Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E452FCA0ED1
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Aug 2025 13:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/8SlmpfJJf5+j+Mt8H9PcwSfZrtuc5mzsi8S1JpBznU=; b=HWCf+8qKOt59wG
	hOQVFRbogP4ymS21E0D9SMPkjJivwylEvgkr/nLPWC9zr85ugVJM5OT7OcCkeEsc9EJYFFBXeBM7W
	pV9zwqiiIXuw0oXKOQl4kSQ4EfS5VO2mMoyD5sP3y+XPJ9x0aEgN+zJjLQTw1WPntWaLywVo26aeK
	HGdHCsBvBmRGAgtdbwloJRDciJKvM5xNJR9Uwsunh0Z+CM/OT4tOwlTKrNDFkalSt1IJYILiAZkU7
	bmVi2DsHboOkPlpQL6UvyA/8mX6gV7IJuzCSRLO3eFMWZ24BpNgfM3mBpaBL+OwKk61ciJI+tLEK5
	Rh8fDqcxnqs1jXHVXbXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo0Ep-00000007fFD-0Kb5;
	Mon, 18 Aug 2025 13:49:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo0Eo-00000007fF5-0nY9
	for linux-mtd@bombadil.infradead.org;
	Mon, 18 Aug 2025 13:49:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=LlgJL0tyh7FscLdsZMa4hvUraRt5/GA6QxyagwOWsnA=; b=jk8vK1KRAPLZ3IGj73PLr8cXk7
	1wi1vsLzCG0xH0VNQzxUlI/SQtUEUaqnZuiYuthLAC1/BnUhWsSFPPmZcUnXawgjygRcxbKpgQoTI
	I5n4WAqcuAYRN/0CxIEVuE8oLS9q0fBPS/i+VUlqvajWC1oChh9xnWgucmeM6Z1lSE2LhBXjOmIU8
	UytW6dPFuML5UeuXPZC8sm+84O/F7whAmhoNh6NTzflSZApH3hbieaX4/0PVvgy1trdgzNRt7MyLe
	1QbKQbQllO3upc24MdEPzSZR9ABBPsid6npQFjnzKeURwwWzA3vSzGZNwpMe/uhKZ5yJrYJSnnfz2
	UaShHDTg==;
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo0Ek-0000000HO1s-3zcC
	for linux-mtd@lists.infradead.org;
	Mon, 18 Aug 2025 13:49:25 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2445824dc27so36960595ad.3
        for <linux-mtd@lists.infradead.org>; Mon, 18 Aug 2025 06:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755524960; x=1756129760; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LlgJL0tyh7FscLdsZMa4hvUraRt5/GA6QxyagwOWsnA=;
        b=S8KXxPaUE0hPQSCAn+CfCaR4fg4grlf+TlQxBPitiU7rRzw6yRm0PSUOGK/F9K4WV1
         wAdF2zvwxqP1/luJ+F7Ne1XF8ui8bdVK1E/E33jr1gmxP690bT+B0Opk8ev7X07sOL/8
         mbXT3gaV6XlYyrjJQuitnpxEgJdCbEFrJ2/DtNGkzRC/6HcEDAIPApG+Xn6X+EQ+r1UT
         NRny5GersvOjh0JrUDr4Ply0FEzKELslxsvHaFaifc6+ojtG1ttFV8hRVaW+FGtY1sRa
         flpDBikdU4bctM5BzH3xdZvwP8NBaz5NHgjR48jV4gU8sn/qBHXqEZEueQPVixc0o7/1
         yqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755524960; x=1756129760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LlgJL0tyh7FscLdsZMa4hvUraRt5/GA6QxyagwOWsnA=;
        b=E61cGLgM8UqBHbfgkKmyw39VTM1qgTHFzWX5mp8QqjiKHkWO8TJeB/kiir4fBROlmy
         Q4/ZXxHeh+pgSF2YV0H6j6n3wIwVujk/Sc/rwiliaaP6EbvCCE+faatm9Uae28uxK5o4
         IAzJqHqw2dAV1OmgiUYJE8M4gCGAEFLts9xgBlGCBj7MIShhM1kjykuIpvfUkxLP9iN+
         zNJb30ngYQ2mhid8BD/Va0PH7O58vccqodj4doOlE+lo2bLu+2eVPqLH4upSjpnvCkNt
         wyrf4ayH3yxuI8OF4wfr4UfUHE/Ga1fKGGKOGh+59ZTtWhS4wtwJOEZaDGxQWHlZfTFt
         r09w==
X-Forwarded-Encrypted: i=1; AJvYcCUM0il0fJ8XJmtzeWpnSTFOA+s0T79Z22C2d0x2ZoinnXC6ahCCr1PebA+bKjNw5/KKeKAvqex5lxc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yycv1eDjN5ZNVhkNl+FJx18aoi7fb2Dv0T1QUZnF3g8EryqP/A2
	CifGte3Ti3hfPBWWeNi/K+wm5ABJj2yV91Gla6kMRuabNJ1kgTlou2mGwhIeuppX1LhGm5OBs38
	Q/o5KLehSpqY+qOqh5cCSKg8VBUGQG2IVxg==
X-Gm-Gg: ASbGnctB2mXr+Qf8y2mRws3q5X4hRswgKvi7itOFIC7T3giSib5W15CxoaCWWO1aoZn
	Ecfo6axlj8KTOcxtGEleOSjyxLq757fFvQMZUQUWW6K+AA9Kr+aJmVZ7v2burTqAeJVf5otDmxc
	UPETd/ZmIJ7qa7LJAmgtMXQlKOgHla9ujC2qmO4TnQKUdlo+QAU+6EDXZhv0XIU+3RZHieQisBU
	YtvKg==
X-Google-Smtp-Source: AGHT+IEh6PAqvkpw9OZzEtMd/NSgsisJDwtyGqVUx+6Vdt3WvoMhOra/FleqhAWxl6JtXmwlSvWp5H4mu0H+ceKvjKM=
X-Received: by 2002:a17:903:291:b0:242:fc4f:9fe3 with SMTP id
 d9443c01a7336-24478f72ec5mr114593685ad.37.1755524960059; Mon, 18 Aug 2025
 06:49:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250817081238.44785-1-rongqianfeng@vivo.com>
In-Reply-To: <20250817081238.44785-1-rongqianfeng@vivo.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 18 Aug 2025 15:49:07 +0200
X-Gm-Features: Ac12FXyoDjH7XDbWz_6LjBR_vJqC6uFHVGd33eUA12DcLLPINNdW-HOpU0Ig-W4
Message-ID: <CAFLxGvy0c=Ja6WBmpmCmqKMpe-AX5n3xMpuFiKz3JWOanrLqvA@mail.gmail.com>
Subject: Re: [PATCH] ubifs: vmalloc(array_size()) -> vmalloc_array()
To: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: Richard Weinberger <richard@nod.at>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_144923_084403_6B2C5A0C 
X-CRM114-Status: GOOD (  11.10  )
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

T24gU3VuLCBBdWcgMTcsIDIwMjUgYXQgMTA6MTLigK9BTSBRaWFuZmVuZyBSb25nIDxyb25ncWlh
bmZlbmdAdml2by5jb20+IHdyb3RlOgo+Cj4gUmVtb3ZlIGFycmF5X3NpemUoKSBjYWxscyBhbmQg
cmVwbGFjZSB2bWFsbG9jKCkgd2l0aCB2bWFsbG9jX2FycmF5KCkgaW4KPiB1Ymlmc19jcmVhdGVf
ZGZsdF9scHQoKS9scHRfaW5pdF9yZCgpL2xwdF9pbml0X3dyKCkuIHZtYWxsb2NfYXJyYXkoKSBp
cwo+IG9wdGltaXplZCBiZXR0ZXIsIHJlc3VsdGluZyBpbiBsZXNzIGluc3RydWN0aW9ucyBiZWlu
ZyB1c2VkIFsxXS4KPgo+IFsxXTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC9hYmM2NmVj
NS04NWE0LTQ3ZTEtOTc1OS0yZjYwYWIxMTE5NzFAdml2by5jb20vCj4KPiBTaWduZWQtb2ZmLWJ5
OiBRaWFuZmVuZyBSb25nIDxyb25ncWlhbmZlbmdAdml2by5jb20+Cj4gLS0tCj4gIGZzL3ViaWZz
L2xwdC5jIHwgMTIgKysrKysrLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMo
KyksIDYgZGVsZXRpb25zKC0pCgpNYWtlcyBzZW5zZS4gRG8geW91IHdhbnQgbWUgdG8gY2Fycnkg
dGhpcyB0aHJvdWdoIHRoZSB1YmlmcyB0cmVlIG9yIGRvIHlvdSBoYXZlCmEgZGlzdGluY3QgdHJl
ZSB3aXRoIGFsbCB5b3VyIHZtYWxsb2NfYXJyYXkoKSBwYXRjaGVzPwoKLS0gClRoYW5rcywKLy9y
aWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
