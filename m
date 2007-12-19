Received: from nz-out-0506.google.com ([64.233.162.226])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1J53Ts-0000tn-R9
	for linux-mtd@lists.infradead.org; Wed, 19 Dec 2007 18:17:27 +0000
Received: by nz-out-0506.google.com with SMTP id z3so1456764nzf.27
	for <linux-mtd@lists.infradead.org>;
	Wed, 19 Dec 2007 10:17:19 -0800 (PST)
Message-ID: <49eab5c80712191017w71c5d315w45b33f2f0423e470@mail.gmail.com>
Date: Thu, 20 Dec 2007 02:17:13 +0800
From: "falls huang" <falls.huang@gmail.com>
To: "Linux mtd" <linux-mtd@lists.infradead.org>
Subject: Re: MTD/YAFFS2 page problem, data missing
In-Reply-To: <47692B14.5040205@tandberg.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <47692B14.5040205@tandberg.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Kjetil!

    I don't the exactly status about your board and testing method .
Maybe I can give u some suggests:

1.  Do testing with such cycle ->
erase the yaffs2 partition that you write to , write , boot , read

2.
Did u open the debug options in /proc/yaffs ?
FYI: http://www.yaffs.net/yaffs-debugging , you can open the option:
YAFFS_TRACE_WRITE

3.
Read your nand flash driver carefully, yaffs2 based on mtd , mtd based
on nandflash driver .

Gook Luck

2007/12/19, Kjetil Aamodt <kjetil.aamodt@tandberg.com>:
> >From time to time we have seen data corruption on our nand flash. Closer investigation with a 300MB large file showed us that 32 of 98 write-boot-read cycles got corrupted. The corruption were of two very similar forms:
>
> a) Somewhere in the image one complete page, page M, were replaced by the contents of M+1. Page M+1, and all other data in the file were correct (data from the same page is returned twice).
>
> b) Somewhere in the image there were two consecutive page errors. In the corrupted file page N were missing and replaced with N+1. Page N+1 contained only zeros. The rest of the data in the file were correct.
>
> Our Linux kernel version are 2.6.22.1. The YAFFS version is per CVS of November 13. 2007.
>
> Have anyone else seen such behavior with MTD and/or YAFFS2?
> Do you have any suggestion in how to debug this?
>
> Best regards,
> Kjetil Aamodt
> TANDBERG
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>


-- 
Regards
Falls Huang
