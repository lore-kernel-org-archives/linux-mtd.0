Return-Path: <SRS0=B2Jc=KF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8253DC433B4
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 11:14:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25BCB60FE3
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 11:14:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25BCB60FE3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aPOXyzz6A9/nPezsen2LrUqafUc7pk9kp8dEOrDMV3M=; b=CzzNQUHhHMXAVUHYwYT32sZjU
	lhO85Uxrm9Y3t2KXMmWmVvsAwkV+RTo7UsvPKWYUPyB2sk0ox98lySJBv81I0EzpZdYtDmhc3Q0ar
	wxUk8lLyHxcInKtCKGXVj57T5ntZ571gFGOmunq5JEjMiQHzQkxnidrQQF8hKUsxxoFmh7KZE4hr+
	kYYMeb3WTFuNWkFQb5Qx0fjbvz5HvNLkQuMki+tKzXD7Il+RGdRlTddsLmonNIyBe713xwdDKfMI4
	No8TDTYhc7w1YyexsGTq7FBBBXokj3EmL5xtTGqae/vG8tgtmUtdW4n7Iqw024msHWeeX4V3IXjBa
	U7ozJsF7w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg3r1-00E2yO-Kz; Mon, 10 May 2021 11:13:41 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg3Of-00Dz55-B6
 for linux-mtd@desiato.infradead.org; Mon, 10 May 2021 10:44:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=TmyWnYLLuopvzZDFqyzUnlwlkanvN8SugsxiLYp+rbI=; b=ma1F+XgfESylDqBn3Aia+CQhSb
 KObbJ+FNSxnryDTDUsFux6SgErNY51KhSvv0SGJavqzneCfUpjeYj9Kvajp7Z5pfM2OEIBAD3UGQY
 g9z9VGwt9L6RawdSt6Qy90PizAdIky2++d73talSfARfBGBTA9Ubr6WFR8IjqgHYM0mQPho7HsHem
 3gemhS9myGeGZ+f+DPnHkW20pS0joSzGDnfH1IlqH6TrV9Tosw84hdc+x1ccGKzIgBOJM4zDn74B9
 wbQduUu429gNd2R3Tg7pdQi51nvniTMUiR7VFLRXjs9HMcneX42rsJQ7w/SP6xQGVj054fy5UN3zW
 C0SoWmRA==;
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg3Oc-008YuB-DI
 for linux-mtd@lists.infradead.org; Mon, 10 May 2021 10:44:20 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id B9A176000B;
 Mon, 10 May 2021 10:44:15 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 1/5] nvmem: core: allow specifying of_node
Date: Mon, 10 May 2021 12:44:15 +0200
Message-Id: <20210510104415.11332-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210424110608.15748-2-michael@walle.cc>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'1333a6779501f4cc662ff5c8b36b0a22f3a7ddc6'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_034418_602497_CD3651BE 
X-CRM114-Status: GOOD (  10.08  )
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

On Sat, 2021-04-24 at 11:06:04 UTC, Michael Walle wrote:
> Until now, the of_node of the parent device is used. Some devices
> provide more than just the nvmem provider. To avoid name space clashes,
> add a way to allow specifying the nvmem cells in subnodes. Consider the
> following example:
> 
>     flash@0 {
>         compatible = "jedec,spi-nor";
> 
>         partitions {
>             compatible = "fixed-partitions";
>             #address-cells = <1>;
>             #size-cells = <1>;
> 
>             partition@0 {
>                 reg = <0x000000 0x010000>;
>             };
>         };
> 
>         otp {
>             compatible = "user-otp";
>             #address-cells = <1>;
>             #size-cells = <1>;
> 
>             serial-number@0 {
>                 reg = <0x0 0x8>;
>             };
>         };
>     };
> 
> There the nvmem provider might be the MTD partition or the OTP region of
> the flash.
> 
> Add a new config->of_node parameter, which if set, will be used instead
> of the parent's of_node.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> Acked-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
