Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 316F1C4167B
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Dec 2023 17:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9pe77gZh75V/m5Kaq4XPrq2djnTBG9TVzgM5XlYTARc=; b=D3q+9OX9a5cQQd
	s9rmT6oCPyADipRBB5PkzRhumLGGjztCCb9FJV5kO2Igu1oZr51WLIfwR7P3RqsDRXpO8hTs5kNbl
	u876+wHxw1FAbrl1oLCcqufLDqSOiB7PtuZnBlG+xyd6KrUm4n0Aynl7oh7qLHLA5LdyXB2mff63h
	/ut/p3Gl7Tx0ZT2BLCywkwC3NiDH4McVWNsw7UzAoSqTUehuLUS3g2BYJI1x2mNPYaSJ+yqt/20la
	7ymmlkPcr40SLcjJClYXeKjbi0IMp79NYn3dDtfQURsDmNNkfA5jgnBDBr0THvq8uOo4gochD8WAl
	nwsAR3VrduIiyUQX+8Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAYpz-007z2s-0I;
	Tue, 05 Dec 2023 17:03:59 +0000
Received: from mail-oo1-f43.google.com ([209.85.161.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAYpw-007z1p-06
	for linux-mtd@lists.infradead.org;
	Tue, 05 Dec 2023 17:03:57 +0000
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-58d9a4e9464so2495522eaf.0
        for <linux-mtd@lists.infradead.org>; Tue, 05 Dec 2023 09:03:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701795835; x=1702400635;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Kxt6CKccKyM2aD5KqaYbJ+5NRAtsSu20TdTe87tfro=;
        b=qg/CJGdNqsZ5JTG5e41gOb9ttZ53gdRttIjEzoFJOV0RKUeWk2sxutrrQWi0gE213n
         zbi0TPuQVdUzRWrsEecb7R8CIPbsnDLrJp9hsRFAkrMebzePm2/FQhxhLQYWBHtm5pij
         vvS5BxF1N4fmSl+BUAVbOobf3HK92x8lnNV79+CF8Xg93KJrqgbB8QJY6XCsK412NTFo
         +mkywUK7KsA4ixbhR6VInbbz1hjqlNA3Vd98wMenjwKVXfhFVlTNqmSt9K9G4auPQhkD
         OBzOoG/xnsNxYG3GnYZcRMGMe5BN91IrTbMuFbP9CNCSC9/70hSquaGJvYThjKvDpHyR
         Ipbg==
X-Gm-Message-State: AOJu0YxlGbkTkDzUKsnFEMOqr7Box3VAsY/L8OdcPa17PEm8mTdbsBo2
	Sv3Fumne6Ku/QP88XRsLJQg=
X-Google-Smtp-Source: AGHT+IHREsBDTR/fguPuUAOPGrQJFqdX7+L934/9nqEfo9v3T6jgbM8x1qOuTAd7fOfx1S8tYfwMzA==
X-Received: by 2002:a05:6358:6f95:b0:16e:43a1:6881 with SMTP id s21-20020a0563586f9500b0016e43a16881mr2252180rwn.26.1701795834695;
        Tue, 05 Dec 2023 09:03:54 -0800 (PST)
Received: from [172.20.2.177] (rrcs-173-197-90-226.west.biz.rr.com. [173.197.90.226])
        by smtp.gmail.com with ESMTPSA id s25-20020a639259000000b00578afd8e012sm5146562pgn.92.2023.12.05.09.03.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Dec 2023 09:03:54 -0800 (PST)
Message-ID: <189fa9b2-bcc8-4839-ac04-33a29bba9aaa@acm.org>
Date: Tue, 5 Dec 2023 09:03:48 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next RFC 01/14] block: add some bdev apis
Content-Language: en-US
To: Yu Kuai <yukuai1@huaweicloud.com>, axboe@kernel.dk, roger.pau@citrix.com,
 colyli@suse.de, kent.overstreet@gmail.com, joern@lazybastard.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sth@linux.ibm.com, hoeppner@linux.ibm.com, hca@linux.ibm.com,
 gor@linux.ibm.com, agordeev@linux.ibm.com, jejb@linux.ibm.com,
 martin.petersen@oracle.com, clm@fb.com, josef@toxicpanda.com,
 dsterba@suse.com, nico@fluxnic.net, xiang@kernel.org, chao@kernel.org,
 tytso@mit.edu, adilger.kernel@dilger.ca, agruenba@redhat.com, jack@suse.com,
 konishi.ryusuke@gmail.com, willy@infradead.org, akpm@linux-foundation.org,
 hare@suse.de, p.raghav@samsung.com
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-bcachefs@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-ext4@vger.kernel.org, gfs2@lists.linux.dev,
 linux-nilfs@vger.kernel.org, yukuai3@huawei.com, yi.zhang@huawei.com,
 yangerkun@huawei.com
References: <20231205123728.1866699-1-yukuai1@huaweicloud.com>
 <20231205123728.1866699-2-yukuai1@huaweicloud.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20231205123728.1866699-2-yukuai1@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_090356_085229_8DA517EB 
X-CRM114-Status: UNSURE (   5.79  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 12/5/23 04:37, Yu Kuai wrote:
> +static inline u8 block_bits(struct block_device *bdev)
> +{
> +	return bdev->bd_inode->i_blkbits;
> +}

This function needs a name that's more descriptive.

Thanks,

Bart.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
