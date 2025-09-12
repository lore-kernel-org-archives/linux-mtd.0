Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC44DCAC582
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Sep 2025 08:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kb9DpIsW8/7iTlaS1AeZZvN67uOGq8lGKGk8Cr+f7+k=; b=nAG5k3+nug1jhw
	8i5VmLu7Fud4M+cBxwYpIko4caTlCTNWDts76ImZnQr8M6xPdLpLEz1yp61phzC0PpzwmOfrBkzS1
	mxv8GFwRiniNDDU/+IcSeWce4ns0bACieVeH02iVN/rKjC989lzEelr258e+uGaqhuLKYw7jCP/+a
	miAOAUUHXq4DUAMYtLsy071ZtzCArvyMk6CG+dztfw8h4KnhR4UnzUBPyk1nOCN8UbhK8qEMlCB8Y
	SX5lnYrAyOE9GT8EUWV1n3PxYbTlK5YEPbpObyUHRpllV7xXuTh5tvUzmdm+nw67UIUzc0hNMjMoA
	l2laPq04TXXcvoOZT3OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwyi5-00000007mxG-3eFn;
	Fri, 12 Sep 2025 08:00:45 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwyi3-00000007mwB-1Gug
	for linux-mtd@lists.infradead.org;
	Fri, 12 Sep 2025 08:00:44 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-32dc4faa0d7so1440303a91.1
        for <linux-mtd@lists.infradead.org>; Fri, 12 Sep 2025 01:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757664042; x=1758268842; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RddhR7Ytc3OyDzAj8qMdOCAnXLaH/yrMZCo6suiwK8U=;
        b=WpC8pXuXwYHBl8notK+y/jbL0Fgm4oSTWc5z6vVfxYsDz9Cv2b9UH6s0cc+kttU+sl
         w+U/wTCSUO8LMXj71+ghfMdGVj753lLoiQrPTxjoBLMb/nrrxGtvGE7Ep9YSsiQ3wNXZ
         fZv9RKl+hNsI8QC+0vGPuhppyfW5H+hRwnn3b4/6h/FqeAGsI+aE8MMSbIf+0Hx4GV7V
         KLYcOCmv3Xl/afpLCo1BxO3+Sdk4QnG8oWdfTv5Fn0jtDI1gONh4K24H5M8MDJ7xBd1k
         qmLmCh/R3DgHu6iu9TxPH83yJ5H9OZ+WjKAY/xEqidtoaYNF8LTSCVOjZ8wSg/d2+1kH
         KFxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757664042; x=1758268842;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RddhR7Ytc3OyDzAj8qMdOCAnXLaH/yrMZCo6suiwK8U=;
        b=L1PrmBCYCH87FVi5siYSslcpN8AQCcgRhj4eivGSjJJBJ8oOroN6YrymTFyWPdW4RS
         oYYl31E9IZElEYOE3K2k/V4gnPqZBXzVJIMLg9UmjhotVUn3Qxb2sjgRkTm/ZIUCjNGP
         h7ddjY30WjKroHlwK98kfB/glVO9vj8MZ4HHOdTK7XAbJI3wpePnYoRiu6KW6VpxHpHb
         62oqIHRGnKChNPjsTFpqRURG2+cl3h/HwT6dbz+4JsweFyOJEtMZunoJgBEvfixtJIab
         4YlkvMmfqKtv0qXj/Hyl/ykF94vnHFzylgj7Rr/yFELgKK7US1gMCwFUrvApagO3fEPb
         K1wg==
X-Forwarded-Encrypted: i=1; AJvYcCXLgrgoL0PdT0NbsTsf6oGm/JhZDOgh3PwKy17nchcVNkx7XEgT9rW3rDMFutASsf5FWjaFC0cvNz4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwzTJNh/f3eGk3jfsVMZvL3Q9TpH6+LedAffYjbft0NLqOQPh3Q
	tXuWDyEDHflMtXWnJb88wtL/Is8k5UgYW0uowmp7Bey6oP974nOFQRcvY4nyQ52l8H1tGVYWa6v
	A2l/dErzS+2bVPhBkSizLU8fhkTI9s6U=
X-Gm-Gg: ASbGncuJASm8uM5wXBI5JIw4bFwbpGNwJXptUmhXEsw/FBAz1WY95EYo5BEzgpdkWYS
	ppLFb13Uz5WwsoRf1AvBuND0T3UUZAa9v2G1kyQqawj782UpkWFRfcE7woZg1dSeEcvIBOezFok
	84Hf4dasTH77PyKbRIAM1WGnWWS+465GckQPhgNW1hmV5l2wZq6h0hzPpWvE7oMXjHvCG4JaiiU
	X9HWQYAuJXbzxOsyn4pgJXlF/dwOu6wySXzCbw1PJk+2X6IX8bMD+IMLrbCJIa/7BRozy7uFZ7T
	btLTM0PG6ZsbV8ZeoWN2rZorOEc=
X-Google-Smtp-Source: AGHT+IHTYqhOqiiMZhoB7qwazwG+9e9lRsDH3mh81eXodRoVjUVVYKsEHquECCI/o050/JZStBy0AmsiSCwPErfROkM=
X-Received: by 2002:a17:90b:5910:b0:327:b33e:39d5 with SMTP id
 98e67ed59e1d1-32de4fc6aecmr2836744a91.37.1757664042269; Fri, 12 Sep 2025
 01:00:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250812051949.983040-1-linchengming884@gmail.com>
 <152133202.103367.1754981828821.JavaMail.zimbra@nod.at> <CAAyq3SaEqYiKhbjYwLH0p6F2G=UR-MwZF28AG1xVMoKhznS3Og@mail.gmail.com>
 <608935583.115196.1755171013804.JavaMail.zimbra@nod.at> <CAAyq3SZT67uwggdNX99qEc4bwSkUw2U=sCc6mon064D=f7oH=w@mail.gmail.com>
 <1899901955.27456.1757663848457.JavaMail.zimbra@nod.at>
In-Reply-To: <1899901955.27456.1757663848457.JavaMail.zimbra@nod.at>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Fri, 12 Sep 2025 15:57:36 +0800
X-Gm-Features: Ac12FXxHIG9JDgbXSdKUNG2K6tSLVBXwdA-VsSOyFDqVojZEJmLsJB2vCnz-G4c
Message-ID: <CAAyq3SZmuTPrEb4i7QR-4Gi6YWsLFGOGm9=a0UvLR5rMLiLxsA@mail.gmail.com>
Subject: Re: [RFC] mtd: ubi: skip programming unused bits in ubi headers
To: Richard Weinberger <richard@nod.at>
Cc: chengzhihao1 <chengzhihao1@huawei.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, Alvin Zhou <alvinzhou@mxic.com.tw>, 
	leoyu <leoyu@mxic.com.tw>, Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_010043_347362_AF015BAE 
X-CRM114-Status: GOOD (  15.96  )
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

SGkgUmljaGFyZCwKClJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+IOaWvCAyMDI1
5bm0OeaciDEy5pelIOmAseS6lCDkuIvljYgzOjU35a+r6YGT77yaCj4KPiAtLS0tLSBVcnNwcsO8
bmdsaWNoZSBNYWlsIC0tLS0tCj4gPiBWb246ICJDaGVuZyBNaW5nIExpbiIgPGxpbmNoZW5nbWlu
Zzg4NEBnbWFpbC5jb20+Cj4gPj4gVGhhdCdzIHRoZSBjcnVjaWFsIHF1ZXN0aW9uLiBJcyB0aGlz
IHRydWUgZm9yIGFsbCBOQU5EIGNoaXBzPwo+ID4+IERvIGF2b2lkIGxhcmdlciB3cml0ZXMgb2Yg
MHhGRiBwYXR0ZXJucyBmaWxlIHN5c3RlbXMgc3VjaCBhcyBVQklGUwo+ID4+IGFsc28gdXNlIGNv
bXByZXNzaW9uIGEgbG90Lgo+ID4+IEF0IGxlYXN0IHRoYXQncyB3aGF0IEkgaGF2ZSBiZWVuIHRv
bGQgd2hlbiBJIGFza2VkIDEwKyB5ZWFycyBhZ28KPiA+PiBob3cgVUJJIHdvcmtzLgo+ID4KPiA+
IFlvdSBhcmUgY29ycmVjdCB0aGF0IHRoZXJlIGlzIGFuIGlzc3VlIHdoZW4gYmxhbmsgZGF0YSBw
YWdlcyBhcmUgcmVwZWF0ZWRseQo+ID4gZXJhc2VkLiBUaGlzIGNhbiBsZWFkIHRvIGNlbGxzIGVu
dGVyaW5nIGEgdG9vIGRlZXAgVlQgc3RhdGUsIHdoaWNoIG1heQo+ID4gY2F1c2UgcHJvZ3JhbSBm
YWlsdXJlcyBpbiBzdWJzZXF1ZW50IG9wZXJhdGlvbnMuCj4gPgo+ID4gVG8gYWRkcmVzcyB0aGlz
LCBuZXdlciBOQU5EIGdlbmVyYXRpb25zIHR5cGljYWxseSBwZXJmb3JtIGEgcHJlLXByb2dyYW0K
PiA+IHN0ZXAgYmVmb3JlIGV4ZWN1dGluZyB0aGUgYWN0dWFsIGVyYXNlLiBUaGlzIGtlZXBzIHRo
ZSBWVCBkaXN0cmlidXRpb24gZnJvbQo+ID4gZ29pbmcgdG9vIGRlZXAsIHRoZXJlYnkgYXZvaWRp
bmcgdGhlIGJsYW5rLXBhZ2UgZGVncmFkYXRpb24gcHJvYmxlbS4KPiA+IFN1Y2ggcHJlLVBHTSB0
ZWNobmlxdWVzIGhhdmUgYmVlbiB3aWRlbHkgYWRvcHRlZCBmb3Igcm91Z2hseSB0aGUgcGFzdAo+
ID4gMTDigJMxNSB5ZWFycy4KPiA+Cj4gPiBBZGRpdGlvbmFsbHksIEpFU0QyMi1BMTE3RSAocGFn
ZSA2LCBzZWN0aW9uIDQuMS4yLjEpIHNwZWNpZmllcyBleGFtcGxlcyBvZgo+ID4gYWNjZXB0YWJs
ZSBkYXRhIHBhdHRlcm5zLCBpbmNsdWRpbmcgc29saWQtcHJvZ3JhbW1lZCwgY2hlY2tlcmJvYXJk
L2ludmVyc2UtCj4gPiBjaGVja2VyYm9hcmQsIGFuZCBjaGVja2VyYm9hcmQtd2l0aC1maWxsIHBh
dHRlcm5zLiBBY2NvcmRpbmcgdG8KPiA+IHF1YWxpZmljYXRpb24ga25vd2xlZGdlIGJhc2VzLCB1
c2luZyAweDAwIGNhbiBzb21ldGltZXMgdHJpZ2dlciBzcGVjaWFsCj4gPiBmYWlsdXJlIG1vZGVz
LCB3aGVyZWFzIHdyaXRpbmcgMHhGRiBpcyBtb3JlIHJvYnVzdC4KPiA+Cj4gPiBBZGRpdGlvbmFs
bHksIHRoZSBLaW94aWEgVEM1OE5WRzFTM0hUQTAwIGRhdGFzaGVldCAocGFnZSA2MykgYWxzbyBu
b3Rlcwo+ID4gdGhhdCBjb250aW51b3VzIHByb2dyYW0vZXJhc2UgY3ljbGluZyB3aXRoIGEgaGln
aCBwZXJjZW50YWdlIG9mIOKAmDAnCj4gPiBiaXRzIGluIHRoZSBkYXRhIHBhdHRlcm4gY2FuIGFj
Y2VsZXJhdGUgYmxvY2sgZW5kdXJhbmNlIGRlZ3JhZGF0aW9uLgo+ID4gVGhpcyBmdXJ0aGVyIHN1
cHBvcnRzIGF2b2lkaW5nIGxhcmdlIDB4MDAgcGF0dGVybnMuCj4KPiBUaGFua3MgZm9yIHRoZSBk
ZXRhaWxlZCBhbnN3ZXIhCj4gU28sIHllcyBsZXQncyBhcHBseSB0aGlzIGNoYW5nZS4KClNvcnJ5
LCBJIG5lZWQgdG8gYWRqdXN0IHRoZSBjb2RlIGEgYml0LCBzaW5jZSBJIGp1c3Qgbm90aWNlZCBt
eQpjb25kaXRpb24gb24gdmlkX2hkciBzaGlmdCB3YXMgaW5jb3JyZWN0LiBJIHdpbGwgc2VuZCBh
IHYyIHZlcnNpb24uCgo+Cj4gVGhhbmtzLAo+IC8vcmljaGFyZAoKVGhhbmtzLApDaGVuZyBNaW5n
IExpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
