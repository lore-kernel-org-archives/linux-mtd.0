Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FDF5C4332F
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Oct 2022 08:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hLJd6/105gNZMkkuZd24rSxIz5+epQ57y0WTt+wQh00=; b=qd4TwRy1l34q9m
	c+zH/clwFXil7ouN4JNe4GeH+Wbwm6/VIDCQCx9p6dYuXQ5TJa4OM4OFgjnyVdk2qjKg+lWhXP2ho
	7Tt/65QJhbJPVDJoBKpDh66mrrvHvkHdOvfwRgiwNaY6cbEVZnW/CIVh6AJoc/Efr5XXKUIr0JT8z
	rTY3Qdd/y39waqft90NxFHJ9OhMrLNxiNFk6REfxpD9covi64SLzScThRrKhovag9ecumQ1NrcN3q
	KfBDURO6W0rQfPybEdSSoDHX9v+vcivwvkOJETg7SrduutABonWa0/jjTTSaFclR9PyYRvm83oDmk
	qnM4hD3+ZRGoOyo0WBfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol4jJ-00Gqf1-Se; Wed, 19 Oct 2022 08:47:13 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol4jC-00GqAL-H9
	for linux-mtd@lists.infradead.org; Wed, 19 Oct 2022 08:47:10 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7920E240004;
	Wed, 19 Oct 2022 08:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666169221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yHd14eyO9S7G2ilSa3qdTym8TxwadiwTy0QqUCJBV/I=;
	b=DTgQRNrnscX6K3pU2U5UQQzepwSB916+cYk3PtilU6VMpEE3pZ0B9eVhvmHeQinntXOKSE
	yVW58xUkYAHyUHea6rKKHI+iRdwGi1+kJzouUe8phKkR23STURgE0GsRziRvYGbSMy7lY7
	KFWDRQoXXt64KLOqfxsPZWqzFlZ0S+eN3q+gDKoNZsTJAuhi55boZ8v5m58+WdyKt2ukWr
	kU7+l4SuGRTMFo0qYn26X+ep6n42n/iILUA6LA/Zk4fYwOw3NOgU6TlUWT4IsV375TcWSe
	o9Oi8K2l+j1keCquOfaE+seab3m99G1zX4fxMPxQ50UupULqm2b6+TkdlMC1zQ==
Date: Wed, 19 Oct 2022 10:46:54 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Vadym Kochan <vadym.kochan@plvision.eu>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Roger Quadros <rogerq@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Liang Yang
 <liang.yang@amlogic.com>, Chuanhong Guo <gch981213@gmail.com>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Elad Nachman
 <enachman@marvell.com>, Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Aviram Dali <aviramd@marvell.com>
Subject: Re: [PATCH 2/3] dt-bindings: mtd: Add AC5 specific binding
Message-ID: <20221019104654.7ee35744@xps-13>
In-Reply-To: <20221019082046.30160-3-vadym.kochan@plvision.eu>
References: <20221019082046.30160-1-vadym.kochan@plvision.eu>
	<20221019082046.30160-3-vadym.kochan@plvision.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_014706_750293_58C73991 
X-CRM114-Status: GOOD (  13.40  )
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

SGkgVmFkeW0sCgp2YWR5bS5rb2NoYW5AcGx2aXNpb24uZXUgd3JvdGUgb24gV2VkLCAxOSBPY3Qg
MjAyMiAxMToyMDozOSArMDMwMDoKCj4gRnJvbTogQXZpcmFtIERhbGkgPGF2aXJhbWRAbWFydmVs
bC5jb20+Cj4gCj4gQWRkIGJpbmRpbmcgZm9yIEFDNSBTb0Mgd2hpY2ggaGF2ZSBpdHMgc3BlY2lh
bCB3YXkgb2YgaGFuZGluZwo+IE5BTkQgbGF5b3V0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEF2aXJh
bSBEYWxpIDxhdmlyYW1kQG1hcnZlbGwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFZhZHltIEtvY2hh
biA8dmFkeW0ua29jaGFuQHBsdmlzaW9uLmV1Pgo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbXRkL21hcnZlbGwtbmFuZC50eHQgfCAxICsKPiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tdGQvbWFydmVsbC1uYW5kLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tdGQvbWFydmVsbC1uYW5kLnR4dAo+IGluZGV4IGEyZDlhMGYyYjY4My4u
MjkzNTUxZWM3MzUwIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tdGQvbWFydmVsbC1uYW5kLnR4dAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tdGQvbWFydmVsbC1uYW5kLnR4dAo+IEBAIC0yLDYgKzIsNyBAQCBNYXJ2ZWxs
IE5BTkQgRmxhc2ggQ29udHJvbGxlciAoTkZDKQo+ICAKPiAgUmVxdWlyZWQgcHJvcGVydGllczoK
PiAgLSBjb21wYXRpYmxlOiBjYW4gYmUgb25lIG9mIHRoZSBmb2xsb3dpbmc6Cj4gKyAgICAqICJt
YXJ2ZWxsLGFjNS1uYW5kLWNvbnRyb2xsZXIiCj4gICAgICAqICJtYXJ2ZWxsLGFybWFkYS04ay1u
YW5kLWNvbnRyb2xsZXIiCj4gICAgICAqICJtYXJ2ZWxsLGFybWFkYTM3MC1uYW5kLWNvbnRyb2xs
ZXIiCj4gICAgICAqICJtYXJ2ZWxsLHB4YTN4eC1uYW5kLWNvbnRyb2xsZXIiCgpDb3VsZCB5b3Ug
cGxlYXNlIGRvIHRoZSB5YW1sIGNvbnZlcnNpb24gZmlyc3Q/CgpUaGFua3MsCk1pcXXDqGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
