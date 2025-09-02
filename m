Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F617CA0FFE
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Sep 2025 07:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=otK32Qdy0akRuXkOUqpt8RqvE0MT/G6xQjY1eAhDMJc=; b=VGUWgTCjAF3rBy
	mn9ZyH3GQJuupP6LCfJAigPQR6fLiogatQqlo3ItUJ3K1cMgkh4XebdRrVH017MjoEl+Z3EEi34l2
	HtalG8JTcpUIHlEX5DIlZiQxlruYNTO+/0QuGg09KF5Qcdc4q1HDq+tIFBYU+qkE/nNzXVV8UJb3j
	my75cW8RDiSz8eqCK6jOekMOYaBV/qFFOMb555quOMi66MpYAKo2qP6E0lssppcr2L5IozDPO/Ci6
	IBrKayUHeCUakc+V8aYIS7RlEvqWAB4K3JOufbA6MbfQRDiQwHwgQXN/Z8pMojPxAKjxxpjh5/XON
	LfuFcbl5sQKVYGCR6LFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utLag-0000000FmsN-1HrR;
	Tue, 02 Sep 2025 07:38:06 +0000
Received: from mail.thorsis.com ([217.92.40.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utLZy-0000000FmgN-2jXv
	for linux-mtd@lists.infradead.org;
	Tue, 02 Sep 2025 07:37:24 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7EB0B14807F6;
	Tue,  2 Sep 2025 09:37:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1756798640; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BN5rmZ3Xmdnj4GOMlRZw4tipJjzFnAUUFeXUaKQC9SI=;
	b=Jx528d/6GSON+C1FFzFQKq75vxXgJYj1aSooP3r6s4/coLwQUfKbT17XELsKIxTpjWvdOr
	LO8nOh6z5UnpmjWHUCc/6Hr8hcxYXP/N/2LhU7YhJcGd7EMMkSdLbq2M1jK/AAb+uCYPDN
	u0fTIvBiQIg+dqTOKuYvqjFnCXI6xzaUUjuCIrMcq/ILtbfiKwztXtm8sHWf1hFuSSsJsa
	gmjysuUCcBZAWIZMPgvOqXEs0zCt7bIAfgUAaOi59b+CnzoR/jWZIJRGenw6eNtb0U3peS
	qJ3XXO6jLsSG1TqMDiUNH5puNC6s1mis4mkd9UIHK+EBWBP4Wi5foRh0UrILnQ==
Date: Tue, 2 Sep 2025 09:37:17 +0200
From: Alexander Dahl <ada@thorsis.com>
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: State of the UBI fastmap feature
Message-ID: <20250902-life-domestic-c341a8992cac@thorsis.com>
Mail-Followup-To: Richard Weinberger <richard.weinberger@gmail.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250902-yarn-from-020874b4da63@thorsis.com>
 <CAFLxGvzO2yszspJtd_A3BSTCRNSF+ts_5+2aMkNksxM48DYEwA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFLxGvzO2yszspJtd_A3BSTCRNSF+ts_5+2aMkNksxM48DYEwA@mail.gmail.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_003722_875660_E2B06724 
X-CRM114-Status: GOOD (  20.97  )
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

SGVsbG8gUmljaGFyZCwKCkFtIFR1ZSwgU2VwIDAyLCAyMDI1IGF0IDA5OjIzOjA0QU0gKzAyMDAg
c2NocmllYiBSaWNoYXJkIFdlaW5iZXJnZXI6Cj4gT24gVHVlLCBTZXAgMiwgMjAyNSBhdCA4OjAw
4oCvQU0gQWxleGFuZGVyIERhaGwgPGFkYUB0aG9yc2lzLmNvbT4gd3JvdGU6Cj4gPiBIZWxsbyBl
dmVyeW9uZSwKPiA+Cj4gPiBhZnRlciB1c2luZyBVQkkgZm9yIGFsbW9zdCAxNSB5ZWFycyBub3cg
d2l0aG91dCBmYXN0bWFwLCBJJ20gY3VycmVudGx5Cj4gPiBleHBlcmltZW50aW5nIHdpdGggdGhh
dCBmZWF0dXJlLiAgVGhlIGhlbHAgdGV4dCBpbiBLY29uZmlnIG1lbnUKPiA+IChkcml2ZXJzL210
ZC91YmkvS2NvbmZpZykgc3RpbGwgc2F5cyAiRXhwZXJpbWVudGFsIGZlYXR1cmUiIGFuZAo+ID4g
ZnVydGhlciBkb3duOgo+ID4KPiA+ID4gSW1wb3J0YW50OiB0aGlzIGZlYXR1cmUgaXMgZXhwZXJp
bWVudGFsIHNvIGZhciBhbmQgdGhlIG9uLWZsYXNoCj4gPiA+IGZvcm1hdCBmb3IgZmFzdG1hcCBt
YXkgY2hhbmdlIGluIHRoZSBuZXh0IGtlcm5lbCB2ZXJzaW9ucwo+ID4KPiA+IElzIHRoaXMgc3Rp
bGwgdGhlIGN1cnJlbnQgc3RhdGU/ICBJIGNhbiBub3QgcmVtZW1iZXIgc2VpbmcgYW55IHBhdGNo
ZXMKPiA+IHRvdWNoaW5nIGZhc3RtYXAgaW4gdGhlIGxhc3QgdGltZS4gIEFyZSB0aGVyZSBwbGFu
cyB0byBzdGFiaWxpemUgdGhpcz8KPiA+IFdpbGwgdGhlcmUgYmUgY2hhbmdlcyBpbiB0aGUgb24t
Zmxhc2ggZm9ybWF0PyAgRG8gZm9sa3MgZXZlbiB1c2UgdGhpcwo+ID4gZmVhdHVyZT8gIEluIHBy
b2R1Y3Rpb24/Cj4gCj4gSSBkb27igJl0IGV4cGVjdCBjaGFuZ2VzIHRvIHRoZSBvbi1kaXNrIGZv
cm1hdCwgYnV0IHRoZSBudW1iZXIgb2YgbmV3IHJhdyBOQU5ECj4gZGV2aWNlcyBiZWluZyBpbnRy
b2R1Y2VkIGlzIG5vdyBjbG9zZSB0byB6ZXJvLiBBcyBhIHJlc3VsdCwgdGhlIHVzZXIKPiBiYXNl
IGlzIHZlcnkgc21hbGwsCj4gYW5kIHN1YnRsZSBidWdzIGFyZSBsaWtlbHkgdG8gcmVtYWluIHVu
ZGlzY292ZXJlZC4KCldlIGFyZSBzdGlsbCB1c2luZyBpdCBpbiBjb3N0LXNlbnNpdGl2ZSBwcm9k
dWN0cy4gIFRob3NlIHJhdyBOQU5ECmZsYXNoIGNoaXBzIGFyZSBhIGxvdCBjaGVhcGVyIHRoYW4g
ZU1NQyBvciBldmVuIE5PUiBmbGFzaHMgb2YgdGhlIHNhbWUKc2l6ZS4KCj4gRmFzdG1hcCBkb2Vz
IGhhdmUgdXNlcnMsIGluY2x1ZGluZyBpbiBwcm9kdWN0aW9uLAo+IGJ1dCBJIGRvbuKAmXQgaGF2
ZSBjb25jcmV0ZSBudW1iZXJzLiBBbmQgSSBkb24ndCBrbm93IHRoZWlyIHdvcmtsb2FkLgo+IFRo
YXQgc2FpZCwgRmFzdG1hcCBzaG91bGQgd29yayBidXQgSSBzdGlsbCBhbnRpY2lwYXRlIHBlcmZv
cm1hbmNlIGFuZAo+IHJ1bnRpbWUgaXNzdWVzLgo+IAo+IEkgZ3Vlc3MgeW91ciBtb3RpdmF0aW9u
IGlzIHJlZHVjaW5nIHRoZSBhdHRhY2ggdGltZT8KCkluZGVlZC4gIE5lZWQgdG8gcmVkdWNlIGJv
b3QgdGltZSBoZXJlLCBhbmQgVUJJIGlzIGF0dGFjaGVkIHR3aWNlLgpPbmNlIGluIFUtQm9vdCB0
byByZWFkIHRoZSBrZXJuZWwgaW1hZ2UgYW5kIHRoZW4gYWdhaW4gaW4gTGludXguCgpHcmVldHMK
QWxleAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
