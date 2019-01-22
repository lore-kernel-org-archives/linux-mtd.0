Return-Path: <SRS0=3GE2=P6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B176C282C4
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jan 2019 08:08:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C2572084C
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jan 2019 08:08:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qLxwaSZ+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C2572084C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PjrOqIOqzRu4djFVsQMT69Zv/3gMoMpNVKgE+Okz2H4=; b=qLxwaSZ++myNoz
	cg6DT0EaLBwijSRcSuFoa8qph4/SugHytEFOSEAi4DD9c6rlEPXKiICDK7IYFm35XhdxvuHZNikz0
	7ZtmsgnIuLUEU8psSoF9mXdJF1THWLPTYLimBzEe9044NG4CzkcpI3yzdHL+XXrhqDcPqHqVPM/En
	2MiKT1a7a67Iw8qz/PqFaoDP+MfS4eEdPmuDTP/SF7LWP6dDq+m03F/fcVj/z8+e6V+2BQWJItu6F
	D3Q0XEu7pVBkSLRlODOOTdGPFjS+OisD1B4qYdNnDw7dU+IeQObP+T6+TdPb9EyuaSfGm/27nN4fY
	gXV5xkFVNqpUoR/mRPcw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glr6z-0005p4-DR; Tue, 22 Jan 2019 08:08:45 +0000
Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glr6w-0005oQ-7O
 for linux-mtd@lists.infradead.org; Tue, 22 Jan 2019 08:08:43 +0000
Received: by mail.bootlin.com (Postfix, from userid 110)
 id 8D411209EF; Tue, 22 Jan 2019 09:08:40 +0100 (CET)
Received: from xps13 (aaubervilliers-681-1-37-87.w90-88.abo.wanadoo.fr
 [90.88.156.87])
 by mail.bootlin.com (Postfix) with ESMTPSA id 1B575206DC;
 Tue, 22 Jan 2019 09:08:30 +0100 (CET)
Date: Tue, 22 Jan 2019 09:08:30 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH 2/2] mtd: rawnand: use unnamed union in struct
 nand_op_parser_pattern_elem
Message-ID: <20190122090830.118eb6be@xps13>
In-Reply-To: <CAK7LNAQvD03By1PQJ8KZG-UqX+NVQcL6JU-5a-2ZVVovdgBpEQ@mail.gmail.com>
References: <1548142975-14219-1-git-send-email-yamada.masahiro@socionext.com>
 <1548142975-14219-3-git-send-email-yamada.masahiro@socionext.com>
 <20190122084944.420fcd4a@xps13>
 <CAK7LNAQvD03By1PQJ8KZG-UqX+NVQcL6JU-5a-2ZVVovdgBpEQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190122_000842_540997_B91E572F 
X-CRM114-Status: GOOD (  21.40  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Lucas Stach <dev@lynxeye.de>, Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, Linus Walleij <linus.walleij@linaro.org>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Stefan Agner <stefan@agner.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 Marek Vasut <marek.vasut@gmail.com>, Thierry Reding <thierry.reding@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, linux-tegra@vger.kernel.org,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzYWhpcm8sCgpNYXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQu
Y29tPiB3cm90ZSBvbiBUdWUsIDIyIEphbgoyMDE5IDE3OjAwOjU0ICswOTAwOgoKPiBPbiBUdWUs
IEphbiAyMiwgMjAxOSBhdCA0OjUwIFBNIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9v
dGxpbi5jb20+IHdyb3RlOgo+ID4KPiA+IEhpIE1hc2FoaXJvLAo+ID4KPiA+IE1hc2FoaXJvIFlh
bWFkYSA8eWFtYWRhLm1hc2FoaXJvQHNvY2lvbmV4dC5jb20+IHdyb3RlIG9uIFR1ZSwgMjIgSmFu
Cj4gPiAyMDE5IDE2OjQyOjU1ICswOTAwOgo+ID4gIAo+ID4gPiBBbHRob3VnaCBkcml2ZXJzIGRv
IG5vdCBkaXJlY3RseSBnZXQgYWNjZXNzIHRvIHRoZSBwcml2YXRlIGRhdGEgb2YKPiA+ID4gaW5z
dHJ1Y3Rpb24gcGF0dGVybnMsIGxldCdzIHVzZSB1bm5hbWVkIHVuaW9uIGZpZWxkIHRvIGJlIGNv
bnNpc3RlbnQKPiA+ID4gd2l0aCBuYW5kX29wX2luc3RyLgo+ID4gPiAgCj4gPgo+ID4gQWN0dWFs
bHkgdGhpcyBpcyBob3cgd2Ugd3JvdGUgaXQgdGhlIGZpcnN0IHRpbWUuIFRoZW4gd2UgZ290IHJv
Ym90cwo+ID4gcmVwb3J0aW5nIHRoYXQgYW5vbnltb3VzIHVuaW9ucyB3aGVyZSBub3QgYWxsb3dl
ZCB3aXRoIG9sZGVyIChzdGlsbAo+ID4gc3VwcG9ydGVkKSBHQ0MgdmVyc2lvbnMgYW5kIEkgaGFk
IHRvIGRvIHRoaXM6Cj4gPgo+ID4KPiA+IGNvbW1pdCBjMWE3MmUyZGJiNGFiYjkwYmQ0MDg0ODBk
N2M0OGJhNDBjYjc5OWNlCj4gPiBBdXRob3I6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxA
ZnJlZS1lbGVjdHJvbnMuY29tPgo+ID4gRGF0ZTogICBGcmkgSmFuIDE5IDE5OjExOjI3IDIwMTgg
KzAxMDAKPiA+Cj4gPiAgICAgbXRkOiBuYW5kOiBGaXggYnVpbGQgaXNzdWVzIGR1ZSB0byBhbiBh
bm9ueW1vdXMgdW5pb24KPiA+Cj4gPiAgICAgR0NDLTQuNC40IHJhaXNlcyBlcnJvcnMgd2hlbiBh
c3NpZ25pbmcgYSBwYXJhbWV0ZXIgaW4gYW4gYW5vbnltb3VzCj4gPiAgICAgdW5pb24sIGxlYWRp
bmcgdG8gdGhpcyBraW5kIG9mIGZhaWx1cmU6Cj4gPgo+ID4gICAgIGRyaXZlcnMvbXRkL25hbmQv
bWFydmVsbF9uYW5kLmM6MTkzNjoKPiA+ICAgICAgICAgd2FybmluZzogbWlzc2luZyBicmFjZXMg
YXJvdW5kIGluaXRpYWxpemVyCj4gPiAgICAgICAgIHdhcm5pbmc6IChuZWFyIGluaXRpYWxpemF0
aW9uIGZvciAnKGFub255bW91cylbMV0uPGFub255bW91cz4nKQo+ID4gICAgICAgICBlcnJvcjog
dW5rbm93biBmaWVsZCAnZGF0YScgc3BlY2lmaWVkIGluIGluaXRpYWxpemVyCj4gPiAgICAgICAg
IGVycm9yOiB1bmtub3duIGZpZWxkICdhZGRyJyBzcGVjaWZpZWQgaW4gaW5pdGlhbGl6ZXIKPiA+
Cj4gPiAgICAgV29yayBhcm91bmQgdGhlIHNpdHVhdGlvbiBieSBuYW1pbmcgdGhlc2UgdW5pb25z
Lgo+ID4KPiA+ICAgICBGaXhlczogODg3OGIxMjZkZjc2ICgibXRkOiBuYW5kOiBhZGQgLT5leGVj
X29wKCkgaW1wbGVtZW50YXRpb24iKQo+ID4gICAgIFJlcG9ydGVkLWJ5OiBBbmRyZXcgTW9ydG9u
IDxha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPgo+ID4gICAgIFNpZ25lZC1vZmYtYnk6IE1pcXVl
bCBSYXluYWwgPG1pcXVlbC5yYXluYWxAZnJlZS1lbGVjdHJvbnMuY29tPgo+ID4gICAgIFRlc3Rl
ZC1ieTogQW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4KPiA+ICAgICBT
aWduZWQtb2ZmLWJ5OiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBmcmVlLWVsZWN0
cm9ucy5jb20+Cj4gPiAgCj4gCj4gCj4gSG1tLCBob3cgY29tZSBBbmRyZXcncyBjb21waWxlciB3
YXMgZmluZSB3aXRoIHRoZSBmb2xsb3dpbmc/Cj4gCj4gc3RydWN0IG5hbmRfZmxhc2hfZGV2IHsK
PiAgICAgICAgIGNoYXIgKm5hbWU7Cj4gICAgICAgICB1bmlvbiB7Cj4gICAgICAgICAgICAgICAg
IHN0cnVjdCB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgdWludDhfdCBtZnJfaWQ7Cj4gICAg
ICAgICAgICAgICAgICAgICAgICAgdWludDhfdCBkZXZfaWQ7Cj4gICAgICAgICAgICAgICAgIH07
Cj4gICAgICAgICAgICAgICAgIHVpbnQ4X3QgaWRbTkFORF9NQVhfSURfTEVOXTsKPiAgICAgICAg
IH07Cj4gICAgICAgICB1bnNpZ25lZCBpbnQgcGFnZXNpemU7Cj4gICAgICAgICAuLi4KPiB9Owo+
IAoKSXQgaXMgcHJvYmFibHkgbm90IDopCgo+IAo+IAo+IFRoZSBjdXJyZW50IG1pbmltdW0gdmVy
c2lvbiBpcyBHQ0MgNC42Cj4gKGNvbW1pdCBjYWZhMDAxMGNkNTFmYjcpCj4gYnV0IEkgYW0gbm90
IHN1cmUgaWYgdGhpcyByZXN0cmljdGlvbiBpcyByZW1haW5pbmcuCj4gCgpUaGF0J3MgcmlnaHQs
IGNhbiB5b3UgcGxlYXNlIHRlc3QgaWYgdGhpcyBsaW1pdGF0aW9uIGlzIHN0aWxsCm9uZ29pbmcg
d2l0IEdDQyA0LjY/CgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
