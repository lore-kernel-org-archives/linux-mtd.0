Received: from bay114-f34.bay114.hotmail.com ([65.54.169.44] helo=hotmail.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EaRnZ-0003kk-7G
	for linux-mtd@lists.infradead.org; Fri, 11 Nov 2005 00:50:10 -0500
Message-ID: <BAY114-F3451D2B79848BA441FDCBF8D590@phx.gbl>
In-Reply-To: <1131679947.3417.16.camel@localhost.localdomain>
From: "YangLu YangLu" <luyang_ly@hotmail.com>
To: forrest.zhao@intel.com, linux-mtd@lists.infradead.org
Date: Fri, 11 Nov 2005 05:30:24 +0000
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
Cc: dedekind@yandex.ru
Subject: Re: [Fwd: Re: a problem about jffs2]
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

	But in linux-2.4.18(Now in linux-2.6.12) with same flash(NOR), 

	I used the same test routine, available space on /dev/mtdblock4 

	would not continue to reduce.

	Had GC's method been changed?

	Thanks!



Regards,
Richard


>From: "zhao, forrest" <forrest.zhao@intel.com>
>To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
>CC: linux-mtd@lists.infradead.org, luyang_ly@hotmail.com
>Subject: Re: [Fwd: Re: a problem about jffs2]
>Date: Fri, 11 Nov 2005 11:32:27 +0800
>
>
> > > Dear Linus:
> > >
> > > 	I recently meet a problem about jffs2.
> > >
> > > 	There have three sectors in my mobilephone(OMAP730):
> > > 	/dev/mtdblock3           16384      3276     13108  20% /System
> > > 	/dev/mtdblock4            2048       388      1660  19% /Sysdisk
> > > 	/dev/mtdblock5            5120       388      4732   8% /Appdisk
> > >
> > > 	I built new file(ph_bk) in /Sysdisk dirctory. 	I write a test
> > > program, as follows:
> > > 	1) open it.
> > > 	fd = fopen(argv[1], "r+");
> > > 	2) fseek with a random number, then write a number
> > > 	for (;;) {
> > > 		offset = rand();
> > > 		fseek(fd, offset % (1024*1024), SEEK_SET);
> > > 		fwrite(&offset,sizeof(int), 1, fd);
> > > 	}
> > >
> > > 	I want to limit the file with 1M size, but when the test program run
> > > in background,
> > > 	this file maintain 1M size, but available space on /dev/mtdblock4
> > > continue to reduce, as below:
> > > 	Filesystem           1k-blocks      Used Available Use% Mounted on
> > > 	/dev/mtdblock4            2048       512      1536  25% /Sysdisk
> > > /dev/mtdblock4            2048       688      1360  34% /Sysdisk
> > > 	/dev/mtdblock4            2048       792      1256  39% /Sysdisk
> > > 	/dev/mtdblock4            2048       856      1192  42% /Sysdisk
> > > 	/dev/mtdblock4            2048      1212       836  59% /Sysdisk
> > > 	/dev/mtdblock4            2048      1516       532  74% /Sysdisk
> > > 	/dev/mtdblock4            2048      1920       128  94% /Sysdisk
> > >
> > > 	Is it jffs2 filesystem's bug?
> > >
>I once did some testing like yours, and had the same result.
>
>I would say that this is an intrinsic nature of JFFS2 instead of a
>JFFS2's bug.
>Updating 4 bytes of a file for every write operation will cause
>flash space wasting since every write operation generate an
>jffs2_raw_inode + 4 bytes on flash. sizeof(jffs2_raw_inode) is 68 bytes.
>
>Thanks,
>Forrest
>
