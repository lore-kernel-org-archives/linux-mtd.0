Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE9AC05027
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Feb 2023 21:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sj547s7aDhAfzwibBuGVeruMyt41PtsicCXkzZGalQo=; b=HvjfZXZVtbcocX
	UWOeknYLPz5UA/Yd2ccs6oliK5S1z0xo4SxxSosu9hWcUSIhOxV6A/Vs8JNBvmtu0fn9uH+3YBGOi
	oBv3+6WcRwxW50fjjyOCHAYltsiWJsaQzdVBr60N7yVzdNukWkknxFJCCFtQ3ObJCH2+d0fKe7Xts
	WjX/kj5bMLK1ycrrdbZkaUDNSkoN4sVqGWAD9qNkw6fxKKw0Z3TXwGlr5rZo3DcXjHE1d+5MRMXhB
	DCPKhmxM06adJrnfRngHHsj4IAdCGtbygPJcBOj7dCDXMBVNU9lCV/3QMD0hWFMBYjNkq8/rArms3
	ldLuaJZ6QzZh83ndSyQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQb16-007f2Q-OL; Fri, 10 Feb 2023 21:33:12 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQb13-007f1l-4X
	for linux-mtd@lists.infradead.org; Fri, 10 Feb 2023 21:33:11 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d8so6655174plr.10
        for <linux-mtd@lists.infradead.org>; Fri, 10 Feb 2023 13:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1676064787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jaTG/YcqsKJ9eLC7Ck7BS82uy6FuCF4UlYVuMNR2PIo=;
        b=ovv8F9kPWpy3fWu/qxCH1rfmW9ce/EUvJBy4giAcgUPwM0AW/RfpAQ/bBHt6+uLPeH
         wJH/LAudN9cJrTeJX1BpcUtgeMS8qgzYd7JXfE7fgTPgNafSGMN8um6j7OVbfTyFPA8Q
         vPAYZR4woLvZEYRjoo7gHYt9rURikUxgnqn62AsGDaLKjA0lm2PQtI9/arhkDGAD5+mO
         dqjkQBFgxaq5je73WYZVxOzuVAjXdjlpc2ajQ5kXQ/3GekQuQzvVEaSMOHBrWcUnLca+
         SbsoRQQw4WTHSFi7McCtDNJpreIbZPrW7bvpsfTy7GwOzw4u/Mhvt8B2iZoy/OwxAKpC
         7cIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676064787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jaTG/YcqsKJ9eLC7Ck7BS82uy6FuCF4UlYVuMNR2PIo=;
        b=30vLWJzfXIkqDsRW1qa47bQ5scZvOCnp2xXI2U7jUxLHmA/ljyxRmq2vx9uWh/rvwo
         DI8S3wmLKDpPTYU98kZclrpwAPjjRVLukEv18owfT9ZhkbGTI1jDu9GQY8CHTrqIpU2I
         OxtYs6nc2N+1WMSrNQsgOQOaG5gofLDjhVLAf1Tq1/JSdwX56jg0RlkLcpxreLLnLhBE
         OlOi5dgNwDbZtUJx6+rm23LxyhwOOtHAFk3P2vF+OJUBJAkDVvX/nJ0LwFtWq4KZ0cMn
         NkbVlywelNsWJa5ldOAqZArTKeF+2pJXAWAg4msCdM57KlD1JkBwizDmjq0HKSYfto6m
         M2ug==
X-Gm-Message-State: AO0yUKXEUHmrCg5Vz1Zdt/WctoVuIzfX1NDfsu3qiITxSrunshLWsva4
	65LMhOAxAqVNMkXBokbCEPVzJW3WcwLPWefn8Ubdnw==
X-Google-Smtp-Source: AK7set/i+ziIBOrTHEBeRDeI5Q8Vmjlc2a67ZKq8/hQ/Q4dBB5gNS3XuPRY8G0QEZEhJ/9weK2lbbDtC4Nf8A4Pw4IE=
X-Received: by 2002:a17:902:ea0e:b0:196:64bf:ed7a with SMTP id
 s14-20020a170902ea0e00b0019664bfed7amr3941916plg.29.1676064787017; Fri, 10
 Feb 2023 13:33:07 -0800 (PST)
MIME-Version: 1.0
References: <20230207014207.1678715-1-saravanak@google.com>
 <20230210101333.h2e7hcl3ylsoh6fy@skbuf> <CAGETcx_SQJ1q_f8r+zKATF-EEb0P-T_ot15AQ1x1Vc_3h=XfCw@mail.gmail.com>
 <20230210210804.vdyfrog5nq6hrxi5@skbuf>
In-Reply-To: <20230210210804.vdyfrog5nq6hrxi5@skbuf>
From: Saravana Kannan <saravanak@google.com>
Date: Fri, 10 Feb 2023 13:32:30 -0800
Message-ID: <CAGETcx-OFh6s8zxQUVb29VKOfaD7GpY=E_KQvVMQ=h7kp_sZGw@mail.gmail.com>
Subject: Re: [PATCH v3 00/12] fw_devlink improvements
To: Vladimir Oltean <vladimir.oltean@nxp.com>
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
	Maxim Kiselev <bigunclemax@gmail.com>, Maxim Kochetkov <fido_max@inbox.ru>, 
	Luca Weiss <luca.weiss@fairphone.com>, Colin Foster <colin.foster@in-advantage.com>, 
	Martin Kepplinger <martin.kepplinger@puri.sm>, Jean-Philippe Brucker <jpb@kernel.org>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-acpi@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_133309_225425_D3A041A6 
X-CRM114-Status: GOOD (  52.35  )
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

T24gRnJpLCBGZWIgMTAsIDIwMjMgYXQgMTowOCBQTSBWbGFkaW1pciBPbHRlYW4gPHZsYWRpbWly
Lm9sdGVhbkBueHAuY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgRmViIDEwLCAyMDIzIGF0IDExOjI3
OjExQU0gLTA4MDAsIFNhcmF2YW5hIEthbm5hbiB3cm90ZToKPiA+IE9uIEZyaSwgRmViIDEwLCAy
MDIzIGF0IDI6MTMgQU0gVmxhZGltaXIgT2x0ZWFuIDx2bGFkaW1pci5vbHRlYW5AbnhwLmNvbT4g
d3JvdGU6Cj4gPiA+Cj4gPiA+IEhpIFNhcmF2YW5hLAo+ID4gPgo+ID4gPiBPbiBNb24sIEZlYiAw
NiwgMjAyMyBhdCAwNTo0MTo1MlBNIC0wODAwLCBTYXJhdmFuYSBLYW5uYW4gd3JvdGU6Cj4gPiA+
ID4gVmxhZGltaXIsCj4gPiA+ID4KPiA+ID4gPiBDY2luZyB5b3UgYmVjYXVzZSBEU0EncyBhbmQg
ZndfZGV2bGluayBoYXZlIGtub3duL2V4aXN0aW5nIHByb2JsZW1zCj4gPiA+ID4gKHN0aWxsIGlu
IG15IFRPRE9zIHRvIGZpeCkuIEJ1dCBJIHdhbnQgdG8gbWFrZSBzdXJlIHRoaXMgc2VyaWVzIGRv
ZXNuJ3QKPiA+ID4gPiBjYXVzZSBhZGRpdGlvbmFsIHByb2JsZW1zIGZvciBEU0EuCj4gPiA+ID4K
PiA+ID4gPiBBbGwsCj4gPiA+ID4KPiA+ID4gPiBUaGlzIHBhdGNoIHNlcmllcyBpbXByb3ZlcyBm
d19kZXZsaW5rIGluIHRoZSBmb2xsb3dpbmcgd2F5czoKPiA+ID4gPgo+ID4gPiA+IDEuIEl0IG5v
IGxvbmdlciBjYXJlcyBhYm91dCBhIGZ3bm9kZSBoYXZpbmcgYSAiY29tcGF0aWJsZSIgcHJvcGVy
dHkuIEl0Cj4gPiA+ID4gICAgZmlndXJlcyB0aGlzIG91dCBtb3JlIGR5bmFtaWNhbGx5LiBUaGUg
b25seSBleHBlY3RhdGlvbiBpcyB0aGF0Cj4gPiA+ID4gICAgZndub2RlcyB0aGF0IGFyZSBjb252
ZXJ0ZWQgdG8gZGV2aWNlcyBhY3R1YWxseSBnZXQgcHJvYmVkIGJ5IGEgZHJpdmVyCj4gPiA+ID4g
ICAgZm9yIHRoZSBkZXBlbmRlbmNpZXMgdG8gYmUgZW5mb3JjZWQgY29ycmVjdGx5Lgo+ID4gPiA+
Cj4gPiA+ID4gMi4gRmluZXIgZ3JhaW5lZCBkZXBlbmRlbmN5IHRyYWNraW5nLiBmd19kZXZsaW5r
IHdpbGwgbm93IGNyZWF0ZSBkZXZpY2UKPiA+ID4gPiAgICBsaW5rcyBmcm9tIHRoZSBjb25zdW1l
ciB0byB0aGUgYWN0dWFsIHJlc291cmNlJ3MgZGV2aWNlIChpZiBpdCBoYXMgb25lLAo+ID4gPiA+
ICAgIEVnOiBncGlvX2RldmljZSkgaW5zdGVhZCBvZiB0aGUgcGFyZW50IHN1cHBsaWVyIGRldmlj
ZS4gVGhpcyBpbXByb3Zlcwo+ID4gPiA+ICAgIHRoaW5ncyBsaWtlIGFzeW5jIHN1c3BlbmQvcmVz
dW1lIG9yZGVyaW5nLCBwb3RlbnRpYWxseSByZW1vdmUgdGhlIG5lZWQKPiA+ID4gPiAgICBmb3Ig
ZnJhbWV3b3JrcyB0byBjcmVhdGUgZGV2aWNlIGxpbmtzLCBtb3JlIHBhcmFsbGVsaXplZCBhc3lu
YyBwcm9iaW5nLAo+ID4gPiA+ICAgIGFuZCBiZXR0ZXIgc3luY19zdGF0ZSgpIHRyYWNraW5nLgo+
ID4gPiA+Cj4gPiA+ID4gMy4gSGFuZGxlIGhhcmR3YXJlL3NvZnR3YXJlIHF1aXJrcyB3aGVyZSBh
IGNoaWxkIGZpcm13YXJlIG5vZGUgZ2V0cwo+ID4gPiA+ICAgIHBvcHVsYXRlZCBhcyBhIGRldmlj
ZSBiZWZvcmUgaXRzIHBhcmVudCBmaXJtd2FyZSBub2RlIEFORCBhY3R1YWxseQo+ID4gPiA+ICAg
IHN1cHBsaWVzIGEgbm9uLW9wdGlvbmFsIHJlc291cmNlIHRvIHRoZSBwYXJlbnQgZmlybXdhcmUg
bm9kZSdzCj4gPiA+ID4gICAgZGV2aWNlLgo+ID4gPiA+Cj4gPiA+ID4gNC4gV2F5IG1vcmUgcm9i
dXN0IGF0IGN5Y2xlIGhhbmRsaW5nIChzZWUgcGF0Y2ggZm9yIHRoZSBpbnNhbmUgY2FzZXMpLgo+
ID4gPiA+Cj4gPiA+ID4gNS4gU3RvcHMgZGVwZW5kaW5nIG9uIE9GX1BPUFVMQVRFRCB0byBmaWd1
cmUgb3V0IHNvbWUgY29ybmVyIGNhc2VzLgo+ID4gPiA+Cj4gPiA+ID4gNi4gU2ltcGxpZmllcyB0
aGUgd29yayB0aGF0IG5lZWRzIHRvIGJlIGRvbmUgYnkgdGhlIGZpcm13YXJlIHNwZWNpZmljCj4g
PiA+ID4gICAgY29kZS4KPiA+ID4gPgo+ID4gPiA+IFRoZSB2MyBzZXJpZXMgaGFzIGdvbmUgdGhy
b3VnaCBteSB1c3VhbCB0ZXN0aW5nIG9uIG15IGVuZCBhbmQgbG9va3MgZ29vZAo+ID4gPiA+IHRv
IG1lLgo+ID4gPgo+ID4gPiBCb290ZWQgb24gYW4gTlhQIExTMTAyOEEgKGFyY2gvYXJtNjQvYm9v
dC9kdHMvZnJlZXNjYWxlL2ZzbC1sczEwMjhhLXJkYi5kdHMpCj4gPiA+IGFuZCBhIFR1cnJpcyBN
T1ggKGFyY2gvYXJtNjQvYm9vdC9kdHMvbWFydmVsbC9hcm1hZGEtMzcyMC10dXJyaXMtbW94LmR0
cykKPiA+ID4gd2l0aCBubyBvYnNlcnZlZCByZWdyZXNzaW9ucy4KPiA+Cj4gPiBUaGFua3MgZm9y
IHRlc3RpbmcgVmxhZGltaXIhCj4gPgo+ID4gPiBJcyB0aGVyZSBzb21ldGhpbmcgc3BlY2lmaWMg
eW91IHdvdWxkIGxpa2UKPiA+ID4gbWUgdG8gdGVzdD8KPiA+Cj4gPiBOb3QgcmVhbGx5LCBJIGp1
c3Qgd2FudCB0byBtYWtlIHN1cmUgdGhlIGNvbW1vbiBEU0EgYXJjaGl0ZWN0dXJlcwo+ID4gZG9u
J3QgaGl0IGFueSByZWdyZXNzaW9uLiBJbiB0aGUgaGFyZHdhcmUgeW91IHRlc3RlZCwgYXJlIHRo
ZXJlIGNhc2VzCj4gPiBvZiBQSFlzIHdoZXJlIHRoZSBzdXBwbGllciBpcyB0aGUgcGFyZW50IE1E
SU8/IEkgcmVtZW1iZXIgdGhhdCBiZWluZwo+ID4gdGhlIG9ubHkgY2FzZSB3aGVyZSBJIG5lZWRl
ZCBzcGVjaWFsIGNhc2luZwo+ID4gKEZXTk9ERV9GTEFHX05FRURTX0NISUxEX0JPVU5EX09OX0FE
RCkgaW4gZndfZGV2bGluayAtLSBzbyBpdCdsbCBiZQo+ID4gZ29vZCB0byBtYWtlIHN1cmUgSSBk
aWRuJ3QgYWNjaWRlbnRhbGx5IGJyZWFrIGFueXRoaW5nIHRoZXJlLgo+ID4KPiA+IC1TYXJhdmFu
YQo+Cj4gWWVzIGFuZCBubyAoSSBuZXZlciBoYWQgYSBzeXN0ZW0gd2hpY2ggZGVwZW5kZWQgb24g
RldOT0RFX0ZMQUdfTkVFRFNfQ0hJTERfQk9VTkRfT05fQUREKS4KPgo+IFllcywgYmVjYXVzZSB3
ZWxsLCB5ZXMsIGluIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWFydmVsbC9hcm1hZGEtMzcyMC10dXJy
aXMtbW94LmR0cywKPiB0aGUgUEhZcyB3aWxsIGRlcGVuZCBvbiBpbnRlcnJ1cHRzIHByb3ZpZGVk
IGJ5IHRoZWlyIChwYXJlbnQpIHN3aXRjaC4gSG93ZXZlciB0aGlzCj4gaXMgbm90IGV4cGxpY2l0
IGluIHRoZSBkZXZpY2UgdHJlZS4gVG8gbWFrZSBpdCBleHBsaWNpdCwgb25lIHdvdWxkIG5lZWQg
dG8gYWRkOgo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWFydmVsbC9hcm1h
ZGEtMzcyMC10dXJyaXMtbW94LmR0cyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWFydmVsbC9hcm1h
ZGEtMzcyMC10dXJyaXMtbW94LmR0cwo+IGluZGV4IGNkMDk4ODMxNzYyMy4uZDc4OWNkYTQ5ZTM1
IDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWFydmVsbC9hcm1hZGEtMzcyMC10
dXJyaXMtbW94LmR0cwo+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWFydmVsbC9hcm1hZGEt
MzcyMC10dXJyaXMtbW94LmR0cwoKLS0tLS04PC0tLS0gU25pcHBlZCBEVCBkaWZmIC0tLS0tCgo+
IEhvd2V2ZXIsIGFzIEkgaGFkIGV4cGxhaW5lZCBpbiBvbmUgb2YgdGhlIGZpcnN0IGRpc2N1c3Np
b25zIGhlcmU6Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbmV0ZGV2LzIwMjEwOTAxMDEyODI2
Lml1eTJiaHZrcmdhaGhybDdAc2tidWYvCj4KPiBpdCB3YXMgYWx3YXlzIGhpdC1vci1taXNzIHdo
ZXRoZXIgdGhlIGFib3ZlIGRldmljZSB0cmVlIGhhZCBhbiBpc3N1ZQo+IHdpdGggZndfZGV2bGlu
ayBvciBub3Q6IGl0IGRlcGVuZGVkIG9uIGhvdyB0aGUgZHJpdmVyIHdhcyB3cml0dGVuIChhbmQK
PiB0aGUgbXY4OGU2eHh4IHN3aXRjaCBkcml2ZXIgd2FzIHRyaWNraW5nIHRoZSBmd19kZXZsaW5r
IGxvZ2ljIGZyb20gdGhhdAo+IHRpbWUgdG8gZHJvcCB0aGUgZGV2aWNlIGxpbmtzIGJlY2F1c2Ug
b2YgYW4gdW5yZWxhdGVkIC1FUFJPQkVfREVGRVIpLgoKWWVhaCwgSSBuZXZlciBmb3Jnb3QgdGhp
cyBpc3N1ZS4gVGhhdCdzIHdoeSBJIHVzZWQgImFkZGl0aW9uYWwiIGluIG15CmNvdmVyIGxldHRl
ciA6KQoKU28gZmFyIEkndmUgbm90IG5lZWRlZCB0byBjaGFuZ2UgZndfZGV2bGluayBpbiBhIHdh
eSB0aGF0J2QgYnJlYWsgdGhpcwp1bmludGVudGlvbmFsICJ0cmlja3kgYmVoYXZpb3IiIGJ1dCBJ
IG1pZ2h0IGJlIGNvbWluZyB1cCB0byB0aGF0IHdhbGwKc29vbi4gU28gdGhpcyByZXBseSBpcyBi
ZWNvbWluZyBtb3JlIHJlbGV2YW50IHRvIG1lOgpodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21s
L0NBR0VUY3g4RGVfcW05aFZ0SzVDem5mV2tlOW5tT2ZWOE9jdkFXNmttd3llYjdBUHI9Z0BtYWls
LmdtYWlsLmNvbS8KCk5vdCBzdXJlIGlmIHlvdSd2ZSBoYWQgYSBjaGFuY2UgdG8gcmVhZCBvciB0
aGluayBhYm91dCBpdC4KCj4gV2hhdCBJIGhhZCBkb25lIHRvICJ1bnRyaWNrIiBmd19kZXZsaW5r
IHNvIHRoYXQgSSBjb3VsZCBzZWUgdGhlIGlzc3VlCj4gKHdoaWNoIHdhcyBvcmlnaW5hbGx5IHJl
cG9ydGVkIGJ5IEFsdmluIMWgaXByYWdhKSB3YXMgdG8gbW9kaWZ5IHRoZQo+IG12ODhlNnh4eCBk
cml2ZXIsIGFuZCBjaGFuZ2UgdGhlIHBsYWNlbWVudCBvZiBtdjg4ZTZ4eHhfbWRpb3NfcmVnaXN0
ZXIoKQo+IHRvIGEgcG9pbnQgYWZ0ZXIgd2hpY2ggd2Ugd2lsbCBuZXZlciBoaXQgLUVQUk9CRV9E
RUZFUiAoZnJvbSBkcml2ZXIgcHJvYmUoKQo+IHRvIHRoZSBkc2Ffc3dpdGNoX29wcyA6OiBzZXR1
cCgpIG1ldGhvZCk6Cj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZHNhL212ODhlNnh4eC9j
aGlwLmMgYi9kcml2ZXJzL25ldC9kc2EvbXY4OGU2eHh4L2NoaXAuYwo+IGluZGV4IDBhNWQ2Yzdi
YjEyOC4uNDg2NTA0NjU2NjBkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbmV0L2RzYS9tdjg4ZTZ4
eHgvY2hpcC5jCj4gKysrIGIvZHJpdmVycy9uZXQvZHNhL212ODhlNnh4eC9jaGlwLmMKCi0tLS0t
ODwtLS0tIHNuaXBwZWQKCj4gQWZ0ZXIgYXBwbHlpbmcgYm90aCBvZiB0aGUgYWJvdmUgY2hhbmdl
cyBvbiB0b3Agb2YgeW91cnMsIEkgY29uZmlybSB0aGF0Cj4gdGhlIFBIWXMgb24gdGhlIG12ODhl
Nnh4eCBvbiBUdXJyaXMgTU9YIHN0aWxsIHByb2JlIHdpdGggdGhlaXIgc3BlY2lmaWMKPiBQSFkg
ZHJpdmVyIHJhdGhlciB0aGFuIHRoZSBnZW5lcmljIG9uZSwgYW5kIHdpdGggaW50ZXJydXB0cyAo
bm90IHBvbGwgbW9kZSk6Cj4KLS0tLS04PC0tLS0gc25pcHBlZAoKPgo+IGV2ZW4gdGhvdWdoIEkg
YW0gc2VlaW5nIHRoZXNlIGVycm9yIG1lc3NhZ2VzIGVhcmxpZXIgaW4gdGhlIGJvb3QgcHJvY2Vz
cyAobWF5YmUgdGhpcyBpcyBzb21ldGhpbmcgdG8gbG9vayBpbnRvKToKPgo+IFsgICAgMC45MTAy
MTldIG1kaW9fYnVzIGQwMDMyMDA0Lm1kaW8tbWlpOjEwOiBGYWlsZWQgdG8gY3JlYXRlIGRldmlj
ZSBsaW5rIHdpdGggZDAwMzIwMDQubWRpby1taWk6MTAKCi0tLS0tODwtLS0tIHNuaXBwZWQKCj4g
WyAgICAwLjk0Mzg3OV0gbXY4OGU2MDg1IGQwMDMyMDA0Lm1kaW8tbWlpOjEyOiBzd2l0Y2ggMHgx
OTAwIGRldGVjdGVkOiBNYXJ2ZWxsIDg4RTYxOTAsIHJldmlzaW9uIDEKPgo+Cj4gSWYgX29uIHRv
cF8gb2YgYWxsIHRoZSBhYm92ZSwgSSBhbHNvIHJlbW92ZSB0aGUgbG9naWMgdGhhdCBzZXRzIEZX
Tk9ERV9GTEFHX05FRURTX0NISUxEX0JPVU5EX09OX0FERDoKCj4gdGhlbiAqZmluYWxseSogSSBn
ZXQgc29tZXRoaW5nIGFwcHJveGltYXRpbmcgQWx2aW4ncyByZXBvcnRlZCBpc3N1ZS4KPiBJbiBt
eSBjYXNlLCBvbmUgc3dpdGNoIG91dCBvZiAzIGdldHMgaXRzIFBIWXMgYm91bmQgdG8gdGhlIEdl
bmVyaWMgUEhZCj4gZHJpdmVyICh3aHkgbm90IGFsbCBpcyBhIHN0b3J5IGZvciBhbm90aGVyIHRp
bWUpOgoKLS0tLS04PC0tLS0gc25pcHBlZAoKPiBTbyBJIGd1ZXNzIHRoYXQgRldOT0RFX0ZMQUdf
TkVFRFNfQ0hJTERfQk9VTkRfT05fQUREIGRvZXMgc29tZXRoaW5nLgoKVGhhbmtzIGZvciB0aGUg
ZXh0ZW5zaXZlIGVmZm9ydCBpbnRvIHRlc3RpbmcgdGhpcyEKCi1TYXJhdmFuYQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
