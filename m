Received: from ernst.netinsight.se ([212.247.11.2])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jmynd-0002RX-4m
	for linux-mtd@lists.infradead.org; Fri, 18 Apr 2008 22:11:17 +0000
Message-ID: <48091C7A.1070709@users.sourceforge.net>
Date: Sat, 19 Apr 2008 00:11:06 +0200
From: =?UTF-8?B?QW5kZXJzIEdyYWZzdHLDtm0=?=
 <grfstrm@users.sourceforge.net>
MIME-Version: 1.0
To: Jared Hulbert <jaredeh@gmail.com>,
	Alexey Korolev <akorolev@infradead.org>,
	Linux-MTD Mailing List <linux-mtd@lists.infradead.org>
Subject: Re: cfi_cmdset_0001.c: Excessive erase suspends
References: <4807B552.7090501@users.sourceforge.net>	<Pine.LNX.4.64.0804181554230.27235@pentafluge.infradead.org>	<20080418163536.GD31520@shareable.org>
	<6934efce0804181054y5887c6b4kc1129deec2d3a2eb@mail.gmail.com>
In-Reply-To: <6934efce0804181054y5887c6b4kc1129deec2d3a2eb@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jared Hulbert wrote:
> 2) Did you check that the MTD is configured to treat this flash with
> the correct bus width?  I've been burned trying to figure out why a
> 16bit configuration was missing half the data, turned out I had it
> configured for 32bit MTD accesses.

I think I got it right.

> 3) I'd like to see that you can't use flash_eraseall and hexdump
> /dev/mtdX to see this behavior.  Or maybe you could try to create a
> simple test that would suspend an erase 10K times and verify the erase

See below.

> A solution might be an small delay before a
> write suspends the erase.

udelay(100) right before the suspend command seems to work for me.
It reduces the suspend count to about 1700 and no errors reported
by JFFS2.


I ran this routine in a standalone test program from u-boot:

void test_flash_erase_suspend(void)
{
	volatile unsigned int *flash = (unsigned int *)0x41040000;
	unsigned int i;
	unsigned int suspends = 0;
	unsigned int words = 10;

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
		suspends++;

		/* Short delay */
		for (i = 0; i < 1000; i++);

		/* Resume */
		flash[0] = 0x00d000d0;
		flash[0] = 0x00700070;

		/* Erase done ? */
		if ((flash[i] & 0x00800080) == 0x00800080) {
			printf("\nStatus %08x\n", flash[i]);
			break;
		}

		/* Short delay */
		for (i = 0; i < 3500; i++);
	}

	/* Read array */
	flash[0] = 0x00ff00ff;

	/* Show the first 10 failed words */
	for (i = 0; i < 0x10000; i++) {
		if (flash[i] != 0xffffffff) {
			printf("%08x\n", flash[i]);
			if (--words == 0)
				break;
		}
	}

	printf("%d suspends\n", suspends);
}

The delay loop doing 3500 loops seems to be the critical one.

Most of the time I get something like this, which I assume
means 'Operation abort'.

Status 00a000a0
aa695555
695a5555
5a555555
a56a5555
59555555
595a5555
6aa65555
69a65555
69595555
95965555
5647 suspends

But sometimes I get this:

Status 00a00080
aa690000
696a0000
5a950000
a66a0000
59590000
595a0000
6a960000
69a60000
69590000
95960000
5625 suspends

Here's a link to the document that I previously referred to:
http://www.spansion.com/application_notes/erase_susp_appnote_00_a1_e.pdf

/Anders
