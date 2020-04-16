Return-Path: <SRS0=O+nk=6A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EE9EC2BB55
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2020 19:53:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E60C221F9
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2020 19:53:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KhjE5KtC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E60C221F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ijzUeNmPTgZPtFsqccEMmbYT1xfVIU8zm7jqMgH9470=; b=KhjE5KtCstGV7l
	FnY7PBx/CY3/Zga+wX42VB94bnz1V+MJKYMEk+6Meu/m+5p7nvglTJAtL/iic/TcW/a8lbMj6aIxP
	N320snI+j/cv29/FSazPU/rsiFltW56WIYzd2NED41zf4p0EWqiiqrjS7agXRBj5C0gdSS2Xvq2wj
	XwAqrB9xXq+kHyB+olUOSGLfBf55L9171eOAP6YpqoLgMRnySLCjKl7uHWdxwxSc5EcW7CpdmfUqf
	uwr1cDqjKPVqIvvJSv0xqtgWUmmhufzki1HDy7FCWvtmduPXUtWJvl49oVfBw7t119FTU07u07KIb
	vJPgms3F6kv32RdJFXZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPAZs-0006GJ-Kb; Thu, 16 Apr 2020 19:53:36 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPAZp-0006Fs-31
 for linux-mtd@lists.infradead.org; Thu, 16 Apr 2020 19:53:34 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 49C832A23D7;
 Thu, 16 Apr 2020 20:53:31 +0100 (BST)
Date: Thu, 16 Apr 2020 21:53:28 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Christophe Kerello <christophe.kerello@st.com>
Subject: Re: [PATCH v2 03/12] bus: stm32-fmc2-ebi: add STM32 FMC2 EBI
 controller driver
Message-ID: <20200416215328.53982fef@collabora.com>
In-Reply-To: <1586966256-29548-4-git-send-email-christophe.kerello@st.com>
References: <1586966256-29548-1-git-send-email-christophe.kerello@st.com>
 <1586966256-29548-4-git-send-email-christophe.kerello@st.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_125333_260545_D9FC424A 
X-CRM114-Status: GOOD (  11.30  )
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
Cc: mark.rutland@arm.com, marex@denx.de, vigneshr@ti.com,
 devicetree@vger.kernel.org, tony@atomide.com, richard@nod.at,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, lee.jones@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 15 Apr 2020 17:57:27 +0200
Christophe Kerello <christophe.kerello@st.com> wrote:

> The driver adds the support for the STMicroelectronics FMC2 EBI controller
> found on STM32MP SOCs.
> 
> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
> Tested-by: Marek Vasut <marex@denx.de>
> ---
> Changes in v2:
>  - call 2 APIs to manage FMC2 enable/disable instead of ops
>  - call 2 APIs to manage FMC2 NWAIT shared signal instead of ops
> 
>  drivers/bus/Kconfig          |   11 +
>  drivers/bus/Makefile         |    1 +
>  drivers/bus/stm32-fmc2-ebi.c | 1091 ++++++++++++++++++++++++++++++++++++++++++

Hm, I see that other memory bus controller drivers are placed under
drivers/memory/, any reason for choosing drivers/bus/? If that's where
we want to have all generic memory bus controllers to live it might be
worth moving existing drivers to the drivers/bus/ directory at some
point.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
