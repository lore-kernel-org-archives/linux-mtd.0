Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C51C4332F
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Nov 2022 16:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+rZ3Mo5rwVr7U1ILRhFYqYpL6YArfhVfT8q1gbrk7Yk=; b=ZA2hHs+PuY3qgO
	2w++coelSGWjhOOZeT994zPGmS+T++90TIpBl1/ufTn7w4DM4+H3e8K/cmklHhB4dq+JjxzUgVfIN
	6xZ3xwRywNQb4JWxYdI4npRkbvaBJ2p8zPOJaZSPge6sdZ1AL/fXy4euYzj4bmZZ2R6yThtzq2lWB
	jtKF9P90aaTEPVuyiH8/H9RAeS5ctGDKAtmHrRh1to4ODpj/4PzfLmYg88VgRKLGnIeMqzMfoFydP
	x2JxC/oorsvi9LSVb1ZyfSTCvGOvu9HBnJoIQkXdLVrq8Dt5YP9Spi7nI/EoqlaCRx8BCHLpGTvmA
	ZWh3kM5jKoO+5l8dLbdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os53i-00GDSm-VA; Mon, 07 Nov 2022 16:33:15 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os4t7-00G8lK-Ko
	for linux-mtd@lists.infradead.org; Mon, 07 Nov 2022 16:22:19 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id DCD9FE000D;
	Mon,  7 Nov 2022 16:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667838134;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rjjELctFESp7irdpKdkiJYoito1nOsPFkddC5B+aubE=;
	b=SdmdWDUYP4zm9smi9oF7/3BdmRNEEvLW9N713dXxVP4YZWbf7RhTSBGbP7dhmuZ+7DC/Ho
	kmEOEnVaP+CYusyinFsU8fVSzKNAjTlGSdtcSo/RiPaAlfWfZ8lczxeGvnCOtE30P4d9tO
	U1XMw+v4lY+wqNdjX/sMsT4V3KDG9vp1MGbZd/5AZ1tyTXsGMGj1Q/yK10qtFZcOlWfTgL
	msj3oFIQC58YunfQmoOW26ReKIS+LPgJIsE/UZIBz0EB1cJ113z4CzSgm/zIrD2jtc4Z0Z
	k5zFrdypQz65YRyV3YVDG21eq8G1rCbApzVqQGBqNhf7dh7wmt05GA+ErP1Ogg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Mikhail Zhilkin <csharper2005@gmail.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Jens Axboe <axboe@kernel.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V3 1/2] dt-bindings: mtd: partitions: support marking rootfs partition
Date: Mon,  7 Nov 2022 17:22:12 +0100
Message-Id: <20221107162212.49114-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221022211318.32009-1-zajec5@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'2b9a31d762f0441ab87cb76524c005adf54d6719'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_082217_853564_7E7D65C2 
X-CRM114-Status: GOOD (  11.28  )
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

T24gU2F0LCAyMDIyLTEwLTIyIGF0IDIxOjEzOjE3IFVUQywgPT91dGYtOD9iP1VtRm1ZY1dDSUUx
cHhZSmxZMnRwPz0gd3JvdGU6Cj4gRnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tp
LnBsPgo+IAo+IExpbnV4IG5lZWRzIHRvIGtub3cgd2hhdCB0byB1c2UgYXMgcm9vdCBkZXZpY2Uu
IE9uIGVtYmVkZGVkIGRldmljZXMgd2l0aAo+IGZsYXNoIHRoZSBvbmx5IGNvbW1vbiB3YXkgdG8g
c3BlY2lmeSB0aGF0IGlzIGNtZGxpbmUgJiByb290PSBwYXJhbWV0ZXIuCj4gCj4gVGhhdCBzb2x1
dGlvbiB3b3JrcyB3aXRoIFUtQm9vdCB3aGljaCBpcyBMaW51eCAmIGNtZGxpbmUgYXdhcmUgYnV0
IGlzbid0Cj4gYXZhaWxhYmxlIHdpdGggYWxsIG1hcmtldCBib290bG9hZGVycy4gQWxzbyB0aGF0
IG1ldGhvZCBpcyBmcmFnaWxlOgo+IDEuIFJlcXVpcmVzIHNwZWNpZmljIHByb2Jpbmcgb3JkZXIg
b24gbXVsdGktZmxhc2ggZGV2aWNlcwo+IDIuIFVzZXMgaGFyZGNvZGVkIHBhcnRpdGlvbnMgaW5k
ZXhlcwo+IAo+IEEgbG90IG9mIGRldmljZXMgdXNlIGRpZmZlcmVudCBwYXJ0aXRpb25pbmcgbWV0
aG9kcy4gSXQgbWF5IGJlCj4gImZpeGVkLXBhcnRpdGlvbnMiIG9yIHNvbWUgZHluYW1pYyBwYXJ0
aXRpb25pbmcgKGUuZy4gYmFzZWQgb24gcGFydHMKPiB0YWJsZSkuIEZvciBzdWNoIGNhc2VzIGFs
bG93ICJsaW51eCxyb290ZnMiIHByb3BlcnR5IHRvIG1hcmsgY29ycmVjdAo+IGZsYXNoIHBhcnRp
dGlvbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2ku
cGw+Cj4gUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+CgpBcHBsaWVk
IHRvIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9s
aW51eC5naXQgbXRkL25leHQsIHRoYW5rcy4KCk1pcXVlbAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
