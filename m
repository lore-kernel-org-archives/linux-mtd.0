Received: from [81.3.11.18] (helo=mail.ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D9Qq7-0003Ym-Uj
	for linux-mtd@lists.infradead.org; Thu, 10 Mar 2005 11:48:49 -0500
Date: Thu, 10 Mar 2005 17:48:49 +0100
From: Konstantin Kletschke <lists@ku-gbr.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20050310164848.GB7018@synertronixx3>
References: <20050309131453.GA2497@synertronixx3>
	<Pine.LNX.4.58.0503101314570.4649@phoenix.infradead.org>
	<20050310154640.GC4910@synertronixx3>
	<Pine.LNX.4.58.0503101621110.5506@phoenix.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.58.0503101621110.5506@phoenix.infradead.org>
Subject: Re: jffs2 with sync burst mode
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 2005-03-10 16:21 +0000 schrieb Artem B. Bityuckiy:
> > 00435660: 0000 0000 0000 0000 b882 2ec7 8519 01e0  ................
> > 00435670: 3c00 0000 c001 e8b0 fb00 0000 1300 0000  <...............
>             ^
>             node length
> > 00435680: 0d01 0000 9400 0000 1408 0000 55ff 2d7c  ............U.-|
>                                 ^
>                                 name length
> > 00435690: a9c7 cf9f 6c69 6270 7468 7265 6164 2d30  ....libpthread-0
>             ^^^^ ^^^^
>             Name CRC
> > 004356a0: 2e39 2e32 362e 736f 8519 02c0 a906 0000  .9.26.so........
> > 004356b0: 4a1e 6fb8 0d01 0000 0200 0000 a481 0000  J.o.............
> > 004356c0: 0000 0000 0010 0000 9400 0000 9400 0000  ................
> Where has this dump come from?

My initial Mail:

I did "cat /dev/mtdblock3 > file1" into nfs-root (as a side note, I did
the same again with dd bs=1024k:
konsti at synertronixx3:/usr/src/debian_arm/ > md5sum ddmtdblock3 
e871d71c52d93c1cafb4a8f4ff47a741  ddmtdblock3
konsti at synertronixx3:/usr/src/debian_arm/ > md5sum mtdblock3 
e871d71c52d93c1cafb4a8f4ff47a741  mtdblock3
).

This is emacs in hexl-mode on these files:

> This dump looks good:

And this dump is read from the same system right after umounting.

> * the length of node is 0x3c
> * the length of the name is 0x14
> * the name CRC - don't know, didn't calculate.
> 
> Looks like JFFS2 really reads messed data from flash and I think this 
> isn't JFFS2'd failure.

> I'd suggest to hack the write function and after each write read the data 
> that has just been written again and check it has is the same as the 
> original data. This check might be done either on MTD layer or on JFFS2 
> layer.

But the error seems quite systematic so I suspect software. But of
course, still my setup my be broken and jffs2 triggers something. I have
no clue what though.
I will look into the code and see if I find the "write" to read
afterwards... :/

Konsti

-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
