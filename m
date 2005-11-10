Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EaB21-00062x-6U
	for linux-mtd@lists.infradead.org; Thu, 10 Nov 2005 06:56:02 -0500
Message-ID: <43733524.4030402@yandex.ru>
Date: Thu, 10 Nov 2005 14:55:16 +0300
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: luyang_ly@hotmail.com
Subject: [Fwd: Re: a problem about jffs2]
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Just forwarding to the appropriate mailing list.

		Artem.

-------- Original Message --------
Subject: Re: a problem about jffs2
Date: Wed, 9 Nov 2005 20:02:02 -0800 (PST)
From: Linus Torvalds <torvalds@osdl.org>
To: Thomas Gleixner <tglx@linutronix.de>,	David Woodhouse 
<dwmw2@infradead.org>,	"Artem B. Bityutskiy" <dedekind@infradead.org>, 
Todd Poynor <tpoynor@mvista.com>,	Ferenc Havasi <havasi@inf.u-szeged.hu>
References: <BAY114-F29E1CCEFBD64791D2C1DC28D660@phx.gbl>


Just forwarding to people who are more appropriate.

		Linus
--
YangLu YangLu <luyang_ly@hotmail.com>
On Thu, 10 Nov 2005, YangLu YangLu wrote:
>
> Dear Linus:
> 
> 	I recently meet a problem about jffs2.
> 
> 	There have three sectors in my mobilephone(OMAP730):
> 	/dev/mtdblock3           16384      3276     13108  20% /System
> 	/dev/mtdblock4            2048       388      1660  19% /Sysdisk
> 	/dev/mtdblock5            5120       388      4732   8% /Appdisk
> 
> 	I built new file(ph_bk) in /Sysdisk dirctory. 	I write a test
> program, as follows:
> 	1) open it.
> 	fd = fopen(argv[1], "r+");
> 	2) fseek with a random number, then write a number
> 	for (;;) {
> 		offset = rand();
> 		fseek(fd, offset % (1024*1024), SEEK_SET);
> 		fwrite(&offset,sizeof(int), 1, fd);
> 	}
> 
> 	I want to limit the file with 1M size, but when the test program run
> in background,
> 	this file maintain 1M size, but available space on /dev/mtdblock4
> continue to reduce, as below:
> 	Filesystem           1k-blocks      Used Available Use% Mounted on
> 	/dev/mtdblock4            2048       512      1536  25% /Sysdisk
> /dev/mtdblock4            2048       688      1360  34% /Sysdisk
> 	/dev/mtdblock4            2048       792      1256  39% /Sysdisk
> 	/dev/mtdblock4            2048       856      1192  42% /Sysdisk
> 	/dev/mtdblock4            2048      1212       836  59% /Sysdisk
> 	/dev/mtdblock4            2048      1516       532  74% /Sysdisk
> 	/dev/mtdblock4            2048      1920       128  94% /Sysdisk
> 
> 	Is it jffs2 filesystem's bug?
> 
> 	Thanks!
> 
> Best Regards,
> Richard
> 
