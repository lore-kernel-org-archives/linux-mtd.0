Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31BBDC5AD7B
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Aug 2026 12:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eDgDsxqw5KbhGBEVu6QZGLKqgk7CKNXfJHHYdnQ4LSg=; b=f6RfiMNTXNY778
	NIgaO5dXFAE5rJvcJWAEqyXV02YhOmImFOzrWfNP1ljSXeTf3sk6k0eO3BJZv6jxQ5njSyVoRXuKB
	MsaHkAzWNIKCBoRQczUgndk4UDuCgBAytnHbRc8z1biOoS/35IWzJ+IkN4HTDX+ON67IHtNyNtCLr
	FAj9h3AlrK4W6p8Spl7FgaPNYHB+mtz72fIZKvlqWcK97F+qy3Vb/OUxIfnUEZyi8fsrFioWmssGx
	AilavGOQoJc2NORCAsOeuvd6DF5YxQQIwXdirCulFD+hPfXppXst0ILWe0ZdSPyXgoR6K59tKpLZ2
	E86mFN5j6N/e+Hw338Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtPMY-0000000BoQe-2eTu;
	Mon, 10 Aug 2026 12:44:18 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtPMT-0000000BoLS-0Xiu
	for linux-mtd@lists.infradead.org;
	Mon, 10 Aug 2026 12:44:17 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BCD811A152A;
	Mon, 10 Aug 2026 12:44:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 901B26033B;
	Mon, 10 Aug 2026 12:44:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 08E6111C4A544;
	Mon, 10 Aug 2026 14:43:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786365848; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kuddQJCPQ9+RgCTheiPwlqc000JoApsk76gda+ZHiC0=;
	b=KwcdlRk/VuRD4S4Lk7wbP/Pfi6gDlzBK/JkM05Ts99gZhRmwjlyNZALfw+E7WyM8WG5hp5
	41QjgqIbkm1ADEdvVGD4X9Km36MOkGUNsV1+uSTzhKn16OuO/6+3Z92BiqbYa2yNKHeW2S
	UGhbgdylf9NuuxDak5GjSNUO90/N4YgUpbC6/xJ4MdqU7ciinzyWb+tbamj9+kJAt9oW0M
	/NfD9Z/1J5uHEGFF5V8lPbeUmbw9zArJ0x9oS3CcBIbeGaNk7h/TzZZ+Q9loGSCB/f+ne0
	zvjFTcvCVRrGuKtAdojG3ZYZAI+aF5+MJp99dEZXgT51USEl1pWj4Raag6et/Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dominique MARTINET <dominique.martinet@atmark-techno.com>
Cc: Md Sadre Alam <md.alam@oss.qualcomm.com>,  richard@nod.at,
  vigneshr@ti.com,  tudor.ambarus@linaro.org,  s-k6@ti.com,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  varadarajan.narayanan@oss.qualcomm.com
Subject: Re: [PATCH 1/2] mtd: spinand: winbond: add support for W25N04LW
In-Reply-To: <anmLsPcXRk0VAQSW@atmark-techno.com> (Dominique MARTINET's
	message of "Mon, 10 Aug 2026 17:28:32 +0900")
References: <20260807064339.1632249-1-md.alam@oss.qualcomm.com>
	<20260807064339.1632249-2-md.alam@oss.qualcomm.com>
	<anmLsPcXRk0VAQSW@atmark-techno.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 10 Aug 2026 14:43:52 +0200
Message-ID: <87mruuqh6f.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_054413_411231_5A8BD660 
X-CRM114-Status: GOOD (  16.54  )
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

SGkgRG9taW5pcXVlLAoKT24gMTAvMDgvMjAyNiBhdCAxNzoyODozMiArMDksIERvbWluaXF1ZSBN
QVJUSU5FVCA8ZG9taW5pcXVlLm1hcnRpbmV0QGF0bWFyay10ZWNobm8uY29tPiB3cm90ZToKCj4g
TWQgU2FkcmUgQWxhbSB3cm90ZSBvbiBGcmksIEF1ZyAwNywgMjAyNiBhdCAxMjoxMzozOFBNICsw
NTMwOgo+PiBBZGQgc3VwcG9ydCBmb3IgV2luYm9uZCBXMjVOMDRMVyA0R2JpdCBTUEktTkFORC4K
Pj4gSXQgaGFzIDgtYml0IG9uLWRpZSBFQ0MgYW5kIGEgNDA5NisyNTYgYnl0ZSBwYWdlCj4+ICg0
MDk2IGJ5dGUgbWFpbiBhcmVhLCAxMjggYnl0ZSB1c2FibGUgT09CIG9uY2UKPj4gb24tY2hpcCBF
Q0MgaGlkZXMgdGhlIDEyOCBieXRlIHBhcml0eSBhcmVhKSwKPj4gb3JnYW5pemVkIGFzIDIwNDgg
YmxvY2tzIG9mIDY0IHBhZ2VzIGVhY2gsIHVubGlrZQo+PiB0aGUgZXhpc3RpbmcgMjA0OCBieXRl
IHBhZ2UgVzI1TjA0S1YvVzI1TjA0S1cgcGFydHMuCj4KPiBUaGlzIGlzIHByZXR0eSBnb29kIHRp
bWluZywgSSB3YXMganVzdCBsb29raW5nIGF0IHNlbmRpbmcgYSBwYXRjaCBmb3IKPiBXMjVOMDRM
VyBteXNlbGYhCj4KPiBJIGFncmVlIHdpdGggTWlxdcOobCB0aGF0IHlvdXIgcGF0Y2ggbG9va3Mg
b2RkLCB5b3Ugd3JvdGUKPj4gKwkJICAgICBOQU5EX01FTU9SRygxLCA0MDk2LCAxMjgsIDY0LCAy
MDQ4LCA0MCwgMSwgMSwgMSksCj4gYnV0IHRoZSBlcmFzZSBibG9ja3MgYXJlIDI1NksgbG9uZyBz
byBpdCBzaG91bGQgYmUKPiArCQkgICAgIE5BTkRfTUVNT1JHKDEsIDQwOTYsIDI1NiwgNjQsIDIw
NDgsIDQwLCAxLCAxLCAxKSwKPgo+IGRpZCB5b3UgYWN0dWFsbHkgdGVzdCB0aGlzIGRldmljZT8K
Pgo+IElmIGl0IGhlbHBzLCB0aGUgZGF0YXNoZWV0IGZvciBXMjVOMDRMV1pFeHggLyBXMjVOMDRM
V1RCeHggaXMgZnJlZWx5Cj4gYXZhaWxhYmxlIGZyb20gZGlnaWtleSBoZXJlWzFdCj4gWzFdIGh0
dHBzOi8vbW0uZGlnaWtleS5jb20vVm9sdW1lMC9vcGFzZGF0YS9kMjIwMDAxL21lZGlhcy9kb2N1
cy83MTgyL1cyNU4wNExXWkV4eF9XMjVOMDRMV1RCeHhfUmV2RF8yMDI1LTA4LTA1LnBkZgoKVGhh
bmtzIGZvciBhbGwgdGhlIGZlZWRiYWNrLCBTYWRyZSwgY2FuIHlvdSBwbGVhc2UgcHJvcG9zZSBh
biB1ZHBhdGUKd2l0aCB0aGVzZSBkZXRhaWxzIGFuZCBjaGFuZ2VzPwoKPiAoQW5kIGl0IGFsc28g
c3VwcG9ydHMgY29udGludW91cyByZWFkLCBzbyBJJ20gY3VyaW91cyB0byBzZWUgaWYgaXQnZAo+
IHdvcmsgd2l0aCB0aGUgcmVjZW50IGNvbnRpbm91cyByZWFkIHN1cHBvcnQgZnJvbSBNaXF1w6hs
WzJdIG1lcmdlZCBpbgo+IDcuMi4uLiBJJ20gbm90IGZhbWlsaWFyIHdpdGggdGhlIHN1YnN5c3Rl
bSBzbyB3aWxsIG5lZWQgYSBiaXQgb2YgdGltZSB0bwo+IHBsdWcgYWxsIHRoZSBob29rcyBpbiBw
cm9wZXJseSkKPiBbMl0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tdGQvMjAyNjA0
Mjktd2luYm9uZC12Ni0xOC1yYzEtY29udC1yZWFkLXYzLTAtMGYzOGIzYzIyOWFkQGJvb3RsaW4u
Y29tLwoKSWYgaXQgaGFzIGNvbnRpbnVvdXMgcmVhZCwgaXQgcmVxdWlyZXMgdGhlIGZsYWcgYW5k
IGEgaG9vayB0bwplbmFibGUvZGlzYWJsZSB0aGUgZmVhdHVyZS4gVGhlIGV4aXN0aW5nIFdpbmJv
bmQgaGVscGVyIG1heSBhbHJlYWR5IGJlCmVub3VnaCBmb3IgaXQuIFlvdSBjYW4gdGVzdCBpdCB3
aXRoIGEgcmVjZW50IHZlcnNpb24gb2YgbXRkLXV0aWxzLCBJCmFkZGVkIG9wdGlvbnMgdG8gbmFu
ZGR1bXAsIG5hbmRiaXRlcnJzIGFuZCBmbGFzaF9zcGVlZCBmb3IgdGhhdC4KCklmIFNhZHJlIGRv
b2Vzbid0IGRvIGl0LCB5b3UgY2FuIHByb3Bvc2UgYSBmb2xsb3ctdXAgcGF0Y2guCgpUaGFua3Ms
Ck1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
