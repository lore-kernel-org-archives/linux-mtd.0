Return-Path: <SRS0=/XBI=PE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF0B3C433F5
	for <linux-mtd@archiver.kernel.org>; Sat, 16 Oct 2021 04:40:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFBD561181
	for <linux-mtd@archiver.kernel.org>; Sat, 16 Oct 2021 04:40:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BFBD561181
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sJs2sA/dKLb/mRWFlAKR9CSRwhClM8qeUz/uLdCiNDc=; b=idJEgKLjh8Io5v
	/puYEB2TlCopYFdBG1I5ZLP0iEzF8zRPTn+LrfWp5yZ71d2WEBTgGRGBt1c6hsVrRnlFKmi7bmWOf
	kASrv6CBcj+ulD1SBS3ct+rULyv0FmEvBqgh8DHdz4UtIIaj1toW8nfvOitsLNtac9ueCDIw8tEhC
	3G1J16EAFmBuDP10DOGwgqUXbGppcfmjljbiSg7Q4SZKWuxtxY7o+kiLcmgbW1GDfRIfbaU1/9VLg
	lFUzItqvQWy1f+95x8T4iqKplayv1EcKgIDbG2JHUSeSkCAwyVgI/1LfAAkV4koJ6BY5QOTikXEuD
	+gymyTY89K2yjVdGYzpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbbTz-009jpx-Q2; Sat, 16 Oct 2021 04:39:43 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbbTx-009joe-K6; Sat, 16 Oct 2021 04:39:42 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 1695D68BEB; Sat, 16 Oct 2021 06:39:37 +0200 (CEST)
Date: Sat, 16 Oct 2021 06:39:36 +0200
From: Christoph Hellwig <hch@lst.de>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: axboe@kernel.dk, geoff@infradead.org, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, jim@jtan.com,
 minchan@kernel.org, ngupta@vflare.org, senozhatsky@chromium.org,
 richard@nod.at, miquel.raynal@bootlin.com, vigneshr@ti.com,
 dan.j.williams@intel.com, vishal.l.verma@intel.com,
 dave.jiang@intel.com, ira.weiny@intel.com, kbusch@kernel.org,
 hch@lst.de, sagi@grimberg.me, linux-block@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-mtd@lists.infradead.org,
 nvdimm@lists.linux.dev, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/13] nvme-multipath: add error handling support for
 add_disk()
Message-ID: <20211016043936.GB27339@lst.de>
References: <20211015235219.2191207-1-mcgrof@kernel.org>
 <20211015235219.2191207-3-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211015235219.2191207-3-mcgrof@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_213941_831740_8C597384 
X-CRM114-Status: UNSURE (   6.75  )
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

Thanks,

applied to nvme-5.16.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
