Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B4E4CFC26E
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Oct 2024 06:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WlXhQRaGHzfFDgVyyuuY++0MhOAmkxBiJJhr9vAtuic=; b=zNkfDodJrf4uq+
	yQkiveLO489VoKSNctYcnZ37gjFimXeTF9IkA651s3aOld6GoYvqUPru+9i4j3wW1No/6lX5xN3E0
	cgk9+LhOCE0TvduGDGbnNELP1kWXOpMI5whoOPHLj1S45THsYUlJsNp2NYb/Ld003YA4ztQX85gYJ
	Arc0Y0hfkhtPqRRgMR4gxc41FECSn2xGvAW8ZKZLAE1+Gpc80CEDHUmKpLTrna03PgP51DcYBWtIi
	bnqAVrnlWVMgBRh3DKJESf4JUp1BWYRWcQvnYss/0I5Ucyvcq+fm97W7gLb98qaZsYUGiGxjC/Hk1
	u4QaIII+c6Fn9RkLltJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0bSX-00000007H5c-0RgI;
	Tue, 15 Oct 2024 06:55:09 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0bSP-00000007H41-4C6p
	for linux-mtd@lists.infradead.org;
	Tue, 15 Oct 2024 06:55:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CC0F2A40CE9;
	Tue, 15 Oct 2024 06:54:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E26CDC4CECE;
	Tue, 15 Oct 2024 06:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1728975300;
	bh=QBfRr33XPaqKkgF7ME2PD+/ZxPGLqwI2g+WHuNvDTMs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SHqVTHajwpQjvTLtehNGRsmEHBLtLw3wkYhcIj3CNxeJbci+CcEgthqkZ5WmsPqGH
	 jHOSQWzPhQV2usAyb5Rl2mhOOWnTYSWQJ1xeJM2+NJfIQZeAM2f0fKQ8+1n7yDGTaD
	 md2w07n7k28TfmFh/KWj5qRZsJ3IyJQ3G+yt030w=
Date: Tue, 15 Oct 2024 08:54:54 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Ryder Wang <rydercoding@hotmail.com>
Cc: Chenyuan Yang <chenyuan0y@gmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"richard@nod.at" <richard@nod.at>,
	"miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	"vigneshr@ti.com" <vigneshr@ti.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"syzkaller@googlegroups.com" <syzkaller@googlegroups.com>,
	Zijie Zhao <zzjas98@gmail.com>,
	"rafael@kernel.org" <rafael@kernel.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>
Subject: Re: [Linux Kernel Bug] memory leak in ubi_attach
Message-ID: <2024101539-ravage-talon-d70c@gregkh>
References: <CALGdzuo8_EXr4aUAw6X9S+yzMPi25Y82netPLWsd+3n-Ov9Pnw@mail.gmail.com>
 <10779b09-3413-6374-b4a1-1efd8821c5f2@huawei.com>
 <CALGdzuryBbCqGAhox9ZWaQHD5dSQNApfGmCP+rYZ7O4MCRH+rw@mail.gmail.com>
 <7138a98c-1562-3059-07b6-4d918bec9d1a@huawei.com>
 <CALGdzuokUpWhUk7uvWcDT2tXRRMk07dmKGS-rFANOE6ZwZZW8w@mail.gmail.com>
 <0171b6cc-95ee-3538-913b-65a391a446b3@huawei.com>
 <CALGdzuoWvy5WvpttC1pab309kZ9cUyfT5O7JB8VjsqwU2HD0Xg@mail.gmail.com>
 <MEYP282MB31641A7FD666B1EA23C1C22FBF452@MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MEYP282MB31641A7FD666B1EA23C1C22FBF452@MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_235502_444587_74EEF987 
X-CRM114-Status: GOOD (  11.07  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Oct 15, 2024 at 03:41:24AM +0000, Ryder Wang wrote:
> By walking through all the related code, it looks to be a bug in slub.c rather than kobject or ubifs.
> 
> sysfs_slab_add() calls kobject_init_and_add():
>   - If kobject_init_and_add fails, sysfs_slab_add()  will go to *out*. But unluckily, *out* code block will never release s->kobj, but it is expected to do so.
> 
> Below is the function comment of kobject_init_and_add():
> * If this function returns an error, kobject_put() must be called to properly clean up the memory associated with the object. *
> ==> It means sysfs_slab_add() shall release the related kobject.

Yup, that's a bug, please send a patch to fix this!

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
