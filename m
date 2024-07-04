Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B31D5C3271E
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Jul 2024 11:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rCYimBIvHELzh2kQ+GBfIEwoy0eJv9uB8bVqZF+JJ/4=; b=qyhD9+N6izRFk0
	o4NQU9tLNS6X1N11xVqEnoI+TsBPe1WwJvHD85haujMV2WD+OAJtWyRV347OpzPEVgKQMSax3QcFd
	a35IBggv8d4tldLI30t2W3b282o+QsKXOd3cugdD4TB62knkBq0bvTO9BqUrRgpdclHPGsmCVkvX0
	jrtALbfbqG/3UDWkwClbhLOJvsOP4Jt4M4wy+viQrHz0CiPOnYKcHjyp3NKxkob+IeTr9ua/L9nZK
	2dFlAv1YGFyKizLE7o00iQ/KBsngegrpn+6sc/cHCms4YSx0+3R45C+pyflbxeRdTxFouWxG4mKLA
	KnRatJ0cM2HmivDaWoVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPKN3-0000000Cy5o-21A4;
	Thu, 04 Jul 2024 11:11:25 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPKMz-0000000Cy4q-2OOQ;
	Thu, 04 Jul 2024 11:11:23 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-36796d2e5a9so358761f8f.3;
        Thu, 04 Jul 2024 04:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720091479; x=1720696279; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qwBmB9TZGFjcG5R2+2N2tz93DvezoEGxh6PsIk8IO/w=;
        b=bi44KyFW1Qpq9svXEJl9nhvukiYw7NByM7LXUF3zPHrzzhRY9SjiSiyYE5IMHTHSSy
         XUF5b/OyIKRFqRRAmOGmK24osGNqFVVesf5YUKuYSvJarUdeevtRLTfsULwMWCIQM2Km
         l0Vj3LSSE/3mGLQEashfgSpTwuQiEUNExlUhVPjDhrZyFZbD/V/ajPy09M5yCMSBnHDO
         qcOOJ9vhywvw/b3wv7poPKRx/CCGVQv23IHauCIhmADED+WJxha/wa+fv7ZCD1zxSsyr
         RjdrGseBzsVhhkblCXDa4rG1Y83Xc8FS2exiwMAQuPm/lrxU+obsWkAz84MhAP9/SIzV
         d7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720091479; x=1720696279;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qwBmB9TZGFjcG5R2+2N2tz93DvezoEGxh6PsIk8IO/w=;
        b=olZN9Larm0oxVE9V/idCvsRvonq9xXraGv+zzNP89At4V0mwjvLfNpPPXA/eYI1ENJ
         GiHHgAXnKhLGNTc+ZEIbGdOBKMu0QmaEVpPHclCx6gAi1Gh2mEKED0VPJ6HT3SANctHX
         LuRunIMJNbWXOQ5R5xVlTm2+5VgfpI6GSwhxFHgrpZx8ww6aDhGu029a8FkL4HNc3Grb
         WYTWF4hq9U8+L6ipRvWGY6nbfP65kcXOlc8pIeEJb+0Su8ATP9sEgJTS9UazxAyOC35f
         0k6zE4SDA+Fyq/fIVKcuDp3YlYQQrB5vjLCLJp4PB7da5ccZCal3QuBJjO6d4ypkw8Oz
         OgRA==
X-Forwarded-Encrypted: i=1; AJvYcCUklKT6by09bejIZTHCKyy5mgZodBlQsfXo3trnmzm8Grd2NbmITltVsrTjidNJmF4Ge0evPOEqgYcFmS33muKYxxBEy4yM8n32V8qa9eglXHGYel4QaAp6ugWgZ8OMt4TSvc0mBhbMbp8IjifS5jbzqUcR3RpZ+I8Fu9y9P0Nf9jIQ/D7YX2+HzPfI
X-Gm-Message-State: AOJu0YyvbluKgkvAlPhJ5nwVJpcHIh9CWBKhVrexooKbp4nuT1K6Fyl7
	sXQo9974cp/CqyCO99nrLsm7Hfv/826NfwAa6oHBd3iqUCJUvTaW
X-Google-Smtp-Source: AGHT+IFEzvL2jC2faLe/uaMvaq/UCJ26KrH1XFm9Ol6h8w0Rebt6hjx4X+gdY7pIVUfbtqQYexMuPw==
X-Received: by 2002:a5d:5712:0:b0:367:94e7:958a with SMTP id ffacd0b85a97d-3679dd17ec1mr1153338f8f.6.1720091479417;
        Thu, 04 Jul 2024 04:11:19 -0700 (PDT)
Received: from [10.14.0.2] ([139.28.176.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36787db4d12sm6821051f8f.110.2024.07.04.04.11.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Jul 2024 04:11:18 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: [PATCH 14/26] block: move the nonrot flag to queue_limits
From: Simon Fernandez <fernandez.simon@gmail.com>
In-Reply-To: <ZnmoANp0TgpxWuF-@kbusch-mbp.dhcp.thefacebook.com>
Date: Thu, 4 Jul 2024 12:11:16 +0100
Cc: Christoph Hellwig <hch@lst.de>,
 Jens Axboe <axboe@kernel.dk>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Richard Weinberger <richard@nod.at>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 =?utf-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
 Josef Bacik <josef@toxicpanda.com>,
 Ming Lei <ming.lei@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alasdair Kergon <agk@redhat.com>,
 Mike Snitzer <snitzer@kernel.org>,
 Mikulas Patocka <mpatocka@redhat.com>,
 Song Liu <song@kernel.org>,
 Yu Kuai <yukuai3@huawei.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-m68k@lists.linux-m68k.org,
 linux-um@lists.infradead.org,
 drbd-dev@lists.linbit.com,
 nbd@other.debian.org,
 linuxppc-dev@lists.ozlabs.org,
 ceph-devel@vger.kernel.org,
 virtualization@lists.linux.dev,
 xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org,
 dm-devel@lists.linux.dev,
 linux-raid@vger.kernel.org,
 linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org,
 nvdimm@lists.linux.dev,
 linux-nvme@lists.infradead.org,
 linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org,
 linux-block@vger.kernel.org,
 Damien Le Moal <dlemoal@kernel.org>
Message-Id: <78BDDF6A-1FC7-4DD7-AABF-E0B055772CBF@gmail.com>
References: <20240617060532.127975-1-hch@lst.de>
 <20240617060532.127975-15-hch@lst.de>
 <ZnmoANp0TgpxWuF-@kbusch-mbp.dhcp.thefacebook.com>
To: Keith Busch <kbusch@kernel.org>
X-Mailer: Apple Mail (2.3608.120.23.2.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_041121_630495_E2BC8113 
X-CRM114-Status: GOOD (  11.88  )
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

Hi folks, how can I unsubscribe from this group.?
Thanks in advance.
S

> On 24 Jun 2024, at 18:08, Keith Busch <kbusch@kernel.org> wrote:
> 
> On Mon, Jun 17, 2024 at 08:04:41AM +0200, Christoph Hellwig wrote:
>> -#define blk_queue_nonrot(q)	test_bit(QUEUE_FLAG_NONROT, &(q)->queue_flags)
>> +#define blk_queue_nonrot(q)	((q)->limits.features & BLK_FEAT_ROTATIONAL)
> 
> This is inverted. Should be:
> 
> #define blk_queue_nonrot(q)	(!((q)->limits.features & BLK_FEAT_ROTATIONAL))
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
