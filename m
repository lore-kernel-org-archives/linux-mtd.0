Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A968AC54E64
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2024 16:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=kjlIkAQ060/bcfv3Z5nN2+2mh1ERVZHIpKfYq+bPrac=; b=BM3
	waD/FCQ+yfVLi3ITCeV79BiEhPPtHb4bnC1PcIM7N5BMv29ai/CKBZZ4o6mk/dQ2vsyfS74H5MYR6
	iMYw3p5/LC51SWRBE3y7h+qGHWQFo42tyzXkrTEWJnJuYfgCYLQUqVQwVBAub+PE0N9ieMbFSEaxL
	kxUBAqDsz8ih2gA+sRb5sdVskS7/369mjBJSGluUZmTMT/JWu4fcavDjqce2YSQODO5DE8knD8zq2
	N4WAEl7wNiQrwko7QdWuKC77Md/TqYE9wNspDkyVskPkmdOXDedDShn8OMH17QkJKS0uuzSeyBZbI
	x0SxWeOXWuyVwXj8KHeWRko5qQGriPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ronda-00000000uDN-0w4T;
	Mon, 25 Mar 2024 16:57:30 +0000
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rondX-00000000uAh-3tSf
	for linux-mtd@lists.infradead.org;
	Mon, 25 Mar 2024 16:57:29 +0000
Received: by mail-vs1-xe2f.google.com with SMTP id ada2fe7eead31-476025fde0aso1490255137.1
        for <linux-mtd@lists.infradead.org>; Mon, 25 Mar 2024 09:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711385842; x=1711990642; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hLwz6AT7i9SFQR1PFmCOZMN76wf8IMXdZo0Hdboi05Q=;
        b=dMgyr6O1UVlV1JLGZ5gFj12JZqydIfielhOJ4O0F+ApQCtX/new9P1SsQ8hu7jiFpv
         YGnySOChuVpz/vq8CvgYMaLZpOGeic0ZVldyZO0m3nel6iz20qW9T30nHQFJ6EYQuOyd
         tct4+OVBEH4DbkxGr2EaTKMZn3VvrE+UF4vVUhMdv5Bcu7LL/MBTQIG91wte99EmsIgA
         P60LATFJ2a0EPDs+i3aYj8bLCAmUlb5kKDufu/1sc5AaDH/XeJ9kxW7vVmyBZibYrlJy
         +BtMRVjymzkx0sA4b8/PuqZXDseQ40308IYXJPv3MJGf3nCaZ82s0GbREmGF1nrv5ixa
         QLng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711385842; x=1711990642;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hLwz6AT7i9SFQR1PFmCOZMN76wf8IMXdZo0Hdboi05Q=;
        b=fuTC+ZvWa1hiFvzdyxZINOudCsAy5G+ko6NwogXWsG/CyfpWZwhGhyumw8IJCOt/m6
         aSMNVvSDEIR+Tz+oQrFpfUg/oIixpe61x1YlEqzMpNjDNItRl7PtlqEOZBD+Y5DsXx6S
         KR20NTlcRTmrz1fzJO1PECQXd2HBpARi+0fKtm93pitdbue14QaZ0KK2gnDTfptuVv2v
         S3+Q5MxHR70hodAnXi3u0padWxVjUs0WFzgby2mX1P8B3XvJTdoPK5Q5TiiQMgUtFbEn
         UX0CgF/yNVb8rHhSb4WTKuRF+OY9xP2W8nTPVv0kFlQKS8R0lU7xNp9U0UfNXx+k3cjI
         u3+A==
X-Forwarded-Encrypted: i=1; AJvYcCX0ts3ggIwSzWmeiM/4P/XHTJgrjzmtvXaHDwti2krVO6tOGlEbaV/xJ0a8Cf5KLkyjmub29MKAC0cBuO9KQ99Et4wiI8tplACN8+kHUQ==
X-Gm-Message-State: AOJu0YwhWFGs1po0ROU0RvI+pQE+vLPgoVWNcggkY6T8rP+da2JwQl/C
	Z0P8tVNG2YiL9clxz39uTtV06xEcP4llbUSB6E0ZZt/EcUMndJ6xmi1PqOmtCjGPvot1YQQZZBv
	RjLedz36Ugg9BvhfsgHX+clegAUg=
X-Google-Smtp-Source: AGHT+IFDmJdILhbZ1B94DyCMDj2TYfzSPnPxFtvwQYnsGy1X4FTKrtyhTl7tP84FRTNDOfm8Dn6ti6PAATMB1IWu3qc=
X-Received: by 2002:a67:cd15:0:b0:478:222a:5303 with SMTP id
 u21-20020a67cd15000000b00478222a5303mr1398631vsl.14.1711385841975; Mon, 25
 Mar 2024 09:57:21 -0700 (PDT)
MIME-Version: 1.0
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Mon, 25 Mar 2024 22:27:10 +0530
Message-ID: <CAOuPNLjQPo8hoawK73H7FOVitQHp21HHODExO+7cguGrtURKWg@mail.gmail.com>
Subject: linux-mtd: ubiattach taking long time
To: linux-fsdevel@kvack.org, linux-fsdevel <linux-fsdevel@vger.kernel.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>, artem.bityutskiy@linux.intel.com, 
	Richard Weinberger <richard.weinberger@gmail.com>, ezequiel@collabora.com, 
	Richard Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>, vigneshr@ti.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_095727_987727_BD8A3A39 
X-CRM114-Status: UNSURE (   6.80  )
X-CRM114-Notice: Please train this message.
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

SGkgQWxsLAoKV2UgYXJlIHVzaW5nIGFybTY0LCBxdWFkLWNvcmUsIHdpdGggTGludXggS2VybmVs
IDUuMTUgd2l0aCAxR0IgTkFORC4KV2UgaGF2ZSBBL0IgcGFydGl0aW9uaW5nIGFuZCBhcm91bmQg
OSB1Ymkgdm9sdW1lcy4KCkR1cmluZyBib290LXVwIHdlIG9ic2VydmVkIHRoYXQgdGhlIHViaWF0
dGFjaCBhbG9uZSBpcyB0YWtpbmcgYXJvdW5kCjEuMiBzZWNzIChlaXRoZXIgdXNlciBzcGFjZSBv
ciBrZXJuZWwgc3BhY2UpLgpUaGUgc25hcHNob3Qgb2YgdGhlIGxvZyBpcyBzaG93biBiZWxvdy4K
CkkgaGF2ZSB0cmllZCB1c2luZyBmYXN0bWFwIGFzIHdlbGwsIGJ1dCBzdGlsbCBubyBkaWZmZXJl
bmNlLgpBcmUgdGhlcmUgYW55IG90aGVyIHRlY2huaXF1ZXMgdG8gaW1wcm92ZSB0aGUgdWJpYXR0
YWNoIHRpbWluZyA/CgpMb2dzOgotLS0tLS0tLS0tCkRvaW5nIGZyb20gaW5pdHJhbWZzOgp7e3sK
WyAgICA2Ljk0OTE0M11bICBUMjE0XSB1YmkwOiBhdHRhY2hpbmcgbXRkNTQKWyAgICA4LjAyMzc2
Nl1bICBUMjE0XSB1YmkwOiBzY2FubmluZyBpcyBmaW5pc2hlZApbICAgIDguMDM1OTAxXVsgIFQy
MTRdIHViaTA6IGF0dGFjaGVkIG10ZDU0IChuYW1lICJzeXN0ZW0iLCBzaXplIDg2NyBNaUIpClsg
ICAgOC4wNDI2MzVdWyAgVDIxNF0gdWJpMDogUEVCIHNpemU6IDI2MjE0NCBieXRlcyAoMjU2IEtp
QiksIExFQgpzaXplOiAyNTM5NTIgYnl0ZXMKWyAgICA4LjA1MDQyM11bICBUMjE0XSB1YmkwOiBt
aW4uL21heC4gSS9PIHVuaXQgc2l6ZXM6IDQwOTYvNDA5NiwKc3ViLXBhZ2Ugc2l6ZSA0MDk2Clsg
ICAgOC4wNTgxMzRdWyAgVDIxNF0gdWJpMDogVklEIGhlYWRlciBvZmZzZXQ6IDQwOTYgKGFsaWdu
ZWQgNDA5NiksCmRhdGEgb2Zmc2V0OiA4MTkyClsgICAgOC4wNjYwMTFdWyAgVDIxNF0gdWJpMDog
Z29vZCBQRUJzOiAzNDcwLCBiYWQgUEVCczogMCwgY29ycnVwdGVkIFBFQnM6IDAKWyAgICA4LjA3
Mjk5NV1bICBUMjE0XSB1YmkwOiB1c2VyIHZvbHVtZTogMTAsIGludGVybmFsIHZvbHVtZXM6IDEs
Cm1heC4gdm9sdW1lcyBjb3VudDogMTI4ClsgICAgOC4wODEyMjVdWyAgVDIxNF0gdWJpMDogbWF4
L21lYW4gZXJhc2UgY291bnRlcjogMy8wLCBXTAp0aHJlc2hvbGQ6IDQwOTYsIGltYWdlIHNlcXVl
bmNlIG51bWJlcjogMzAyNjkxOTYzClsgICAgOC4wOTEyNDJdWyAgVDIxNF0gdWJpMDogYXZhaWxh
YmxlIFBFQnM6IDAsIHRvdGFsIHJlc2VydmVkIFBFQnM6CjM0NzAsIFBFQnMgcmVzZXJ2ZWQgZm9y
IGJhZCBQRUIgaGFuZGxpbmc6IDgwClsgICAgOC4xMDE1NDRdWyAgVDIxNV0gdWJpMDogYmFja2dy
b3VuZCB0aHJlYWQgInViaV9iZ3QwZCIgc3RhcnRlZCwgUElEIDIxNQpVQkkgZGV2aWNlIG51bWJl
ciAwLCB0b3RhbCAzNDcwIExFQnMgKDg4MTIxMzQ0MCBieXRlcywgODQwLjMgTWlCKSwKYXZhaWxh
YmxlIDAgTEVCcyAoMCBieXRlcyksIExFQiBzaXplIDI1Mzk1MiBieXRlcyAoMjQ4LjAgS2lCKQpb
ICAgIDguMTM2OTA3XVsgIFQyMjddIGJsb2NrIHViaWJsb2NrMF8wOiBjcmVhdGVkIGZyb20gdWJp
MDowKHJvb3Rmc19hKQp9fX0KCkRvaW5nIGZyb20gS2VybmVsIHVzaW5nIGNtZGxpbmU6IHViaS5t
dGQ9NTQsMCwzMCA6Cnt7ewpbICAgIDYuNzAyODE3XVsgICAgVDFdIHViaTA6IGRlZmF1bHQgZmFz
dG1hcCBwb29sIHNpemU6IDE3MApbICAgIDYuNzAyODIyXVsgICAgVDFdIHViaTA6IGRlZmF1bHQg
ZmFzdG1hcCBXTCBwb29sIHNpemU6IDg1ClsgICAgNi43MDI4MjZdWyAgICBUMV0gdWJpMDogYXR0
YWNoaW5nIG10ZDU0ClvigKZdClsgICAgNy43ODQ5NTVdWyAgICBUMV0gdWJpMDogc2Nhbm5pbmcg
aXMgZmluaXNoZWQKWyAgICA3Ljc5NzEzNV1bICAgIFQxXSB1YmkwOiBhdHRhY2hlZCBtdGQ1NCAo
bmFtZSAic3lzdGVtIiwgc2l6ZSA4NjcgTWlCKQp9fX0KCgpUaGFua3MsClBpbnR1CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
