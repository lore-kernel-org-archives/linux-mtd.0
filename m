Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D06CC6B30
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2026 02:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pshFxGbdBoDFH/6pntQi0LTXfghq6JpdrVNXd2rphrU=; b=lZuF0VMrXb7UDO
	4Y2mrB0hSnG47My2Fz+fq6OeMj280V223PbRa0rcYCNL+A56gZuuIQUmT15dLN+frseAUHCKMXZMi
	pE7H7K+Xmi6WjsOhkR8Yr3jPZgVZsT7yNY9paMe3J3chICRAPkE2fE6ppVwtMQnhoPCBEX/uNScpW
	RNG4PQ7xfUvIewXt8BfDfrX5PvCMapg4q/cxsIdHYxRQQbF0UWH4CQqH02piP1eWqNuXMi1bku+IR
	99x3Nkk9ZmUvXASExDhecboeac/mPxCWm2sleCx0JW8Yl0+TEZWsbiFZVcswLoSVp0Np7q30XDedA
	rXWxR+QYggl6XHBSP7dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHBV1-0000000Ggzq-1FLq;
	Thu, 15 Oct 2026 02:47:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHBV0-0000000GgzT-0l1w
	for linux-mtd@bombadil.infradead.org;
	Thu, 15 Oct 2026 02:47:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=16GbWlEqbR86iNc8/Kds0QNYGdsCxKka1B+rvUYPHwU=; b=nABdBhuaHXEmocJ5We4tVIaENb
	EZjT+gpUbCWwWQBzVUR3urdLu9PZqITxQ2NTdC8xu56E926+PWBuziTIx6BX+Fay9tUvA1lTJZ7kv
	b7wqQ/SN+8U76dzFESIs11wcBU4ckjUo1YPpsNKccCuzmjlGuB/mlvaR4YuNaJXRCQt2YuD/TuqMy
	+RVIN8CJNU3TisHMuq/ZBe24lO9aCVSN49rupKHN1B9q5L49lXHMvnK2vR0DVqo2C7XZg2t8T1D0D
	CebLT4Rj+k5OAQUGHXeCOo27kYisTY29w61CfZyZIZnKYBszLroLTT8Xmh979pnQYY6Lv2wqQFDT1
	vRQz9gWw==;
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHBUw-0000000HOhJ-2fKL
	for linux-mtd@lists.infradead.org;
	Thu, 15 Oct 2026 02:47:16 +0000
Received: by mail-vs1-xe30.google.com with SMTP id ada2fe7eead31-7bec5112765so603297137.1
        for <linux-mtd@lists.infradead.org>; Wed, 14 Oct 2026 19:47:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792032432; cv=none;
        d=google.com; s=arc-20260327;
        b=b5uzRwdLPp1LzIebs4RFxHSJPySpN05civudZAm5ow/AeY8il4lkY9uMXwZB0tkj0N
         BxPF9432rfG/R3tkn9KFM0CAdLxhLSwLrU6G0Ii3jBhijEpLiw4Thh3CLEVE6+CkztB+
         mWsULzGLcy+0DmY+AyxYuz4rGpAXZWRElmuggqTVGvFrOVOlL/8U+irIZztQzSoZPRac
         WrVJVRGLkjAo/EGeSoD+TRvj2hF6vQwWxoiA1GDMWqFgGD5oxBrtgaKdYq/3eLG6jy8I
         sS1FzpIScElTDadX2EbIiYzlvpfNBM8xBhR0gGiZMfiyqyBK3FbI5VqUt1xpS56jArJW
         J3Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=16GbWlEqbR86iNc8/Kds0QNYGdsCxKka1B+rvUYPHwU=;
        fh=MxxCVNue/3SkbhZoeOvcyehMr+R2WBaqtT1en1S0caA=;
        b=AfP04i85Jky9fQslo+6rO4nb4KU6f2XE3E+K+eIFv/D3U/hes00+lUZilj7c7wHUsR
         7e26IS+VKH6QtH9gn/aFyvpgqmiunYj3Cii7eplZ8ucm8/vkyvGvQQZlvDUtUpxwL7JT
         HSuPNqV0gEZzsGawBH0uXkLgmYJeoBpJDLVxRxYdB2oOMEN3bRuB+F0PqVBQ9CdvRd8k
         vNjlSnz5TVH9hrPhnPYdJLWY6fELNE9aRc4shfhkcdX475sa2PE1cJJPbfn46u/MkrLz
         bcNdYeFZVf5sygo9ZqHDVnx1XO5RiyhHhoAWTI57rSI0Dv9EAkoaG3KwyuuH216wUwf+
         /43Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792032432; x=1792637232; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=16GbWlEqbR86iNc8/Kds0QNYGdsCxKka1B+rvUYPHwU=;
        b=hdMYd7mlYHyPPPWMRLfbFKuqbNW5x9GKp+d+0uYnEs5Hjj8RyvsEvnneO2i0y/FzTd
         RRlEniwdq6gv+CGdBIEK2gxeH2qBEu2lJbNGezouwOK8lSc/Y8H/lZWJ4YPrT+G4uB6r
         WGkPAvuYxHAG6vs4jRdQPEMt6w7Ns7p8Y/FMSR1dfobFulubuzBLA8wGkKbWg2Jp1CAl
         kjXQv92B/3c9DT5pxs7KleaSZQsjbQNZKTco1dbzW1J9jMHhrxhRK6VlFj0zGBHxLXhc
         fdMfHUkE5d+wyGxgYBQbTdxbyqh7S5cqLIR6FOszHpOBAYcyI0GnXkU8OupoJpE4qUJa
         LB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792032432; x=1792637232;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=16GbWlEqbR86iNc8/Kds0QNYGdsCxKka1B+rvUYPHwU=;
        b=ATAyvylCh9QbGzWD7Gk2yb37tb6isGYyd54JHvPzhkx3io9k8kd547ynDHiX+fwsP+
         VMxlqAxN5f9cbJKxDQXBHdvfGSTSxs6T+KLv20+KuH1EJdtFPvp/oZthjNk5kHYlF00I
         2lJQMssWlnDy3jimlHtc+jClcUOyQkuJOR1rl7XixxnrcOy2w/QptK7nsxIobMjFtu99
         sYMYQnayDwoa1EKBVuzNm/hkO9E9OUFc41zusZP0vcU6cs6K0f0hNPAUvP1786XZce+W
         TqmtOnaoH7ukHH6llNtrBE+nyiSK40whWekjWcSXI8ildNY/ZaXy4No9ZlvqGYT9FfBG
         ipKg==
X-Forwarded-Encrypted: i=1; AKwUvBz/u9Ga0FTuStjk8zmezjmRYOSGTl37ZkWHGeV4ndTj1kupecWqobHSGc6PykmeRi1zqqfBVbBjk84=@lists.infradead.org
X-Gm-Message-State: AFq9FYJTPcnZr54KOlZBCUpL62ndsJMdmPodN6KinInABvNvHTzML1Rj
	jhA6a8zkpd3PcqRXl0EpyjtEQK94784q3lc4rWzd5mRrw99BAX2KTMwueDLpUC1WgE6Du4rrgeA
	7Lb/bunWXtrv0qU1rouFLGUCYyJ6+G8Q=
X-Gm-Gg: AYBFou0pSbXV42Nj7aIY131yT69YSTyuGdJ84eYiPnyuPc7YNaTGODpXoUP4/d2bLP/
	9TKt4lmYycMqnwpMCIVMy6J6ftNo2ygTmPuV32DeSKXYtAaip3T7H/0S+jO3H+ctjZfKpHewPpT
	YO4+w+wWVmKQoqEQbpD/Tb/v4sZJAYHpJNtTXNV6wGnio2ZsrXqtUOOiOwfxSz4pceEesuwGPWN
	zlANe5MmxK5EeL0o3mZVSVfEvxmQLpiFZSl9DmduxMHJcCK26b1TEIJAjgpcS4T9qHqByVtj60A
	wi5XZgibR49vHYKTOpKMJDW5C/2dfG3Ahet5E+kV3ctlPVCylnD/LyliCmKjEh2h22ZEcFQKlvf
	Xizho8KrNIUFEf0TJHKnpxcrhYTOJN3qZHZRoTAqQf/nUVeZ2cjhcfCfiAhOm0oh0PyctO6dp1i
	ROn8rUcpRJ8JSacTXSWy0UARJEqjkAD33GYqyf67IaKXRQ
X-Received: by 2002:a05:6102:418b:b0:7c3:2f13:d905 with SMTP id
 ada2fe7eead31-7cb3668b831mr6416805137.3.1792032432146; Wed, 14 Oct 2026
 19:47:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
 <871p9v4a1x.fsf@bootlin.com>
In-Reply-To: <871p9v4a1x.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 14 Oct 2026 20:47:00 -0600
X-Gm-Features: AclHuK8WjfPBl-snALh8yjK0sT9hEMdsL68lGw63Y8O6sDBZaP8Ds_BfAoAdcJg
Message-ID: <CADvTj4oCVOBiY-55OJt3xFaOiBrFVixmK=AmTRt40iEisDSO2g@mail.gmail.com>
Subject: Re: [PATCH v6 00/18] mtd: rawnand: sunxi: support the Allwinner
 randomized OOB format
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, Richard Genoud <richard.genoud@bootlin.com>, 
	Masahiro Yamada <yamada.masahiro@socionext.com>, Boris Brezillon <bbrezillon@kernel.org>, 
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_034714_877071_B0DE3A23 
X-CRM114-Status: GOOD (  28.09  )
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

T24gTW9uLCBPY3QgMTIsIDIwMjYgYXQgMjowNuKAr0FNIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5y
YXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGkgSmFtZXMsCj4KPiBPbiAxNC8wOS8yMDI2
IGF0IDE1OjA5OjQ2IC0wNiwgSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5j
b20+IHdyb3RlOgo+Cj4gPiBBbGx3aW5uZXIgTkFORCBmaXJtd2FyZSBsZWF2ZXMgdGhlIGJhZC1i
bG9jayBtYXJrZXIgaW4gdGhlIHJhbmRvbWl6ZXIKPiA+IGRhdGEgc3RyZWFtLiBPbiBINi9INjE2
IGl0IGFsc28gcGxhY2VzIGFsbCBwcm90ZWN0ZWQgdXNlciBkYXRhIGJlZm9yZSB0aGUKPiA+IGZp
cnN0IEVDQyBzdGVwLiBUaGVzZSBjaG9pY2VzIGRpZmZlciBmcm9tIHRoZSBtYWlubGluZSBmb3Jt
YXQsIHdoaWNoCj4gPiBrZWVwcyB0aGUgcGh5c2ljYWwgbWFya2VyIHBsYWluIGFuZCBtYXhpbWl6
ZXMgdGhlIEg2L0g2MTYgdXNlci1kYXRhIGFyZWEuCj4KPiBbLi4uXQo+Cj4gPiBBc3Npc3RlZC1i
eTogQ29kZXg6Z3B0LTYtYXN0cmEKPiA+IFNpZ25lZC1vZmYtYnk6IEphbWVzIEhpbGxpYXJkIDxq
YW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgo+ID4gLS0tCj4KPiBJIGFtIHNvcnJ5IGJ1dCBJIGRv
IG5vdCB3YW50IHRvIHByb2NlZWQgZnVydGhlciB3aXRoIHRoaXMgc2VyaWVzLgo+Cj4gRXZlbiB0
aG91Z2ggSSBhbSBub3QgY2FwYWJsZSBvZiBmaW5nZXIgcG9pbnRpbmcgd2hhdCBpcyB3cm9uZyBp
biB0aGUKPiBkaWZmcyBub3IgaW4gdGhlIGNvbW1pdCBsb2dzLCBJIGRvIG5vdCB1bmRlcnN0YW5k
IG1vc3Qgb2YgaXQuIEkgY2Fubm90Cj4gY2xlYXJseSBleHBsYWluIHdoeSwgYnV0IEkgaGF2ZSBo
YWQgYSBoYXJkIHRpbWUgdHJ5aW5nIHRvIHVuZGVyc3RhbmQKPiB3aGF0IHRoZSBjb21taXRzIHdl
cmUgZG9pbmcuCgpJIHRoaW5rIEkgbWF5IGhhdmUgaWRlbnRpZmllZCBhIHN1YnN0YW50aWFsIHBh
cnQgb2Ygd2hhdCBtYWRlIHY2CmRpZmZpY3VsdCB0byBmb2xsb3cuIEZvcm1hdC1zcGVjaWZpYyBo
YW5kbGluZyB3YXMgaW50ZXJzcGVyc2VkIHdpdGggdGhlClBJTyBhbmQgRE1BIHRyYW5zZmVyIHBh
dGhzLCB3aGljaCBhbHNvIGltcGxlbWVudGVkIHNpbWlsYXIgRUNDLXJlc3VsdCwKT09CIHJldHJp
ZXZhbCBhbmQgZXJhc2VkLWNodW5rIGhhbmRsaW5nIHNlcGFyYXRlbHkuIFJldmlld2luZyBhIGNo
YW5nZQpyZXF1aXJlZCBmb2xsb3dpbmcgdGhvc2UgaW50ZXJhY3Rpb25zIGFjcm9zcyBzZXZlcmFs
IGZ1bmN0aW9ucy4KCnY3IDAxLzE2LCAibXRkOiByYXduYW5kOiBzdW54aTogY2VudHJhbGl6ZSBP
T0IgaGFuZGxpbmciIFswXSwgc2VwYXJhdGVzCnRob3NlIHJlc3BvbnNpYmlsaXRpZXMgd2l0aG91
dCBjaGFuZ2luZyBiZWhhdmlvci4gVGhlIHRyYW5zZmVyIGZ1bmN0aW9ucwpyZXRhaW4gY29tbWFu
ZCBzZXF1ZW5jaW5nLCBETUEgb3duZXJzaGlwIGFuZCByYW5kb21pemVyIGNvbnRyb2wuClBlci1j
aGlwIE9PQiBvcGVyYXRpb25zIGhhbmRsZSBsYXlvdXQgc2V0dXAsIG1hcmtlciB0cmFuc2Zvcm1h
dGlvbiBhbmQKaW50ZXJwcmV0YXRpb24gb2YgY29tcGxldGVkIHJlYWRzLiBUaGUgZXhpc3Rpbmcg
Zm9ybWF0cyBzaGFyZSB0aGVpcgpyZWFkLWludGVycHJldGF0aW9uIGxvZ2ljLgoKVGhlIEFsbHdp
bm5lciBhZGRpdGlvbiBpbiB2NyAxNi8xNiwgIm10ZDogcmF3bmFuZDogc3VueGk6IHN1cHBvcnQg
dGhlCkFsbHdpbm5lciByYW5kb21pemVkIE9PQiBmb3JtYXQiIFsxXSwgbm93IGhhcyBhIGNsZWFy
IGJvdW5kYXJ5OiBpdHMKbGF5b3V0IGFuZCBwYWdlLWNsYXNzaWZpY2F0aW9uIHJ1bGVzIGxpdmUg
aW4gZGVkaWNhdGVkIGNhbGxiYWNrcywKc2VsZWN0ZWQgdGhyb3VnaCB0aGUgb3B0LWluIGF0dGFj
aCBwYXRoLiBJdHMgZXJhc2VkLXBhZ2UgYW5kIGJhZC1wYWdlCnBvbGljeSBpcyBzZXBhcmF0ZSBm
cm9tIHRoZSBleGlzdGluZyBmb3JtYXRzJyBpbnRlcnByZXRhdGlvbi4KCkNvbW1vbiBoYXJkd2Fy
ZSBoZWxwZXJzIHJlbWFpbiBzaGFyZWQsIGJ1dCBhZGRpbmcgdGhpcyBmb3JtYXQgbm8gbG9uZ2Vy
CnJlcXVpcmVzIHNjYXR0ZXJpbmcgZm9ybWF0LXNwZWNpZmljIGJyYW5jaGVzIHRocm91Z2ggdGhl
IFBJTyBhbmQgRE1BCnNlcXVlbmNpbmcuIFRoYXQgc2hvdWxkIG1ha2UgYm90aCBpdHMgYmVoYXZp
b3IgYW5kIHRoZSBwcmVzZXJ2YXRpb24gb2YKZXhpc3RpbmcgYmVoYXZpb3IgZWFzaWVyIHRvIHJl
dmlldy4KClswXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjYxMDE0LXN1Ym1pdC1zdW54
aS1uYW5kLXZlbmRvci1vb2ItbGF5b3V0LXYxLXY3LTEtNWQzZmM2YWQyZGExQGdtYWlsLmNvbS8K
WzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNjEwMTQtc3VibWl0LXN1bnhpLW5hbmQt
dmVuZG9yLW9vYi1sYXlvdXQtdjEtdjctMTYtNWQzZmM2YWQyZGExQGdtYWlsLmNvbS8KCj4gVGhl
IHJpc2sgaXMgdGhhdCBub2JvZHkgd291bGQgdGhlbiBiZSBhYmxlCj4gdG8gZnVydGhlciBtYWlu
dGFpbiB0aGlzIGRyaXZlciBhbmQgSSBhbSBub3Qgd2lsbGluZyB0byB0YWtlIHRoYXQKPiBvcHRp
b24uIFRoZSBrZXJuZWwgcG9saWN5IHNvIGZhciBoYXMgYmVlbiB0byBlbnN1cmUgcmVhZGFiaWxp
dHkgYW5kCj4gbWFpbnRhaW5hYmlsaXR5LCBhbmQgbXkgZ3V0IGZlZWxpbmcgaXMgdGhhdCB0aGlz
IHNlcmllcyBpcyBnb2luZwo+IHNpZGV3YXlzIHdydCB0aGlzIG1ham9yIGNvbnN0cmFpbnQuCj4K
PiBBbHNvLCBmcm9tIGEgTGludXgga2VybmVsIHBvaW50IG9mIHZpZXcsIHdlIGdlbmVyYWxseSBq
dXN0IGRvIG5vdAo+IHN1cHBvcnQgdmVuZG9yIHNwZWNpZmljIGxheW91dHMuIEkgYWxyZWFkeSB0
b2xkIHNvIFJpY2hhcmQgR2Vub3VkIGJhY2sKPiB3aGVuIGhlIHdhcyB3b3JraW5nIG9uIEg2MTYu
Cj4KPiBXaXRoIHRoaXMgYWRkZWQgdG8gdGhlIHBpbGUsIEkgcHJlZmVyIG5vdCB0byBtZXJnZSB0
aGUgZW50aXJlIHNlcmllcy4gSQo+IGNhbiBzdGlsbCB0YWtlIHNvbWUgb2YgdGhlIGZpeGVzIGlm
IHlvdSBmZWVsIGxpa2UgdGhleSB3b3VsZCBiZSByZWxldmFudAo+IGFueXdheS4gSW4gd2hpY2gg
Y2FzZSBJIGludml0ZSB5b3UgdG8gc2VuZCBhIHY3IHdpdGgganVzdCB0aGUgZmV3IGZpeGVzCj4g
eW91IHRoaW5rIGFyZSBhY3R1YWxseSByZWxldmFudCBvdXRzaWRlIG9mIHRoZSByYW5kb21pemVk
IGxheW91dAo+IHN1cHBvcnQuCgpJbiB2NyB0aGUgYmVoYXZpb3ItcHJlc2VydmluZyByZWZhY3Rv
ciBjb21lcyBmaXJzdCwgZm9sbG93ZWQgYnkgc2VwYXJhdGUgZml4ZXMKYW5kIG9wdGltaXphdGlv
bnMuIFBhdGNoZXMgMS0xNCBkbyBub3QgZGVwZW5kIG9uIHRoZSBiaW5kaW5nIGFuZCBBbGx3aW5u
ZXIKZm9ybWF0IGluIHBhdGNoZXMgMTUtMTYsIHNvIHRoZXkgY2FuIGJlIGNvbnNpZGVyZWQgaW5k
ZXBlbmRlbnRseS4KCj4KPiBUaGFuayB5b3UgZm9yIHlvdXIgdW5kZXJzdGFuZGluZywKPiBNaXF1
w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
