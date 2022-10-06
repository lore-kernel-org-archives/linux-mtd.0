Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E12A2C433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Oct 2022 22:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bSvc1pGhqKlBxIbAFwF1OFxuy3VewiTy8mia/AV4A5g=; b=JCw05ZP2+6+g56
	QhVaRFxbGWoO/WLhXM0tmVs152GR1Ma42R9O841qD+s3z7Q816RufDa0mectKHQSev9y9iK3/ffwv
	O6u68490ha3gGNJ5czDwJncyzJmDbgOjEdkc7hzY++sHjNjMfaBgRaPnoqbAe+F4dgiwX7CgdtNkE
	Q7IoOAj6lH8oG/KHO8Fc0XHrbB4ZRvfbpVsfNr2YMY7ZUBBepMvv1T+I4m8yHNe6vsoGZ3tdDJggM
	vEK+3wk5RJA2hhjK9ygCXruQaxUrsk+WRQW7hHoSZmnH0ZnPchac+bDSKWBuRdpUOSSXvsCoF/8vd
	S+w0vRp9GEuN46J05Ugg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogZoO-005r2n-HG; Thu, 06 Oct 2022 22:57:52 +0000
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogZoL-005r22-Hc
	for linux-mtd@lists.infradead.org; Thu, 06 Oct 2022 22:57:50 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 387805C00D8;
	Thu,  6 Oct 2022 18:57:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Thu, 06 Oct 2022 18:57:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1665097064; x=1665183464; bh=b5
	XUZk2mUE1/iao/j42pTqa0KQh0Vq/p61ZJZ5jY18I=; b=jwgAn3XAcipVn1klJ0
	SyxDIdbbnJw5PnU6L6sV1++NlGCPbafHCOT0aIQ9Qdnu4xPQ6pEKpum2R3c7D1NL
	O5fe6WaEXaIIohEmpRPadcg2S8kfzc8eUSab0/0/0SVMQZmGarnnYhmqpXmRsx4f
	XK6jeL+tEeeuiVDEtsJTqLpc28E58ATjcRuTZcd/MBtArCkRHs8fx/A2SJqdPEGH
	8BHOgPonTMJedug3A7F15vBnKdsOXhVKfZbYCS/H0NISEuuOIqepc7T4D+GqrQHS
	q6WymY++VmvBpZL2BVpgBWAMGrZFME78PWX32CRuQSxcFWprZbE04qGUF8Pait6P
	pW8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1665097064; x=1665183464; bh=b5XUZk2mUE1/i
	ao/j42pTqa0KQh0Vq/p61ZJZ5jY18I=; b=CQe3AXuMeuy0b/qGv/tfoHnqqh3fX
	9Fo/AwWT9pHXsbgwDjMZAuebXrdO1bH6FyED3DNxHO3+Wvc1jpcDz5UlVlOZSAJI
	YnuzsnpIsXr3MnHDoMmMkjymml3MzXsfBhBKK6u6dnjqKW+dzTPo+zzA5x2Kv+2r
	tV8xySFnRbkcG8/5+uBkpWgscapbahYQQXEl/gj3jDd4zMEPKsrK7zuq02vXETeT
	x7G5opZa0NKFOZKbcG/ooR2SYfBPDeKn7JNTjF6SEJeA0I/qVY0/fw2iuIZ8319B
	TtLfeqTLrUcRT/TeI3wVVAmY0Kvc35iJZTmcwWY8N0YBMuqpun2mf7wlg==
X-ME-Sender: <xms:Z10_Y3eooiZblZXf3h_THx_qprAVnWz2QX26bTOtaWK8thQy5XKTGw>
    <xme:Z10_Y9PARl4JRuZMCgnNrwfCgcHsSOhlyzntQkY00VEjkoRjBwgrCFctkUfjkxT7p
    4GKGW1BO3xTdwBiEJg>
X-ME-Received: <xmr:Z10_YwgEQmlcu1faVEcbfUqVDAGkv-bnz9IPRjAZibc9e_BzXUrC6f-f6CGtTcXmZvWR5cLmdvWVxYh773eBhgSmMGYFfeOc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeiiedgudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfeefmdenucfjughrpefhvf
    evufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefrrghtrhhitghkucghihhl
    lhhirghmshcuoehprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrghtthgvrh
    hnpeefveeihfdvgeeguddtveeuudeuvdelgeetleefhfeukeehteekieeujeehtddtjeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrh
    hitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:Z10_Y49T_gyIllh6Z6IhNZElTJOIWrWrPpksFyroceI7ds9kqYHRuA>
    <xmx:Z10_YzvSc02JoAiuUWEVzeU9bxs0wBhHGEX2YuKbA6jgGYhJ8c8xgQ>
    <xmx:Z10_Y3EhfIJZ2GvogYZ9HvNd3gsNzYFD1wckD43-AD5YQjfkMgHfCQ>
    <xmx:aF0_Y5D-GUn-k8pHNYgWigQfH9ixrDETFIbIWUrcBPXtS2eAlWoRMg>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Oct 2022 18:57:43 -0400 (EDT)
From: Patrick Williams <patrick@stwcx.xyz>
To: potin.lai@quantatw.com
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	p.yadav@ti.com,
	patrick@stwcx.xyz,
	richard@nod.at,
	tudor.ambarus@microchip.com,
	vigneshr@ti.com
Subject: [PATCH v4] mtd: spi-nor: winbond: Add support for w25q01jvq
Date: Thu,  6 Oct 2022 17:57:37 -0500
Message-Id: <20221006225737.3560091-1-patrick@stwcx.xyz>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222085148.21594-1-potin.lai@quantatw.com>
References: <20220222085148.21594-1-potin.lai@quantatw.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_155749_675516_F7D5F247 
X-CRM114-Status: UNSURE (   9.01  )
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

From: Potin Lai <potin.lai@quantatw.com>

Add support for winbond w25q01jvq chip

Signed-off-by: Potin Lai <potin.lai@quantatw.com>
Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
Reviewed-by: Michael Walle <michael@walle.cc>
---
 drivers/mtd/spi-nor/winbond.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index ffaa24055259..e60ad92c0ace 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -139,6 +139,8 @@ static const struct flash_info winbond_nor_parts[] = {
 	{ "w25q512jvq", INFO(0xef4020, 0, 64 * 1024, 1024)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ) },
+	{ "w25q01jvq", INFO(0xef4021, 0, 64 * 1024, 2048)
+		PARSE_SFDP },
 };
 
 /**
-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
