Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F6BCA9ED1
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Oct 2026 08:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hFSnrPUw8EO74F1CusbrVFG7JEDohBAGg8PPv8juojg=; b=wOzh5zpsHNz/Vp
	o1HO26DCQ8qjJSUbMLMkwYl22+4ozmA2s8EzV7RDO46N9B5h/m9EidW0uSzzaHqBDiXz5cbloe7Hs
	ThqJ52MRDQWDCeSY2kvO3XLXg/7UeLj0Hj57ajtUF17CUH/1iFJuXAmFv33qkvwOcBEP+tEIwx31E
	cRbPwOejgQyQv4vGMXUbZ0gRLEqbe7X+Ket7LkN6KiOaw1Ks0GZwoUKjZ4K/pU1bPBizuROQ4gnjC
	wOPvu5x8a+0OlBrqObOahsqN1lT+i6tj+kRJsduO66UbfFGc9GxyEb6+k5G5xuMEpmSLKeIve2MRX
	BNB3K12sMrLHdH/0zkpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGBqK-0000000A0IJ-1qXA;
	Mon, 12 Oct 2026 08:57:12 +0000
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGBqG-0000000A0HC-40VN
	for linux-mtd@lists.infradead.org;
	Mon, 12 Oct 2026 08:57:10 +0000
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-5e948e56af3so322791e0c.2
        for <linux-mtd@lists.infradead.org>; Mon, 12 Oct 2026 01:57:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791795427; cv=none;
        d=google.com; s=arc-20260327;
        b=jki/ILKe1aSS3wd0+VxA1+pATOqCu1QcLMD2MK6m+ntVNjUnqgF01LKtH9ttqNOSCW
         aOVs2OhqespJZqlTErZ+G7tE/fxJ0t31YnxCyCrx9zlG188boPsBJXRegfaZL2TCnwUS
         fKsiO0v/GJeLZoM2fCi7yFMjBzM6g5dWj4rnR/fKARNYONAR2Xo5eqvLVT+Qlt4qDTXp
         3W58uiUzi2TVAhRdcM7iq79UuIa5OG9BcNqiYswvt9TUq99bcFLzUIOGZCoIBj596uDd
         6MItD0Svhwd03rtQrzPJpdAzCQBNSfDpF7Uk6rEvme2KPYAfq9wRQ3fHmiXnOMzGgvsP
         DfVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+hsanqcaRD8wERt3PKwcrFG5KTWWy58uIS8hjI8nI1M=;
        fh=0SweXztWwT2c0y8efHN+OhRN57++U9lQfHlgHj70/pI=;
        b=mQ6HPkieho18M7aCBgn/MWVkxOyPyqNPwTshqmnah7cTD147zqqN64UWEh1o2JgXxc
         YZa3ovpT3froquIGsCX8gHb2nmiL8o9MDZjElPDPlXNhfCCmw2Hr2NJXRBYr3IO3CZ0O
         jbB4CE5OEzv25bNG9XAzevNAwr+qIzFu30FraXFqyzLMAeEmOC0J3ktjAUsFpN56CGX+
         xsj2IG6wJTQ3zHqYJyS+EH1AA9/PTqvuxWoCO5VLvWE9xrg4VUBEz/2ikHC7xBZMxdO6
         pt3+JKORZpNBLbkZJP/P/BGPYlvP59WPd8iRM29hw97C0Tf58bjGfpPdanpNPLaVZ9fL
         mV/A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791795427; x=1792400227; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+hsanqcaRD8wERt3PKwcrFG5KTWWy58uIS8hjI8nI1M=;
        b=bl6pVwLLnYM0XtxXGUXJZ3Q5R7paZjtrtkMZF1WUJW+KvvpsdHRRICHz3W1Om9whhv
         cxNWrVbgquU6nuYQJdOTn22ZF/+eCOZKVPzCoNoD8TLOw47bvLVPL9Gw520fRwz/hr0C
         zZHsRLGwZcoICUYz0y1F8wAr81i+qzcnt5ijRBo9pCerayOL4Q8qKIpoNriw945S+4/N
         GJqGks/5q+WHyjN1amtVFfF+mlODHc6Qlz76uCUBV3EkMezAIukd13uMjagXTMF0bXPP
         AgNOw0mA9wb8vst/2ReSGtvrObFtnOg5ihKWgf1qX5SZ+n2AgE2Wj57PLTzN2+PbjanO
         y7fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791795427; x=1792400227;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+hsanqcaRD8wERt3PKwcrFG5KTWWy58uIS8hjI8nI1M=;
        b=NKUqNc3VI2y8UubYB+LrjSIpvHAwGR5kJOlcIwiocy+Mw7hPm2JEVsvtbE7RtC08NT
         7mOHKyaiWP+esBX3VJL8SK/PXhtjZ74i0z49e7VS4V9rxCv8Qo9D+v/bOLh6//peQiBv
         O1W2LehgXLymGwWtUuZHWMKzYWzKYIEDhCSIg3U9XFZoKIuV9BeCzS5FwluxrjQL0HBq
         A5gAviNTlcSWKXyXV6acfHY9B1ZAOgY4fvIV06mATNkUOe6+lBxBe+2LF8SAqdICMAxb
         GMAXQo/3y811nKcwkXRClmVdOxVM+f4z0046TPWNdfb/dBw/nU8cXmAWj+HGdfD9cJcB
         FfCw==
X-Forwarded-Encrypted: i=1; AKwUvByZNro87ALyL+R80WNSqxOH6PU2O8L3VjivyUJssPXu3tJVEp1/dEFERKYpoySVR48DIqYB5sQV7YA=@lists.infradead.org
X-Gm-Message-State: AFq9FYJ1+jf1mZUvlpDm00Pe01sbqDSmk9AvcXW8EY1kDugoZZ7umO85
	lvuX63OIOyYWR72ZovSYxWrQ2ItcDx5zDa9NoX4hssqb0smQOa3N7wSOAgXPNbRgOnZIMLMwxLf
	nDGQTscDjHc9BSH+WbH7rnLFBTvZ4Crc=
X-Gm-Gg: AYBFou3ZklvF7UHoG3r03L8q6nFotb/m69w5Pf89JQ758FrXFuxh0cLLP9SVaxesREL
	biDQOkXpu5htkSlQSqXn1r7ossvHGBB5jN6iBkdT+UsAlFblbe7Q/fO3yCUUJXzqvLUhiYcS1Kr
	rPiPCOjZ7Vgio8u2LoWTA50gQHDLOA562N4t7lUkF3PSVSqFZ2OG8kdC93IR0HFZTm9Nc7QHPcq
	X1FED3nTkFIty8xLyy6FAV2ZZ3J5Chu3Diwp0R5yT6Yu+9Pm5RH3QDaRUhYbhuviDFb3jrkE+ik
	YkyX+WOaYEWqgFVo3l6D0QhgfnR4mPAUOzq2gQgG+QLRUUzBWFyX4TgLH1+ZrbXqwpc1qDiDpCL
	Jw3Ga2/X7Sj8+BtEZBpnogg7JUVtkS31MTtWwF/exc2RuZwlPpu6oTB/nZajW0h63XIuvuTNae2
	bCVeyCEjSOyM1ixSNDnBENfVnYGMRXsm5TP2pYh6NGHurY
X-Received: by 2002:a05:6102:80a3:b0:7af:4843:5ec9 with SMTP id
 ada2fe7eead31-7cb3728268emr2044842137.8.1791795427219; Mon, 12 Oct 2026
 01:57:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
 <871p9v4a1x.fsf@bootlin.com>
In-Reply-To: <871p9v4a1x.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 12 Oct 2026 02:56:55 -0600
X-Gm-Features: AclHuK9PgSRU-9yDfcYymMtt4yQDEEGqg1HXAOlwk0cudjnkkhK9ivdvdn9hMz0
Message-ID: <CADvTj4pZEH2wj2aHSL+S+jO-MeFjRx+XMqhv+XGLiiukvf28vQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20261012_015709_222910_CBD16E46 
X-CRM114-Status: GOOD (  32.59  )
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
cmUgZG9pbmcuIFRoZSByaXNrIGlzIHRoYXQgbm9ib2R5IHdvdWxkIHRoZW4gYmUgYWJsZQo+IHRv
IGZ1cnRoZXIgbWFpbnRhaW4gdGhpcyBkcml2ZXIgYW5kIEkgYW0gbm90IHdpbGxpbmcgdG8gdGFr
ZSB0aGF0Cj4gb3B0aW9uLiBUaGUga2VybmVsIHBvbGljeSBzbyBmYXIgaGFzIGJlZW4gdG8gZW5z
dXJlIHJlYWRhYmlsaXR5IGFuZAo+IG1haW50YWluYWJpbGl0eSwgYW5kIG15IGd1dCBmZWVsaW5n
IGlzIHRoYXQgdGhpcyBzZXJpZXMgaXMgZ29pbmcKPiBzaWRld2F5cyB3cnQgdGhpcyBtYWpvciBj
b25zdHJhaW50LgoKSnVzdCB0byBjbGFyaWZ5IGFsbCBrbm93biByZWFsIHdvcmxkIHVzYWdlIG9m
IHRoZXNlIGRldmljZXMgcmVxdWlyZXMKdGhlIHZlbmRvciBsYXlvdXQgZHVlIHRvIEJCTSdzIHRo
ZW1zZWx2ZXMgYmVpbmcgcmFuZG9taXplZC4KCkZyb20gYSBwcmFjdGljYWwgcG9pbnQgb2Ygdmll
dyBJJ20gbm90IGF3YXJlIG9mIGFueSB3YXkgdG8gYXZvaWQKdGhpcyBjb25zdHJhaW50IGZvciBh
bnkgZXhpc3RpbmcgaGFyZHdhcmUuCgpJIG1lYW4sIHdpdGhvdXQgdGhlIHZlbmRvciBPT0IgYmVp
bmcgaW4gbWFpbmxpbmUgaXQncyBsaWtlbHkgbWFpbnRlbmFuY2UKd2lsbCBqdXN0IGJlIGFiYW5k
b25lZCBkdWUgdG8gdGhlIG1haW5saW5lIGRyaXZlciBiZWluZyBpbmNvbXBhdGlibGUgd2l0aApy
ZWFsIGhhcmR3YXJlIHNvIHRoYXQgZG9lc24ndCBzZWVtIGxpa2UgYSB2ZXJ5IGdvb2QgdHJhZGVv
ZmYuIEFzLWlzIHRoZQpleGlzdGluZyBjb2RlIGhhcyByZWNlaXZlZCB2ZXJ5IGxpdHRsZSBtYWlu
dGVuYW5jZSBvdmVyYWxsIGxpa2VseSBkdWUgdG8KdGhpcyBpc3N1ZS4KCklzIGl0IGJldHRlciB0
byBoYXZlIGEgbW9yZSByZWFkYWJsZSBkcml2ZXIgdGhhdCdzIGVmZmVjdGl2ZWx5IG5vbi1mdW5j
dGlvbmFsCnNpbmNlIGl0J3MgaW5jb21wYXRpYmxlIHdpdGggdGhlIGhhcmR3YXJlIG9yIGEgbGVz
cyByZWFkYWJsZSBvbmUgdGhhdCBjYW4KYWN0dWFsbHkgYmUgdXNlZCBpbiB0aGUgcmVhbCB3b3Js
ZD8KCktlZXAgaW4gbWluZCB0aGUgcGF0Y2ggYWRkaW5nIHRoZSBhY3R1YWwgdmVuZG9yIG9vYiBm
b3JtYXQgc3VwcG9ydCBpcwpvbmx5IDI3MCBhZGRpdGlvbnMgYW5kIDEwIGRlbGV0aW9ucyBhbmQg
aXMgZmFpcmx5IGNsZWFubHkgc2VwYXJhdGVkIGZyb20KdGhlIG90aGVyIGZvcm1hdCBoYW5kbGlu
ZyB2aWEgdGhlIHN1bnhpX25hbmQtPnJhbmRvbWl6ZWRfb29iIGZsYWcgc28KSSdtIG5vdCBzdXJl
IGl0J3MgcmVhbGx5IGFzIGJhZCBhcyB5b3UgYXJlIG1ha2luZyBpdCBvdXQgdG8gYmUgaW4gdGVy
bXMgb2YKbWFpbnRlbmFuY2UgYnVyZGVuOgpodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAy
NjA5MTQtc3VibWl0LXN1bnhpLW5hbmQtdmVuZG9yLW9vYi1sYXlvdXQtdjEtdjYtMTMtMmZiMDg0
ZmUwNzUxQGdtYWlsLmNvbS8KClRoaXMgY29kZSBtYXkgbm90IGJlIHRoZSBlYXNpZXN0IHRvIHVu
ZGVyc3RhbmQgd2l0aG91dCBMTE0gYXNzaXN0YW5jZQpzaW5jZSB0aGUgdmVuZG9yIGxvZ2ljIGlz
IHNvbWV3aGF0IGNvbXBsZXggYnV0IHNpbmNlIHRob3NlIHRvb2xzIGFyZQpvbmx5IGdvaW5nIHRv
IGdldCBiZXR0ZXIgYXMgdGltZSBnb2VzIG9uIGl0IHNlZW1zIHVubGlrZWx5IHRvIG1lIHRoYXQg
dGhpcwp3b3VsZCBlbmQgdXAgYmVpbmcgdW5tYWludGFpbmFibGUgYW5kIHJlZ2FyZGxlc3MgbW9z
dCBvZiB0aGlzIHNlcmllcwppcyB1bnJlbGF0ZWQgdG8gdGhlIHZlbmRvciBvb2IgZm9ybWF0IGFu
ZCBpcyBqdXN0IGJ1ZyBmaXhlcyBvciBvcHRpbWl6YXRpb25zLgoKPiBBbHNvLCBmcm9tIGEgTGlu
dXgga2VybmVsIHBvaW50IG9mIHZpZXcsIHdlIGdlbmVyYWxseSBqdXN0IGRvIG5vdAo+IHN1cHBv
cnQgdmVuZG9yIHNwZWNpZmljIGxheW91dHMuIEkgYWxyZWFkeSB0b2xkIHNvIFJpY2hhcmQgR2Vu
b3VkIGJhY2sKPiB3aGVuIGhlIHdhcyB3b3JraW5nIG9uIEg2MTYuCgpIbW0sIEknbSBzZWVpbmcg
cGxlbnR5IG9mIG1haW5saW5lIGRyaXZlcnMgd2l0aCB2ZW5kb3Igc3BlY2lmaWMgbGF5b3V0czoK
aHR0cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2Jsb2IvdjcuMi9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9yb2NrY2hpcC1uYW5kLWNvbnRyb2xsZXIuYwpodHRwczovL2dpdGh1Yi5jb20vdG9y
dmFsZHMvbGludXgvYmxvYi92Ny4yL2RyaXZlcnMvbXRkL25hbmQvc3BpL2dpZ2FkZXZpY2UuYwoK
PiBXaXRoIHRoaXMgYWRkZWQgdG8gdGhlIHBpbGUsIEkgcHJlZmVyIG5vdCB0byBtZXJnZSB0aGUg
ZW50aXJlIHNlcmllcy4gSQo+IGNhbiBzdGlsbCB0YWtlIHNvbWUgb2YgdGhlIGZpeGVzIGlmIHlv
dSBmZWVsIGxpa2UgdGhleSB3b3VsZCBiZSByZWxldmFudAo+IGFueXdheS4gSW4gd2hpY2ggY2Fz
ZSBJIGludml0ZSB5b3UgdG8gc2VuZCBhIHY3IHdpdGgganVzdCB0aGUgZmV3IGZpeGVzCj4geW91
IHRoaW5rIGFyZSBhY3R1YWxseSByZWxldmFudCBvdXRzaWRlIG9mIHRoZSByYW5kb21pemVkIGxh
eW91dAo+IHN1cHBvcnQuCgpQYXRjaGVzIGZyb20gW1BBVENIIHY2IDExLzE4XSBhbmQgZWFybGll
ciBhcmUgdW5yZWxhdGVkIHRvIHRoZSB2ZW5kb3IKbGF5b3V0IGNoYW5nZSBzbyB5b3Ugc2hvdWxk
IGJlIGFibGUgdG8gdGFrZSB0aG9zZSBhcy1pcy4gSSBkZWxpYmVyYXRlbHkKc3RydWN0dXJlZCB0
aGUgc2VyaWVzIHRvIHB1dCBhbGwgdGhlIGJ1ZyBmaXhlcyBhaGVhZCBvZiB0aGUgdmVuZG9yIGZv
cm1hdApjaGFuZ2VzLiBUaGUgb25lcyBhZnRlciBhcmUgbW9zdGx5IGp1c3Qgb3B0aW1pemF0aW9u
cyB0aGF0IGRpZG4ndCBtYWtlCnNlbnNlIHRvIGltcGxlbWVudCBiZWZvcmUgYWRkaW5nIHZlbmRv
ciBvb2Igc3VwcG9ydCBidXQgZm9yIHRoZSBtb3N0CnBhcnQgcHJvYmFibHkgc3RpbGwgbWFrZSBz
ZW5zZSB0byBhZGQgZWl0aGVyIHdheSB0byBzb21lIGRlZ3JlZS4gQWxsCmNoYW5nZXMKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
