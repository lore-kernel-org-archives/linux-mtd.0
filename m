Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D7AF513EE
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Mar 2026 02:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YpMtG5C7MgFVaG7vXOdqVFgTsdXzw6hX3CRnQZqkTY8=; b=LI6zTKd1DOvZjO
	pzIUsENO/oh0uCy75b3TzXlRRQtRdK30YXHAVq2A9Ookpl6XzfFxzQpfbIY9upfrc+1w7wFZHO5Bz
	DHpbAZLzfro1VY7UPbPG71YGlFYdZODmf/mQxFp7VtQp2De7N1FIiBXc1ZTggRUrizmoMzeP/gwtG
	4eyGD8qei6+ifynsPY4gGh003kz+0CJw518WORs7/T+Jz7Yt5DsanoPraskvjmNXnlbtACP/0iLCl
	bU7ucW9NQyVVPcRFWuPYtkHObJJOUNJok7kiIfR0gCj7RAh/F6rvGUIuWmvdDWUhEWKEcSfYKPlFB
	L6/17eUHFK5pzDSKz5Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyLCo-00000002to1-48pH;
	Fri, 06 Mar 2026 02:46:22 +0000
Received: from mail-vk1-xa64.google.com ([2607:f8b0:4864:20::a64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyLCh-00000002tne-30HU
	for linux-mtd@lists.infradead.org;
	Fri, 06 Mar 2026 02:46:21 +0000
Received: by mail-vk1-xa64.google.com with SMTP id 71dfb90a1353d-56aeaa75cadso888943e0c.3
        for <linux-mtd@lists.infradead.org>; Thu, 05 Mar 2026 18:46:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772765171; x=1773369971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5b/j6X69YBx00YFyIEtzW/3QlUqa8RPyQnmUud1J0bg=;
        b=Ihg0BHEYrIkzc6eSWKpw3TQbMPv5Eb/CzX9VDRK6E1tb+oxKplGODrQokvNUgXtNoz
         gtaf21ZjuJt+Ify0lFInFLIiWRt+8A/NYhwyGg3W7N2IcWrA8mk1VrOP0TQJCaL9NHK/
         jXqbSSZeAyuNBOm19F3m1K2tJhpXJbgnQ8scPoFOUZ6pDLtAHdIEiGFxiZtiRoE3NYbM
         KFTPav5FSgas+hLJ6OsXL3DlI1M7sNcwQm7HjCMMAtUoA5lGCYPyAjjuaNcZ+EmYiR+w
         AesLj91LbXUGD5ayurWH5DiSet5JzAVttPRMaAmyJ2wHK5gS7sohj4tZkZgTMklhZWzE
         breA==
X-Forwarded-Encrypted: i=2; AJvYcCWMlyzbsgbbf/67q3Pulc+/UYkT9pGMYC5JNCYtkMjUjQvTUiDgTa6PqPWyjVfeX0kSWrW2wwMplJ4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxjiD556vLH8YDTXjSsQazxNE0ArEJwcJ9rc0FRjQskz8buiYcW
	TO77huYyBvzMoBia8/0yS7SfEzlms+XBqVx33Txoi6QLPE5JpK23XMM+1klqhiGnvVKMxU7W4Ol
	lmqxX20iDeZqMsioWzvBouqts7l4SoT9asuBd5Qmsl+hNoioRX/dv6GXBK+6mMX5bCiaY3rkxjA
	x+RlfJLuRjNMpddppYTjnw7pjo9Fer3MBYRif9dEzYK2rd81dyfGEW6KyTLQ82MSq0v3U1krBgF
	W52CeVe670sDI3SoVLyuA==
X-Gm-Gg: ATEYQzwyhtsZIZVjedgatObDRWQTZ3FSCO//nwPttjQ5cqiCyVyzeNkDT0yfUaLu4Tq
	OR24BJDtCC91YebuvpRyESstL4iTK2egBLeogSrYe9sXl4j2lZXV9zZGW6t/eBI7Lhmw1ALEn2Q
	Ouc6CigRrr8M0QI002jIo2F5IW61mbU80NsIwuPBPeXJ+QQcXcmDvjEUUnTX1seu0CcYEIVEpMH
	OBxlzXp6+gI1yW5g8OFlEUGTD4N3Ece8z1JLpk1GmLRSsnrAjBEibUeOFcG5jQJOsMgij7vr5Av
	8UL3+++dlJxY+I4dWyIWUQi8VO7q4CZaxWa6lEf7kwFvj6ULU2+3j1KPbI3RVALbekEA1i6APfF
	+QLaTE1M8PoGT0ow6EB/fUXWNbYCGh7CbdZUsdbI2XX/8TBXEjo5FrqfSuWTy24InzdZRWImVTv
	eDUynLS1kkigVd/t+/Vc/6Zzkhn/0XP+7TbeaoPW85Srz9e2YanIAa4kpvuKdx
X-Received: by 2002:a05:6102:3051:b0:5fe:c4e8:e822 with SMTP id ada2fe7eead31-5ffe63355e0mr200469137.37.1772765171124;
        Thu, 05 Mar 2026 18:46:11 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-5ffe8cded7bsm13454137.5.2026.03.05.18.46.10
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Mar 2026 18:46:11 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-64ad18e7ffaso11089413d50.2
        for <linux-mtd@lists.infradead.org>; Thu, 05 Mar 2026 18:46:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772765170; cv=none;
        d=google.com; s=arc-20240605;
        b=dN0kQvnZFG1flEv4kZgo8xhKIfg4D5uaFbB12hYQN02TKJlSxk1qS1QUbRcDwiBk+x
         AvQOLV3rCDizvju2Mo7ZWEQuwOz8XR9QcNtAnjxhrsF9nPSmlvysovPQm0uKYJpWI8NT
         ELEyAfr4Q2KFr0DgimETWHIX9oFCmkymEUUm5onn9xpKD1Mq52X6SC7mgf8iFDG+hrCL
         bwwgYU5SsNF7SfODXcyY/w0aDtng65knbGqjM7C27u7bKCZKpggNQDdpY+V0ksTXoXBq
         1p3xqIwJ8zuJx5R/Z1Zw4Xolnzd2iKFfJPSmaYJM2tKyfPT5UQ4ziU4AfLeqgDUt/tM+
         71QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5b/j6X69YBx00YFyIEtzW/3QlUqa8RPyQnmUud1J0bg=;
        fh=dfU2CykYPONnSPbDYAqfA0Sx5d0bBc0Gkk5koCid374=;
        b=f+AMd++KRqVXGXFjPw3I/NNCCRlgd38NhcfFTpir99wnsFSgSHdHXBSRP9gyR2lgER
         TCC2NSu0seLP8XcopSfJRwEP2tKtE5wSbgJ/MvKYSyIUPuyvEWul8ZFlFA4YYlY2Gv49
         css9qYmSwD11RjSHuBzFR6c2trq8vezdyH7kVUyEFF8YkuhA015uJ1tQorSiAeESZ7d3
         Ob7auRHZndalxncsARcuRmlHSqiJtGaQDwpCx2To2gADmYtACjZ4e9W7uvwR5wHg+kCP
         LV5iNcke9qkQ87HWJwAjg36ikL4RgCXCyAsmnsiN6pn9LpbEpluZlQrmfTAdKCOHU/pm
         mkDA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1772765170; x=1773369970; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5b/j6X69YBx00YFyIEtzW/3QlUqa8RPyQnmUud1J0bg=;
        b=Cj0ydMEMJHXb1A3lXTeY0E7J+8086jH4dQuN5Kf6F+lcDK8mkfosRRa1Fi5vwjzlVK
         3t7UR6BywW+zOWvR8iaqiRtzzf5hIPqG/RqUET1+XafP+sYLl6nbMzSLoVWGaFYSbmqO
         onKINGJU60dCVF06Knj0Y8Jb9pEImJfEyDPok=
X-Forwarded-Encrypted: i=1; AJvYcCXimi+YQz+9WqhruzdxRiHtTjZpoF7rQI8VK9MSQuaqONkRgVQgJDgRloV4gfZMleEoqLBl/CT5Tr8=@lists.infradead.org
X-Received: by 2002:a05:690e:44a7:b0:64c:f4f4:20ae with SMTP id 956f58d0204a3-64d14333d11mr516208d50.78.1772765170538;
        Thu, 05 Mar 2026 18:46:10 -0800 (PST)
X-Received: by 2002:a05:690e:44a7:b0:64c:f4f4:20ae with SMTP id
 956f58d0204a3-64d14333d11mr516195d50.78.1772765170110; Thu, 05 Mar 2026
 18:46:10 -0800 (PST)
MIME-Version: 1.0
References: <20260305194906.3007131-1-kamal.dasu@broadcom.com>
In-Reply-To: <20260305194906.3007131-1-kamal.dasu@broadcom.com>
From: William Zhang <william.zhang@broadcom.com>
Date: Thu, 5 Mar 2026 18:45:59 -0800
X-Gm-Features: AaiRm5322Yc01_8MOpZRrOBJGHs7JCFzeym41CyhaswbNHwbUemOerpR2CqpPz4
Message-ID: <CAHi4H7EfmRqC2ehG5s4z=AsRcZ0DTS9Y8icaPtS_G7AwtwV+xw@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: serialize lock/unlock against other NAND operations
To: Kamal Dasu <kamal.dasu@broadcom.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
	masonccyang@mxic.com.tw, florian.fainelli@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_184618_465267_68E4E3E3 
X-CRM114-Status: GOOD (  18.03  )
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

T24gVGh1LCBNYXIgNSwgMjAyNiBhdCAxMTo0OeKAr0FNIEthbWFsIERhc3UgPGthbWFsLmRhc3VA
YnJvYWRjb20uY29tPiB3cm90ZToKPgo+IG5hbmRfbG9jaygpIGFuZCBuYW5kX3VubG9jaygpIGNh
bGwgaW50byBjaGlwLT5vcHMubG9ja19hcmVhL3VubG9ja19hcmVhCj4gd2l0aG91dCBob2xkaW5n
IHRoZSBOQU5EIGRldmljZSBsb2NrLiBPbiBjb250cm9sbGVycyB0aGF0IGltcGxlbWVudAo+IFNF
VF9GRUFUVVJFUyB2aWEgbXVsdGlwbGUgbG93LWxldmVsIFBJTyBjb21tYW5kcywgdGhlc2UgY2Fu
IHJhY2Ugd2l0aAo+IGNvbmN1cnJlbnQgVUJJL1VCSUZTIGJhY2tncm91bmQgZXJhc2Uvd3JpdGUg
b3BlcmF0aW9ucyB0aGF0IGhvbGQgdGhlCj4gZGV2aWNlIGxvY2ssIHJlc3VsdGluZyBpbiBjbWRf
cGVuZGluZyBjb25mbGljdHMgb24gdGhlIE5BTkQgY29udHJvbGxlci4KPgo+IEFkZCBuYW5kX2dl
dF9kZXZpY2UoKS9uYW5kX3JlbGVhc2VfZGV2aWNlKCkgYXJvdW5kIHRoZSBsb2NrL3VubG9jawo+
IG9wZXJhdGlvbnMgdG8gc2VyaWFsaXplIHRoZW0gYWdhaW5zdCBhbGwgb3RoZXIgTkFORCBjb250
cm9sbGVyIGFjY2Vzcy4KPgo+IEZpeGVzOiA5MjI3MDA4NmI3ZTUgKCJtdGQ6IHJhd25hbmQ6IEFk
ZCBzdXBwb3J0IGZvciBtYW51ZmFjdHVyZXIgc3BlY2lmaWMgbG9jay91bmxvY2sgb3BlcmF0aW9u
IikKPiBTaWduZWQtb2ZmLWJ5OiBLYW1hbCBEYXN1IDxrYW1hbC5kYXN1QGJyb2FkY29tLmNvbT4K
PiAtLS0KPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMgfCAxNCArKysrKysrKysr
KystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
Pgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYyBiL2RyaXZl
cnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jCj4gaW5kZXggMzg0MjkzNjMyNTFjLi5kZmQ4MzYx
YmRkMzYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMKPiAr
KysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYwo+IEBAIC00NzM3LDExICs0NzM3
LDE2IEBAIHN0YXRpYyB2b2lkIG5hbmRfc2h1dGRvd24oc3RydWN0IG10ZF9pbmZvICptdGQpCj4g
IHN0YXRpYyBpbnQgbmFuZF9sb2NrKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBsb2ZmX3Qgb2ZzLCB1
aW50NjRfdCBsZW4pCj4gIHsKPiAgICAgICAgIHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAgPSBtdGRf
dG9fbmFuZChtdGQpOwo+ICsgICAgICAgaW50IHJldDsKPgo+ICAgICAgICAgaWYgKCFjaGlwLT5v
cHMubG9ja19hcmVhKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT1RTVVBQOwo+Cj4gLSAg
ICAgICByZXR1cm4gY2hpcC0+b3BzLmxvY2tfYXJlYShjaGlwLCBvZnMsIGxlbik7Cj4gKyAgICAg
ICBuYW5kX2dldF9kZXZpY2UoY2hpcCk7Cj4gKyAgICAgICByZXQgPSBjaGlwLT5vcHMubG9ja19h
cmVhKGNoaXAsIG9mcywgbGVuKTsKPiArICAgICAgIG5hbmRfcmVsZWFzZV9kZXZpY2UoY2hpcCk7
Cj4gKwo+ICsgICAgICAgcmV0dXJuIHJldDsKPiAgfQo+Cj4gIC8qKgo+IEBAIC00NzUzLDExICs0
NzU4LDE2IEBAIHN0YXRpYyBpbnQgbmFuZF9sb2NrKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBsb2Zm
X3Qgb2ZzLCB1aW50NjRfdCBsZW4pCj4gIHN0YXRpYyBpbnQgbmFuZF91bmxvY2soc3RydWN0IG10
ZF9pbmZvICptdGQsIGxvZmZfdCBvZnMsIHVpbnQ2NF90IGxlbikKPiAgewo+ICAgICAgICAgc3Ry
dWN0IG5hbmRfY2hpcCAqY2hpcCA9IG10ZF90b19uYW5kKG10ZCk7Cj4gKyAgICAgICBpbnQgcmV0
Owo+Cj4gICAgICAgICBpZiAoIWNoaXAtPm9wcy51bmxvY2tfYXJlYSkKPiAgICAgICAgICAgICAg
ICAgcmV0dXJuIC1FTk9UU1VQUDsKPgo+IC0gICAgICAgcmV0dXJuIGNoaXAtPm9wcy51bmxvY2tf
YXJlYShjaGlwLCBvZnMsIGxlbik7Cj4gKyAgICAgICBuYW5kX2dldF9kZXZpY2UoY2hpcCk7Cj4g
KyAgICAgICByZXQgPSBjaGlwLT5vcHMudW5sb2NrX2FyZWEoY2hpcCwgb2ZzLCBsZW4pOwo+ICsg
ICAgICAgbmFuZF9yZWxlYXNlX2RldmljZShjaGlwKTsKPiArCj4gKyAgICAgICByZXR1cm4gcmV0
Owo+ICB9Cj4KPiAgLyogU2V0IGRlZmF1bHQgZnVuY3Rpb25zICovCj4gLS0KPiAyLjM0LjEKPgpS
ZXZpZXdlZC1ieTogV2lsbGlhbSBaaGFuZyA8d2lsbGlhbS56aGFuZ0Bicm9hZGNvbS5jb20+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
