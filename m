Return-Path: <SRS0=O+nk=6A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59B72C2BB55
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2020 19:45:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 305A1221F9
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2020 19:45:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UZEb1H+E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 305A1221F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ro90YpoonLntSVYBVsZGlQsJNPXMiX9CJRNDaqMawNM=; b=UZEb1H+EstMi+H
	SabB3LG/7/RFfnIBO3fOsSfqStpbviMPQM6mgBitvwxZriBo90YrBNSkzx6Ump2CFYyjWgt4nS09w
	zfTkP4B8vgJjzBEMznTZFO/6ZJwJdvKI7Hwupf1Q6mr968kXsGYf3JxmZGmfkgmOw4AuWL2dOnDrn
	qQRNYLnfmmxDpZfCLSNNYi4YtU3Cv/XPTuYN31ahxIUAIAR3jpG5GL85Rvec5VyC9BpeEQanDL61g
	95N7vkZgiiWaDBeTYG69rCnGvAV8IGBC7/ZG2zaZDCoPz0JkbWTGKwwtAURpEeKtBdi0oiRPLFGDi
	+SIXe4h+YUaQYUCHzirA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPARt-0002pH-P2; Thu, 16 Apr 2020 19:45:21 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPARq-0002ob-Q9
 for linux-mtd@lists.infradead.org; Thu, 16 Apr 2020 19:45:20 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 16AB32A1199;
 Thu, 16 Apr 2020 20:45:16 +0100 (BST)
Date: Thu, 16 Apr 2020 21:45:13 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Christophe Kerello <christophe.kerello@st.com>
Subject: Re: [PATCH v2 08/12] mtd: rawnand: stm32_fmc2: use
 FIELD_PREP/FIELD_GET macros
Message-ID: <20200416214513.43b7b6e1@collabora.com>
In-Reply-To: <1586966256-29548-9-git-send-email-christophe.kerello@st.com>
References: <1586966256-29548-1-git-send-email-christophe.kerello@st.com>
 <1586966256-29548-9-git-send-email-christophe.kerello@st.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_124518_981053_20E306ED 
X-CRM114-Status: UNSURE (   7.45  )
X-CRM114-Notice: Please train this message.
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

On Wed, 15 Apr 2020 17:57:32 +0200
Christophe Kerello <christophe.kerello@st.com> wrote:

> This patch removes custom macros and uses FIELD_PREP and FIELD_GET macros.

Oh, nice. I didn't know about these macros. This could have saved me
from defining a whole bunch of setters/getters in driver code...



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
