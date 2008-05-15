Received: from fk-out-0910.google.com ([209.85.128.187])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JwZoR-00086g-7F
	for linux-mtd@lists.infradead.org; Thu, 15 May 2008 09:31:47 +0000
Received: by fk-out-0910.google.com with SMTP id 18so208765fks.2
	for <linux-mtd@lists.infradead.org>;
	Thu, 15 May 2008 02:31:46 -0700 (PDT)
Message-ID: <e8775dd00805150231j558b4de7mc86ad4355e126582@mail.gmail.com>
Date: Thu, 15 May 2008 17:31:45 +0800
From: "Jason Liu" <liu.h.jason@gmail.com>
To: "veena s" <veena_3_2003@yahoo.co.in>
Subject: Re: Reg:FAT support for NAND
In-Reply-To: <816646.88229.qm@web8607.mail.in.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <816646.88229.qm@web8607.mail.in.yahoo.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In order to support vfat filesystem on raw nand flash, the new FTL
should be developed. The simple FTL(mtdblock.c) that mtd provide has a
lot of shortcomings or bugs, such as no BBM, no wear-leveling, not
correctly handle the ecc error case, etc.

2008/5/12 veena s <veena_3_2003@yahoo.co.in>:
> Hi ,
>
>
> I want to Use FAT Filesystem for NAND in the Linux
> Kernel ver-2.6.10.
> We have tried by enabling NFTL layer . But we are
> facing the following  problem to mount  with FAT.....
>
> 1 ) nftl_format : utility is used to format the device
> requires the erase size to be 8k bytes, but our device
> has erase size of 128kbytes.so nftl_format is not able
> to recognise the erase size.
>
> 2 ) We have created the device nodes as /dev/nftla and
> tried to mount FAT over it using the following
> command.
>
> mount -tvfat /dev/nftla /mnt/nand
> but above command is failing.
>
> So please suggest whether the above steps are
> correct.?
> and help us how to use FAT over NAND.
>
> Thanks
>
>
>
>
>      Planet Earth is in the hot seat. Know more - http://in.search.yahoo.com/search?&fr=na_onnetwork_mail_taglines&ei=UTF-8&rd=r1&p=global+warming
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
