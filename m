Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE4DC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Mar 2022 16:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4pgVLslXFehCpAVmVDOm+krqyKERxUQaVXNhFJkxKOs=; b=cAcNAn7cvcSCNL
	3IP7KS3WoShPVj2fmuj3gTTqJ61UeX3lrwMbQ8gW+NmU3oRpwIyckIwXrf/8dhksuFLUZytrXMrMN
	7800ScMhnU3Y9dhML6wI4OQl+rbfNt8kvPgcsWgFitoLHfihuagR8tqg15dEjj+/T5MuscaWUc8wT
	5ZrIEK059t1fbgrkk/NtH3zYeiQCPBihKzE0gbB2HHyYWjO+7Y5+FTmDcsM6cevN5HLlzYclgqZYz
	/lwbFLN6uuPuHmG2qpTEe+awVA9ODyFLfozY5IddlgpfjMw7jB0+DtT2C+Q7GqzQLMjpCUnGQvLCm
	pnWedv2qcxif3LTdMtFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTn7X-005uVk-Ca; Mon, 14 Mar 2022 16:00:31 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTn6x-005uG9-GK
 for linux-mtd@lists.infradead.org; Mon, 14 Mar 2022 15:59:57 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A21E720002;
 Mon, 14 Mar 2022 15:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647273592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rKG6p0o6eMj1vKwb7urgP6OlCMQPZuyRxy4tfDd+QRI=;
 b=fRxX88VIt0QqdkaXb5BIVvmfWzx0jhtdZ5RzJD6ia4zfi1hwY2AGqfK5TgSIiuA4HEIRn1
 NnYc2pbiQVeq+O0ale2iILwOtU/TzI+S4hXdQqr9WOHIR/jESV6l5zvZmD373N3b8D8NZS
 hxc3iUnOvKjWdCYIa/Y+wThtNQTHbDucW3zvULg0i2jCJTJVKTlewj7b+4k+0Tgb7ma6Ot
 TMMuOt/YrB4fAbQqFh+oo5RRsuCqYqUaeH57oWhDhhVpDghf1PC0deN40Jx3ZDs56WHNRF
 jSxzYwQ2jrhtUS3eEaLwwo1m6a5K8e7DnrlbX2LHSuhjPtvxyjtHjOVzWWMW+A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Hauke Mehrtens <hauke@hauke-m.de>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org,
 =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH] dt-bindings: mtd: partitions: convert BCM47xx to the
 json-schema
Date: Mon, 14 Mar 2022 16:59:50 +0100
Message-Id: <20220314155950.77335-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220216104135.31307-1-zajec5@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'6d41012c4498f71c8aeb89794d25511fe0aeccea'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_085955_710514_A2A64C10 
X-CRM114-Status: UNSURE (   5.61  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAyMDIyLTAyLTE2IGF0IDEwOjQxOjM1IFVUQywgPT91dGYtOD9iP1VtRm1ZY1dDSUUx
cHhZSmxZMnRwPz0gd3JvdGU6Cj4gRnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tp
LnBsPgo+IAo+IFRoaXMgaGVscHMgdmFsaWRhdGluZyBEVFMgZmlsZXMuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+IFJldmlld2VkLWJ5OiBS
b2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgoKQXBwbGllZCB0byBodHRwczovL2dpdC5rZXJu
ZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9tdGQvbGludXguZ2l0IG10ZC9uZXh0LCB0
aGFua3MuCgpNaXF1ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
