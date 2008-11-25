Received: from yx-out-1718.google.com ([74.125.44.153])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L4mlX-0003Kf-EI
	for linux-mtd@lists.infradead.org; Tue, 25 Nov 2008 01:30:59 +0000
Received: by yx-out-1718.google.com with SMTP id 3so1472294yxi.72
	for <linux-mtd@lists.infradead.org>;
	Mon, 24 Nov 2008 17:30:58 -0800 (PST)
Message-ID: <2c3b11250811241730j17c97df4mb3073acfcf48bb6f@mail.gmail.com>
Date: Tue, 25 Nov 2008 09:30:57 +0800
From: "Liu Hui" <onlyflyer@gmail.com>
To: "Sidney Amani" <seed95@gmail.com>
Subject: Re: [UBI] UFFS : Unified Flash File System
In-Reply-To: <52e42efe0811240928g6bc4c8a6rd7483289f0ae83a2@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <52e42efe0811240928g6bc4c8a6rd7483289f0ae83a2@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is interesting. I have some questions about UFFS:
1)UFFS can work both with bare flash(MTD or UBI) and FTL(as a block
device), how do you organize the metadata of UFFS(log-structured?).
2)As we know, bare flash and FTL provide very different interfaces for
FS. For MTD, FS should do garbage collection, wear leveling, bad block
management by itself; For UBI, FS should also do garbage collection
and wear leveling; and for FTL, FS just treat flash as block device.
What will UFFS do to treat all of kind of interfaces? Will UFFS
provide different strategy for different interfaces?

-- 
Thanks & Best Regards
Liu Hui
--


2008/11/25 Sidney Amani <seed95@gmail.com>:
> Hi,
>
> We are forth year Epitech (www.epitech.eu) students, our six member
> team plan to use and maybe improve UBI as part of our end studies
> project.
>
> Our project is UFFS for Unified Flash File System, Unified because it
> is going to allow mounting any kind of NAND Flash Memory, this means
> any bare Flash or Flash on top of FTL.
>
> It is also going to be ported on several operating systems, we plan to
> supported on Fuse (Linux, *BSD, MacOs-X) and Windows and Linux (as a
> Kernel module).
>
>      UFFS
>   ____/|\
>  /        | \
> Block    |  |\
>  |        |  |  \
>  FTL     |  |   \
>  |\____/  |    \
>  |       |   |     |
>  |     UBI |     |
>  \       \   |     |
>   \       \_|     |
>    \         |     |
>     \      MTD |
>      \____|___|
>              |
>           NAND
>
> This scheme means if  UBI is available we use it but if it's not
> (WinCE) we have to develop a UBI-Like layer.
>
> We contactyou to let you know about our intention and maybe get any
> information about some work in progresss of UBI related project?
>
> Has someone heard about a WinCe UBIFS version?
>
> What do you think about our project?
>
> Any suggestion will be welcomed.
>
> --
> Sidney Amani
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
