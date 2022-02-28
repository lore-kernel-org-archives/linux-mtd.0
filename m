Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE301C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Feb 2022 21:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qQ23q+VAN3u9zhtg87aiA2vWFsTZhixhhmvs+21Oy6g=; b=UXLF1wQKUGjGVK
	sv8u2OjLVOrkqNAU+QceY1V7XoU1ajF4DJ3vBoJi41rDxmzGTv2WPjzuToiZSAyPZW6mQu/VBBAbo
	nZOCJSRbW5TaWPDK9oECJ/gqbzVlNvP3lurEDmEpm9/SlIzwrdDLAuIjHiXUHr5jF6iAs79EVXGH2
	XAtFfj3T0NcxCJJFCFCIb2YA3kgeTVj7XPSGCETr5OUqiEqEcyA2amszBgDNwirE+GMExPBusgi8G
	NYISIiJ+MVk6Cqbuh7OONK5qbpUYDcyym9k7UL+Uoq/0Ai0iv5KmIejSN+qBpm9dIXbTGyG+VWihJ
	bCH8ljh/lBpwnT7KO9JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOnqG-00EDix-HA; Mon, 28 Feb 2022 21:46:04 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOnq0-00EDcM-Mm; Mon, 28 Feb 2022 21:45:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2B445B81680;
 Mon, 28 Feb 2022 21:45:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B9C7C340EE;
 Mon, 28 Feb 2022 21:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646084744;
 bh=xNZESzUMzSuk4pAAHRceX1seRWJe9glE5ZOBVSMu+ss=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kJsao+0jIAu7AXGo4SmZExZXCVdAMoRdI6X/QYb0Jwx69nV5AXxk1KuFrkvkDoBZ8
 wynJf7Ejzi16ZoB5fMgRDwbiZpcd+/EAx5d25F81iwujuU137kggTAu/Ouyhd6mslo
 qE1lWNqd/NvyYxD/oyrvBcmlF7sWhF0wdtNX9KoO9XakbyKPyrNllh+oB1O7BVNSpF
 dyjcppCe9nJobXDjDDRHaOnC4Y5GBT+Wrmd/cpxS8p7+CGMPMv3PCmgoM8Ae/0ptaI
 3jM8TnpXM4NyIeR9REsX9YfQPND5nJKX1ATaS1f6IV2RiEh5xRTMvwe/eiEwfX2qu8
 OnaqJZkVhHwKA==
Date: Mon, 28 Feb 2022 22:45:34 +0100
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof
 Kozlowski <krzysztof.kozlowski@canonical.com>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Dmitry
 Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>, Lee
 Jones <lee.jones@linaro.org>, Guenter Roeck <groeck@chromium.org>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Kishon Vijay
 Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, Sebastian Reichel
 <sre@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Mathieu
 Poirier <mathieu.poirier@linaro.org>, Mark Brown <broonie@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-mtd@lists.infradead.org,
 netdev@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-spi@vger.kernel.org,
 linux-usb@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Another pass removing cases of 'allOf'
 containing a '$ref'
Message-ID: <20220228224534.073ca78a@thinkpad>
In-Reply-To: <20220228213802.1639658-1-robh@kernel.org>
References: <20220228213802.1639658-1-robh@kernel.org>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_134549_069975_01DAB9DE 
X-CRM114-Status: GOOD (  13.18  )
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

T24gTW9uLCAyOCBGZWIgMjAyMiAxNTozODowMiAtMDYwMApSb2IgSGVycmluZyA8cm9iaEBrZXJu
ZWwub3JnPiB3cm90ZToKCj4gQW5vdGhlciBwYXNzIGF0IHJlbW92aW5nIHVubmVjZXNzYXJ5IHVz
ZSBvZiAnYWxsT2YnIHdpdGggYSAnJHJlZicuCj4gCj4ganNvbi1zY2hlbWEgdmVyc2lvbnMgZHJh
ZnQ3IGFuZCBlYXJsaWVyIGhhdmUgYSB3ZWlyZCBiZWhhdmlvciBpbiB0aGF0Cj4gYW55IGtleXdv
cmRzIGNvbWJpbmVkIHdpdGggYSAnJHJlZicgYXJlIGlnbm9yZWQgKHNpbGVudGx5KS4gVGhlIGNv
cnJlY3QKPiBmb3JtIHdhcyB0byBwdXQgYSAnJHJlZicgdW5kZXIgYW4gJ2FsbE9mJy4gVGhpcyBi
ZWhhdmlvciBpcyBub3cgY2hhbmdlZAo+IGluIHRoZSAyMDE5LTA5IGpzb24tc2NoZW1hIHNwZWMg
YW5kICckcmVmJyBjYW4gYmUgbWl4ZWQgd2l0aCBvdGhlcgo+IGtleXdvcmRzLgoKRm9yIERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2N6bmljLHR1cnJpcy1vbW5pYS1sZWRz
LnlhbWwKCkFja2VkLWJ5OiBNYXJlayBCZWjDum4gPGthYmVsQGtlcm5lbC5vcmc+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
