Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95753C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Mar 2022 09:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1NBtPdpl3d1rt9b8KdA4Q7uAf5HAGPsLUUazCjihwW0=; b=rFn95uLfFS1YkM
	eaQ1cwlxxratWun15GdBu2U6M4GnL4LKqbDPbdN/2Q0KPGkwVOApFDkCphP6fWHTUnuzXHP4rJK89
	jywlHdBeDWrFBLi7n4ggsCR2HBjI6K9BmHgNi+OxlF/Lf82aufTAH5j8QFwHDJeP223ci5yosNLwz
	5nmxERVLNM6xA7mEZf5Jskx+mmMCeaXdwDCv7KWs9d3x7UFZkaiWMFuOchGXnn7Csq/H87YsBfOiv
	MJxyKdMhNOik7A0VjdOjF1apj4g/Oy9aOE35pyHSULioj78LOBITLLcqxmcndh/a19PIC9VZ+hOjt
	gUU0YbEdoK6l3ts4PLqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOzHL-00FxQN-4K; Tue, 01 Mar 2022 09:58:47 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOzHE-00FxM3-5M
 for linux-mtd@lists.infradead.org; Tue, 01 Mar 2022 09:58:43 +0000
Received: by mail-wm1-x32e.google.com with SMTP id
 a13-20020a05600c348d00b0038188b8bbf6so838150wmq.0
 for <linux-mtd@lists.infradead.org>; Tue, 01 Mar 2022 01:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ezdeTFdrJTsDEenywDPHfcLnhNipBCHF9MXHMNmg8uE=;
 b=V2OTBoFu/3u2MYQvlXN4XFA5Mpc0sw3VVP6kB35gAmpBt4CBakEr+BEajFVumt4As4
 0YJzO8ZkJSWBwhRj8Uy59RUU3v/hwzbgxduT2I1y1xX6HI1gg41aETpQIUdjxh7ZnBz4
 HhdMQcg8+L7O8eux9r9AapKed4y6D46u2n+k9nwiZpMaa2tu8mfi2s4ZCxAcFvaUN+tp
 HrzR1JisJxyRdZ3wNr04C/4Vuj0omTcfD+rfi5DwD/mU4leNbAbXNJMtNPKsu3bNCRus
 eGsPP4EAXhwGxUe8HQ9DLeSwcxn2uyLPYqzmE2imgxG0kXR+Hov/16dL3PxdUfxU3h53
 VE0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ezdeTFdrJTsDEenywDPHfcLnhNipBCHF9MXHMNmg8uE=;
 b=Ll2uzBaS6fJ8YVJIUHNwkcvHR9nNnwkwFd8B1lb97GWp172uoQqWkynMoDNZw62ZJI
 mQL5hRxspBRT+FiVBQpQJnkzXep9qTqfHlXKfs/HaGGFtGW/00ntndrZzbZvbwPXNznb
 suLKOKpFfOwcFnz5GfWRrMAtvwmfsOvMaYcYOs6Moh8BnqunnQT+C0XWGFeAC0PKcylP
 1PMJRls3qZqZmNZ0AsEGvlt82peGQmC3OO5rfmSnQn4G6gDkAnK0JPY7t7ici2Md3VLF
 71PzfxY1hkMKPosyMEp0rV1v1rxG1KoGBAuQ/+GcStv2+q6g+LfP2A8hbdFkluablycq
 sSRA==
X-Gm-Message-State: AOAM530DGvZhpzWXUN1Jp01P/6Z24pQiuEs3WRrjUtqv9yl+CHIUulQZ
 hwSt6jBk/en5GuWx+HT7Q8WeWg==
X-Google-Smtp-Source: ABdhPJyd3JL277KFZFJnNY8vNt+J/UADyqWySP9nrfMl9nw+JMafV9kv9enuyMZSjvJi9JFM8u0lYg==
X-Received: by 2002:a1c:29c6:0:b0:381:51d6:9afe with SMTP id
 p189-20020a1c29c6000000b0038151d69afemr9268826wmp.0.1646128718201; 
 Tue, 01 Mar 2022 01:58:38 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net.
 [86.27.177.88]) by smtp.gmail.com with ESMTPSA id
 r186-20020a1c2bc3000000b0037bdd94a4e5sm1955820wmr.39.2022.03.01.01.58.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 01:58:37 -0800 (PST)
Date: Tue, 1 Mar 2022 09:58:34 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Pavel Machek <pavel@ucw.cz>, Guenter Roeck <groeck@chromium.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Vinod Koul <vkoul@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Mark Brown <broonie@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-mtd@lists.infradead.org,
 netdev@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-spi@vger.kernel.org,
 linux-usb@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Another pass removing cases of 'allOf'
 containing a '$ref'
Message-ID: <Yh3uSifwByjQWpyO@google.com>
References: <20220228213802.1639658-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220228213802.1639658-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_015840_263094_25B892E7 
X-CRM114-Status: GOOD (  17.83  )
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

T24gTW9uLCAyOCBGZWIgMjAyMiwgUm9iIEhlcnJpbmcgd3JvdGU6Cgo+IEFub3RoZXIgcGFzcyBh
dCByZW1vdmluZyB1bm5lY2Vzc2FyeSB1c2Ugb2YgJ2FsbE9mJyB3aXRoIGEgJyRyZWYnLgo+IAo+
IGpzb24tc2NoZW1hIHZlcnNpb25zIGRyYWZ0NyBhbmQgZWFybGllciBoYXZlIGEgd2VpcmQgYmVo
YXZpb3IgaW4gdGhhdAo+IGFueSBrZXl3b3JkcyBjb21iaW5lZCB3aXRoIGEgJyRyZWYnIGFyZSBp
Z25vcmVkIChzaWxlbnRseSkuIFRoZSBjb3JyZWN0Cj4gZm9ybSB3YXMgdG8gcHV0IGEgJyRyZWYn
IHVuZGVyIGFuICdhbGxPZicuIFRoaXMgYmVoYXZpb3IgaXMgbm93IGNoYW5nZWQKPiBpbiB0aGUg
MjAxOS0wOSBqc29uLXNjaGVtYSBzcGVjIGFuZCAnJHJlZicgY2FuIGJlIG1peGVkIHdpdGggb3Ro
ZXIKPiBrZXl3b3Jkcy4KPiAKPiBDYzogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtv
emxvd3NraUBjYW5vbmljYWwuY29tPgo+IENjOiBUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5yZWRp
bmdAZ21haWwuY29tPgo+IENjOiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gQ2M6
IERtaXRyeSBUb3Jva2hvdiA8ZG1pdHJ5LnRvcm9raG92QGdtYWlsLmNvbT4KPiBDYzogUGF2ZWwg
TWFjaGVrIDxwYXZlbEB1Y3cuY3o+Cj4gQ2M6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5v
cmc+Cj4gQ2M6IEd1ZW50ZXIgUm9lY2sgPGdyb2Vja0BjaHJvbWl1bS5vcmc+Cj4gQ2M6IE1pcXVl
bCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gQ2M6IFJpY2hhcmQgV2VpbmJl
cmdlciA8cmljaGFyZEBub2QuYXQ+Cj4gQ2M6IFZpZ25lc2ggUmFnaGF2ZW5kcmEgPHZpZ25lc2hy
QHRpLmNvbT4KPiBDYzogIkRhdmlkIFMuIE1pbGxlciIgPGRhdmVtQGRhdmVtbG9mdC5uZXQ+Cj4g
Q2M6IEpha3ViIEtpY2luc2tpIDxrdWJhQGtlcm5lbC5vcmc+Cj4gQ2M6IEtpc2hvbiBWaWpheSBB
YnJhaGFtIEkgPGtpc2hvbkB0aS5jb20+Cj4gQ2M6IFZpbm9kIEtvdWwgPHZrb3VsQGtlcm5lbC5v
cmc+Cj4gQ2M6IFNlYmFzdGlhbiBSZWljaGVsIDxzcmVAa2VybmVsLm9yZz4KPiBDYzogQmpvcm4g
QW5kZXJzc29uIDxiam9ybi5hbmRlcnNzb25AbGluYXJvLm9yZz4KPiBDYzogTWF0aGlldSBQb2ly
aWVyIDxtYXRoaWV1LnBvaXJpZXJAbGluYXJvLm9yZz4KPiBDYzogTWFyayBCcm93biA8YnJvb25p
ZUBrZXJuZWwub3JnPgo+IENjOiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5k
YXRpb24ub3JnPgo+IENjOiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFz
b25ib2FyZC5jb20+Cj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzog
bGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gQ2M6IGxpbnV4LWlucHV0QHZn
ZXIua2VybmVsLm9yZwo+IENjOiBsaW51eC1sZWRzQHZnZXIua2VybmVsLm9yZwo+IENjOiBsaW51
eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IENjOiBuZXRkZXZAdmdlci5rZXJuZWwub3JnCj4g
Q2M6IGxpbnV4LXBoeUBsaXN0cy5pbmZyYWRlYWQub3JnCj4gQ2M6IGxpbnV4LXBtQHZnZXIua2Vy
bmVsLm9yZwo+IENjOiBsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZwo+IENjOiBhbHNh
LWRldmVsQGFsc2EtcHJvamVjdC5vcmcKPiBDYzogbGludXgtc3BpQHZnZXIua2VybmVsLm9yZwo+
IENjOiBsaW51eC11c2JAdmdlci5rZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1ieTogUm9iIEhlcnJp
bmcgPHJvYmhAa2VybmVsLm9yZz4KPiAtLS0KPiAgLi4uL2JpbmRpbmdzL2Nvbm5lY3Rvci91c2It
Y29ubmVjdG9yLnlhbWwgICAgICAgICB8ICAzICstLQo+ICAuLi4vYmluZGluZ3MvZGlzcGxheS9i
cmNtLGJjbTI3MTEtaGRtaS55YW1sICAgICAgIHwgIDMgKy0tCj4gIC4uLi9iaW5kaW5ncy9kaXNw
bGF5L2JyaWRnZS9hZGksYWR2NzUxMS55YW1sICAgICAgfCAgNSArKy0tLQo+ICAuLi4vYmluZGlu
Z3MvZGlzcGxheS9icmlkZ2Uvc3lub3BzeXMsZHctaGRtaS55YW1sIHwgIDUgKystLS0KPiAgLi4u
L2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvZGlzcGxheS10aW1pbmdzLnlhbWwgICB8ICAzICstLQo+
ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3N0ZSxtY2RlLnlhbWwgICAgIHwgIDQg
KystLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnB1dC9hZGMtam95c3RpY2sueWFtbCAg
IHwgIDkgKysrKy0tLS0tCj4gIC4uLi9iaW5kaW5ncy9sZWRzL2N6bmljLHR1cnJpcy1vbW5pYS1s
ZWRzLnlhbWwgICAgfCAgMyArLS0KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9sZWRz
LWxwNTB4eC55YW1sICAgICB8ICAzICstLQoKPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbWZk
L2dvb2dsZSxjcm9zLWVjLnlhbWwgICB8IDEyICsrKystLS0tLS0tLQoKR28gZm9yIGl0LgoKQWNr
ZWQtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Cgo+ICAuLi4vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tdGQvbmFuZC1jb250cm9sbGVyLnlhbWwgIHwgIDggKysrLS0tLS0KPiAgLi4u
L2JpbmRpbmdzL210ZC9yb2NrY2hpcCxuYW5kLWNvbnRyb2xsZXIueWFtbCAgICB8ICAzICstLQo+
ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvdGksY3Bzdy1zd2l0Y2gueWFtbCAgIHwgIDMg
Ky0tCj4gIC4uLi9iaW5kaW5ncy9waHkvcGh5LXN0bTMyLXVzYnBoeWMueWFtbCAgICAgICAgICAg
fCAgMyArLS0KPiAgLi4uL2JpbmRpbmdzL3Bvd2VyL3N1cHBseS9zYnMsc2JzLW1hbmFnZXIueWFt
bCAgICB8ICA0ICstLS0KPiAgLi4uL2JpbmRpbmdzL3JlbW90ZXByb2MvdGksazMtcjVmLXJwcm9j
LnlhbWwgICAgICB8ICAzICstLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9zb2MvdGkvdGks
cHJ1c3MueWFtbCAgICAgIHwgMTUgKysrLS0tLS0tLS0tLS0tCj4gIC4uLi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3NvdW5kL3N0LHN0bTMyLXNhaS55YW1sICAgfCAgMyArLS0KPiAgLi4uL2RldmljZXRy
ZWUvYmluZGluZ3Mvc291bmQvdGx2MzIwYWRjeDE0MC55YW1sICB8IDEzICsrKysrKy0tLS0tLS0K
PiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL3NwaS1jb250cm9sbGVyLnlhbWwgICB8ICA0
ICstLS0KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL3N0LHN0dXNiMTYweC55YW1sICAg
ICB8ICA0ICstLS0KPiAgMjEgZmlsZXMgY2hhbmdlZCwgMzkgaW5zZXJ0aW9ucygrKSwgNzQgZGVs
ZXRpb25zKC0pCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClByaW5jaXBhbCBUZWNobmljYWwg
TGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0
d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxv
ZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
