Return-Path: <SRS0=j2Kw=WQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E4D2C3A589
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Aug 2019 11:05:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5317620C01
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Aug 2019 11:05:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r8r7VeM5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="OWYdJNUz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5317620C01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sEufGUPqorDucfQr/BaubMFjFHeURWK+kCh26h7Xo1Q=; b=r8r7VeM5T0mMaV
	1GNUgli7SlWFIgdDk/Oug7hx1D4nf3H5bDBnEZLiUCWnhEkcI7lFR33VlYtA6TaoHnf7cbCPn6grN
	ILaECzkp5HspYVbA5xmuD8ggCQ8h7VY7Mvwd2HcjBt2AfvvxQrYU9nyiKtpP6lEf/32RqQqCk6ZxO
	heJibD5pFgqOIBTcAd3SnbkP25vCxCU3zssY8RrVP3n34mE8f2byX8f5oDkeA9kvt1LIKLiow3HFD
	4yAtLFbGBTTl1KDuUxX31EQtvV2w4ad8i6aerEBqLplyRJJZ0aiWE2oHelZiUzb9cn1w582768a61
	yHU/jAH9t7+nLMOvJltw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i01x4-0007zt-96; Tue, 20 Aug 2019 11:05:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i01x0-0007ya-2F
 for linux-mtd@lists.infradead.org; Tue, 20 Aug 2019 11:05:19 +0000
Received: from tleilax.poochiereds.net
 (68-20-15-154.lightspeed.rlghnc.sbcglobal.net [68.20.15.154])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EFF55205C9;
 Tue, 20 Aug 2019 11:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566299116;
 bh=T0rmHh8w3H3bwdXLru7KFY2A/8hjJcNt2eMc9MdFvoU=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=OWYdJNUzSee+UuIh6LQ3YFru0x6seE2TTCifysIDGNOjR8O4ScYkdj2Vrw5S/JeTB
 qmDzLYeDaoNBfNwX5IDihFikAWZqI1dzLhII85Qm3JJy6zIH2yIFue45EEMtXZPwcN
 fgzdH+WlULgP+SUhyw7NDBScX/I9XuZMIU+ITkEg=
Message-ID: <27d1943a0027cb4f658334fad8dc880df133c22d.camel@kernel.org>
Subject: Re: [PATCH v8 00/20] vfs: Add support for timestamp limits
From: Jeff Layton <jlayton@kernel.org>
To: Deepa Dinamani <deepa.kernel@gmail.com>, viro@zeniv.linux.org.uk, 
 linux-kernel@vger.kernel.org
Date: Tue, 20 Aug 2019 07:05:10 -0400
In-Reply-To: <20190818165817.32634-1-deepa.kernel@gmail.com>
References: <20190818165817.32634-1-deepa.kernel@gmail.com>
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_040518_152010_56C66D4B 
X-CRM114-Status: UNSURE (   9.49  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: lucho@ionkov.net, martin@omnibond.com, jfs-discussion@lists.sourceforge.net,
 shaggy@kernel.org, al@alarsen.net, yuchao0@huawei.com, me@bobcopeland.com,
 adilger.kernel@dilger.ca, mikulas@artax.karlin.mff.cuni.cz, hch@lst.de,
 nico@fluxnic.net, hubcap@omnibond.com, linux-cifs@vger.kernel.org,
 zyan@redhat.com, sage@redhat.com, darrick.wong@oracle.com,
 y2038@lists.linaro.org, richard@nod.at, sfrench@samba.org, anton@enomsg.org,
 codalist@coda.cs.cmu.edu, hch@infradead.org, coda@cs.cmu.edu,
 v9fs-developer@lists.sourceforge.net, idryomov@gmail.com,
 linux-ext4@vger.kernel.org, salah.triki@gmail.com, asmadeus@codewreck.org,
 devel@lists.orangefs.org, dushistov@mail.ru, keescook@chromium.org,
 arnd@arndb.de, ericvh@gmail.com, jack@suse.com, reiserfs-devel@vger.kernel.org,
 tj@kernel.org, jlbec@evilplan.org, aivazian.tigran@gmail.com,
 phillip@squashfs.org.uk, dsterba@suse.com, jaegeuk@kernel.org,
 ceph-devel@vger.kernel.org, trond.myklebust@hammerspace.com,
 hirofumi@mail.parknet.co.jp, jaharkes@cs.cmu.edu, linux-nfs@vger.kernel.org,
 tony.luck@intel.com, tytso@mit.edu, luisbg@kernel.org, dedekind1@gmail.com,
 linux-ntfs-dev@lists.sourceforge.net, gregkh@linuxfoundation.org,
 linux-karma-devel@lists.sourceforge.net, adrian.hunter@intel.com,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 ccross@android.com, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, dwmw2@infradead.org, anna.schumaker@netapp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, 2019-08-18 at 09:57 -0700, Deepa Dinamani wrote:
> The series is an update and a more complete version of the
> previously posted series at
> https://lore.kernel.org/linux-fsdevel/20180122020426.2988-1-deepa.kernel@gmail.com/
> 
> Thanks to Arnd Bergmann for doing a few preliminary reviews.
> They helped me fix a few issues I had overlooked.
> 
> The limits (sometimes granularity also) for the filesystems updated here are according to the
> following table:
> 
> File system   Time type                      Start year Expiration year Granularity
> cramfs        fixed                          0          0
> romfs         fixed                          0          0
> pstore        ascii seconds (27 digit ascii) S64_MIN    S64_MAX         1
> coda          INT64                          S64_MIN    S64_MAX         1
> omfs          64-bit milliseconds            0          U64_MAX/ 1000   NSEC_PER_MSEC
> befs          unsigned 48-bit seconds        0          0xffffffffffff  alloc_super
> bfs           unsigned 32-bit seconds        0          U32_MAX         alloc_super
> efs           unsigned 32-bit seconds        0          U32_MAX         alloc_super
> ext2          signed 32-bit seconds          S32_MIN    S32_MAX         alloc_super
> ext3          signed 32-bit seconds          S32_MIN    S32_MAX         alloc_super
> ext4 (old)    signed 32-bit seconds          S32_MIN    S32_MAX         alloc_super
> ext4 (extra)  34-bit seconds, 30-bit ns      S32_MIN    0x37fffffff	1
> freevxfs      u32 secs/usecs                 0          U32_MAX         alloc_super
> jffs2         unsigned 32-bit seconds        0          U32_MAX         alloc_super
> jfs           unsigned 32-bit seconds/ns     0          U32_MAX         1
> minix         unsigned 32-bit seconds        0          U32_MAX         alloc_super
> orangefs      u64 seconds                    0          U64_MAX         alloc_super
> qnx4          unsigned 32-bit seconds        0          U32_MAX         alloc_super
> qnx6          unsigned 32-bit seconds        0          U32_MAX         alloc_super
> reiserfs      unsigned 32-bit seconds        0          U32_MAX         alloc_super
> squashfs      unsigned 32-bit seconds        0          U32_MAX         alloc_super
> ufs1          signed 32-bit seconds          S32_MIN    S32_MAX         NSEC_PER_SEC
> ufs2          signed 64-bit seconds/u32 ns   S64_MIN    S64_MAX         1
> xfs           signed 32-bit seconds/ns       S32_MIN    S32_MAX         1
> ceph          unsigned 32-bit second/ns      0          U32_MAX         1000

Looks reasonable, overall.

Note that the granularity changed recently for cephfs. See commit
0f7cf80ae96c2a (ceph: initialize superblock s_time_gran to 1).

In any case, you can add my Acked-by

-- 
Jeff Layton <jlayton@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
