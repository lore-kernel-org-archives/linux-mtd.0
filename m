Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E507BC27C76
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Jan 2023 15:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=56RVWx19vAEAkNF4ZKGhFy/vbQRU/QgHzBanY1S06Ws=; b=lUrSz+dyiHcimU
	shK5VR3cqnvPzlWie5VFPjIPjNia2AVBE83MTky5laSeUQsuRZOKSc2moLd9qgRE5jf5S1g0XqnCQ
	g34pMQoes9wUPVsW5PLL/dEZ30hvvjHTA9o1ArBRTZPpQxichJo/54W6hDwIOJEhaELGPKU2ncdVj
	B2CKd1Ut5bpoDH3p6SpB9bE2XQqMSOq86Cejg+AbjF+Q059CIS2nCD1VKXVS45CLOPR+EXDAVbgON
	bjUIiErZMAlsBqNkhzyNwvwi7fP/f0kiIDXZz08H6spE+FYF79GMpCllYKFJD/4QnTAWMmcKfoN3e
	HlcaJ3lZzNnhlmHS61Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKhOs-007jRb-Mb; Wed, 25 Jan 2023 15:09:22 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKhOd-007jMR-AW; Wed, 25 Jan 2023 15:09:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B706DB819F3;
	Wed, 25 Jan 2023 15:09:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FC81C433EF;
	Wed, 25 Jan 2023 15:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674659344;
	bh=v+B+KDBEA50AHtVt9lQ1BTuMYwoPUgbIgH8/Amio1lE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hSoessefOv16Xt7Qbj98AdgmJicOcikMVtEdI8hVuvfe5IRYVPezihO/irb3buQZt
	 3ZFdNvsViDwPHeE3Jm/XuN6iGzIm1ESIZsv0lbDa1vk4s6rEEf6cKYM+bN/iuQe9VW
	 P/Svjep8k+fSgfN9zyFG7lQqfCHheo29BxDr+K+4T3lE67taLSodJ3E7d4EG4RrRqe
	 73RJMrkg3YqzKBZH4GY2t14YGyMJND9cOXmrIKdYBcHjYwCgCzhERtbbPGPR5fu5EG
	 NLAP3xoucfO28ZdQF16a1/t4V81l7sTg4luWlxs+aH+wX1wDHuET+t7+76hhEK6te3
	 8HtxOatriltJw==
Date: Wed, 25 Jan 2023 15:08:54 +0000
From: Lee Jones <lee@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Sebastian Reichel <sre@kernel.org>, Mark Brown <broonie@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-media@vger.kernel.org,
	openbmc@lists.ozlabs.org, linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-pm@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-spi@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Add missing
 (unevaluated|additional)Properties on child node schemas
Message-ID: <Y9FGBqFKMxL3XraK@google.com>
References: <20230124230228.372305-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230124230228.372305-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_070907_655604_EA3356BE 
X-CRM114-Status: GOOD (  18.70  )
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

T24gVHVlLCAyNCBKYW4gMjAyMywgUm9iIEhlcnJpbmcgd3JvdGU6Cgo+IEp1c3QgYXMgdW5ldmFs
dWF0ZWRQcm9wZXJ0aWVzIG9yIGFkZGl0aW9uYWxQcm9wZXJ0aWVzIGFyZSByZXF1aXJlZCBhdAo+
IHRoZSB0b3AgbGV2ZWwgb2Ygc2NoZW1hcywgdGhleSBzaG91bGQgKGFuZCB3aWxsKSBhbHNvIGJl
IHJlcXVpcmVkIGZvcgo+IGNoaWxkIG5vZGUgc2NoZW1hcy4gVGhhdCBlbnN1cmVzIG9ubHkgZG9j
dW1lbnRlZCBwcm9wZXJ0aWVzIGFyZQo+IHByZXNlbnQuCj4gCj4gQWRkIHVuZXZhbHVhdGVkUHJv
cGVydGllcyBvciBhZGRpdGlvbmFsUHJvcGVydGllcyBhcyBhcHByb3ByaWF0ZSwgYW5kCj4gdGhl
biBhZGQgYW55IG1pc3NpbmcgcHJvcGVydGllcyBmbGFnZ2VkIGJ5IHRoZSBhZGRpdGlvbi4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+IC0tLQo+IFRv
OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpK2R0QGxpbmFyby5vcmc+
Cj4gVG86IERhdmlkIEFpcmxpZSA8YWlybGllZEBnbWFpbC5jb20+Cj4gVG86IERhbmllbCBWZXR0
ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBUbzogQmFydG9zeiBHb2xhc3pld3NraSA8YnJnbEBiZ2Rl
di5wbD4KPiBUbzogSmVhbiBEZWx2YXJlIDxqZGVsdmFyZUBzdXNlLmNvbT4KPiBUbzogR3VlbnRl
ciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0Pgo+IFRvOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhA
bGludXRyb25peC5kZT4KPiBUbzogTWFyYyBaeW5naWVyIDxtYXpAa2VybmVsLm9yZz4KPiBUbzog
SmFzc2kgQnJhciA8amFzc2lzaW5naGJyYXJAZ21haWwuY29tPgo+IFRvOiBNYXVybyBDYXJ2YWxo
byBDaGVoYWIgPG1jaGVoYWJAa2VybmVsLm9yZz4KPiBUbzogTGVlIEpvbmVzIDxsZWVAa2VybmVs
Lm9yZz4KPiBUbzogVWxmIEhhbnNzb24gPHVsZi5oYW5zc29uQGxpbmFyby5vcmc+Cj4gVG86IFJp
Y2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+Cj4gVG86IFZpZ25lc2ggUmFnaGF2ZW5k
cmEgPHZpZ25lc2hyQHRpLmNvbT4KPiBUbzogU2ViYXN0aWFuIFJlaWNoZWwgPHNyZUBrZXJuZWwu
b3JnPgo+IFRvOiBNYXJrIEJyb3duIDxicm9vbmllQGtlcm5lbC5vcmc+Cj4gVG86ICJSYWZhZWwg
Si4gV3lzb2NraSIgPHJhZmFlbEBrZXJuZWwub3JnPgo+IFRvOiBEYW5pZWwgTGV6Y2FubyA8ZGFu
aWVsLmxlemNhbm9AbGluYXJvLm9yZz4KPiBUbzogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hA
bGludXhmb3VuZGF0aW9uLm9yZz4KPiBDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRl
YWQub3JnCj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogbGludXgt
Z3Bpb0B2Z2VyLmtlcm5lbC5vcmcKPiBDYzogbGludXgtaHdtb25Admdlci5rZXJuZWwub3JnCj4g
Q2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwo+IENjOiBvcGVuYm1jQGxpc3RzLm96bGFi
cy5vcmcKPiBDYzogbGludXgtbW1jQHZnZXIua2VybmVsLm9yZwo+IENjOiBsaW51eC1tdGRAbGlz
dHMuaW5mcmFkZWFkLm9yZwo+IENjOiBsaW51eC1wbUB2Z2VyLmtlcm5lbC5vcmcKPiBDYzogYWxz
YS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCj4gQ2M6IGxpbnV4LXNwaUB2Z2VyLmtlcm5lbC5vcmcK
PiBDYzogbGludXgtdXNiQHZnZXIua2VybmVsLm9yZwo+IC0tLQo+ICAuLi4vZGV2aWNldHJlZS9i
aW5kaW5ncy9hcm0vYXJtLHZleHByZXNzLWp1bm8ueWFtbCAgICAgfCAgMSArCj4gIC4uLi9iaW5k
aW5ncy9hcm0vYmNtL3Jhc3BiZXJyeXBpLGJjbTI4MzUtZmlybXdhcmUueWFtbCB8ICA1ICsrKy0t
Cj4gIC4uLi9iaW5kaW5ncy9hcm0vdGVncmEvbnZpZGlhLHRlZ3JhMjAtcG1jLnlhbWwgICAgICAg
ICB8ICA0ICsrKysKPiAgLi4uL2JpbmRpbmdzL2J1cy9hbGx3aW5uZXIsc3VuNTBpLWE2NC1kZTIu
eWFtbCAgICAgICAgIHwgIDEgKwo+ICAuLi4vYmluZGluZ3MvYnVzL2FsbHdpbm5lcixzdW44aS1h
MjMtcnNiLnlhbWwgICAgICAgICAgfCAgMSArCj4gIC4uLi9idXMvaW50ZWwsaXhwNHh4LWV4cGFu
c2lvbi1idXMtY29udHJvbGxlci55YW1sICAgICB8ICA2ICsrKysrKwo+ICBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvYnVzL3BhbG1idXMueWFtbCAgICAgfCAgMSArCj4gIC4uLi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbXNtL3Fjb20sbWRzcy55YW1sICAgICB8ICA1ICsr
KysrCj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9leGFtcGxlLXNjaGVtYS55
YW1sICB8ICAyICsrCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwaW8veC1wb3dlcnMsYXhw
MjA5LWdwaW8ueWFtbCB8ICAxICsKPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvaHdtb24vYWRp
LGx0YzI5OTIueWFtbCAgICAgICAgIHwgIDEgKwo+ICAuLi4vYmluZGluZ3MvaW50ZXJydXB0LWNv
bnRyb2xsZXIvYXJtLGdpYy12My55YW1sICAgICAgfCAgMiArKwo+ICAuLi4vYmluZGluZ3MvbWFp
bGJveC94bG54LHp5bnFtcC1pcGktbWFpbGJveC55YW1sICAgICAgfCAgMSArCj4gIC4uLi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL21lZGlhL2kyYy9tYXhpbSxtYXg5Mjg2LnlhbWwgICB8ICA3ICsrKysr
KysKPiAgLi4uL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9hcm0scGwzNXgtc21jLnlhbWwg
ICAgIHwgIDEgKwo+ICAuLi4vYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL2V4eW5vcy1zcm9t
LnlhbWwgICAgICAgfCAgMSArCj4gIC4uLi9tZW1vcnktY29udHJvbGxlcnMvbnZpZGlhLHRlZ3Jh
MTI0LWVtYy55YW1sICAgICAgICB8ICAxICsKPiAgLi4uL2JpbmRpbmdzL21lbW9yeS1jb250cm9s
bGVycy9zdCxzdG0zMi1mbWMyLWViaS55YW1sIHwgIDEgKwo+ICAuLi4vZGV2aWNldHJlZS9iaW5k
aW5ncy9tZmQvbWVkaWF0ZWssbXQ2MzcwLnlhbWwgICAgICAgfCAgMiArKwo+ICAuLi4vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tbWMvYXNwZWVkLHNkaGNpLnlhbWwgICAgICAgICAgfCAgMSArCj4gIERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvbXRkLnlhbWwgICAgICAgICB8ICAx
ICsKPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcG93ZXIvc3VwcGx5L3RpLGxwODcyNy55YW1s
ICAgIHwgIDEgKwo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9zb2MvaW14L2ZzbCxpbXg5My1z
cmMueWFtbCAgICAgfCAgMyArKy0KPiAgLi4uL2JpbmRpbmdzL3NvYy9taWNyb2NoaXAvYXRtZWws
YXQ5MXJtOTIwMC10Y2IueWFtbCAgIHwgIDEgKwo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3Mvc29jL3RpL3RpLHBydXNzLnlhbWwgfCAgMSArCj4gIC4uLi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3NvdW5kL21hcnZlbGwsbW1wLXNzcGEueWFtbCAgICB8ICAxICsKPiAgLi4uL2Rldmlj
ZXRyZWUvYmluZGluZ3Mvc291bmQvcWNvbSx3Y2Q5MzR4LnlhbWwgICAgICAgIHwgIDEgKwo+ICAu
Li4vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9zYW1zdW5nLG9kcm9pZC55YW1sICAgICAgfCAg
MiArKwo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZHdpcmUvcWNvbSxzb3VuZHdpcmUu
eWFtbCAgfCAgMSArCj4gIC4uLi9iaW5kaW5ncy9zcGkvYWxsd2lubmVyLHN1bjRpLWExMC1zcGku
eWFtbCAgICAgICAgICB8ICAxICsKPiAgLi4uL2JpbmRpbmdzL3NwaS9hbGx3aW5uZXIsc3VuNmkt
YTMxLXNwaS55YW1sICAgICAgICAgIHwgIDEgKwo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9z
cGkvc3BpLWNvbnRyb2xsZXIueWFtbCAgICAgICAgfCAgMSArCj4gIC4uLi9zcmFtL2FsbHdpbm5l
cixzdW40aS1hMTAtc3lzdGVtLWNvbnRyb2wueWFtbCAgICAgICB8IDEwICsrKysrLS0tLS0KPiAg
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NyYW0vcWNvbSxvY21lbS55YW1sIHwg
IDEgKwo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy90aGVybWFsL3RoZXJtYWwtem9uZXMueWFt
bCAgICAgfCAgMSArCj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvcWNv
bSxkd2MzLnlhbWwgICB8ICAxICsKPiAgMzYgZmlsZXMgY2hhbmdlZCwgNjUgaW5zZXJ0aW9ucygr
KSwgOCBkZWxldGlvbnMoLSkKCkFja2VkLWJ5OiBMZWUgSm9uZXMgPGxlZUBrZXJuZWwub3JnPgoK
LS0gCkxlZSBKb25lcyBb5p2O55C85pavXQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
