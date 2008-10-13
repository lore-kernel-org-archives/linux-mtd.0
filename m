Received: from wr-out-0506.google.com ([64.233.184.237])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KpPb7-0002fH-Aj
	for linux-mtd@lists.infradead.org; Mon, 13 Oct 2008 15:44:41 +0000
Received: by wr-out-0506.google.com with SMTP id c53so1057728wra.22
	for <linux-mtd@lists.infradead.org>;
	Mon, 13 Oct 2008 08:44:40 -0700 (PDT)
Message-ID: <80b317760810130844l53709cf8j284d81d432d2696e@mail.gmail.com>
Date: Mon, 13 Oct 2008 17:44:39 +0200
From: "Richard Genoud" <richard.genoud@gmail.com>
To: "Haavard Skinnemoen" <haavard.skinnemoen@atmel.com>
Subject: Re: [PATCH] Bug on atmel_nand HW ECC : OOB info not correctly written
In-Reply-To: <20081013161353.38b8ff51@hskinnemo-gx745.norway.atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1223793748.7110.13.camel@ubuntu>
	<1223906461.6770.604.camel@macbook.infradead.org>
	<20081013161353.38b8ff51@hskinnemo-gx745.norway.atmel.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2008/10/13 Haavard Skinnemoen <haavard.skinnemoen@atmel.com>:
> I have no clue, I'm afraid. What's the difference between NAND_ECC_HW
> and NAND_ECC_HW_SYNDROME?
>
> I do think I have a large page NAND flash available for testing though,
> so I can do that. Will any potential problems be easy to spot?
>
> In other words: What are the consequences of this bug?
>
> Haavard
>

The NAND_ECC_HW_SYNDROME is normally used with "non standard" ECC
controllers that need to have a complete access on the OOB area ( the
OOB pointer is given in the xxx_nand_calculate function whereas in
NAND_ECC_HW, only an ecc code pointer is given).
The read and write mechanisms are also a "little bit" more complicated
in syndrome mode, they admit ecc post-pad and pre-pad data which are
not used in our case.

The reported bug was from a small pages user :
mount -tyaffs2 /dev/mtdblock0 /mnt/part
touch /mnt/part/foo
rm /mnt/part/foo
umount /mnt/part
mount -tyaffs2 /dev/mtdblock0 /mnt/part
... and foo is still there.

the code in cause was in atmel_nand_write_oob_512, the writing start
position was pos = eccsize + chunk; instead of pos = eccsize; (eccsize
= size of a page). The OOB info was written with an offset of 4 bytes
(=chunk) and so Yaffs didn't manage to read its deleted file marker.
With this patch, the deleted files are removed.

There's the same mechanism for large pages (the at91sam9263-ek has large pages).
Today, nand_write_oob_syndrome is used and we've got pos = steps *
(eccsize + chunk); with steps = 1.
There's no reason to have an offset of 4 bytes (chunk).

I'm not sure that there will be the same bug with yaffs and large
pages, but there will certairnly be some problems.

maybe there's a way with the mtdtools to call the read/write_oob_ functions.
In this case, it would be easy to see the bug.

(I would have do it myself, but I have no board left...)

richard.
