Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C29C636D4
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Feb 2023 07:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xPJKhbnBEDDXsFyJcaFjMeyKhpImr0259LxTKZZpVuo=; b=dg4ue77Kbxdxpn
	8Qv0WXA1f0I6jphINvTORrGHM1E6wkq9pYOr0U3hBC5ONVXOIQftYn81u5A81qNe/UEBhgA23Nftq
	4v3V8mKdX77mAPcKMmtXSYn5xJ1M6UVXjdJzVztZOAfJPHOahdXyECalBgEaNP7ba1nKN35wg9ncv
	PshlDulHVFk3aECQfJoOW88DFXZ7i60Fopu4soOr0BEbATSYdEaWtEy4jcANZlK6kArLp3ww5dcZZ
	PmR23RfyNY/KEOC/LWinm76UdrpTXStZE4j6PFSZKildVBI1/j2Ai+9EHcQ3fcxpdbrGx655V8c2W
	5wxXxe1t1hsiHmoZUPgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPIlt-00BC91-GU; Tue, 07 Feb 2023 07:52:09 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPIli-00BC6f-Tm; Tue, 07 Feb 2023 07:52:00 +0000
Received: by mail-ed1-x52b.google.com with SMTP id q19so14284497edd.2;
        Mon, 06 Feb 2023 23:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1MAcGBhfYJH12s1m6Mlrfjjm34y3tTLoDEvIT2WAfMg=;
        b=d7K7xElfgp/OSqI7i4n2yCI8yumpN7UeyLpjtJx0sV/FpiLD/636yAvtiMkTtkYb0l
         ucDlBQjpSjRU/+aOWJzRHVKBDZmOhA9zcBhNG5jaISqPzCREvE8uZC2fePI4uuhZFVb3
         ZVouoHp1n3OcwIk5MiJh0HjBTnFDhTrgYxHmdndZjz9aHrNYR1jEt9EX39P/tut7eww2
         ZcW5YPGlY2CrQTQvywR1fryKusmAXif+bU4ox7LT3G7pbNcV0JmP5H0Igll2IULkiee4
         v+Wj5EP7kCIfF1E2g0QBph3fJfdfQTZAzVt/QiF+meDGsqk7AxQoWo+UjQZk24PGorhf
         JxBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1MAcGBhfYJH12s1m6Mlrfjjm34y3tTLoDEvIT2WAfMg=;
        b=gR4aemKRVMQCmmGY/VzD8ePw7ffCWEE8eeEUhReyvbczJl1j/P/jK9FuVdYcg0SVUq
         hOV37QbidIlqT62WS1n1lu5DQPh4Z5kQkPgkunkTr1RvIUP6LUTR7bhgexUkvAY5KHPy
         sTsTbQWQPW5Ju3sCO5dL7ZmkMgpDMthxfqieByyBFBo7cue6X410q4DiVnPlNv6vTOaG
         BEjR5KhMTfEbflPFxMmn3KlIK7ON4XirsPRcWf9mvaWB1i7Y1mf95/TfV7ScxOKlZ110
         klG0g0CMP1WC366iLcMnMYA6Wf1w03IXB5Xj2XRruMJidrwk1h5UOpytUQkwqnNtiWEE
         +V/g==
X-Gm-Message-State: AO0yUKUVmRliBhdBFHCU+jYct+6g81WhY/LKUIx9zWqyCOlAa9kr6wFM
	PTXxEu+zipWBc95vsYCzRTMmUZVK5kAHajFeNRc=
X-Google-Smtp-Source: AK7set9lt5j+w095nFTUJw9kawQv3h15WZBR3heYuhLpaFmwnyQ54oO5vLiD88vSYWR/e266zEZphxYcff6g5Hda/As=
X-Received: by 2002:a50:8a83:0:b0:4aa:9903:ec5f with SMTP id
 j3-20020a508a83000000b004aa9903ec5fmr656184edj.54.1675756314187; Mon, 06 Feb
 2023 23:51:54 -0800 (PST)
MIME-Version: 1.0
References: <20230207014207.1678715-1-saravanak@google.com> <20230207014207.1678715-13-saravanak@google.com>
In-Reply-To: <20230207014207.1678715-13-saravanak@google.com>
From: Maxim Kiselev <bigunclemax@gmail.com>
Date: Tue, 7 Feb 2023 10:51:41 +0300
Message-ID: <CALHCpMgC55uTnZKPGdKmSX1f0++bSLp2odBp5gQ1kmg90JuQwQ@mail.gmail.com>
Subject: Re: [PATCH v3 12/12] mtd: mtdpart: Don't create platform device
 that'll never probe
To: Saravana Kannan <saravanak@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, 
	Frank Rowand <frowand.list@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Len Brown <lenb@kernel.org>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Abel Vesa <abel.vesa@linaro.org>, Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Tony Lindgren <tony@atomide.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	John Stultz <jstultz@google.com>, Doug Anderson <dianders@chromium.org>, 
	Guenter Roeck <linux@roeck-us.net>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Maxim Kochetkov <fido_max@inbox.ru>, Luca Weiss <luca.weiss@fairphone.com>, 
	Colin Foster <colin.foster@in-advantage.com>, 
	Martin Kepplinger <martin.kepplinger@puri.sm>, Jean-Philippe Brucker <jpb@kernel.org>, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-acpi@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_235159_003161_F7A0DBC6 
X-CRM114-Status: GOOD (  20.67  )
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

0LLRgiwgNyDRhNC10LLRgC4gMjAyMyDQsy4g0LIgMDQ6NDIsIFNhcmF2YW5hIEthbm5hbiA8c2Fy
YXZhbmFrQGdvb2dsZS5jb20+Ogo+Cj4gVGhlc2UgIm52bWVtLWNlbGxzIiBwbGF0Zm9ybSBkZXZp
Y2VzIG5ldmVyIGdldCBwcm9iZWQgYmVjYXVzZSB0aGVyZSdzIG5vCj4gcGxhdGZvcm0gZHJpdmVy
IGZvciBpdCBhbmQgaXQncyBuZXZlciB1c2VkIGFueXdoZXJlIGVsc2UuIFNvIGl0J3MgYQo+IHdh
c3RlIG9mIG1lbW9yeS4gVGhlc2UgZGV2aWNlcyBhbHNvIGNhdXNlIGZ3X2RldmxpbmsgdG8gYmxv
Y2sgbnZtZW0KPiBjb25zdW1lcnMgb2YgIm52bWVtLWNlbGxzIiBwYXJ0aXRpb24gZnJvbSBwcm9i
aW5nIGJlY2F1c2UgdGhlIHN1cHBsaWVyCj4gZGV2aWNlIG5ldmVyIHByb2Jlcy4KPgo+IFNvIHN0
b3AgY3JlYXRpbmcgcGxhdGZvcm0gZGV2aWNlcyBmb3IgbnZtZW0tY2VsbHMgcGFydGl0aW9ucyB0
byBhdm9pZAo+IHdhc3RpbmcgbWVtb3J5IGFuZCB0byBhdm9pZCBibG9ja2luZyBwcm9iaW5nIG9m
IGNvbnN1bWVycy4KPgo+IFJlcG9ydGVkLWJ5OiBNYXhpbSBLaXNlbGV2IDxiaWd1bmNsZW1heEBn
bWFpbC5jb20+Cj4gRml4ZXM6IGJjZGYwMzE1YTYxYSAoIm10ZDogY2FsbCBvZl9wbGF0Zm9ybV9w
b3B1bGF0ZSgpIGZvciBNVEQgcGFydGl0aW9ucyIpCj4gU2lnbmVkLW9mZi1ieTogU2FyYXZhbmEg
S2FubmFuIDxzYXJhdmFuYWtAZ29vZ2xlLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9tdGQvbXRkcGFy
dC5jIHwgMTAgKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQo+
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL210ZHBhcnQuYyBiL2RyaXZlcnMvbXRkL210ZHBh
cnQuYwo+IGluZGV4IGQ0NDJmYTk0Yzg3Mi4uODVmNWVlNmYwNmZjIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvbXRkL210ZHBhcnQuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL210ZHBhcnQuYwo+IEBAIC01
NzcsNiArNTc3LDcgQEAgc3RhdGljIGludCBtdGRfcGFydF9vZl9wYXJzZShzdHJ1Y3QgbXRkX2lu
Zm8gKm1hc3RlciwKPiAgewo+ICAgICAgICAgc3RydWN0IG10ZF9wYXJ0X3BhcnNlciAqcGFyc2Vy
Owo+ICAgICAgICAgc3RydWN0IGRldmljZV9ub2RlICpucDsKPiArICAgICAgIHN0cnVjdCBkZXZp
Y2Vfbm9kZSAqY2hpbGQ7Cj4gICAgICAgICBzdHJ1Y3QgcHJvcGVydHkgKnByb3A7Cj4gICAgICAg
ICBzdHJ1Y3QgZGV2aWNlICpkZXY7Cj4gICAgICAgICBjb25zdCBjaGFyICpjb21wYXQ7Cj4gQEAg
LTU5NCw2ICs1OTUsMTUgQEAgc3RhdGljIGludCBtdGRfcGFydF9vZl9wYXJzZShzdHJ1Y3QgbXRk
X2luZm8gKm1hc3RlciwKPiAgICAgICAgIGVsc2UKPiAgICAgICAgICAgICAgICAgbnAgPSBvZl9n
ZXRfY2hpbGRfYnlfbmFtZShucCwgInBhcnRpdGlvbnMiKTsKPgo+ICsgICAgICAgLyoKPiArICAg
ICAgICAqIERvbid0IGNyZWF0ZSBkZXZpY2VzIHRoYXQgYXJlIGFkZGVkIHRvIGEgYnVzIGJ1dCB3
aWxsIG5ldmVyIGdldAo+ICsgICAgICAgICogcHJvYmVkLiBUaGF0J2xsIGNhdXNlIGZ3X2Rldmxp
bmsgdG8gYmxvY2sgcHJvYmluZyBvZiBjb25zdW1lcnMgb2YKPiArICAgICAgICAqIHRoaXMgcGFy
dGl0aW9uIHVudGlsIHRoZSBwYXJ0aXRpb24gZGV2aWNlIGlzIHByb2JlZC4KPiArICAgICAgICAq
Lwo+ICsgICAgICAgZm9yX2VhY2hfY2hpbGRfb2Zfbm9kZShucCwgY2hpbGQpCj4gKyAgICAgICAg
ICAgICAgIGlmIChvZl9kZXZpY2VfaXNfY29tcGF0aWJsZShjaGlsZCwgIm52bWVtLWNlbGxzIikp
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgb2Zfbm9kZV9zZXRfZmxhZyhjaGlsZCwgT0ZfUE9Q
VUxBVEVEKTsKPiArCj4gICAgICAgICBvZl9wcm9wZXJ0eV9mb3JfZWFjaF9zdHJpbmcobnAsICJj
b21wYXRpYmxlIiwgcHJvcCwgY29tcGF0KSB7Cj4gICAgICAgICAgICAgICAgIHBhcnNlciA9IG10
ZF9wYXJ0X2dldF9jb21wYXRpYmxlX3BhcnNlcihjb21wYXQpOwo+ICAgICAgICAgICAgICAgICBp
ZiAoIXBhcnNlcikKPiAtLQo+IDIuMzkuMS41MTkuZ2NiMzI3YzRiNWYtZ29vZwo+CgpIaSwgU2Fy
YXZhbmEhCgpOb3cgaXQgd29ya3MgcHJldHR5IHdlbGwuIFRoYW5rIHlvdSBzbyBtdWNoIGZvciB5
b3VyIGVmZm9ydHMuCgo+IFJlcG9ydGVkLWJ5OiBNYXhpbSBLaXNlbGV2IDxiaWd1bmNsZW1heEBn
bWFpbC5jb20+Cj4gRml4ZXM6IGJjZGYwMzE1YTYxYSAoIm10ZDogY2FsbCBvZl9wbGF0Zm9ybV9w
b3B1bGF0ZSgpIGZvciBNVEQgcGFydGl0aW9ucyIpCj4gU2lnbmVkLW9mZi1ieTogU2FyYXZhbmEg
S2FubmFuIDxzYXJhdmFuYWtAZ29vZ2xlLmNvbT4KClRlc3RlZC1ieTogTWFrc2ltIEtpc2VsZXYg
PGJpZ3VuY2xlbWF4QGdtYWlsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
