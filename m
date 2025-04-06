Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C478AC36002
	for <linux-mtd@archiver.kernel.org>; Sun,  6 Apr 2025 19:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:Cc:To:From:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QtOuz4GScfmNagPB3aQqjdLe8nTckRRiSM65nTCQCMU=; b=Z0Xm7ImZmbmBfKBaHbx7LfRitO
	uEmq//bvyAUm6k9Q+7lnLeLjrhcOiZRXHNlrNViBko/oRVQ6WFDBlJ7UCuLv0yH8QFNVE0NC4g8XN
	buN4oSzKGyUntRugr0bbeJc+Xvby15x6b5v48tJE2uQyX4pRP/QI6mnLR8edoM7V+iTIqS6pR0XLU
	qVDX2HijaJNHVcs+ITI11aKdPevlRMjcaeGwNxqOmwAYckfbHKw02+CE/5f1+mzkDOCta2Hpv4a5q
	0nKHt3MVhW5mCZD5du7mcgtPTkCXvRXi1urvQkfbFG3w7GxbJDLHkJFxuM0yyF7amQu7moK0ZF72I
	xIxVESZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1Vqm-0000000FiYG-3ZZw;
	Sun, 06 Apr 2025 19:40:12 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1Vqj-0000000FiXr-0JHf
	for linux-mtd@lists.infradead.org;
	Sun, 06 Apr 2025 19:40:10 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-7c549d9ecc6so36623385a.1
        for <linux-mtd@lists.infradead.org>; Sun, 06 Apr 2025 12:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743968407; x=1744573207; darn=lists.infradead.org;
        h=content-transfer-encoding:subject:cc:to:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mO5fydfHAKGvoUzu82MoiuIQJWkfokSlR1XoSOQYf9Q=;
        b=f0+ovOvDlG66XWOMh21sd7gN5y9wgnXmHxchB/P2UYlxCqkw85C8DEZ2JY5ZYQEZfw
         GuTxViwP0fcdcmSt7+0yh4LM9S6dqY01k8/nOcJ/T1wtWr2BMyrz8hgfAtXfjeQLYWBK
         zTrWQHUsSpIQkH1NAF1EbrAjH+rbfkvMJmHIyHRXqllZSVUuIC0PQ/7vxZQApqfjhQ2N
         9Ay/CCH/bN5WACaWRCCdeylQFGKp08/A4SiTcJpzo04zjnt6lLKzLM6f9OPs9n1CJswa
         58iYwY6Z0rXVot0PyOsiFOmtM5QFFs8TSTHIIfIwfxmGTrAuhfKcJ3V23SR9oVYFYSlV
         zLsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743968407; x=1744573207;
        h=content-transfer-encoding:subject:cc:to:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mO5fydfHAKGvoUzu82MoiuIQJWkfokSlR1XoSOQYf9Q=;
        b=HaM4gNwZiw6sE5rqDrW8EJqrbcA3DmjORXC6C7rX20K1tXULuuEdpg9/B06ve90H3O
         3cINpkWmWsTAQ/he8oToIPMsWzLcpOiwDpNFTL19ByupAWVMOWzFEKjSmudJhyuni2CY
         6VLAgrt1q0DqWfpGF9FgKVqlg5COcWJ4yoi0UnsBfDBE4AQaG/jC9flA83a0kEJb6TTQ
         RYPwCCU+LYnvQ4UKiOFVaLw7so6gv/4nVqj67c8ew7eNuQrHGcs5IBa2WQeKoQOak9CW
         3SL1uxxmODB+sIbWBDRxUyFB2F1UnarNwIOvPQLg49v7s981kZ43fyFB7a+4Y/7pEdNB
         b8tg==
X-Forwarded-Encrypted: i=1; AJvYcCVqJEraQR3/FeO2KFAV3d3RbtbvPm9Jwlu1cXYlrO3gdGCGE/IzxSOXjfqP1BA0d4r5RgaaNm42mNE=@lists.infradead.org
X-Gm-Message-State: AOJu0YySzLp8BYPRYjMLJWmE2jnYB+h19DRb+6jjmibN/wutPYaroLTy
	J+T/GqbThCfp/zeU2JUU6ehcDus+xg75INuCEugRrdAdfMsMNSdq
X-Gm-Gg: ASbGncvQDfBPLFL7Tn9AxLbaD/QnLtKZLBzXqH05K/3wwijm1OqVwLouAnBHWmpf9Z6
	UPzgoccqOEMN+Awy4+NfvD5MQzu49AX7If8lpq0VPayGkKFGVSHPt+tqVO1mLxYRdmQmzjv46K5
	/yKJ41SvDQD5rsT4ekox1MO14TjODiwJ2FOy9ucwhLFygRduYJnRf0MjqbLjDYRkAHYJjmapcao
	ZL2OTluL6H5Lr7qSxZReyBImuLVOdULO2s8yF69Mh+F3zcz8Rt2+iDfM0yzOQHvGf6J9cj0pH1M
	q1EZA4PQG4eIZ7nvTW0BVNVm0WUbdQZxhhzkQTgG3ylZWzZwtJrgY8Zo2K2TSenMR3FJpsRpS9g
	q5XW1yvA6jPCvdt4kU6Bi
X-Google-Smtp-Source: AGHT+IHshaNiVavKgRypG9Q1JakhTzWtRhNgywqkAA7FhQPQTwXB+tzfd7Sn9ZKxA/TeaV8FIOT9EQ==
X-Received: by 2002:a05:6214:27e9:b0:6e8:8f31:3120 with SMTP id 6a1803df08f44-6f01e7b21e6mr48014746d6.8.1743968407204;
        Sun, 06 Apr 2025 12:40:07 -0700 (PDT)
Received: from [192.168.1.201] (pool-108-48-176-137.washdc.fios.verizon.net. [108.48.176.137])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ef0f0483a3sm49244196d6.63.2025.04.06.12.40.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Apr 2025 12:40:06 -0700 (PDT)
Message-ID: <8dfd97ac-59e7-ae69-238a-85b7a2dae4f1@gmail.com>
Date: Sun, 6 Apr 2025 15:40:04 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
From: Sean Anderson <seanga2@gmail.com>
To: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, Zhihao Cheng <chengzhihao1@huawei.com>
Subject: bio segment constraints
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_124009_123669_0A3EB347 
X-CRM114-Status: GOOD (  19.26  )
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

Hi all,

I'm not really sure what guarantees the block layer makes regarding the
segments in a bio as part of a request submitted to a block driver. As
far as I can tell this is not documented anywhere. In particular,

- Is bv_len aligned to SECTOR_SIZE?
- To logical_sector_size?
- What if logical_sector_size > PAGE_SIZE?
- What about bv_offset?
- Is it possible to have a bio where the total length is a multiple of
   logical_sector_size, but the data is split across several segments
   where each segment is a multiple of SECTOR_SIZE?
- Is is possible to have segments not even aligned to SECTOR_SIZE?
- Can I somehow request to only get segments with bv_len aligned to
   logical_sector_size? Or do I need to do my own coalescing and bounce
   buffering for that?

I've been reading some drivers (as well as stuff in block/) to try and
figure things out, but it's hard to figure out all the places where
constraints are enforced. In particular, I've read several drivers that
make some big assumptions (which might be bugs?) For example, in
drivers/mtd/mtd_blkdevs.c, do_blktrans_request looks like:

	block = blk_rq_pos(req) << 9 >> tr->blkshift;
	nsect = blk_rq_cur_bytes(req) >> tr->blkshift;

	switch (req_op(req)) {
	/* ... snip ... */
	case REQ_OP_READ:
		buf = kmap(bio_page(req->bio)) + bio_offset(req->bio);
		for (; nsect > 0; nsect--, block++, buf += tr->blksize) {
			if (tr->readsect(dev, block, buf)) {
				kunmap(bio_page(req->bio));
				return BLK_STS_IOERR;
			}
		}
		kunmap(bio_page(req->bio));

		rq_for_each_segment(bvec, req, iter)
			flush_dcache_page(bvec.bv_page);
		return BLK_STS_OK;

For context, tr->blkshift is either 512 or 4096, depending on the
backend. From what I can tell, this code assumes the following:

- There is only one bio in a request. This one is a bit of a soft
   assumption since we should only flush the pages in the bio and not the
   whole request otherwise.
- There is only one segment in a bio. This one could be reasonable if
   max_segments was set to 1, but it's not as far as I can tell. So I
   guess we just go off the end of the bio if there's a second segment?
- The data is in lowmem OR bv_offset + bv_len <= PAGE_SIZE. kmap() only
   maps a single page, so if we go past one page we end up in adjacent
   kmapped pages.

Am I missing something here? Handling highmem seems like a persistent
issue. E.g. drivers/mtd/ubi/block.c doesn't even bother doing a kmap.
Should both of these have BLK_FEAT_BOUNCE_HIGH?

--Sean

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
