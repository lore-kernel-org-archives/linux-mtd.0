Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DAD0C43458
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Jul 2026 07:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U/3WSfW2EH90+N+5EE5sYvZ72yzWbnjqzpEZUJjC8UI=; b=b6rGU8o/29XXpN
	diOxPlj2bDIEorPVpopG899tAzk9krCHIUzjhntE0wkrrW+TSQUItJnzCWYUSlXplG3Lfm9VFXNWl
	YofNfsOBRwy+Rc5w4JG+8atobTq9cpdpEmyJnAZyeEb7fjFv15kIdcOC/sVkIjdUqayNs4n214z49
	sG4gfJwo+j51O0vYOUF765/NO4hrxNxGMJmeNkb9hGB6lwXnKx/JGpzaKYr2sC/aJBg0hnJzmScII
	7NupreIRxMhItuXsZ4Nc3XErCDUq0IX6qE4dWPc3NIqVV2LRo1QWbwLaJtx+2fiwtdMU2gRJsaD74
	A3Sifn8y78YyMpFO9ziw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfBqK-00000003jhY-0SrE;
	Thu, 02 Jul 2026 07:28:16 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfBqI-00000003jhD-0CtI
	for linux-mtd@lists.infradead.org;
	Thu, 02 Jul 2026 07:28:15 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-c96cb024ee0so723688a12.1
        for <linux-mtd@lists.infradead.org>; Thu, 02 Jul 2026 00:28:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782977293; cv=none;
        d=google.com; s=arc-20260327;
        b=KzAIFQCz5dlGvvR9U1I+buAcNnNu4Wsvuq2U4BM7r4yTOjvDwCn8hfgdFj4JuUoGGr
         uEVSInM3gCQmP9tQolWTOv3Dqpu7BeR6Oyt4P0OW0bqsmzTBX6VE92eygP4PaaxSuok6
         sUbu+yt1KQ3S0EoDJICOKhuI6yxSspcH4ql5HPUUiqnP9Z1/vFl5EEyLhQUrUVMhcXAP
         /uF2EfVmWszroaMTTNN4mX7UqYGZdWbohA2Q37Thg3hax1s2GJzRuBqmm/aNAVPE0esI
         EwdYBQ0GS0NUS4leNm1ioS/GOjF2NxhQ2JP9lnvOvnREelhwfimvrv3hDzQH6ihfESO4
         i3aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iSg7UmndrJmXXq+2G8hB7zmOgf39V74PutvtsgDozeU=;
        fh=/SuNMvg2lBqU3ypHvTxMw/TFVo+tOeQywdotpcU1jEw=;
        b=leb4PH4szUfC2XXoWsw7qBrEW0nm9mlIary3L5zHA+VIW6Wl23KRtS4bqzrEvrC3p/
         HFDKg9Fhk8FOalwEXkz2hPvvEpR1gAZWwWODv4ErFLU9XI4nSX/AjrW9jFau2kuTqtu1
         WzlmCQOLJtRFcOvreawoVEGfTgC1v9tEFvOCABrYAzTUt9T66rA4YLbUsVZoPI44xksI
         1A/IzTGJaEmk5pHTR8MqRPo+zavg8sGJGaTEedy7BD2YVIuGeb/TofSGMBvfHAu/cIZU
         Nvv8ruUifHj+Wq95idTdcYrzL3ZJDv1CmwjrRsoNX+swlcA1ye9lIVmDrXU5tssx5Vdu
         09DA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782977293; x=1783582093; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iSg7UmndrJmXXq+2G8hB7zmOgf39V74PutvtsgDozeU=;
        b=PDWki373t0hd0kfXrCLN470WdPKTKn2TS/Ey9gb3yan0UzDbV3j9cEaU6aUAdIlh8+
         WpDdDeTFnhKMwvkRcvYPWuXjdjNSHnnZ21xfbYJew1zfAMzpriLuytfWAn/i+4O9feo7
         wG0V6J3u0u6D+rPKgTiy89vK5D+NIiuqMzYN5GGpJ5Y5iVP/EmjvuMJlxTh1VsEnpMN6
         6MvBkBjBMt6/T/eDQ6TMcGs2krviQf+2a3g7M7bFlkFSv9OTlVO0nK8hlle+rO9Zf+OB
         U2GDfLiFNotLGEkNtONPBviQyWNjPbptXrmwV7g8jmIRi/aO6/xFESz3ok04uNLlpqvY
         r1Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782977293; x=1783582093;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iSg7UmndrJmXXq+2G8hB7zmOgf39V74PutvtsgDozeU=;
        b=I7uX7FMy3sLY+gyIQF/Mo3GSxz4NNk72v/ND7HZLUcTx0SmPmHHTVzJfBPmp8fzrLi
         PowUuCnCmTHnEu4ZHoHylWPczxIvqsRcFFiEZymxZxUuexuGozCPb4+vRrBkcdsCgBeW
         b9I9HhsjoCTjzLVZayJ8Ja+qYppR4sXRlgGOupQqJItmEchT6UxbQ2tg5ohsqA15mdCR
         RBrKkyHrcP0vITZG+UjumgljPhCFLV9qxY+6vtfzYWYxdqH0Lpgnt2J7CdbazU3SEch+
         6UXM98pypdVQZQdFjFI7IO1ju1NUAVDVDWh1GNzsqXf8p/8K+MpdKpafuOn2wpwpDeuM
         Sq7w==
X-Forwarded-Encrypted: i=1; AFNElJ/rOA3XE3pZwYPZjg5RcBl9hxIgynyCqFd3YQSLDZqaPj5NJb0hkr+PgaKoRjjekdE0mHGsWe9EcrE=@lists.infradead.org
X-Gm-Message-State: AOJu0YxcMSkPa4KRrP7BYLKI1ZfFPIb3gfZ5jDKOLAgIrjjBp4Pz25wR
	O2V60U9lj5zK/ChVqWws/mjmoodz69/HT+QHh52f6qNr1J33IWUUJzMeUn+jbvR2+SazRItcEcb
	rrOzk+Umfnfdj2WBOWp33G6hG5Il9W4Q=
X-Gm-Gg: AfdE7cmfxEKwickjO+qKGjD767iVASKtai0D2DOlXAUgMr0lluKffWSPX8F/RlMZpxv
	WAUY7+wPHO8BsR5SuNRvCqq6C9K9Ge+0wGRvvb6uRn3xq4ypfooBRnAKhCOuV7hvVSQO+ZkFSa9
	TnA/h339YCi/gcNGf5ljizCHwQ4jXQv4TbAYkVuJ2g5lZzgf7KVs5TtqREzATvbuaBhrvxatOUr
	79xvBOHWi1X0iT9tqsUlQ4BMF28edsL+xy71ZB8AeBsdGXBsZZdldmjNLWg7FbCkEpEok1R
X-Received: by 2002:a05:6a20:734f:b0:3bf:e2f1:1b17 with SMTP id
 adf61e73a8af0-3bfed5d84b3mr5130678637.50.1782977292785; Thu, 02 Jul 2026
 00:28:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260701023619.2730136-1-linchengming884@gmail.com>
 <stable-reply-mtd-macronix-66-20260701193800@kernel.org> <CAAyq3SY48RRSO1nN-uRH7HVnXbnvQ1_K823Lc_hRsCyVuf9L3g@mail.gmail.com>
 <DJNVRMSG4C6K.34EGBE463IOCZ@kernel.org>
In-Reply-To: <DJNVRMSG4C6K.34EGBE463IOCZ@kernel.org>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Thu, 2 Jul 2026 15:25:08 +0800
X-Gm-Features: AVVi8CcWlU27hjRKRNYS1yEHj59voSMvjse80wpxaUbcKd4sp8ZX2S5x4aeIs_k
Message-ID: <CAAyq3Sb6d4xtp-wEwM9EhMo5OSzjvsh450JcwyeEOh2NeLrA8Q@mail.gmail.com>
Subject: Re: [PATCH 6.6.y] mtd: spi-nor: macronix: Add post_sfdp fixups for
 Quad Input Page Program
To: Michael Walle <mwalle@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, stable@vger.kernel.org, tudor.ambarus@linaro.org, 
	pratyush@kernel.org, miquel.raynal@bootlin.com, richard@nod.at, 
	vigneshr@ti.com, linux-mtd@lists.infradead.org, alvinzhou@mxic.com.tw, 
	Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_002814_091354_F109EB0D 
X-CRM114-Status: GOOD (  23.67  )
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

SGkgTWljaGFlbCwKCk1pY2hhZWwgV2FsbGUgPG13YWxsZUBrZXJuZWwub3JnPiDmlrwgMjAyNuW5
tDfmnIgy5pel6YCx5ZubIOS4i+WNiDI6NDTlr6vpgZPvvJoKPgo+IE9uIFRodSBKdWwgMiwgMjAy
NiBhdCA0OjEzIEFNIENFU1QsIENoZW5nIE1pbmcgTGluIHdyb3RlOgo+ID4gSGkgU2FzaGEsCj4g
Pgo+ID4gU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPiDmlrwgMjAyNuW5tDfmnIgy5pel
6YCx5ZubIOS4iuWNiDg6Mzjlr6vpgZPvvJoKPiA+Pgo+ID4+IEkgY2FuJ3QgdGFrZSB0aGlzIHNl
cmllcyBmb3IgNi42Lnk6IHBhdGNoIDIgYWRkcyBmbGFzaF9pbmZvIGVudHJpZXMKPiA+PiB3aXRo
IGEgTlVMTCAubmFtZSwgYW5kIDYuNidzIHNwaV9ub3JfbWF0Y2hfbmFtZSgpIGhhcyBubyBOVUxM
IGd1YXJkCj4gPj4gKG9ubHkgYWRkZWQgdXBzdHJlYW0gaW4gYWM1YmZhOTY4YjYwKSwgc28gdGhl
IGxlZ2FjeSBwcm9iZS1ieS1uYW1lCj4gPj4gcGF0aCBjYW4gb29wcyBhdCBib290Lgo+ID4KPiA+
IFRoYW5rIHlvdSBmb3IgcG9pbnRpbmcgdGhpcyBvdXQgYW5kIGNhdGNoaW5nIHRoZSBwb3RlbnRp
YWwgaXNzdWUuCj4gPgo+ID4gSSBoYXZlIHZlcmlmaWVkIHRoaXMsIGFuZCB5b3UgYXJlIGFic29s
dXRlbHkgcmlnaHQuIFRoZSBpc3N1ZSBzdGVtcyBmcm9tCj4gPiB0aGUgc3RyY21wKG5hbWUsIG1h
bnVmYWN0dXJlcnNbaV0tPnBhcnRzW2pdLm5hbWUpIGV2YWx1YXRpb24gd2l0aGluIHRoZQo+ID4g
bGVnYWN5IHByb2JlIHBhdGguIFNpbmNlIDYuNi55IGxhY2tzIHRoZSBudWxsIGd1YXJkLCBwYXNz
aW5nIGEgTlVMTCAubmFtZQo+ID4gd2lsbCByZXN1bHQgaW4gYSBudWxsIHBvaW50ZXIgZGVyZWZl
cmVuY2UgaW4gc3RyY21wKCkgYW5kIGNhdXNlIGEga2VybmVsCj4gPiBvb3BzIGR1cmluZyBib290
Lgo+ID4KPiA+IEkgd2lsbCBhZGQgdGhlIC5uYW1lIHRvIHRoZSBuZXcgZmxhc2ggZW50cmllcyBh
bmQgc3VibWl0IGEgdjIgc2VyaWVzLgo+Cj4gTm8sIHBsZWFzZSBiYWNrcG9ydCB0aGUgbmVlZGVk
IHBhdGNoZXMuIFRoZSByZWFzb24gaXMgdGhhdCB0aGUgbmFtZQo+IHNob3VsZG4ndCBiZWNvbWUg
c29tZXRoaW5nIGFuIGFwcGxpY2F0aW9uIHJlbGllcyBvbiAoaXQgaXMgYWxzbwo+IGV4cG9zZWQg
dmlhIHN5c2ZzKS4KPgo+IEZvciBhbGwgcGVvcGxlIG5vdCB0b28gaW52b2x2ZWQ6IHdlIGFyZSBk
cm9wcGluZyB0aGUgbmFtZSBmb3IgbmV3Cj4gZmxhc2ggYWRkaXRpb25zLCBiZWNhdXNlIGl0IGlz
IGFsbW9zdCBhbHdheXMgd3JvbmcsIGR1ZSB0byBmbGFzaCBpZAo+IHJldXNlIGFtb25nIGFsbW9z
dCBhbGwgZmxhc2ggdmVuZG9ycy4KClRoYW5rIHlvdSBmb3IgdGhlIGNsYXJpZmljYXRpb24gcmVn
YXJkaW5nIHRoZSB1cHN0cmVhbSBwb2xpY3kgb24gZHJvcHBpbmcKZmxhc2ggbmFtZXMuIFRoYXQg
bWFrZXMgcGVyZmVjdCBzZW5zZSBnaXZlbiB0aGUgSUQgcmV1c2UgaXNzdWVzLgoKVW5mb3J0dW5h
dGVseSwgb3VyIGVtYWlscyBjcm9zc2VkIHBhdGhzLCBhbmQgSSBoYWQgYWxyZWFkeSBzdWJtaXR0
ZWQgdGhlCnYyIHNlcmllcyAod2hpY2ggYWRkcyB0aGUgLm5hbWUgYmFjaykganVzdCBiZWZvcmUg
c2VlaW5nIHlvdXIgbWVzc2FnZS4KUGxlYXNlIGRpc3JlZ2FyZCB0aGUgdjIgc3VibWlzc2lvbi4K
ClRvIGZvbGxvdyB5b3VyIGd1aWRhbmNlLCBJIHdpbGwgcHJlcGFyZSBhIHYzIHNlcmllcy4KTXkg
cGxhbiBpcyB0bzoKCjEuIEJhY2twb3J0IGNvbW1pdCBhYzViZmE5NjhiNjAgKCJtdGQ6IHNwaS1u
b3I6IGZpeCBmbGFzaCBwcm9iaW5nIikgYXMgdGhlCmZpcnN0IHBhdGNoIGluIHRoZSB2MyBzZXJp
ZXMgdG8gcmVzb2x2ZSB0aGUgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIGlzc3VlCmluIDYuNi55
LgoKMi4gU2VuZCBteSBmbGFzaCBhZGRpdGlvbiBwYXRjaGVzICh3aXRob3V0IHRoZSAubmFtZSBm
aWVsZCwgdXNpbmcgY29tbWVudHMKaW5zdGVhZCkgYXMgdGhlIHN1YnNlcXVlbnQgcGF0Y2hlcyBp
biB0aGUgc2VyaWVzLgoKRG9lcyB0aGlzIHN0cnVjdHVyZSBmb3IgdGhlIHYzIHNlcmllcyBsb29r
IGdvb2QgdG8geW91PwoKPgo+IC1taWNoYWVsCj4KPiA+Cj4gPj4KPiA+PiBQbGVhc2Ugc2VuZCBh
IHYyIHRoYXQgZWl0aGVyIG5hbWVzIHRoZSBuZXcgZW50cmllcyBvciBiYWNrcG9ydHMKPiA+PiBh
YzViZmE5NjhiNjAgZmlyc3QuCj4gPj4KPiA+PiBUaGUgNi4xMi55IHNlcmllcyBpcyBxdWV1ZWQs
IHRoYW5rcy4KPiA+Pgo+ID4+IC0tCj4gPj4gVGhhbmtzLAo+ID4+IFNhc2hhCj4gPgo+ID4gVGhh
bmtzLAo+ID4gQ2hlbmcgTWluZyBMaW4KPgoKVGhhbmtzLApDaGVuZyBNaW5nIExpbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
