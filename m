Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E48AC4167B
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Nov 2023 10:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QtZb7B+uiKLqhc4vl+rf/YR3TGQfDZGMKv3Nj9Ca3I0=; b=g/elx1MShIMun/
	ZTE8PMDnX/ELamgMpNglZ9/uzpEzLQlkeRXMa/XBBUWjZh1sSTJo/50BGUjC/fp+HEKzQhYMjDFat
	VbYfGqr+Aolsw6eP/nyt3kJUB/QZ/8yaEVYgORYmBJMx/sJcovCYVmV2mZcfLN+ukhjAYdfcxa7ma
	cBCWOGZPYMy29S73N31kF/f+NRtWfxopeANypsXJ1csW3XEpWa5hT4fTzY43EzuE40edjSBy2Kosa
	BDHbmon1anulapm7zq0G7/ZQg5hcxMB1ywV1PnifC176ngV4+gxorCBjPTa/ewT+TZUNXpu6F4qFU
	Z1VcepNwDnkRWWrOm2iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7uyI-004oWJ-0V;
	Tue, 28 Nov 2023 10:05:38 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7uyE-004oV0-17
	for linux-mtd@lists.infradead.org;
	Tue, 28 Nov 2023 10:05:36 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-32f737deedfso3246037f8f.3
        for <linux-mtd@lists.infradead.org>; Tue, 28 Nov 2023 02:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701165931; x=1701770731; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZKJsy/O9sQNKnNFyRJVuTOt01SElG6aFkPQ2+Lfq3iI=;
        b=sLgjJs9f8958oetVug3L2un8EuKA3y4UWbUa/wScem/DP55qSKFiQohKNgnQbGOqYs
         RlO8+4xk54J+/gqkU1IXb35jiGLT7+8tnlgQFSC6klAW+pfB9ddXwUG8Dt24Hlh0j/I5
         nA3aPMlkm8O1O2F8X/4WoUxGd+R8dLdTe+AwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701165931; x=1701770731;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZKJsy/O9sQNKnNFyRJVuTOt01SElG6aFkPQ2+Lfq3iI=;
        b=XM/BA9gB1XVEx2us8pVYCEDINI+rXwjrhh1ndxt4PB/Ze2FTzA3BAEthSJ+sGovAzX
         QyIavLVO25myd10pa4AFURyeskh+oXPtrAywT+E3Xl1/1c6+l19vhZ42eerVyJeTpzed
         GDYm5eIpOhDyNnPp0aftuKni/Su0koYtij1gVPaRGu9dSEh6rqLEv+Y9mf1NFGLljDk9
         ABh9XS8h7H5atj3Dh4jX/tBApnJ0jRzvV6xYUVyc4m5jbcisU+dpNmu8SxVjVdHrCvhd
         yaQ5ul49gyAMXXlw9/Y4cm6HGYZqKtI87+z4YnphZF07kz7Fmf0TBuUUG3CldBzdBMLH
         ZJ5A==
X-Gm-Message-State: AOJu0YyfZ7cCXrOl8b3xM8qln1sQwcDjzoB6nPRzUFO178LyGo1dg36d
	Y+rWDU+4uTrUv0BhZ7nGniWM0Q==
X-Google-Smtp-Source: AGHT+IHso67qiRejATVe+y4q8GA8WkjBME6ZXNG2nx2AvipjQBf9Fe7u/GIhGV/RuBTAoKaGDDxyQg==
X-Received: by 2002:a5d:4bcf:0:b0:332:f81d:8dac with SMTP id l15-20020a5d4bcf000000b00332f81d8dacmr6833150wrt.67.1701165931581;
        Tue, 28 Nov 2023 02:05:31 -0800 (PST)
Received: from localhost ([213.195.113.99])
        by smtp.gmail.com with ESMTPSA id l10-20020a5d674a000000b00332eef1ca7asm9779426wrw.80.2023.11.28.02.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 02:05:31 -0800 (PST)
Date: Tue, 28 Nov 2023 11:05:30 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: hch@infradead.org, ming.lei@redhat.com, axboe@kernel.dk, colyli@suse.de,
	kent.overstreet@gmail.com, joern@lazybastard.org,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	sth@linux.ibm.com, hoeppner@linux.ibm.com, hca@linux.ibm.com,
	gor@linux.ibm.com, agordeev@linux.ibm.com, jejb@linux.ibm.com,
	martin.petersen@oracle.com, clm@fb.com, josef@toxicpanda.com,
	dsterba@suse.com, viro@zeniv.linux.org.uk, brauner@kernel.org,
	nico@fluxnic.net, xiang@kernel.org, chao@kernel.org, tytso@mit.edu,
	adilger.kernel@dilger.ca, agruenba@redhat.com, jack@suse.com,
	konishi.ryusuke@gmail.com, dchinner@redhat.com,
	linux@weissschuh.net, min15.li@samsung.com, yukuai3@huawei.com,
	dlemoal@kernel.org, willy@infradead.org, akpm@linux-foundation.org,
	hare@suse.de, p.raghav@samsung.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-bcachefs@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-ext4@vger.kernel.org, gfs2@lists.linux.dev,
	linux-nilfs@vger.kernel.org, yi.zhang@huawei.com,
	yangerkun@huawei.com
Subject: Re: [PATCH block/for-next v2 02/16] xen/blkback: use new helper to
 get inode from block_device
Message-ID: <ZWW7ag6vIhc_Skh5@macbook>
References: <20231127062116.2355129-1-yukuai1@huaweicloud.com>
 <20231127062116.2355129-3-yukuai1@huaweicloud.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231127062116.2355129-3-yukuai1@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_020534_405944_09D76F0C 
X-CRM114-Status: UNSURE (   8.17  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBOb3YgMjcsIDIwMjMgYXQgMDI6MjE6MDJQTSArMDgwMCwgWXUgS3VhaSB3cm90ZToK
PiBGcm9tOiBZdSBLdWFpIDx5dWt1YWkzQGh1YXdlaS5jb20+Cj4gCj4gV2hpY2ggaXMgbW9yZSBl
ZmZpY2llbmN5LCBhbmQgYWxzbyBwcmVwYXJlIHRvIHJlbW92ZSB0aGUgZmllbGQKPiAnYmRfaW5v
ZGUnIGZyb20gYmxvY2tfZGV2aWNlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFl1IEt1YWkgPHl1a3Vh
aTNAaHVhd2VpLmNvbT4KCkFja2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0
cml4LmNvbT4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
