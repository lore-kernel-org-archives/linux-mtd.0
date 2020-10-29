Return-Path: <SRS0=x3fM=EE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9171C2D0A3
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2020 09:08:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 574B1206D9
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2020 09:08:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M9Xvcx+u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 574B1206D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=my/hRT5fGugBiT3H67VGr6VE/0VbU0E/sG/IcfMIIvk=; b=M9Xvcx+uryYYnxFfkfFYiy000
	Aj5mD6idz+SXBKFtTE3DBClBrjDv+yNTr4r4+f+Eg6ik6wYyghwnBqxF32479Obv+g3i5lpLs91UE
	qhUSiughKCiGQQReQrAUH7SEKLd/YnEZPT75wvMv+boFuctqKbkEeEg303FfX+B75vfn3Rdm40tjP
	ffqiMM1kCQR2GAKuvF93OwqhmiNzT/3ZF7jkVt+8zB8o0E8ExJ3OTmEbvX6B5U7LVGOAWc4b7Dgdb
	224H81tM1A2/swuguws34eC4H9lDn/VSN6cn+VMg2IRufkGrGstwMdk/xZWHnJHJnfVgPLKzLyKBi
	4rzx0rocg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kY3uX-0004q7-EN; Thu, 29 Oct 2020 09:07:57 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kY3uV-0004pf-IB
 for linux-mtd@lists.infradead.org; Thu, 29 Oct 2020 09:07:56 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 35D211F458B8;
 Thu, 29 Oct 2020 09:07:54 +0000 (GMT)
Date: Thu, 29 Oct 2020 10:07:51 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Md Sadre Alam <mdalam@codeaurora.org>
Subject: Re: [PATCH 2/5] mtd: rawnand: qcom: Add initial support for qspi nand
Message-ID: <20201029100751.713e27df@collabora.com>
In-Reply-To: <1602307902-16761-3-git-send-email-mdalam@codeaurora.org>
References: <1602307902-16761-1-git-send-email-mdalam@codeaurora.org>
 <1602307902-16761-3-git-send-email-mdalam@codeaurora.org>
Organization: Collabora
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_050755_900545_E4AB022F 
X-CRM114-Status: GOOD (  13.42  )
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
Cc: devicetree@vger.kernel.org, vigneshr@ti.com, richard@nod.at,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, bjorn.andersson@linaro.org, agross@kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 sricharan@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello,

On Sat, 10 Oct 2020 11:01:39 +0530
Md Sadre Alam <mdalam@codeaurora.org> wrote:

> This change will add initial support for qspi (serial nand).
> 
> QPIC Version v.2.0 onwards supports serial nand as well so this
> change will initialize all required register to enable qspi (serial
> nand).
> 
> This change is supporting very basic functionality of qspi nand flash.
> 
> 1. Reset device (Reset QSPI NAND device).
> 
> 2. Device detection (Read id QSPI NAND device).

Unfortunately, that's not going to work in the long term. You're
basically hacking the raw NAND framework to make SPI NANDs fit. I do
understand the rationale behind this decision (re-using the code for
ECC and probably other things), but that's not going to work. So I'd
recommend doing the following instead:

1/ implement a SPI-mem controller driver
2/ implement an ECC engine driver so the ECC logic can be shared
   between the SPI controller and raw NAND controller drivers
3/ convert the raw NAND driver to the exec_op() interface (none of
   this hack would have been possible if the driver was using the new
   API)

Regards,

Boris

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
