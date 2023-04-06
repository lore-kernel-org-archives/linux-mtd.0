Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A24F2C76196
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Apr 2023 12:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lm59uMML/EV975Y6rA7mSY1+PPiNVQV9FzwcVJZVjS4=; b=qQTjihUiYIoqYa
	dpgeyGHonc7kdGw94Y7MlTkq9T7s5k/yBBDuyqd3O/Ar3Z9nQS7oymQ8tWUHMN6tyTdZt9xAEi+UX
	myUyHajZinj1/KJ96ny5TqYhaTx0iBCsXWBSdK6UTbmSQ8V3NzGIoaap+RZYYn8Vw2P3bZ5tq0ncu
	8zMEtvaq52bPp9E3wMvefJZLRpUiUifxPPC4kSp3KeHtyO+Iu36wGukXHRhrVTo4pxpXe8JxKotjq
	jV6sMscOPcmE70v22EBt9uX22/EDvEQn3avaeGG+HwbO6l+urrgBBS8MEuOKgeyCNEZpZGV+rFJkU
	GRaBexzAuDFCEBvUdXCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkOVe-007FtG-0M;
	Thu, 06 Apr 2023 12:14:34 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkOVb-007Fst-22
	for linux-mtd@lists.infradead.org;
	Thu, 06 Apr 2023 12:14:32 +0000
Received: by mail-wr1-x42e.google.com with SMTP id q19so36234797wrc.5
        for <linux-mtd@lists.infradead.org>; Thu, 06 Apr 2023 05:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680783269;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PtN6finzlKyjOWOTDfHBV+4d8fKjhpXJy7YkWKnE6X8=;
        b=fUiy/wpfYV1ZBaAFw5mPNZBrYwyPjKEFeedgzHaJvzqrmTkzezArwN1BBgSXOgytmG
         94kW3OOcyejtN6rK2XhqUrcohm4fjqm5wGumy8xLadNiRWyg/AhKSWHTRnX4/wS0q+Vf
         3myriiFR5HW3XnPOTW7UfohFOhacsMOdZINbiTGXfNUIz8QxSZmhGGXb5GsBEu4JOmUO
         68znTs7QF4SLHjYxsjBFIUoFR+EGpwY+td+zi9BFUv3eN3KSc1rC7VtFTn7crLoKf/vn
         WSYfxxezKtjqF9I4Y40mVZplEP2CkCK5ZOPVxddvED3kSiHNjQ7LraAUHsh1u9tpiTiq
         UXnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680783269;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PtN6finzlKyjOWOTDfHBV+4d8fKjhpXJy7YkWKnE6X8=;
        b=VCn+FE8Fa2btMijgVmqot3G8d7LtxXp1XUMi8Xiazbrogai5a11i2RR4MEImIBWM7+
         z7YTYu/2ES1reBNKXTPOuRDPJ9hyYUQwalBwn0s6QJK4rrhk+GhEcckKDbRsIk24/HrD
         Im+crVftXEwthIfjOH6mTYbArO51XLWa2wlp0wgdb8y8VaARscVDgZncI2ggnDEGOIKh
         bepkJSSbrVEwOzZ1dt+iQpvkz7XN1tKlWPaM7+s4r4brcWinkXeZ69uy4p2izrcJs5ZS
         SpZFPNcXvGDsqHaAnxHJufHV+rKSpEx4/dBdbUd4Ga3XNS1uXKHl9SXJads44DfcrVvJ
         TAYA==
X-Gm-Message-State: AAQBX9edxy3NaVe6oomr1n9LV/q7fWB2E+CgGgMwsO5fSeKa21/z8n4v
	0Rx2O7zMIajwXvSM3NYdwfPSjA==
X-Google-Smtp-Source: AKy350Zv1H53qcTrQdQmKKvpijr863TpWXekAARScTC3UByulubKjEiiO79+Ua9XQrRktPoJ23+5ww==
X-Received: by 2002:a5d:610a:0:b0:2d5:553a:93ac with SMTP id v10-20020a5d610a000000b002d5553a93acmr6985574wrt.7.1680783269444;
        Thu, 06 Apr 2023 05:14:29 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id t1-20020a05600001c100b002d51d10a3fasm1622971wrx.55.2023.04.06.05.14.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 05:14:29 -0700 (PDT)
Message-ID: <0917542e-e8b4-6dbb-54c4-8215b05e399a@linaro.org>
Date: Thu, 6 Apr 2023 14:14:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH 20/49] mtd: rawnand: ingenic: Convert to platform remove
 callback returning void
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Harvey Hunt <harveyhuntnexus@gmail.com>, Paul Cercueil
 <paul@crapouillou.net>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-mips@vger.kernel.org, kernel@pengutronix.de
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
 <20230401161938.2503204-21-u.kleine-koenig@pengutronix.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230401161938.2503204-21-u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_051431_693904_54505459 
X-CRM114-Status: GOOD (  14.60  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMS80LzIzIDE4OjE5LCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiBUaGUgLnJlbW92ZSgp
IGNhbGxiYWNrIGZvciBhIHBsYXRmb3JtIGRyaXZlciByZXR1cm5zIGFuIGludCB3aGljaCBtYWtl
cwo+IG1hbnkgZHJpdmVyIGF1dGhvcnMgd3JvbmdseSBhc3N1bWUgaXQncyBwb3NzaWJsZSB0byBk
byBlcnJvciBoYW5kbGluZyBieQo+IHJldHVybmluZyBhbiBlcnJvciBjb2RlLiBIb3dldmVyIHRo
ZSB2YWx1ZSByZXR1cm5lZCBpcyAobW9zdGx5KSBpZ25vcmVkCj4gYW5kIHRoaXMgdHlwaWNhbGx5
IHJlc3VsdHMgaW4gcmVzb3VyY2UgbGVha3MuIFRvIGltcHJvdmUgaGVyZSB0aGVyZSBpcyBhCj4g
cXVlc3QgdG8gbWFrZSB0aGUgcmVtb3ZlIGNhbGxiYWNrIHJldHVybiB2b2lkLiBJbiB0aGUgZmly
c3Qgc3RlcCBvZiB0aGlzCj4gcXVlc3QgYWxsIGRyaXZlcnMgYXJlIGNvbnZlcnRlZCB0byAucmVt
b3ZlX25ldygpIHdoaWNoIGFscmVhZHkgcmV0dXJucwo+IHZvaWQuCj4gCj4gVHJpdmlhbGx5IGNv
bnZlcnQgdGhpcyBkcml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8gaW4gdGhlIHJlbW92
ZQo+IGNhbGxiYWNrIHRvIHRoZSB2b2lkIHJldHVybmluZyB2YXJpYW50Lgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+
Cj4gLS0tCj4gICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9pbmdlbmljL2luZ2VuaWNfbmFuZF9kcnYu
YyB8IDYgKystLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0
aW9ucygtKQoKUmV2aWV3ZWQtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGlu
YXJvLm9yZz4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
