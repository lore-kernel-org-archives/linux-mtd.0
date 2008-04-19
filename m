Received: from ernst.netinsight.se ([212.247.11.2])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JnDPh-0003do-AH
	for linux-mtd@lists.infradead.org; Sat, 19 Apr 2008 13:47:33 +0000
Message-ID: <4809F7EC.9010808@users.sourceforge.net>
Date: Sat, 19 Apr 2008 15:47:24 +0200
From: =?ISO-8859-1?Q?Anders_Grafstr=F6m?= <grfstrm@users.sourceforge.net>
MIME-Version: 1.0
To: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>,
	'Jared Hulbert' <jaredeh@gmail.com>,
	'Alexey Korolev' <akorolev@infradead.org>,
	'Linux-MTD Mailing List' <linux-mtd@lists.infradead.org>
Subject: Re: cfi_cmdset_0001.c: Excessive erase suspends
References: <4807B552.7090501@users.sourceforge.net>	<Pine.LNX.4.64.0804181554230.27235@pentafluge.infradead.org>	<20080418163536.GD31520@shareable.org>	<6934efce0804181054y5887c6b4kc1129deec2d3a2eb@mail.gmail.com>	<48091C7A.1070709@users.sourceforge.net>
	<012501c8a1fe$4a5308e0$def91aa0$@Tjernlund@transmode.se>
In-Reply-To: <012501c8a1fe$4a5308e0$def91aa0$@Tjernlund@transmode.se>
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Joakim Tjernlund wrote:
> Don't you need to check that the chip is suspended before you do any
> new operation?

You're right.

Here's the improved version;

static void erase_suspend(unsigned int loops)
{
	volatile unsigned int *flash = (unsigned int *)0x41040000;
	unsigned int i;
	unsigned int suspends = 0;
	unsigned int words = 2;
	unsigned int timeout;

	/* Make sure there's something to erase */
	for (i = 0; i < 0x10000; i++) {
		if (flash[i] == 0xffffffff) {
			flash[i] = 0x00400040;
			flash[i] = 0;
			while ((flash[i] & 0x00800080) != 0x00800080);
		}
	}

	/* Clear status */
	flash[0] = 0x00500050;

	/* Erase */
	flash[0] = 0x00200020;
	flash[0] = 0x00d000d0;

	while (1) {
		/* Suspend */
		flash[0] = 0x00b000b0;
		flash[0] = 0x00700070;
		timeout = 100000;
		while ((flash[0] & 0x00800080) != 0x00800080 && --timeout);
		if (!timeout)
			printf("suspend timeout\n");
		suspends++;

		/* Short delay */
		for (i = 0; i < 1000; i++);

		/* Resume */
		flash[0] = 0x00d000d0;
		flash[0] = 0x00700070;

		/* Erase done ? */
		if ((flash[0] & 0x00800080) == 0x00800080) {
			printf("\nstatus %08x\n", flash[0]);
			break;
		}

		/* Short delay */
		for (i = 0; i < loops; i++);
	}

	/* Read array */
	flash[0] = 0x00ff00ff;

	/* Show the first 2 failed words */
	for (i = 0; i < 0x10000; i++) {
		if (flash[i] != 0xffffffff) {
			printf("%08x\n", flash[i]);
			if (--words == 0)
				break;
		}
	}

	printf("%d suspends\n", suspends);
}

void test_flash_erase_suspend(void)
{
	unsigned int loops;

	for (loops = 6000; loops > 2000; loops -= 500) {
		printf("\n%d loops", loops);
		erase_suspend(loops);
	}
}


It produced this output at one occasion:

6000 loops
status 00800080
ffff0000
ffff0000
4783 suspends

5500 loops
status 00800080
5508 suspends

5000 loops
status 008000a0
6394 suspends

4500 loops
status 00a000a0
fffffeff
fffffffe
5169 suspends

4000 loops
status 00a000a0
fffffeff
fffffeff
5378 suspends

3500 loops
status 00a000a0
aaaaaaaa
aaaaaaaa
5715 suspends

3000 loops
status 00a000a0
55555555
55555555
6142 suspends

2500 loops
status 00a000a0
00000000
00000000
6929 suspends

It locks up when I drop it down to 2000 or less iterations in the loop between resume and suspend.
I think I need to do more testing with properly timed delays.

Is there anything else that I have missed?

/Anders
