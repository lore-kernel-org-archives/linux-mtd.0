Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECBFFCAC582
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Sep 2025 17:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ytF8fWGCswaMTKVy5zytUcxIJFPNguQTXUUh086Rvks=; b=PSHrrCRQKqoJPL
	NQ0QD3+sr/izP7UO6YnWNVabSmpnCs+JVSSM8muiPUHn8XlZwo1xoPcLlgRQ7a9jvp04XcE35t20p
	+Jfb93C+Tu3dqJ2ZL7A9rEWyoJvA3cVpXvF07tfFw7nUYZBhA9dwvRW0hKUQt0oOakvnA8b05NiFp
	QU6HQd7sY6glbfrZ3qRsqjVllBKiWHX8HGyD7YhnSd9dqy4FE6GQ/j7BtFQFTFE0YglvNDwgEhWN7
	QVp8xGVLvcWflfP0itx9PiAEZ3N8emwd5FOV0c1jwWis1XBFq66ljyqujvP21RieWDEi/G8c7Hs14
	MeOtJhXXElMRPNLYpIqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1vV-00000008nBB-3yYx;
	Tue, 09 Sep 2025 17:14:41 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvxDA-00000006zIt-33Wo
	for linux-mtd@lists.infradead.org;
	Tue, 09 Sep 2025 12:12:37 +0000
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-88432e31114so412929139f.2
        for <linux-mtd@lists.infradead.org>; Tue, 09 Sep 2025 05:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757419955; x=1758024755; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nkBEP56Uel40DX62RGXYLGaihWp1S3NRQH+BuVUs8SU=;
        b=m/sRPghLoQtXo1XmtifZR/zVHsN4iySTzJbxWZcbTlT1tmg7NL/ZdCjufdVjoFXQE7
         SA1SnHpTa1edX9dD0QZJfOjzQMI4dtev81fBM58HIg5wSrRW+Tk4wlHNHvPB842uL/KA
         dnK0Zi07GLfrQq5YrH7eNhR1GKI4OdXUmm5rhzr1k+jU97mf7Gl/fuSLVKVls6VygsKC
         CqCa02qQIyRqyUQPApUCzzy4SLLAMqKrMTLGhx+YSzi6Fas/3/ENGoOCjPgWYYOroiv4
         svixdPP0BMNNM5BU833XAY2yIabMeQcstVuVXa0mlsw5K91fmtS0rN2YOivHdGMCduvm
         wZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757419955; x=1758024755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nkBEP56Uel40DX62RGXYLGaihWp1S3NRQH+BuVUs8SU=;
        b=FyN3Byray+JxZepF7hmmlX/RSTIO0hhNZcSEmB27UGb71UX573dBHINWZ1XigIsHcV
         2pqRU8hl/onHGHtMskBtDA8Ypyy+63Fp1GdQ6Xz01A5SMaiZr3QScuzwdND8nPDHaAal
         lPsXEQtx/q2diXFTSSTHFt/3fB0tzWBF0ZJgDh20qADC1Ax9dhlQbcekX2Ovpl7pFUdp
         4+Ah3MqkjEPHNal7P+a2AP31heG3kFAyBSG5xKCAnckxSH0BvfdfwGwx+KHXGqSDA2V+
         HEoRLNxMw1SqhAZ6O/jVMVbTy698obxhaXKn3meHv4127tDCtlby/j3SCWO/5dBIjXkB
         K/dA==
X-Forwarded-Encrypted: i=1; AJvYcCXIsoqPNrVay9ALF09kYWYd5S74LqzjoMPE7ct1iA+IxccTdVnHTABBFVZQB2FNJ1lSeEdIcXZCQFM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwbHCAzudnImr0BeSKWQ/YzkYcq1lHc5byA9/zBGWiSsHaZbzj2
	TZKde+A4jmFm++2HnS7SpYtqK6dlmQGDja3xFPYEfwGtVWh8SLvDSYv8BplSAh73Ct5Yph1qpW3
	ZJYnxwDYfEiopUMdUBcFXNN8BuHwhBJIupvd9ecIx+A==
X-Gm-Gg: ASbGnctGdVUmGtsN0N0hw2xLmByTt9At1jAwqKIeY1DWAH9oQqSnDdXY16WfdZClnIO
	D7QtEWVomr/PFouyZb/jpo4GQjjz0zFU+Qjvxz9agVgzJuCYfS/Sej9O5HTkfXoO531EndNjl3p
	NXmHJRST6qdP4XgDHqhuKS6lzoNolskMGopR8d34of59XRUbRRILhxni9PzEX8Ll4iUg+a/+4Po
	ONjEQ==
X-Google-Smtp-Source: AGHT+IHttMERFW0A/KHZaBTOGR8TX/BI3COHvJIGooI6xnbMAbIF1hB7QCYj6I7hnqG3mC5gXf0qcw8Her+804dvKeo=
X-Received: by 2002:a05:6e02:2701:b0:409:58ec:2491 with SMTP id
 e9e14a558f8ab-40958ec2739mr74890145ab.7.1757419955264; Tue, 09 Sep 2025
 05:12:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250908070124.2647038-1-rk0006818@gmail.com> <87tt1djtot.fsf@bootlin.com>
 <93578759.11447.1757322260340.JavaMail.zimbra@nod.at> <mafs08qinn92v.fsf@kernel.org>
In-Reply-To: <mafs08qinn92v.fsf@kernel.org>
From: Rahul Kumar <rk0006818@gmail.com>
Date: Tue, 9 Sep 2025 17:42:23 +0530
X-Gm-Features: Ac12FXzyioeKzeThxh8TxpOTJ5aYFfR6XxhutZ-VkjdtOnAXx2DXjKhkM9XUvkQ
Message-ID: <CAKY2RybqkE74EADTPnCUHAXpJLJmM9skPXQ6S3UOq8TK_y9EQA@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: sm_ftl: replace strncpy with memcpy
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, linux-kernel-mentees@lists.linux.dev, 
	Shuah Khan <skhan@linuxfoundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_051236_766925_D425DBE7 
X-CRM114-Status: GOOD (  33.10  )
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

SGkgYWxsLAoKVGhhbmtzIGEgbG90IGZvciB0aGUgZGV0YWlsZWQgZmVlZGJhY2sgb24gbXkgcGF0
Y2guIEkgdW5kZXJzdGFuZCBub3cKdGhhdCB0aGlzIGNoYW5nZSBkb2VzIG5vdCBhZGQgbXVjaCB2
YWx1ZSwgYW5kIEnigJlsbCBrZWVwIHlvdXIgcG9pbnRzIGluCm1pbmQgZm9yIGZ1dHVyZSBjb250
cmlidXRpb25zLiBJIHJlYWxseSBhcHByZWNpYXRlIHRoZSBndWlkYW5jZS4KCkJlc3QsClJhaHVs
CgpPbiBUdWUsIFNlcCA5LCAyMDI1IGF0IDU6MTXigK9QTSBQcmF0eXVzaCBZYWRhdiA8cHJhdHl1
c2hAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBNb24sIFNlcCAwOCAyMDI1LCBSaWNoYXJkIFdl
aW5iZXJnZXIgd3JvdGU6Cj4KPiA+IC0tLS0tIFVyc3Byw7xuZ2xpY2hlIE1haWwgLS0tLS0KPiA+
PiBWb246ICJNaXF1ZWwgUmF5bmFsIiA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KPiA+PiBB
bjogIlJhaHVsIEt1bWFyIiA8cmswMDA2ODE4QGdtYWlsLmNvbT4KPiA+Pj4gLSAgIHN0cm5jcHko
YnVmLCBzbV9hdHRyLT5kYXRhLCBzbV9hdHRyLT5sZW4pOwo+ID4+PiAtICAgcmV0dXJuIHNtX2F0
dHItPmxlbjsKPiA+Pj4gKyAgIG1lbWNweShidWYsIHNtX2F0dHItPmRhdGEsIHNtX2F0dHItPmxl
bik7Cj4gPj4+ICsgICBidWZbc21fYXR0ci0+bGVuXSA9ICdcMCc7Cj4gPj4+ICsgICByZXR1cm4g
c21fYXR0ci0+bGVuICsgMTsKPiA+Pgo+ID4+IEFyZSB3ZSBzdXJlIHRoZSBidWZmZXIgaXMgYWx3
YXlzIHNtX2F0dHItPmxlbiArIDEgbG9uZz8KPgo+IFllYWgsIHRoYXQgd2FzIHdoYXQgSSB3YXMg
d29uZGVyaW5nIG9uIHRoZSBvcmlnaW5hbCBwYXRjaCB0b28uIFBva2luZwo+IGFyb3VuZCB0aGUg
Y29kZSwgSSBzZWUgaW4gZGV2X2F0dHJfc2hvdygpIHRoYXQ6Cj4KPiAgICAgICAgIGlmIChkZXZf
YXR0ci0+c2hvdykKPiAgICAgICAgICAgICAgICAgcmV0ID0gZGV2X2F0dHItPnNob3coZGV2LCBk
ZXZfYXR0ciwgYnVmKTsKPiAgICAgICAgIGlmIChyZXQgPj0gKHNzaXplX3QpUEFHRV9TSVpFKSB7
Cj4gICAgICAgICAgICAgICAgIHByaW50aygiZGV2X2F0dHJfc2hvdzogJXBTIHJldHVybmVkIGJh
ZCBjb3VudFxuIiwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRldl9hdHRyLT5z
aG93KTsKPiAgICAgICAgIH0KPgo+IFNvIEkgc3VwcG9zZSB0aGUgYnVmZmVyIGlzIFBBR0VfU0la
RSBsb25nLCB0aG91Z2ggdGhlIHNob3coKSBBUEkgaXMKPiBraW5kYSBwb29yIGZvciBub3QgcmVw
b3J0aW5nIHRoZSBzaXplIGV4cGxpY2l0bHkuIElmIHdlIGRvIHJlYWxseSB3YW50Cj4gdG8gbWFr
ZSB0aGlzIHNhZmVyLCBJIHN1cHBvc2UgdGhpcyBpcyB3aGF0IHNob3VsZCBiZSBjaGVja2VkIGZv
ci4gVGhlCj4gc3RybmNweSB3aXRoIGxlbmd0aCBiZWluZyBsaW1pdGVkIHRvIHRoZSBzdHJpbmcg
bGVuZ3RoIGluc3RlYWQgb2YgYnVmZmVyCj4gbGVuZ3RoIGlzIGNvbXBsZXRlbHkgdXNlbGVzcy4K
Pgo+IEFueXdheSwgaGVyZSBzbV9hdHRyLT5kYXRhIGlzIChTTV9TTUFMTF9QQUdFIC0gU01fQ0lT
X1ZFTkRPUl9PRkZTRVQgKyAxKQo+IGJ5dGVzIGxvbmcsIHdoaWNoIHNob3VsZCBhZGQgdXAgdG8g
MTY4IGJ5dGVzLCB3aGljaCBpcyBwZXJmZWN0bHkgc2FmZSB0bwo+IGp1c3QgY29weS4KPgo+ID4K
PiA+IENhbiB3ZSBwbGVhc2UganVzdCBzdG9wIG1lc3Npbmcgd2l0aCBwZXJmZWN0bHkgZmluZSBj
b2RlPwo+ID4gSSdtIHNpY2sgb2YgdGhlIHdhciBvbiBzdHJpbmcgZnVuY3Rpb25zLgo+ID4gRmly
c3Qgd2UgaGFkIHRvIHJlcGxhY2UgZXZlcnl0aGluZyB3aXRoIHN0cm5jcHkoKSwgdGhlbiBzdHJs
Y3B5KCksCj4gPiB0aGVuIHN0cnNjcHkoKSwgLi4uCj4KPiBJIGhhZCBhIHNpbWlsYXIgcmVhY3Rp
b24gaW5pdGFsbHkgdG9vLiBCdXQgVEJIIGlmIHRoZSBwYXRjaCBtYWRlIHRoZQo+IGNvZGUgYWN0
dWFsbHkgc2FmZXIgSSByZWNrb24gaXQgd291bGQgYmUgZmluZS4gTG9uZyB0ZXJtLCB0aGVzZSBr
aW5kIG9mCj4gdGhpbmdzIGNhbiBoZWxwIHByZXZlbnQgdW5leHBlY3RlZCBidWdzLiBCdXQgaGVy
ZSB3ZSBkb24ndCBldmVuIGtub3cgaG93Cj4gbGFyZ2UgYnVmIGlzIHNvIHRoZXJlIGlzIG5vIHBv
aW50IGluIHVzaW5nIGFueSBvZiB0aGUgZmFuY3kgc3RyaW5nCj4gZnVuY3Rpb25zLiBBIHBsYWlu
IHN0cmNweShidWYsIHN0cikgaXMganVzdCBhcyAic2FmZSIgYXMgYQo+IHN0cm5jcHkoYnVmLCBz
dHIsIHN0cmxlbihzdHIpKSwgb3IgYW55IG90aGVyIGZhbmN5IHZhcmlhdGlvbi4KPgo+IFNvIHll
YWgsIEkgZG9uJ3QgdGhpbmsgdGhpcyBwYXRjaCBkb2VzIG11Y2guLi4KPgo+IFRoYXQgc2FpZCwg
UmFodWwgeW91IHNlZW0gbGlrZSBhIG5ldyBjb250cmlidXRvci4gSSB3b3VsZCBzYXkgZG9uJ3Qg
YmUKPiB0b28gZGlzY291cmFnZWQuIE5vdCBldmVyeSBwYXRjaCBlbmRzIHVwIGdvaW5nIHRocm91
Z2guIEkgaGF2ZSBoYWQgbXkKPiBmYWlyIHNoYXJlIG9mIHJlamVjdGVkIHBhdGNoZXMuIFRha2Ug
dGhpcyBhcyBhIGxlYXJuaW5nIGFuZCBrZWVwIGxvb2tpbmcKPiBmb3Igb3RoZXIgaW1wcm92ZW1l
bnRzIDotKQo+Cj4gPgo+ID4gRG9uJ3QgZ2V0IG1lIHdyb25nLCBJJ20gYWxsIGZvciBoYXJkZW5p
bmcgY29kZSBwYXRocyB3aGVyZQo+ID4gc3RyaW5ncyBhcmUgYXJiaXRyYXJ5IGlucHV0LCBidXQg
aW4gbWFueSBvZiB0aGVzZSBjYXNlcyBhbGwgc3RyaW5ncwo+ID4gYXJlIG5vIGlucHV0IG9yIGFs
cmVhZHkgc2FuaXRpemVkLgo+Cj4gLS0KPiBSZWdhcmRzLAo+IFByYXR5dXNoIFlhZGF2CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
