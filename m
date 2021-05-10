Return-Path: <SRS0=B2Jc=KF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79BC7C433B4
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 11:12:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21B5161624
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 11:12:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21B5161624
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DTWCqnfdNWnw2kf1An+XkDm/wwn+2MRsfil5r5tFsOE=; b=bUbsArqOmDK58OM+7w4mj8kVi
	tIc310OvyheKqSOmyw8BQ2ZKeG5UJ+6fHmqh4FRCGFkchvNBjdcxtVfh/BghOa93z8crLUTrfzcKA
	LDyURle0qz3PgijzJLjp0yg8Evl2J+K8mFbnMFtTvFjvSQTepvhpBZik9rE/wH+/P2xLXsZQB1Efj
	nl+5oxfNZh7ckGIwOF+Ql5bICNirPOQm7V1iSQiZBJxTUMOW9YWhNAFClXMOqBUgbgce/v/dByPiB
	p1oBsETCmy89rxf11HUQwnAIJaxvqzZHQwwgH5MqktveEZTn8oIAGHHWCp5Kr7ejj/GFS4ItqjSHq
	u9uvEhdcg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg3nd-00E2dP-CQ; Mon, 10 May 2021 11:10:09 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg3Oa-00Dz3t-Jm
 for linux-mtd@desiato.infradead.org; Mon, 10 May 2021 10:44:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=JDsAqYiF9v1L2DavjD8wURgwHNlAwKWGehpuZwMWywY=; b=a502AmM6hRvVoU7hnlnif1btRc
 R2xOWFIY9LYoaTDOlP7qWwUyqRWVpQIPM0puUvcTSbXX37vrz5Xext78+XeBlg5fN0zST9vqZthjU
 /1ci0luB3Ca72Mora+CWqNPqScLPzV7JDv5SL7glU4BvRE8SNK2b8unNoFQ+SZy4M7vM1l3bJklpf
 TKVTptDRoi3YU+xHYSFGPgWy/SKiGqMhjLs8HNk9bNWrm31Q3C6V23s9CU/wlP0IM7fT5Ah5oQhx6
 +VAz0Ijq3JOViA+2qgc+ZjYC1BjH1386S9wVsiB3h4WJ8KrxoqVCHWiZJEqfYXDnogfLAWVJOfH2Y
 aVlmhcGQ==;
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg3OX-008Ytw-Qy
 for linux-mtd@lists.infradead.org; Mon, 10 May 2021 10:44:15 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 7F7D61C0015;
 Mon, 10 May 2021 10:44:11 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/5] dt-bindings: mtd: add YAML schema for the generic
 MTD bindings
Date: Mon, 10 May 2021 12:44:11 +0200
Message-Id: <20210510104411.11267-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210424110608.15748-3-michael@walle.cc>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'e6aed6717cd429a48995d2c6533fdde9f88d8cf1'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_034414_024628_F3E0E0D9 
X-CRM114-Status: UNSURE (   5.54  )
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

On Sat, 2021-04-24 at 11:06:05 UTC, Michael Walle wrote:
> Convert MTD's common.txt to mtd.yaml.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
