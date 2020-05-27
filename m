Return-Path: <SRS0=kTjQ=7J=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D138EC433DF
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2020 08:35:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9416920723
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2020 08:35:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YuOfWpqg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9416920723
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n0VC4pwsMGJqtd6N1L2Wk/T7kE7+3AbxBpPN/6knuDM=; b=YuOfWpqg/QxJtW
	/orwFSUBlNTEbFGOTtJpHdv9e38keXwNDL6WaJFN2ypq99BLMfl3RgRHb2HhBVhFQFyadxyTDHj8A
	i1BAjVBUdIvg2IUCb3CZZxmODUV607/ehB7WCFhXNRpuO9mnGcX1agBxyabMgi97BGhAFt3hjg0Es
	BZBbhl9B8ZOEBSIP0mmGI5AZIul5zvNKEeTqVMRfIbaNxuG3m3FgB+cZPjvMAdhcQBWwVBeBprMZ3
	iZcELTBeOFUBE6hjsQUymNI0xQ3+2xvFlRLro3Y1z+WDKh7RtCZeH6RJxWdU/7UdsRuMA+ykxUzJS
	jjCJAOysbII9ui6SzroA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdrXN-0002c1-M6; Wed, 27 May 2020 08:35:45 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdrX4-00015C-FU
 for linux-mtd@lists.infradead.org; Wed, 27 May 2020 08:35:28 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B3EE52A0E52;
 Wed, 27 May 2020 09:35:22 +0100 (BST)
Date: Wed, 27 May 2020 10:35:19 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v5 28/28] mtd: rawnand: Allocate the best data interface
 structure dynamically
Message-ID: <20200527103519.0863732c@collabora.com>
In-Reply-To: <20200527095732.467db722@xps13>
References: <20200526191725.7591-1-miquel.raynal@bootlin.com>
 <20200526191725.7591-29-miquel.raynal@bootlin.com>
 <20200527002844.7e54aa22@collabora.com>
 <20200527095732.467db722@xps13>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200527_013526_826614_157B032A 
X-CRM114-Status: GOOD (  12.84  )
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
Cc: Rickard Andersson <rickaran@axis.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 27 May 2020 09:57:32 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Maybe I misunderstood your request, you were saying that allocating a
> "best data interface object" would be good, so I interpreted it as:
> rename it, and allocated it dynamically. I'm fine keeping
> data_interface and just declaring it as a pointer.

Correct, renaming it into best_iface_cfg is probably good, but then,
maybe we should have a current_iface_cfg, so the core/drivers always
have a pointer to the currently applied config (which after a reset
can be the reset config for a short period of time).

> 
> Anyway, I like talking about the "interface" rather than the "interface
> configuration" which is implied in my mind, I saw you were asking to
> add "configuration" sometimes, do you have something in mind that I
> don't?

Well, to me a configuration is something that you can manipulate without
necessarily implying it's the current state the HW operates in. For a
configuration to be active, you have to apply it. And that's pretty
much what the nand_data_interface describes, a configuration, that can
be retrieved, tweaked, and finally applied. Hence the renaming I
suggest.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
