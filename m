Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C4BC5AC82
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Aug 2026 16:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+GD8dDWdc4Czu63iaDZw/kwL+dBVgas6ii7LmaFt9qM=; b=2D/b+4UaIkJAvk
	m83xyRcgFLqHpMCNTf6WpN3UkdkVLWn+Moh/hYIyKV7W9MTktg9zn3r39SMplYY3Mz3lqa4p7e3Ra
	2qiITj/5TXLkFktrwP+Fk9e73NaDTPoySs33ywTGF7678UsGYrrmC93Tlz4if7UFf15rml9PCY2Kh
	hHTsAp9LCl3hgnD0HZ1r+rui6QlKpFGSv14ePCy3S9cOhwyqBC6n38um9zb5gAk7Gi1Fj7avSb/Fn
	LNtbN2A1oYojPcEPQjwyCh5z45V4T1iTrVuRKC/vVdqkiIE2r2LgzpW6zAWGPbC4JXisyTyCwEOrp
	EHegWgTMr8RrMfxvaLcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNt0-00000008UJ3-41bo;
	Fri, 07 Aug 2026 16:57:34 +0000
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNsx-00000008UHX-2tsi
	for linux-mtd@lists.infradead.org;
	Fri, 07 Aug 2026 16:57:33 +0000
Received: by mail-vs1-xe30.google.com with SMTP id ada2fe7eead31-754acc61e10so1444525137.2
        for <linux-mtd@lists.infradead.org>; Fri, 07 Aug 2026 09:57:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786121850; cv=none;
        d=google.com; s=arc-20260327;
        b=gyawZ8EncBOC9uk7q8WVeUwrXVXHm7J+YdekGyUzIDx3JbkKanAfkG1EM4e7czpO6A
         7HMavoNI99E/yBkY9zMmCEk6MPvg352z4Rkahq9rYU6Av/fDOxIQsERYptNshmRlQRa1
         C1MBHDjhLFwaPYPKFUT+Qtm3Wl0oGGw9Q8FVPkgoqbsOWiWptSVp2o5ANzWZq6W+VYTr
         bvTkg8ggKEeWQ2Gx4JoHIfFD/7zv0w55Y0Pl97UlcRDs+tvarH0C0UfjpiqCuDI+Z0D6
         +cWAKw8dol+ZxQBf2dB47nQWrSMQXt1sIHMH/jjzMWcyUKXe4MRQqkcThEZyptTeA5Z3
         G3QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Hq8X/4Xg0Ta1JBUv3CIgDq4vQ920HdWsgV3I1NkcJTQ=;
        fh=bR1xZR6/jOWT5LIhfTNBwJtnv/TsKR+I8ZqM6ntW628=;
        b=h72KJIxl+BhbH5OB3FqGPt4kT6iaDNNoDc4nhvJFTXEG507JEZFxAC8uRibjANasKC
         Lploq1OjFKM8zsd6peep4T4sT5AbWzPsb64VN4LtRKXglTrYntD3cbaafBNQ7F8dYUSA
         /m1yrAS1eEQPeCfEb1FEaqj8DMa+K1lnoycoO28JFuSDsi0PtbULyY7LfY2VqRIhp1W4
         1Sz1t6ocjHn/3t4YZyOEvCN1JFLE7KM+9o+AOYcVZbf9FH1nBcdpLezf/i3jFke2Ua88
         eIEi82cmC2/RN3IHVTMaLX0Swa+xsDBU8v/uRs+XlxJZAGLyxfDNvQuIiIOrt/e8Z+pD
         7yLA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786121850; x=1786726650; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Hq8X/4Xg0Ta1JBUv3CIgDq4vQ920HdWsgV3I1NkcJTQ=;
        b=bZ3mX8aCF1SXGPk/anz7izYzDp0wJaGUgSr8+xzcWyQwdFx4s/DNkVdQPQ8Hx7oxrv
         twWNitNlcRDTGo6vaR5wxrPpvN4vUVnunOc51ml9zwSPZ0PLVI6sTBrsyRrwlArT6qq7
         QT6cb9RqK8gE0kLm8pNyjFJCIWNbES5i6rCQ01cocnc+iCq406NqfpM/d+vjGh8OYQym
         h0hNcNkU9z3vczPPI6kuzlrEY4yKeqelIFLslGU7nzYiLGb9X7cNpuW40SycUaC90qgM
         lVFvy1bkNshUsLtNUyyRjQhBYOaARUGIMN7qe2xXSBJcxobHkN+aYtSvM9Mi4P5tS+b6
         PKEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786121850; x=1786726650;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hq8X/4Xg0Ta1JBUv3CIgDq4vQ920HdWsgV3I1NkcJTQ=;
        b=AArh5UuZcV3i8mDnHQZLivHXsGkF1qB0SfVERY3hGlOBumPXQioqzkm2blCjlRvLiG
         Txwi3Jp7cwTimhDlP9TpjnvDoY8aMui0ogrjYH00jGVbM2iyA99TJLLuIzKOntLt1vzH
         PoKL7HrgaAIeu00Svlj4Nh+Eah9MZ6wfQkKUF+bqmCtvl+sULrCsg6ePK5bA6LBgG/aT
         ZeFSzFWvdQ7bQwbi1i23Ew6zxdr7N+NK+0gUOlkZB2+Qhebyjfe1LgYhlzIzZFmtaEEa
         IENUNUr+LvQslV7iTvPsIHA87+8sL1pBijnbpwVtfHLBm7n+kP9Gs/l/YZbHwAV0U3KA
         t9xA==
X-Forwarded-Encrypted: i=1; AHgh+RrEN/ScHR/J85gd2n7u+Ak4rSVVo6dpr3KELH7SioSAa7DJQ8z6a9NN0KF6G5cgzpK8SJSmb/He3B0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxoCZbeeh/n7qHWdOKOI/L54d2c0Xjt4b+xqV/F8y4hRh2Zw/r1
	GPCw3cASKE17qo1EZYKpj2evBsUqWnbqyUbyAmq3k5gL1kS1A0YB1xzBonLSI87Jtl/Pwx51HOj
	jDGyg55S6ApQ8MlMuIs7x2Q3kfSu6uYg=
X-Gm-Gg: AR+sD114b1q92Jz/+Ju6fol3DaS6g3hhM0w5HcV7t4/kDLaZk5Pf6fkR+2q4uyRuPJX
	7sWX+1xgPku0N1nReY3FMHzhgVBDwO4mGKKeUjguvAXVXdCw6+XW69/q9O/+g5mBiOxCaLn6nOA
	5c2fcenW4jaliqA4YPbGjPMZlDa2QbuJDYtK9qY7ANczA/r26BYma83pJD7I6WKcHTMLXZ+vl6V
	1XMfXBXsZH0a73edESPxRzuiN+O2vV+i45yxdCLqI5M7TFAhZaFI+AjmUOUdqvlg9iBuempeHgm
	ltkOihXkg+pjOZ6Gg3QXF+BgxnfEOLTbrhKxGHylWS0yZAmEfATqylQBwGBRqlHreAHqIgy9p8d
	7gF5WO1aq1sFDdxY8VJd2z3Mj2rLXasaCfi718hGd27ntagUvrcShgQRAYLgfDDl3qA+Krbpp/a
	NTnmJdq4TFMKQHeUHJ06lmfT4nrzOQqOicFiMH
X-Received: by 2002:a05:6102:390f:b0:744:d1a6:b11d with SMTP id
 ada2fe7eead31-764e4f2985dmr717652137.3.1786121850298; Fri, 07 Aug 2026
 09:57:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260717-submit-sunxi-nand-h6-h616-timings-v2-0-225515107640@gmail.com>
 <87ik5mav6x.fsf@bootlin.com>
In-Reply-To: <87ik5mav6x.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 7 Aug 2026 10:57:19 -0600
X-Gm-Features: AUfX_myfeWEyYh7Y2JNZ3tcJ-zpan6IsdJA8dIqxxvbXvmFsYYO1pP5EnmrWVAg
Message-ID: <CADvTj4pHOpKfNCoVcfDmtCuHh2F0H8e+_AhCwcSKG8xosLpbzA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] mtd: rawnand: sunxi: fix H6/H616 controller timings
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Richard Genoud <richard.genoud@bootlin.com>, linux-mtd@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_095731_738314_B9D16FF1 
X-CRM114-Status: GOOD (  15.69  )
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

T24gRnJpLCBBdWcgNywgMjAyNiBhdCA3OjU44oCvQU0gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJh
eW5hbEBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBIaSBKYW1lcywKPgo+IE9uIDE3LzA3LzIwMjYg
YXQgMTE6MzM6NTYgLTA2LCBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNv
bT4gd3JvdGU6Cj4KPiA+IFRoZSBzdW54aSBOQU5EIHRpbWluZyBzb2x2ZXIgY3VycmVudGx5IGFw
cGxpZXMgdGhlIG9yaWdpbmFsIEExMCBOREZDCj4gPiB0aW1pbmcgY2hhcmFjdGVyaXN0aWNzIHRv
IGV2ZXJ5IHN1cHBvcnRlZCBjb250cm9sbGVyLiBUaGUgSDYvSDYxNiBOREZDCj4gPiB1c2VzIHR3
byBpbnRlcm5hbCBjeWNsZXMgZm9yIHNldmVyYWwgc2V0dXAgYW5kIGhvbGQgaW50ZXJ2YWxzIGFu
ZCBoYXMKPiA+IGRpZmZlcmVudCBkZWxheS1maWVsZCBlbmNvZGluZ3MsIHNvIHRoZSByZXN1bHRp
bmcgY2xvY2sgYW5kIHRpbWluZwo+ID4gcmVnaXN0ZXIgdmFsdWVzIGRvIG5vdCBtYXRjaCB0aGUg
aGFyZHdhcmUuCj4gPgo+ID4gUHJlcGFyZSBmb3IgcGVyLWNvbnRyb2xsZXIgdGltaW5nIGRhdGEg
aW4gdHdvIGJlaGF2aW9yYWxseSBmb2N1c2VkCj4gPiBwYXRjaGVzLCB0aGVuIGFkZCBhbmQgc2Vs
ZWN0IHRoZSBINjE2IGNoYXJhY3RlcmlzdGljcyBpbiB0aGUgZmluYWwgZml4Lgo+ID4gTGVnYWN5
IGNvbnRyb2xsZXJzIHJldGFpbiB0aGVpciBleGlzdGluZyBzZXR1cC1jeWNsZSBiZWhhdmlvciBh
bmQgZGVsYXkKPiA+IGVuY29kaW5ncy4KPiA+Cj4gPiBUZXN0ZWQgb24gYW4gSDYxNiBib2FyZCB3
aXRoIFRvc2hpYmEgVEM1OE5WRzFTM0ggTkFORC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKYW1l
cyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KPgo+IFRoZXJlIGFyZSBhIG51
bWJlciBvZiBjaGVja3BhdGNoIGlzc3VlLiBDYW4geW91IHBsZWFzZSBmaXggdGhlbT8gKGV4Y2Vw
dAo+IHRoZSBjYW1lbGNhc2Ugb25lIHdoaWNoIGlzIGZpbmUgd2l0aCB0aW1pbmcgbmFtZXMgY29t
aW5nIGZyb20gdGhlIE9ORkkKPiBzcGVjKS4KClNob3VsZCBiZSBmaXhlZCBpbiBteSB2MzoKaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYwODA3LXN1Ym1pdC1zdW54aS1uYW5kLWg2LWg2
MTYtdGltaW5ncy12My0wLTkxMjg3YjU0M2Y0MUBnbWFpbC5jb20vCgo+Cj4gVGhhbmtzLAo+IE1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
