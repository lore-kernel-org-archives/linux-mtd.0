Return-Path: <SRS0=Jpfl=PR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D599AC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 15:10:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9ACEE610FD
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 15:10:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9ACEE610FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=IOrJ0mGNdjUSl6AbqhMrUdd6hPnUpQ/duMKxJLULmCo=; b=URKZ6WlYE3LHHU26/Mcb2gdIQK
	YrvC30Jno/UJQ7EKUG3GP3hXDzRZsMD0AGmI/QCS8wEo/xTso2d41ktR37o8D6LVlS0bpO/PCfoGq
	PO3O7l53VzDVWH1RXEShT49ojkwCdYZpqCorICbnXsTaPz8jQL+550pTkDpUkhXdSKaoAOow7MgvI
	6+QcucPRNHt+vG8SjkOelCg3hP0op1X1HCec/+Ks3BY1biFuguSY5lWW5D7DTtdLIs5msLyVym32H
	N5E5Nc5+Va0u7anqhBvWVgHJK28IzJlVv27vGcoXdc5DLp5EA3ubbjurT/T+L1OGudl6UaAhnpucE
	XoF4cmvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgTWN-00BIvz-Vr; Fri, 29 Oct 2021 15:10:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgTWB-00BIsX-Hp; Fri, 29 Oct 2021 15:10:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=4YN8DKc/50CxJ1/q46BvmC8TnMeGci9z1miBkCyhNpU=; b=FV3owrfnS0CfUbnuX9OXOFFqJX
 NmdXz/DOByNNeprGTa6FC6aCLvgPTkCUorqFQSUa+L8LcKCSn304KpqFF6IrnnLOyTrD+evEDLQNK
 0ozka9hMYFCBdJJi2TW7fTAaOcYdSEWqAhbmHvvJybh5ws+8VX5lV7FbxZ9oHcRz52mpd+MYzcmQY
 q9LHMBOH2BBDn2Qqjlgaf7ipi7kV+dlrv7WbmGGZKTuh7jReVQZfRggusg5qsRfyB1SLDw0PUdCl6
 sj1lMU6/nR3d9jQhIR7slT5in4a2hvAfpyIJmBmlT5iK/ycRhNn1PBughoXKBA+URp0XO1NddfCzi
 QwHixX/g==;
Received: from [2602:306:c5a2:a380:b27b:25ff:fe2c:51a8]
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgTW9-00D6lg-CO; Fri, 29 Oct 2021 15:10:05 +0000
Subject: Re: [PATCH 11/13] ps3vram: add error handling support for add_disk()
To: Luis Chamberlain <mcgrof@kernel.org>, axboe@kernel.dk,
 mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 jim@jtan.com, minchan@kernel.org, ngupta@vflare.org,
 senozhatsky@chromium.org, richard@nod.at, miquel.raynal@bootlin.com,
 vigneshr@ti.com, dan.j.williams@intel.com, vishal.l.verma@intel.com,
 dave.jiang@intel.com, ira.weiny@intel.com, kbusch@kernel.org, hch@lst.de,
 sagi@grimberg.me
Cc: linux-block@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-mtd@lists.infradead.org, nvdimm@lists.linux.dev,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20211015235219.2191207-1-mcgrof@kernel.org>
 <20211015235219.2191207-12-mcgrof@kernel.org>
From: Geoff Levand <geoff@infradead.org>
Message-ID: <2b782451-f931-27bb-1114-2aba450c5879@infradead.org>
Date: Fri, 29 Oct 2021 08:09:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211015235219.2191207-12-mcgrof@kernel.org>
Content-Language: en-US
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

Hi Luis,

On 10/15/21 4:52 PM, Luis Chamberlain wrote:
> We never checked for errors on add_disk() as this function
> returned void. Now that this is fixed, use the shiny new
> error handling.

I didn't yet test this ps3vram related change, but based
on the ps3disk testing I think this change will be OK.

Acked-by: Geoff Levand <geoff@infradead.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
