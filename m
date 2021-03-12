Return-Path: <SRS0=p7xI=IK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6964EC433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Mar 2021 13:33:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EC3A64FB5
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Mar 2021 13:33:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EC3A64FB5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NtIkGdP6KBUNPwaLB9Xs6j64lV4McHLbfZ/J+6z1Keo=; b=MBNg8++/g/eQX+IcRQMj3tCcX
	cge68Q8gdIa0WlN35aD1h/E9CG1C77X0tVsSfw6HdERkZRlBoVEmuJy2lJKXvh7NcjTG2Ib2v7ML/
	sfE0JtVPbljLJicH3de+4xhTmcMrGjcHSVxAJTc98GwPvNXb/D/UYXyHGRjdLeMp6ogU8JOvqwwYI
	IQS1cajmzNHu1ssq1Ns83xPlNO8RqEpN/fRrxfOBQpY8p4Tyq/Jt+kr4Io+GopUJtANaLzFn5p/Pw
	LQU5IdETvVmUOcAtTo5hCaYTeg4YuiTT1D2QEG9cCg70G3lpj1vWeUgIE8II/+e12a0KDQZuo3ohJ
	h/HFaO9rQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKhuE-00BXT0-0d; Fri, 12 Mar 2021 13:32:42 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKhtx-00BXRO-V3; Fri, 12 Mar 2021 13:32:29 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 438F722238;
 Fri, 12 Mar 2021 14:32:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1615555945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QBuZP8POWp3qMMHBSO5zfPwntXaxLE+5SncR7mrkwkQ=;
 b=fVeBkdcbfb0c7Z3025M6QUtKCnZBa2aNX05py5QmSYQTSEaWsyniqyN9M5FHUL77xqM7xq
 FzoedG7HmpzUT5MtJ1BsZSmiUozPbYcGeQxArBa9KJzjjwsUR1CRbDuLYSTz2W1mxDlWG3
 oNTTVz+JnDS/UK8Y6Ravou9ofFt/t6Q=
MIME-Version: 1.0
Date: Fri, 12 Mar 2021 14:32:25 +0100
From: Michael Walle <michael@walle.cc>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org, Lokesh Vutla <lokeshvutla@ti.com>
Subject: Re: [RFC PATCH 0/6] spi: Add OSPI PHY calibration support for
 spi-cadence-quadspi
In-Reply-To: <20210311191216.7363-1-p.yadav@ti.com>
References: <20210311191216.7363-1-p.yadav@ti.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <b9450a151cce89cde47b4d6a76c74b32@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_133226_551402_952C8D2E 
X-CRM114-Status: GOOD (  16.06  )
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

Am 2021-03-11 20:12, schrieb Pratyush Yadav:
> The main problem here is telling the controller where to find the
> pattern and how to read it. This RFC uses nvmem cells which point to a
> fixed partition containing the data to do the reads. It depends on [0]
> and [1].
> 
> The obvious problem with this is it won't work when the partitions are
> defined via command line. I don't see any good way to add nvmem cells 
> to
> command line partitions. I would like some help or ideas here. We don't
> necessarily have to use nvmem either. Any way that can cleanly and
> consistently let the controller find out where the pattern is stored is
> good.

The NXP LS1028A SoC has a similar calibration (although there its done
in hardware it seems) and there the datasheet mentions there are flash
devices which supports a preamble before a read function. The preamble
is then some kind of learning pattern. Did you see a flash which 
actually
supports that in the wild? I can't find any publicly available 
datasheets
of 8bit I/O SPI NOR flashes.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
