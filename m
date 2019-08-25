Return-Path: <SRS0=xwO+=WV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF932C3A5A1
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Aug 2019 20:29:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AAB5206E0
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Aug 2019 20:29:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WIdFOKnY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qIjSaJux"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AAB5206E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4PlwtJaBtgAvdmOZg4oaafPnGZuKu0Lv5EipT6dZ14Q=; b=WIdFOKnYq7q1L6
	3AucfHe4iWoV8EaNmI2ryi3gmTNC+8DCiy/pQAYhFvd9CXKhW6zze190CPTjLMqJs44Xld2hk9zGK
	tydRm0lTSVTCkPqHBRkOoWwB+aGNzuywcvfBFD8OIImkVY4fa2Su39Qc9IjGj3k/HRVDlhAilJbrl
	lNCTnYl5Q+1XT1kL9buVMdDxKqDaHY/a/7y5Naypyifku4GhJ1hNcdCr2/aqBZlfDutXV1FPX965E
	/Tg1KjE5bjH6wTSMFKQOC3BoMJ34EZYIfRtZsnnyRS3p6zVS/M/7VpNQvpbo5Q8wJ4Q0Mm267EVQg
	uSAKPx4tVYg2/V/Dth9g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i1z81-0001R0-1I; Sun, 25 Aug 2019 20:28:45 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i1z7x-0001Qc-Su
 for linux-mtd@lists.infradead.org; Sun, 25 Aug 2019 20:28:43 +0000
Received: by mail-wr1-x42d.google.com with SMTP id u16so13355150wrr.0
 for <linux-mtd@lists.infradead.org>; Sun, 25 Aug 2019 13:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=V9cYYwBjQ4CUbSw4feoqebzQqKyBoKUM68shR8BYXLA=;
 b=qIjSaJuxuI0N9XDbjJFj3VA29/L+LSb626rHLYoxpNOyvWIdTNBjhca/jC+DyiBciR
 aCII5L5zJ6Swpz2eQZsAhrcHeDy0edxuqdXlyP8Q6vp5Nx69A4v45nLs2RpcnfFY+41y
 oRh6PXII05m/3BVo/L/xfBOinS034wvN+F2li7hT4JVz25QdJ34TuLNArXrKCxqX8dHV
 ddAihRs5uomHQ/+xvMVuqa2rkVY9iwydCf8RgPU8yNUWxrKys5xo3lAwkqlcIBRQ41dD
 ChCv5HUlgDKCsf0NwzjK4A6RpwSjlOdNhNoz3bk2YdGShc4+Ut4KVLDnGBaEPooV5PUb
 mm8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=V9cYYwBjQ4CUbSw4feoqebzQqKyBoKUM68shR8BYXLA=;
 b=j+EyWKnFUNbbwM1cNmCE3FiuyHKI6sEdgJQSyBrwq/1NQSFiREDEGSuM+PAZRsbUMU
 bncOK4pi2Evnt4+oBlCsK6kF4E6WI5yfSG6/tFfm0iNrBtkBm7zOsMskrj/WBRTpzSyC
 /AyJNCPi2hMNdpJvAr/v/9Z3vDk6SZGAG1z54sNJOgez88B1pRMC8lpApNTSL20RzmW/
 fhnX1zFagkXXNefSAZU5pLht+bXQuAvzT9ikuXoHN0ZvF0c8esPzxTgna8SjwE7mL8CR
 T0iob+Q0L9PsKYEe/qemJ7oJQSim0a8C8AdUp4NIMIvKzwb+CE/xk2JrmarefNa8qMJp
 xISg==
X-Gm-Message-State: APjAAAVqAMS0J7Eqo07AkuxyR6T888DAMVQKQoQKf02zFom3WEqNzC3G
 d4ETdY805I75CKlsXxNrBVPI4wx+z1eQgwuSd6U4u4dXcFc=
X-Google-Smtp-Source: APXvYqwkXhQP6to2Pq19/K9jrepFG6K/G1GaYPCokZozxkIdyB68zV2hjfqk1vJXWS5DBoAnWtDaQz1i8AOmRpQEJxg=
X-Received: by 2002:adf:f287:: with SMTP id k7mr18256968wro.183.1566764920525; 
 Sun, 25 Aug 2019 13:28:40 -0700 (PDT)
MIME-Version: 1.0
References: <CFF08794-67A7-4383-92BC-61AD0D2D3661@gmail.com>
In-Reply-To: <CFF08794-67A7-4383-92BC-61AD0D2D3661@gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sun, 25 Aug 2019 22:28:28 +0200
Message-ID: <CAFLxGvwpR9e15vgcKZ1JadHto+xP2T=stEa3rfJ7vbHrt60sJg@mail.gmail.com>
Subject: Re: Debian 10 boot problems with corrupted rw /var
To: Travis Griggs <travisgriggs@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190825_132841_963112_4B5AA203 
X-CRM114-Status: GOOD (  14.88  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VHJhdmlzLAoKT24gVHVlLCBBdWcgMjAsIDIwMTkgYXQgNzoxNyBQTSBUcmF2aXMgR3JpZ2dzIDx0
cmF2aXNncmlnZ3NAZ21haWwuY29tPiB3cm90ZToKPiAxLiBIb3cgY2FuIEkgZ2V0IHRvIHRoZSBi
b3R0b20gb2Ygd2hhdC93aHkgbXkgL3ZhciBmaWxlIHN5c3RlbSBpcyBnZXR0aW5nIGNvcnJ1cHRl
ZD8KClRoaXMgc291bmRzIGEgbGl0dGxlIGxpa2UgdGhlIFVCSUZTIHhhdHRycyBpc3N1ZSBJJ3Zl
IGJlZW4gaHVudGluZwpkb3duLiBGaXhlcyBhcmUgdXBzdHJlYW0gYnV0IG5vdCBpbiBzdGFibGUt
dHJlZXMgeWV0LgpDYW4geW91IHBsZWFzZSBnaXZlIExpbnVzJyB0cmVlIGFzIG9mIHRvZGF5IGEg
dHJ5PwoKPiAyLiBJIGFjY2VwdCB0aGF0IFVCSUZTIGRvZXNuJ3QgcHJvdGVjdCBtZSBmcm9tIHBv
d2VyLWN5Y2xlIGNvcnJ1cHRpb24gaXNzdWVzIDEwMCUuIEkgaGF2ZSBiZWVuIGxlYWQgdG8gYmVs
aWV2ZSBpdCBzaW1wbHkgbWFrZXMgaXQgbW9yZSByb2J1c3QgaW4gdGhlIHByZXNlbmNlIG9mIHBv
d2VyIGN5Y2xlIGV2ZW50cy4gQnV0IHdoeSBkb2VzIGl0IGFsd2F5cyBmYWlsIGJldHdlZW4gMTYw
MCBhbmQgMTgwMCBpdGVyYXRpb25zPyBJZiBpdCB3YXMgdHJ1bHkgcmFuZG9tLCBJJ2QgZXhwZWN0
IGl0IHRvIGZhaWwgYXQgcmFuZG9tIHBvd2VyIGN5Y2xlIGV2ZW50cy4gSXQncyBsaWtlIHNvbWUg
Y291bnRlciBpcyB3ZWFyaW5nIG91dCB0aG91Z2guCgpVQklGUyBzaG91bGQgbm90IGRpZSBmcm9t
IHBvd2VyLWN1dHMuIEkgaGF2ZSBubyBpZGVhIHdoeSBpdCBmYWlscyBpbgp5b3VyIGNhc2UgYmV0
d2VlbiAxNjAwIGFuZCAxODAwLgoKPiAzLiBUaGUgYXNzdW1wdGlvbiBJJ20gd29ya2luZyBvbiBo
ZXJlIGlzIHRoYXQgaGF2aW5nIHRoZSBtYWpvcml0eSBvZiB0aGUgc3lzdGVtIGJlIHJlYWQtb25s
eSB3b3VsZCBpbmNyZWFzZSB0aGUgcm9idXN0bmVzcyBvZiB0aGUgc3lzdGVtIChsZXNzIGJyaWNr
IGFibGUpLiBCdXQgaXQgc2VlbXMgaXQncyBvbmx5IG1hZGUgaXQgc28gaXQgYm9vdHMgZnVydGhl
ciwgYnV0IHVsdGltYXRlbHkgc3RpbGwgYnJpY2tzLiBXaGF0IGNhbiBJIGFkZCBpdCB0byBtYWtl
IHRoZSByby9ydyBzcGxpdCBhY3R1YWxseSBtZWFuaW5nZnVsPwoKV2VsbCwgdGhlIGJvb3QgZmFp
bHMgYmVjYXVzZSB5b3VyIHN5c3RlbSBkZXBlbmRzIGhhcmQgb24gYSBydyBVQklGUz8KVXN1YWxs
eSBzdWNoIGEgc3BsaXQgaXMgdXNlZnVsIHRvIG1ha2UgdXBkYXRlIGNvbmNlcHRzIGVhc3kgb3Ig
dG8KZGV0ZWN0IGJhZCBwcm9ncmFtcy4KCj4gNC4gSXTigJlzIGJlZW4gc3VnZ2VzdGVkIHRoYXQg
SSBzaG91bGQgcGxhY2UgdGhlIHR3byBzZXBhcmF0ZSB2b2x1bWVzIChyb290ZnMgYW5kIC92YXIg
b24gc2VwYXJhdGUgbXRkcykuIEnigJltIGdvaW5nIHRvIGV4cGVyaW1lbnQgd2l0aCB0aGF0LCBi
dXQgd2lsbCBpdCBtYWtlIGEgZGlmZmVyZW5jZT8KCk5ldmVyIGhhdmUgbXVsdGlwbGUgVUJJIGlu
c3RhbmNlcyBvbiB0aGUgc2FtZSBmbGFzaC4gVUJJIHNob3VsZCB1c2UgYXMKbXVjaCBmcm9tIHRo
ZSBmbGFzaCBhcyBpdCBjYW4gdG8gaGF2ZSBhIGxhcmdlCndlYXIgbGV2ZWxpbmcgZG9tYWluLiBP
biB0b3Agb2YgVUJJIHlvdSBjYW4gaGF2ZSBtdWx0aXBsZSB2b2x1bWVzIGlmIHlvdSB3YW50LgoK
LS0gClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
