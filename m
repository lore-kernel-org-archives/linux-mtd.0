Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89BFFC04A94
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Aug 2023 10:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2G4kn3druxfGaEmnGFOrhWjhBmoByk4poPGp1jtQeko=; b=G2OkcRTKzNaRkQ
	1gU14pUgM563fWXSawOYM/0ckcbHy55S73DwDfN8y6i+AEeUWfS5Sjp4RmePoPPo244/NQvCkuToy
	7IX4XildD8sFT/Qfd/1v41QbzyZnZaRkDj2S05yw5IZOKY1jSyNDzyzV8J7v8dn11QdNp2q2isKZJ
	9u8v+t0NNeHfVKtJlrCyo6So5qJQrYZON5WbkRTsXT1Wk8/CwfWJtba41H/INkoifDwyBdiG2Wak6
	ImfmSLUn7acTt0T4BlO2C6kXeGTQ1pFtnhRztar/dh/8KJxWLZkWljkd8J7c7XJ7vUi4cMySmwMjV
	36PP/QydFGSsQOAwD1NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWE47-003tcL-1V;
	Wed, 16 Aug 2023 10:47:51 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWE44-003taQ-16
	for linux-mtd@lists.infradead.org;
	Wed, 16 Aug 2023 10:47:49 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-6bd0a96e63dso5495677a34.2
        for <linux-mtd@lists.infradead.org>; Wed, 16 Aug 2023 03:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692182866; x=1692787666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IqfltUzO9/7XC4DYmyYNWNOkXYukgueL2I3mGg1oQAA=;
        b=Fq65ng7kO+56O688EyACOxLCzvqd//sLdtPogj3dPsTM8xaGxawYIleaF4EvMy/j4X
         dgjU3gcW3l+SJpPFMN4HY0cM5ju/GLbX1EsXHNcfhQZs7FuAVRK3Mkr+Wlrztg+2IJff
         3n22RO5sbjmW2j0UJXPerWGEDMHTaZLuM5ZeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692182866; x=1692787666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IqfltUzO9/7XC4DYmyYNWNOkXYukgueL2I3mGg1oQAA=;
        b=SnADl2ec8eft1yaZmNPkE6whW/nbKQB7ptVAvMyWR+pYfX9SyPnN3WPi9LfOtK7HNQ
         2w7d8eVG2XbMHhYl2zcrBXDIoxnKOFhRcWsGuyg3rIEB+zr5bpoOGEfYhmQ1qtMt3DG5
         +mtNvypABy3tFGVBOUGj+3GOBNIBLU6SN4MBRmBLWo0VSwrryQubxrqfmLSYsavXoFaa
         E/5Hasd1azRXKtHoTx6BFNGxOz5znpNhtUCrWTM4zlwOwR1sU65sN/TWDeiadLFJhqyN
         eFooQSeX2LpW0U5A8CJlz4RqAkzYfPnbaIZX6aPDee5JU8HdteKDjQPqphkxOHQZHVmC
         XzBg==
X-Gm-Message-State: AOJu0Yyrnxk5xMD0kj4zyrN9var9k5NG7anwYluID2i38OQQYJry21gj
	Qsef3qiqh1RIV5cfvw/clVYYLWMInCFCYpMNfI/tdg==
X-Google-Smtp-Source: AGHT+IFP9WgOa+Uiy6lzdS/I4FjriYORF5bZW6c+fXS5Unla5QE6KDKixuRVgSimwfA4N1KJgy/utNzBq8HRGuK/BQA=
X-Received: by 2002:a05:6830:154a:b0:6b9:350e:4051 with SMTP id
 l10-20020a056830154a00b006b9350e4051mr1202859otp.4.1692182866233; Wed, 16 Aug
 2023 03:47:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230816104245.2676965-1-hsinyi@chromium.org> <20230816104245.2676965-2-hsinyi@chromium.org>
In-Reply-To: <20230816104245.2676965-2-hsinyi@chromium.org>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Wed, 16 Aug 2023 18:47:20 +0800
Message-ID: <CAJMQK-j2LNvPOC4G=jwdZ3+F+ynpicnVA-ZZ1B6cdDmOnsCxhA@mail.gmail.com>
Subject: Re: [PATCH v2,2/2] arm64: dts: mediatek: mt8183: set bus rx width to
 disable quad mode
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Bjorn Andersson <andersson@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>, 
	"Miquel Raynal )" <miquel.raynal@bootlin.com>, "Richard Weinberger )" <richard@nod.at>, 
	"Vignesh Raghavendra )" <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	cros-qcom-dts-watchers@chromium.org, Andy Gross <agross@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_034748_378152_EB788537 
X-CRM114-Status: GOOD (  13.93  )
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

T24gV2VkLCBBdWcgMTYsIDIwMjMgYXQgNjo0MuKAr1BNIEhzaW4tWWkgV2FuZyA8aHNpbnlpQGNo
cm9taXVtLm9yZz4gd3JvdGU6Cj4KPiBTb21lIG9mIHRoZSBTS1VzIGFyZSB1c2luZyBnaWdhZGV2
aWNlIGdkMjVscTY0YyBmbGFzaCBjaGlwLiBUaGUgY2hpcAo+IGRlZmF1bHQgZW5hYmxlcyBxdWFk
IG1vZGUsIHdoaWNoIHJlc3VsdHMgaW4gdGhlIHdyaXRlIHByb3RlY3QgcGluIHNldCB0bwo+IElP
IHBpbi4gSW4gbXQ4MTgzIGt1a3VpLCB3ZSB3b24ndCB1c2UgcXVhZCBlbmFibGUgZm9yIGFsbCBT
S1VzLCBzbyBhcHBseQo+IHRoZSBwcm9wZXJ0eSB0byBkaXNhYmxlIHNwaSBub3IncyBxdWFkIG1v
ZGUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBIc2luLVlpIFdhbmcgPGhzaW55aUBjaHJvbWl1bS5vcmc+
Cj4gLS0tCmNoYW5nZSBsb2c6CnYxLT52MjogdXNlIGV4aXN0aW5nIHByb3BlcnR5Lgp2MSBsaW5r
OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjMwODE1MTU0NDEyLjcxMzg0Ni0xLWhz
aW55aUBjaHJvbWl1bS5vcmcvCi0tLQo+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210
ODE4My1rdWt1aS5kdHNpIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTgzLWt1a3Vp
LmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE4My1rdWt1aS5kdHNpCj4g
aW5kZXggNmNlMTZhMjY1ZTA1My4uZWY0NzJiNTIyZjJlNyAxMDA2NDQKPiAtLS0gYS9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE4My1rdWt1aS5kdHNpCj4gKysrIGIvYXJjaC9hcm02
NC9ib290L2R0cy9tZWRpYXRlay9tdDgxODMta3VrdWkuZHRzaQo+IEBAIC04NzcsNiArODc3LDcg
QEAgdzI1cTY0ZHc6IGZsYXNoQDAgewo+ICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gIndp
bmJvbmQsdzI1cTY0ZHciLCAiamVkZWMsc3BpLW5vciI7Cj4gICAgICAgICAgICAgICAgIHJlZyA9
IDwwPjsKPiAgICAgICAgICAgICAgICAgc3BpLW1heC1mcmVxdWVuY3kgPSA8MjUwMDAwMDA+Owo+
ICsgICAgICAgICAgICAgICBzcGktcngtYnVzLXdpZHRoID0gPDI+Owo+ICAgICAgICAgfTsKPiAg
fTsKPgo+IC0tCj4gMi40MS4wLjY5NC5nZTc4NjQ0MmE5Yi1nb29nCj4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
