Return-Path: <SRS0=6iW2=DF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3FB6C2D0A8
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Sep 2020 15:45:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D66F2074F
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Sep 2020 15:45:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pI7UbBvn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D66F2074F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uxIe3KaHB4e79dx4gxvdR97rXtSKnqTVywmdMa63WPQ=; b=pI7UbBvnnGyI1MS4r12QpDk9c
	5rD2TaIOtbyuLEdAyM5dswegk3GSfpTXRu7267ABUuojgS3P0iyiMIYkqWj+yrO+Ud/36cDxwGiJ+
	ezPMh26i6Xc6OMVGPI0dkvdpyPY5iXhG1lfelf4CCS/sPBHh62Kbto/HVE8joMjhdRzkuGKEWogqN
	VwfmAxsHcPaGNu6E+Bz7X4qZDYSd0j6e42yeX4dBHwcrPNq4XtienarSNbhvdYqQOXU2h/r+Kg+f+
	rCuMyZPwkN+iamqtTA7mm1SukFb+O9Ct4BisiuqYhKDYrCIInVGyr7eONGEnkAJEhEXiC1uE23NFE
	TjshOddGg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMvKy-00079S-Eb; Mon, 28 Sep 2020 15:45:12 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMvKw-000787-Ms
 for linux-mtd@lists.infradead.org; Mon, 28 Sep 2020 15:45:11 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9DE0C29AA6C;
 Mon, 28 Sep 2020 16:45:08 +0100 (BST)
Date: Mon, 28 Sep 2020 17:45:05 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v4 1/2] mtd: spinand: micron: Generalize the function
 and structure names
Message-ID: <20200928174505.75fda272@collabora.com>
In-Reply-To: <20200928165528.54e5db6e@xps13>
References: <20200913161533.10655-1-nthirumalesha7@gmail.com>
 <20200913161533.10655-2-nthirumalesha7@gmail.com>
 <20200915101321.1afa5033@xps13>
 <CALKVOUomKLZ5GEHmXb+VfEq8UiNUpCN-Vqkx3N+yykEnCrHkDA@mail.gmail.com>
 <20200928165528.54e5db6e@xps13>
Organization: Collabora
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200928_114510_858939_E4357B6E 
X-CRM114-Status: GOOD (  14.97  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Thirumalesha N <nthirumalesha7@gmail.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Chuanhong Guo <gch981213@gmail.com>,
 Shivamurthy Shastri <sshivamurthy@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 28 Sep 2020 16:55:28 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> > IMHO, grouped means, ecc bytes are at continuous address, where as
> > interleaved means ecc bytes splitted into multiple addresses  
> 
> I don't like the name. Interleaved means that there are OOB bytes
> stored in the data section, which is not the case here.

Well, I would argue that the term interleaved alone doesn't say
anything about the things that are interleaved. But I guess
split/grouped would be fine too if you want to avoid re-using
interleaved here.

> The way OOB
> bytes are organized do not seem relevant to me, I think i prefer the
> "_4_/_8_" naming,even if it's not very explicit.

The ECC strength doesn't say anything about the scheme used for ECC
bytes placement, and you might end up with 2 different schemes
providing the same strength, or the same scheme used for 2 different
strengths.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
