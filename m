Return-Path: <SRS0=B2Jc=KF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7924DC433B4
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 11:07:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EB846186A
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 11:07:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EB846186A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uLzOe/r6nH5p9tjOpuhStHOKisvOe4XGeeYJk2YGxiM=; b=WNX52y/DHAVLMTc7OlSR/R6ba
	rjVV76wB3g/ipqFmv0QLgiQ8ro8yDSsyQxL3O2aHM9d/pbvZM1VGzjfhDbnUMbRzs53ZbJSjnqwoR
	zIVDougwZmAWdcRF6R/Y5L58L16D9y2BTlTLYZIzy6YNXyxyQmY54x5yvFXD144EyIE4H1PKTen7K
	AO/ynl+pn1HHz7Z6TjgLboQajUJhYmbUWoHaQDOfE4ddfRjFmhlgfBEd+FJ5mkvJUKdz2JLdUVLDr
	gucTFbQRQbzOzdJEw4RmII7cUJoFi8YfijmNRVlv0OCuQWXV66UZ0riW3E52c1eF19eQpuTcIYIut
	7YqmGc34w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg3kA-00E2Cv-NQ; Mon, 10 May 2021 11:06:34 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg3OV-00Dz2q-Mh
 for linux-mtd@desiato.infradead.org; Mon, 10 May 2021 10:44:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=zuBxNwr8Es/Z9jz9TL9tGrqotYBoy+R7Eo32vB9pd/I=; b=Q400myPv6nD30S9vHrhyr2Skmy
 9h0gwC23CAqXVaNsGMqpih+0fgOJf07PM+ksHSDKpL0RffK9gVM2sN5w4Xamp9z1itGuva0GfRfTp
 QmM4XY2B2DHSDJI4v3B30qxaEiF5po+eHJ4mRLtyCYw2xYsJ6QLjlF3iT5oLpiY1ylOyXdXHXssdE
 AoL0xbwaWMeluIZX6TqPjoAgfVFbuvIpAGQenVbAEsG9/yyEafhbcmMz4jTqrUI3XHP3P2tN9CQHZ
 i9yzBGFJHvZ8daURrSdN9YoiQr3Pa8JoOuxQ20FtzoBuY24nCTVxRgIK2zrq0yoPq+kpqOAdWKsw9
 b1lt3Rdg==;
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg3OS-008Ytc-Qr
 for linux-mtd@lists.infradead.org; Mon, 10 May 2021 10:44:10 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 9509F1C0006;
 Mon, 10 May 2021 10:44:06 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 3/5] dt-bindings: mtd: add OTP bindings
Date: Mon, 10 May 2021 12:44:06 +0200
Message-Id: <20210510104406.11203-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210424110608.15748-4-michael@walle.cc>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'74ae3663b110d8d3e5d41dd4b05f4fa6bd79d49d'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_034409_021815_B42F07D9 
X-CRM114-Status: UNSURE (   6.44  )
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

On Sat, 2021-04-24 at 11:06:06 UTC, Michael Walle wrote:
> Flash devices can have one-time-programmable regions. Add a nvmem
> binding so they can be used as a nvmem provider.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
