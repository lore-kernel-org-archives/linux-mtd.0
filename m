Return-Path: <SRS0=xf6T=PX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEE2BC433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Nov 2021 11:50:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A03C60296
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Nov 2021 11:50:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6A03C60296
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p7kdfWnoooC97Oc3PobH5Z27dHqjAyQBtHyWC4EFD8w=; b=PpUgaBXwK3zaor
	UM0CajhZ5KHsXOWg/acCyjaa5iuZwsAdyKUywcv+BjsuHP9nVQTvs71KGbOosegVE3JUJpMvxaLFY
	Kfr4t1RNVQGN5UOGjC792C4Vnsh/5hdyoj13f+4GNslaccYSoOAivOktThltCrzQg/L5GumSkGJBs
	9/d4a3oIxgNuQGiEie/RlfF0hho03f5x30QvbT8EkAO13assHpj107bBuhKmDbNBGBIzeEpQy1dVJ
	tc4HTw18LPT/GvSYSHEtN1rTeu292YQ0MEH+LzvJEwEAiRJMey1f8kpNqfy8Bj6ESKwgTqukBKb8L
	587prn04NF8RbxwwTz8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mibF6-008m4k-V9; Thu, 04 Nov 2021 11:49:17 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mibF3-008m2u-Nc
 for linux-mtd@lists.infradead.org; Thu, 04 Nov 2021 11:49:15 +0000
Received: by mail-io1-xd2b.google.com with SMTP id c206so5021479iof.2
 for <linux-mtd@lists.infradead.org>; Thu, 04 Nov 2021 04:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:in-reply-to:references:subject:message-id:date
 :mime-version:content-transfer-encoding;
 bh=jcCYN/Vpuq9VjyR1baSc9jmePXWBGgpQHLyfjUo1kN0=;
 b=qFXeUbMx+fks5h4unoMKTc1LhJZqSE1NyKDAI5w83ogMKOOM0kU3purU/H33NlzPwW
 eHVV1IidhsSGwT1O6tr2jF8Faxr9jVev093BxfP6VSI4dkQ3J3vb4BtkyS+WNvCZLafE
 8RJ6NCGluBEgk853x+GL8iDQYteU5vl6fdQl0+ni96MIOIczYSlK45zpvMifA/kD95hg
 rPa4O1733yq2aC4AVUSrYAMw0Vg1m8W65eUmAmMKxQpMGVCRJrPiS3bXB3M6N1UHwxhP
 raoRViyx1obQj3jBzWassDHD8Ul/z65tEi99uP15mHMonnQSFjUH3i7iVD/2O78UIwYf
 qCcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject
 :message-id:date:mime-version:content-transfer-encoding;
 bh=jcCYN/Vpuq9VjyR1baSc9jmePXWBGgpQHLyfjUo1kN0=;
 b=zEAjWhraabZjVktrO+sROgjY0dy4YFU9KqA2Usb9wM7mJ534ZpTaafu0Rhq0/TDFUA
 g4607/ddbv4EK/kCRImK8bWRrDb7NaLEYKylzTPKTb5Om5EDgCrysf3j/oHnR0qY553r
 7yOLaX2YJSFm4CUcjq4vKFkEyt3KS9hT/0+j+FFYPnczhRlRYXvcgYtSzstkYhW4AYAB
 KGr/kdiUlvCdeAIpEI8UfMKPecas9ExSHdgOf7KRhJXs3I0AHyc5aa9QrWMKD23gffJo
 cR9Gctkmf5dz2COVyszpn87JRFMwXD4vFazA3QadVvLYL7E4+41pSy2iRH6fOaDXx7mS
 X8/A==
X-Gm-Message-State: AOAM532rweaFP/nZC6/z9lt08Z3WYJmynZXp9xi1VgmI0PP+wAonJ6w+
 87IK/ZHGKfvUfdvP6n2DvEdYSw==
X-Google-Smtp-Source: ABdhPJzJv5ibu1rdNLJ/Ra2e9JNtbTKOYYws7eMieW7cg3crbW5dob+RRrmopP3pH67AnoqS2LtSxw==
X-Received: by 2002:a5d:9e44:: with SMTP id i4mr700296ioi.172.1636026552990;
 Thu, 04 Nov 2021 04:49:12 -0700 (PDT)
Received: from [127.0.1.1] ([66.219.217.159])
 by smtp.gmail.com with ESMTPSA id y3sm2877761ilv.5.2021.11.04.04.49.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 04:49:12 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: miquel.raynal@bootlin.com, martin.petersen@oracle.com, hare@suse.de,
 Luis Chamberlain <mcgrof@kernel.org>, jack@suse.cz, hch@lst.de,
 song@kernel.org, dave.jiang@intel.com, richard@nod.at,
 vishal.l.verma@intel.com, penguin-kernel@i-love.sakura.ne.jp, tj@kernel.org,
 ira.weiny@intel.com, vigneshr@ti.com, dan.j.williams@intel.com,
 ming.lei@redhat.com, efremov@linux.com
Cc: linux-raid@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-scsi@vger.kernel.org
In-Reply-To: <20211103230437.1639990-1-mcgrof@kernel.org>
References: <20211103230437.1639990-1-mcgrof@kernel.org>
Subject: Re: [PATCH v5 00/14] last set for add_disk() error handling
Message-Id: <163602655191.22491.10844091970007142957.b4-ty@kernel.dk>
Date: Thu, 04 Nov 2021 05:49:11 -0600
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211104_044913_809443_04A6E85A 
X-CRM114-Status: UNSURE (   9.95  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 3 Nov 2021 16:04:23 -0700, Luis Chamberlain wrote:
> Jens,
> 
> as requested, I've folded all pending changes into this series. This
> v5 pegs on Christoph's reviewed-by tags and since I was respinning I
> modified the ataprobe and floppy driver changes as he suggested.
> 
> I think this is it. The world of floppy has been exciting for v5.16.
> 
> [...]

Applied, thanks!

[01/14] nvdimm/btt: use goto error labels on btt_blk_init()
        commit: 2762ff06aa49e3a13fb4b779120f4f8c12c39fd1
[02/14] nvdimm/btt: add error handling support for add_disk()
        commit: 16be7974ff5d0a5cd9f345571c3eac1c3f6ba6de
[03/14] nvdimm/blk: avoid calling del_gendisk() on early failures
        commit: b7421afcec0c77ab58633587ddc29d53e6eb95af
[04/14] nvdimm/blk: add error handling support for add_disk()
        commit: dc104f4bb2d0a652dee010e47bc89c1ad2ab37c9
[05/14] nvdimm/pmem: cleanup the disk if pmem_release_disk() is yet assigned
        commit: accf58afb689f81daadde24080ea1164ad2db75f
[06/14] nvdimm/pmem: use add_disk() error handling
        commit: 5a192ccc32e2981f721343c750b8cfb4c3f41007
[07/14] z2ram: add error handling support for add_disk()
        commit: 15733754ccf35c49d2f36a7ac51adc8b975c1c78
[08/14] block/sunvdc: add error handling support for add_disk()
        commit: f583eaef0af39b792d74e39721b5ba4b6948a270
[09/14] mtd/ubi/block: add error handling support for add_disk()
        commit: ed73919124b2e48490adbbe48ffe885a2a4c6fee
[10/14] ataflop: remove ataflop_probe_lock mutex
        commit: 4ddb85d36613c45bde00d368bf9f357bd0708a0c
[11/14] block: update __register_blkdev() probe documentation
        commit: 26e06f5b13671d194d67ae8e2b66f524ab174153
[12/14] ataflop: address add_disk() error handling on probe
        commit: 46a7db492e7a27408bc164cbe6424683e79529b0
[13/14] floppy: address add_disk() error handling on probe
        commit: ec28fcc6cfcd418d20038ad2c492e87bf3a9f026
[14/14] block: add __must_check for *add_disk*() callers
        commit: 1698712d85ec2f128fc7e7c5dc2018b5ed2b7cf6

Best regards,
-- 
Jens Axboe



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
