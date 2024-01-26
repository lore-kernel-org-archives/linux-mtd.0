Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F34C47258
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jan 2024 01:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7zQpM1B23EAhqDDqi2xWHUIzpiB+V5gifWSCvkDVKkI=; b=LvZc2kfw0LXu86
	C8ETlmUvk2NPwgK0OWYLsRw5pa+E8PPlFyt+spiIuiAuCTKzh4lhfzK8vmWrS9mwNkGP1VPGsGsFM
	db9uNe9GwlPaRglRUKjIGSQj/tKmdZZoETKPCMzXdM6vAWI5DJrtouGo0CAHk3HMPYlw887A+hAYA
	usTktlWhZROSRF09jH6uqs5AejcFLSyQ+Bp2pL5F+sFhcR0kRW0xm6EycxdBWGrhj4rY2CS6GgkOR
	lB5gOmkFcJIK0z4RQMsl5BnK3zKazlCr/PFVbxAjlC1pmO9CJpM/h5cp6uQt3tm9xTaSAF3ZPA/T0
	7p44yHKw3lDgXa3nL+nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTBI3-00000002mrk-1iQy;
	Fri, 26 Jan 2024 01:45:55 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTBI0-00000002mrF-2zye
	for linux-mtd@lists.infradead.org;
	Fri, 26 Jan 2024 01:45:53 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-dc25e12cc63so1206888276.0
        for <linux-mtd@lists.infradead.org>; Thu, 25 Jan 2024 17:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706233551; x=1706838351; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mGndTaMbzKrye6eY5n+umXIma64hlLmLq8ZTlgknYcw=;
        b=ksTWv3ezlLdNxm/ktrfLfPxHCzmXINANLwTKmTUOchMhgHJBoiLxLSv9L96elU2rzX
         hb+oXshquqvlVxFN/1tarkTNS1gb2eanf/SK4MnKVsP+HmsDPK3G+f8X5yy3S1nASTgS
         yVZv8rgSJIx9ytvbl2uas95vF+/eR7q5k7WYx9FKTJtRrbFklWbyyiiarEGku5X0+x80
         KPHFsBXsrt3D9RAsIktgtQHcnjyyVpfJGCXsuCfgCsDEnAaioNVyspoBVUX+LR9/H3Ir
         WcX+7LMgeN6sOBvaA1vHyT9Te7ouTv5c2csIFXTP9TdMnN1z5j4lLkV2Z8FtAP1OnhaG
         LQXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706233551; x=1706838351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mGndTaMbzKrye6eY5n+umXIma64hlLmLq8ZTlgknYcw=;
        b=im79YFvaMoiB/Ha2RhE6epy/SGCc4wTnIZbrW6L+BrP0aAof5/T7djoTzjFFMKFY9F
         RAWaomZEV88GMCUv+KcQxMDBcukRVYjOJ97JGWQtf7n/q7YyPstMfqZHupS/A1/Pl014
         o74OaSrPWRsYprFRXIQDuxhLLrckuzjC9aM5kEmuS1hK2DTNtzwB39LfMppTlItq0NeT
         ZMmpN92WY8co5QSTJz3rjGjn1iIq6SMqVo6/7gdUb+cZws2zb86yGz5uTM8woVCblD8p
         0oS8SAm7vKKBuFrX+5oOV5X395YPrcxKj6a/hqWRfBf7qPe/qVsf5gA6GxTOfedAZiqG
         5sew==
X-Gm-Message-State: AOJu0YxfDGwTvZkkOUrXcpap3+ePYNuru6xSPCxQaQGNNhm2tAsXIwV7
	ORRr4EJi1wvRnqLYFKRHcfhREX0/U7KwO+WKYqa4DZKOV48J2+XK9OA/cJo0vY15kNn8Tz03JJA
	TvCg9vSfAWYjnhAKxtTtMIDJfbMg=
X-Google-Smtp-Source: AGHT+IGyhCo/WzXci0GxrAbp1tFg9LjNLv1tWLlLPkdgUnrt42MEnSLORmzk5t6dqXFXkY3mvCtO9hYswh/sSWLmolM=
X-Received: by 2002:a25:aa54:0:b0:dc2:22a0:9ab4 with SMTP id
 s78-20020a25aa54000000b00dc222a09ab4mr110613ybi.15.1706233550646; Thu, 25 Jan
 2024 17:45:50 -0800 (PST)
MIME-Version: 1.0
References: <20220413083824.247136-1-gch981213@gmail.com> <20220413145843.46a3d9b5@xps13>
 <CAJsYDV+3J0ipbR+N-xE=DH-WXsjierdHe_pJtKf1Xbt7fdaiWw@mail.gmail.com>
 <CAM1KZS=tvEi6fed=BoynpkjfzZqKGb-wv+CVbVmAPYz5tNaNkQ@mail.gmail.com> <20240124180848.3647d5c9@xps-13>
In-Reply-To: <20240124180848.3647d5c9@xps-13>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Fri, 26 Jan 2024 09:45:39 +0800
Message-ID: <CAJsYDVLGjXXNrTicQpOd+rnAKpLpFttkeOSH15_qs5ymm+HaBQ@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: spinand: add support for ESMT F50x1G41LB
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Ezra Buehler <ezra@easyb.ch>, linux-mtd@lists.infradead.org, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, 
	Christophe Kerello <christophe.kerello@foss.st.com>, Mark Brown <broonie@kernel.org>, 
	Daniel Palmer <daniel@0x0f.com>, open list <linux-kernel@vger.kernel.org>, quic_sridsn@quicinc.com, 
	quic_mdalam@quicinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_174552_778559_1D676004 
X-CRM114-Status: GOOD (  14.51  )
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

SGkgTWlxdWVsIQoKT24gVGh1LCBKYW4gMjUsIDIwMjQgYXQgMTowOOKAr0FNIE1pcXVlbCBSYXlu
YWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+ID4gQWNjb3JkaW5nIHRvIHRo
ZSBkYXRhc2hlZXRzLCB0aGUgRVNNVCBjaGlwcyBhY3R1YWxseSBoYXZlIGEgNSBieXRlIElELAo+
ID4gdGhlIGxhc3QgMyBieXRlcyBiZWluZyAweDdGIChKRURFQyBNYWtlciBDb2RlIENvbnRpbnVh
dGlvbiBDb2RlKS4gV2h5Cj4gPiBjYW4ndCB3ZSBzaW1wbHkgZXh0ZW5kIHRoZSBJRCBpbiBlc210
LmMgKGFzIHlvdSBoYWQgaXQgaW4geW91ciBvcmlnaW5hbAo+ID4gcGF0Y2gpIGFuZCBpbmNyZWFz
ZSBTUElOQU5EX01BWF9JRF9MRU4gdG8gNT8gT3IsIGFsdGVybmF0aXZlbHksIG9ubHkKPiA+IGV4
dGVuZCB0aGUgSUQgdG8gNCBieXRlcz8KPiA+Cj4gPiBJZiB0aGF0IGlzIHRoZSB3YXkgdG8gZ28s
IEkgd291bGQgYmUgaGFwcHkgdG8gcHJvdmlkZSB0aGUgcGF0Y2hlcy4KPgo+IFBsZWFzZSBzZW5k
IHRoZSBwYXRjaGVzLiBDaHVhbmhvbmcgY2FuIHlvdSB0ZXN0IHRoZW0/CgpJIHRoaW5rIGl0IHNo
b3VsZCBiZSBmaW5lIHRvIHNldCBNQVhfSURfTEVOIHRvIDUgYW5kIGFkZCBtb3JlCjB4N2YgdG8g
dGhlIElEIGRlZmluaXRpb24uIFVuZm9ydHVuYXRlbHkgSSBkb24ndCBoYXZlIGFjY2VzcyB0byBh
bgpFU01UIGZsYXNoIGZvciBhIHRlc3QuCgotLSAKUmVnYXJkcywKQ2h1YW5ob25nIEd1bwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
