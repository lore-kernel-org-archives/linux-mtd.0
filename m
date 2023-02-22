Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 884BEC61DA4
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Feb 2023 21:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S4rC+UNN7VtrY8EjQEu4OY0AzVfXOIE6+1MsAvGzkzk=; b=V4Rna1pmwy3P4K
	QJ5Y9vi4+uZkzRPJwZCb84tXgmLIs2tj5ZEJLwM6p5P3RxbyAQ+gqjEUmvmbDVczQY725B8lXiCMD
	SlEPyleS5kJehu9lNiM9PQxcQnkmLWMRjLdgklm5zphxhYKSpro2VklcMVvCbvJildMjPLNYiVZ3+
	8KaPOjN8rrq7lU+ZVl7277kzVOctpRhz1DBYAfOaMJ+ZyrMmO/LgC7LNBr4r9akZ29llzqCmA3ia5
	8cftSOBuqz3ULaUj5oaN1LgxePnhqZMWac8dkWm99OEaZp20rEDfO+S7YHBshjSRWoA5zdICeqmXR
	Cz7SlBZRGtMZdJHnqkxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUwSI-00E98A-1e; Wed, 22 Feb 2023 21:15:14 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUwSE-00E96V-Tn; Wed, 22 Feb 2023 21:15:12 +0000
Received: by mail-ed1-x533.google.com with SMTP id eg37so32060472edb.12;
        Wed, 22 Feb 2023 13:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1hpkcdj31Kp+64I0H+8QjpzTiuX76hZTeMvrWdpVOt4=;
        b=Y95tEBQTvJnja0wiaBFlONHEPFFpg4E5Aidd7Wxu88GO6+Efw9s32CSm6Qrv+mXXKE
         i5+x1nQprf7tfF0IcJzKPjG26LQSm8lVS+CQndNmsIeuLxTz3Zws+u23ldaG3K54+WIL
         IKeo6NJCJ7WchtpfymyIpeNWai8L7kAy3lwcxu51e9DNdYZrZ0f3D1Sw8ivAk+CfDKS3
         Ek4oq62+5hOyx3h0ySU4oZmDiESIURoGhUvHFCUOXpdaqhWIldAEFOJmG9Rfku2zdt2S
         XHD98cqCLTBp5a+c55IWJPbpd06egfIFbD37YQMjJACS4ZlT8leLyYR4DAvtMaXLTN/X
         IY6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1hpkcdj31Kp+64I0H+8QjpzTiuX76hZTeMvrWdpVOt4=;
        b=ESzvGo2YbvD9LkdPZngcUgPHxKJHJ11ML7/WfBdKFcxFjShY0Cg7AHlZ+t5/7ZkBRO
         bRgczKqzjlpebS6eCV6yaDCjdwuwmw8hbJUhwhDoFM4EbfEHf6MdWrD93vGGv38vVCNw
         Pt8ABVBZyiVcx5NObesb1koQjM6Z7iICBI2I6CofEKzQNmlnyopcSNdocw2hhHKWbmVM
         Wj0sRZw86o2KEUrEd+dkZYA/VnKwMzW2JdWTvw9Yya/MBCOMHTGl/nSODbYojH0aSTOs
         LTef2Wz9WItTcVQd/d7966NXo54PTBwopnF2mLx9oMkChnXe/MS1FnuMKpA2l70azBxJ
         jLoA==
X-Gm-Message-State: AO0yUKVu+6q8GGYg54UdQxtMYeLW6Y4q1xtF/XYb0p7x+Ghd9pNDjpvt
	uK6eP+6iWbJvoDPsVbgL+SI30gkqRESBAm3PyZ0=
X-Google-Smtp-Source: AK7set8TXb46bTmDPfzW/xczn6QfGU7MdMXPRf/CaO6cyWdNx+3X84yvibHTXzLWWA/EAH5iiZY+OShEAAHjsEGwRMc=
X-Received: by 2002:a50:f611:0:b0:4ac:b7c1:9109 with SMTP id
 c17-20020a50f611000000b004acb7c19109mr4476929edn.6.1677100506156; Wed, 22 Feb
 2023 13:15:06 -0800 (PST)
MIME-Version: 1.0
References: <20230221145021.31993-1-zajec5@gmail.com> <CAFBinCDxB=xtz9mtZupBC7J5oxknN1ENHzJ-cFxX4FTDSgZeFQ@mail.gmail.com>
 <101a5bdf-870a-a1bb-954d-1d675ecad5a7@gmail.com>
In-Reply-To: <101a5bdf-870a-a1bb-954d-1d675ecad5a7@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 22 Feb 2023 22:14:55 +0100
Message-ID: <CAFBinCDcDYtdOdikc2ieXjRUkrjgwNKaPYvYZb_v84gh66q=bw@mail.gmail.com>
Subject: Re: [PATCH] nvmem: add explicit config option to read OF fixed cells
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Heiko Stuebner <heiko@sntech.de>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vincent Shih <vincent.sunplus@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Michal Simek <michal.simek@xilinx.com>, Alessandro Zummo <a.zummo@towertech.it>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Evgeniy Polyakov <zbr@ioremap.net>, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	linux-rtc@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_131510_988749_858D027B 
X-CRM114-Status: GOOD (  23.40  )
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

SGVsbG8gUmFmYcWCLAoKT24gVHVlLCBGZWIgMjEsIDIwMjMgYXQgMTE6MjkgUE0gUmFmYcWCIE1p
xYJlY2tpIDx6YWplYzVAZ21haWwuY29tPiB3cm90ZToKWy4uLl0KPiA+IEkgYW0gbm90IGZhbWls
aWFyIHdpdGggdGhlIHJlY2VudCBjaGFuZ2VzIGFyb3VuZCBkeW5hbWljIGNlbGxzLgo+ID4gSXMg
dGhlcmUgYW55IGRpc2N1c3Npb24vc3VtbWFyeSB0aGF0IEkgY2FuIHJlYWQgdG8gZ2V0IHVwIHRv
IHNwZWVkPwo+Cj4gU29tZSBOVk1FTSBkZXZpY2VzIGRvbid0IHN0b3JlIHNwZWNpZmljIGRhdGEg
YXQgaGFyZGNvZGVkIG9mZnNldHMuIEZvcgo+IHN1Y2ggZGV2aWNlcyB3ZSBoYXZlIGRyaXZlcnMg
KHRvIGJlY29tZTogbGF5b3V0cykgdGhhdCBwYXJzZSB0aGVpciBtYWdpYwo+IGNvbnRlbnQuIFRo
ZXkgZGlzY292ZXIgY2VsbHMgYW5kIHJlZ2lzdGVyIHRoZW0gYW5kIHByb3ZpZGUgbWF0Y2hpbmcg
d2l0aAo+IHByb3BlciBEVCBub2Rlcy4KPgo+IEZvciBiaW5kaW5ncyBzZWU6Cj4gaHR0cHM6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0
L2NvbW1pdC8/aWQ9MDg0OTczZTk0NGJlYzIxODA0ZjhhZmIwNTE1YjI1NDM0NDM4Njk5YQo+IGh0
dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xp
bnV4LmdpdC9jb21taXQvP2lkPWE2MDdhODUwYmExZmE5NjZjYmIwMzU1NDRjMTU4OGUyNGE2MzA3
ZGYKPgo+IEZvciBleGFtcGxlIGRyaXZlciBzZWU6Cj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L2NvbW1pdC8/aWQ9NmU5
NzdlYWE4MjgwZTk1N2I4NzkwNGI1MzY2NjE1NTBmMmE2YjNlOAo+IGh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC9jb21taXQv
P2lkPTIwNzc3NWY3ZTE3YjhmZDA0MjZhMmFjNGE1YjgxZTRlMWQ3MTg0OWUKPgo+IEZvciB1c2Fn
ZSBzZWU6Cj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
dG9ydmFsZHMvbGludXguZ2l0L2NvbW1pdC8/aWQ9Yzg0NDJmMGZiMDljYTNkODQyYjliMjNkMWQw
NjUwZjY0OWZkMTBmOApUaGFua3MsIHRoYXQgbWFrZXMgdGhpbmdzIGNsZWFyZXIgZm9yIG1lIQoK
PiA+IE15IG1haW4gdGhvdWdodCBpczogaWYgdGhlcmUgYXJlIG1hbnkgImZpeGVkIE9GIGNlbGxz
IiBpbXBsZW1lbnRhdGlvbnMKPiA+IGFuZCBvbmx5IGEgZmV3ICJkeW5hbWljIiBvbmVzIC0gZG9l
cyBpdCBtYWtlIHNlbnNlIHRvIGZsaXAgdGhlIGxvZ2ljCj4gPiBhbmQgaW50cm9kdWNlIGEgbmV3
ICJ1c2VfZHluYW1pY19vZl9jZWxscyIgZmxhZyBpbnN0ZWFkPwo+Cj4gVGhlIHByb2JsZW0gaXMg
dGhhdCB0aGVyZSBhcmUgbW9yZSBjYXNlcyB0aGFuIGp1c3QgdHdvLiBXZSBjYW4gaGF2ZToKPiAx
LiBObyBjZWxscyBhdCBhbGwKPiAyLiBGaXhlZCBjZWxscyBpbiBEVAo+IDMuIER5bmFtaWMgY2Vs
bHMgd2l0aCByZWZlcmVuY2VzIGluIERUCj4gNC4gRHJpdmVyIHNwZWNpZmllZCBjZWxscyAoc3Bl
Y2lmaWVkIHdpdGhpbiBjb25maWcpCj4gNS4gQ2VsbHMgZGVmaW5lZCBpbiBhIGdsb2JhbCB0YWJs
ZQo+Cj4gU28gd2UgbmVlZCB0byByZWZlcmVuY2UgRFQgY2VsbHMgZXhwbGljaXRseSAod2UgY2Fu
J3QganVzdCBjb25maXJtIC8KPiBkZW55ICpkeW5hbWljKiBjZWxscykuCj4KPiBBbm90aGVyIHNv
bHV0aW9uIHdvdWxkIGJlIHRvIGhhdmUgIm5vX2ZpeGVkX29mX2NlbGxzIiBidXQ6Cj4KPiAxLiBQ
ZXJzb25hbGx5IEkgdGhpbmsgbmVnYXRpb24gaXMgbGVzcyBjbGVhciAvIGVhc3kgdG8gZm9sbG93
Cj4KPiAyLiBUaGVyZSBtYXkgYmUgYWN0dWFsbHkgbW9yZSBkcml2ZXJzIHdpdGggbm8gZml4ZWQg
Y2VsbHMuCj4gSSB0aGluayBJIG1vZGlmaWVkIDE4IGRyaXZlcnMuIEl0IHNlZW1zIGRldm1fbnZt
ZW1fcmVnaXN0ZXIoKSBpcwo+IHJlZmVyZW5jZWQgaW4gNDQgcGxhY2VzLiBGZXcgb2YgdGhlbSBt
YXkgYmUgbm90IGFjdHVhbCB1c2VycyBidXQgaXQKPiBzdGlsbCBzZWVtcyB0byBiZSBhYm91dCBl
cXVhbC4KVGhhbmtzIGZvciB0aGlzIG92ZXJ2aWV3IG9mIGFsbCB0aGUgc3BlY2lhbCBjYXNlcy4g
UGxlYXNlIGFkZCBteToKQWNrZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVt
ZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+CmZvciB0aGUgZm9sbG93aW5nIHR3byBkcml2ZXJzOgot
IGRyaXZlcnMvbnZtZW0vbWVzb24tZWZ1c2UuYwotIGRyaXZlcnMvbnZtZW0vbWVzb24tbXgtZWZ1
c2UuYwoKCkJlc3QgcmVnYXJkcywKTWFydGluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
