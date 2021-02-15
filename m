Return-Path: <SRS0=LIjS=HR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80A82C433DB
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Feb 2021 19:20:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C75E64E16
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Feb 2021 19:20:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C75E64E16
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=h73W+l4EA0GvrDYF5EwaeldxrYTAkZ2UCHEiQrsc3Lk=; b=KnMVGcv+tn8xAmRPrATBKq4cv
	rOVUtDVHUDpwbmmQL+Cs3Q5q17fCp4NgGPlSGSVIZIrZIu9qJqMf9UeEBnPx4JgkA7DCn10M0XjJM
	vJJxvhcUwdpoWVewRCRNeS8/mTWEpQsKK/LFki3zr+VW38CbTZpWI/TdbvdgfG3ME97Z9jds95EHo
	35TGAnu39UElDeUICuU4ByVSd04QNGfkzIaHZIbq4KEVV83lnLLiSXgudAzS0uWhh6i0Ej0R+d5jo
	lxUr8+F+HXmovfjmqCEffJI8H41ZfF5kY8+47AiHMPm5S2LIBLnSKhbbiYEQbssbTWA8ugMSrcjEV
	OD1SKL8Rw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lBjP1-0000DA-4E; Mon, 15 Feb 2021 19:19:23 +0000
Received: from m42-2.mailgun.net ([69.72.42.2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lBjOv-0000Bp-P1
 for linux-mtd@lists.infradead.org; Mon, 15 Feb 2021 19:19:20 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1613416758; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=j/f3tmtSL2nPpj1djxZ+o8iXqVNVb7TVceUokeZt5Wc=;
 b=QiDxZ5ogLZN5EQze0irq7+sEJtNsXz+CcQZ26lXhzIA4f4h4iOMYiKfi9wzHRNAOTvniaXdr
 fxo1ddPLFXj/JHcjenwdzIlSqhPJAn1assbHlP/X7yuRJy2Fp3/hAOKlc23GTssjSHfKYxhJ
 MT6MgYfDHfW6XDfaG9dbce8WV6o=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyJkZDQ0ZiIsICJsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 602ac92b8e43a988b73390bc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 15 Feb 2021 19:19:07
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 29EDAC43465; Mon, 15 Feb 2021 19:19:07 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: mdalam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id F3C8EC433C6;
 Mon, 15 Feb 2021 19:19:05 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 16 Feb 2021 00:49:05 +0530
From: mdalam@codeaurora.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd: rawnand: qcom: update last code word register
In-Reply-To: <20210215094055.1c3847f8@xps13>
References: <1613337451-8002-1-git-send-email-mdalam@codeaurora.org>
 <20210215094055.1c3847f8@xps13>
Message-ID: <e4658795d5a00960b32116a81d43222f@codeaurora.org>
X-Sender: mdalam@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210215_141919_172564_02F9A7A8 
X-CRM114-Status: GOOD (  21.31  )
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
Cc: vigneshr@ti.com, mani@kernel.org, richard@nod.at,
 linux-kernel@vger.kernel.org, krzk@kernel.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, sricharan@codeaurora.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMjAyMS0wMi0xNSAxNDoxMCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIZWxsbywKPiAKPiBN
ZCBTYWRyZSBBbGFtIDxtZGFsYW1AY29kZWF1cm9yYS5vcmc+IHdyb3RlIG9uIE1vbiwgMTUgRmVi
IDIwMjEKPiAwMjo0NzozMSArMDUzMDoKPiAKPj4gRnJvbSBRUElDIHZlcnNpb24gMi4wIG9ud2Fy
ZHMgbmV3IHJlZ2lzdGVyIGdvdCBhZGRlZCB0bwo+PiByZWFkIGxhc3QgY29kZXdvcmQuIFRoaXMg
Y2hhbmdlIHdpbGwgYWRkIHRoZSBSRUFEX0xPQ0FUSU9OX0xBU1RfQ1dfbgo+PiByZWdpc3Rlci4K
Pj4gCj4+IEZvciBmaXJzdCB0aHJlZSBjb2RlIHdvcmQgUkVBRF9MT0NBVElPTl9uIHJlZ2lzdGVy
IHdpbGwgYmUKPj4gdXNlLkZvciBsYXN0IGNvZGUgd29yZCBSRUFEX0xPQ0FUSU9OX0xBU1RfQ1df
biByZWdpc3RlciB3aWxsIGJlCj4+IHVzZS4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IE1kIFNhZHJl
IEFsYW0gPG1kYWxhbUBjb2RlYXVyb3JhLm9yZz4KPj4gLS0tCj4+IFtWNV0KPj4gICogQWRkZWQg
aGVscGVyIGZ1bmN0aW9uIHRvIHVwZGF0ZSBsb2NhdGlvbiByZWdpc3RlciB2YWx1ZS4KPiAKPiAK
PiBQbGVhc2UgZG9uJ3QgZm9yZ2V0IHRoZSAidjUiIGluIHRoZSBtZXNzYWdlIG9iamVjdC4KPiAK
Pj4gIC8qCj4+IEBAIC0xMDk0LDExICsxMTQxLDE2IEBAIHN0YXRpYyB2b2lkIGNvbmZpZ19uYW5k
X3BhZ2VfcmVhZChzdHJ1Y3QgCj4+IHFjb21fbmFuZF9jb250cm9sbGVyICpuYW5kYykKPj4gICAq
IGJlZm9yZSByZWFkaW5nIGVhY2ggY29kZXdvcmQgaW4gTkFORCBwYWdlLgo+PiAgICovCj4+ICBz
dGF0aWMgdm9pZAo+PiAtY29uZmlnX25hbmRfY3dfcmVhZChzdHJ1Y3QgcWNvbV9uYW5kX2NvbnRy
b2xsZXIgKm5hbmRjLCBib29sIHVzZV9lY2MpCj4+ICtjb25maWdfbmFuZF9jd19yZWFkKHN0cnVj
dCBxY29tX25hbmRfY29udHJvbGxlciAqbmFuZGMsIGJvb2wgdXNlX2VjYywgCj4+IGJvb2wgbGFz
dF9jdykKPj4gIHsKPj4gLQlpZiAobmFuZGMtPnByb3BzLT5pc19iYW0pCj4+IC0JCXdyaXRlX3Jl
Z19kbWEobmFuZGMsIE5BTkRfUkVBRF9MT0NBVElPTl8wLCA0LAo+PiAtCQkJICAgICAgTkFORF9C
QU1fTkVYVF9TR0wpOwo+PiArCWlmIChuYW5kYy0+cHJvcHMtPmlzX2JhbSkgewo+PiArCQlpZiAo
bmFuZGMtPnByb3BzLT5xcGljX3YyICYmIGxhc3RfY3cpCj4+ICsJCQl3cml0ZV9yZWdfZG1hKG5h
bmRjLCBOQU5EX1JFQURfTE9DQVRJT05fTEFTVF9DV18wLCA0LAo+PiArCQkJCSAgICAgIE5BTkRf
QkFNX05FWFRfU0dMKTsKPj4gKwkJZWxzZQo+PiArCQkJd3JpdGVfcmVnX2RtYShuYW5kYywgTkFO
RF9SRUFEX0xPQ0FUSU9OXzAsIDQsCj4+ICsJCQkJICAgICAgTkFORF9CQU1fTkVYVF9TR0wpOwo+
IAo+IEkgZ3Vlc3Mgd3JpdGVfcmVnX2RtYSBzaG91bGQgYmUgdXBkYXRlZCBhcyB3ZWxsLgoKICAg
VXBkYXRlZCBpbiBWNiBwYXRjaCAsIHBsZWFzZSBjaGVjay4KPiAKPiAKPiBbLi4uXQo+IAo+PiAK
Pj4gLQljb25maWdfbmFuZF9jd19yZWFkKG5hbmRjLCBmYWxzZSk7Cj4+ICsJY29uZmlnX25hbmRf
Y3dfcmVhZChuYW5kYywgZmFsc2UsIGN3ID09IGVjYy0+c3RlcHMgLSAxID8gdHJ1ZSA6IAo+PiBm
YWxzZSk7Cj4+IAo+PiAgCXJlYWRfZGF0YV9kbWEobmFuZGMsIHJlZ19vZmYsIGRhdGFfYnVmLCBk
YXRhX3NpemUxLCAwKTsKPj4gIAlyZWdfb2ZmICs9IGRhdGFfc2l6ZTE7Cj4+IEBAIC0xODczLDE4
ICsxOTM4LDMxIEBAIHN0YXRpYyBpbnQgcmVhZF9wYWdlX2VjYyhzdHJ1Y3QgcWNvbV9uYW5kX2hv
c3QgCj4+ICpob3N0LCB1OCAqZGF0YV9idWYsCj4+IAo+PiAgCQlpZiAobmFuZGMtPnByb3BzLT5p
c19iYW0pIHsKPj4gIAkJCWlmIChkYXRhX2J1ZiAmJiBvb2JfYnVmKSB7Cj4+IC0JCQkJbmFuZGNf
c2V0X3JlYWRfbG9jKG5hbmRjLCAwLCAwLCBkYXRhX3NpemUsIDApOwo+PiAtCQkJCW5hbmRjX3Nl
dF9yZWFkX2xvYyhuYW5kYywgMSwgZGF0YV9zaXplLAo+PiAtCQkJCQkJICAgb29iX3NpemUsIDEp
Owo+PiArCQkJCWlmIChuYW5kYy0+cHJvcHMtPnFwaWNfdjIgJiYgaSA9PSAoZWNjLT5zdGVwcyAt
IDEpKSB7Cj4gCj4gSSB3b3VsZCBsaWtlIHRoZSBoZWxwZXIgdG8gaGFuZGxlIHRoaXMgY29uZGl0
aW9uLiBJIHdvdWxkIHByZWZlciB0bwo+IGF2b2lkIHlldCBhbiBleHRyYSBpbmRlbnRhdGlvbiBs
ZXZlbC4KCiAgIFVwZGF0ZWQgaW4gVjYgcGF0Y2ggLCBwbGVhc2UgY2hlY2suCj4gCj4+ICsJCQkJ
CW5hbmRjX3NldF9yZWFkX2xvYyhjaGlwLCBpLCAwLCAwLCBkYXRhX3NpemUsIDApOwo+PiArCQkJ
CQluYW5kY19zZXRfcmVhZF9sb2MoY2hpcCwgaSwgMSwgZGF0YV9zaXplLAo+PiArCQkJCQkJCSAg
IG9vYl9zaXplLCAxKTsKPj4gKwkJCQl9IGVsc2Ugewo+PiArCQkJCQluYW5kY19zZXRfcmVhZF9s
b2MoY2hpcCwgaSwgMCwgMCwgZGF0YV9zaXplLCAwKTsKPj4gKwkJCQkJbmFuZGNfc2V0X3JlYWRf
bG9jKGNoaXAsIGksIDEsIGRhdGFfc2l6ZSwKPj4gKwkJCQkJCQkgICBvb2Jfc2l6ZSwgMSk7Cj4+
ICsJCQkJfQo+PiAgCQkJfSBlbHNlIGlmIChkYXRhX2J1Zikgewo+PiAtCQkJCW5hbmRjX3NldF9y
ZWFkX2xvYyhuYW5kYywgMCwgMCwgZGF0YV9zaXplLCAxKTsKPj4gKwkJCQlpZiAobmFuZGMtPnBy
b3BzLT5xcGljX3YyICYmIGkgPT0gKGVjYy0+c3RlcHMgLSAxKSkKPj4gKwkJCQkJbmFuZGNfc2V0
X3JlYWRfbG9jKGNoaXAsIGksIDAsIDAsIGRhdGFfc2l6ZSwgMSk7Cj4+ICsJCQkJZWxzZQo+PiAr
CQkJCQluYW5kY19zZXRfcmVhZF9sb2MoY2hpcCwgaSwgMCwgMCwgZGF0YV9zaXplLCAxKTsKPj4g
IAkJCX0gZWxzZSB7Cj4+IC0JCQkJbmFuZGNfc2V0X3JlYWRfbG9jKG5hbmRjLCAwLCBkYXRhX3Np
emUsCj4+IC0JCQkJCQkgICBvb2Jfc2l6ZSwgMSk7Cj4+ICsJCQkJaWYgKG5hbmRjLT5wcm9wcy0+
cXBpY192MiAmJiBpID09IChlY2MtPnN0ZXBzIC0gMSkpCj4+ICsJCQkJCW5hbmRjX3NldF9yZWFk
X2xvYyhjaGlwLCBpLCAwLCBkYXRhX3NpemUsCj4+ICsJCQkJCQkJICAgb29iX3NpemUsIDEpOwo+
PiArCQkJCWVsc2UKPj4gKwkJCQkJbmFuZGNfc2V0X3JlYWRfbG9jKGNoaXAsIGksIDAsIGRhdGFf
c2l6ZSwKPj4gKwkJCQkJCQkgICBvb2Jfc2l6ZSwgMSk7Cj4+ICAJCQl9Cj4+ICAJCX0KPj4gCj4+
IC0JCWNvbmZpZ19uYW5kX2N3X3JlYWQobmFuZGMsIHRydWUpOwo+PiArCQljb25maWdfbmFuZF9j
d19yZWFkKG5hbmRjLCB0cnVlLCBpID09IGVjYy0+c3RlcHMgLSAxID8gdHJ1ZSA6IAo+PiBmYWxz
ZSk7Cj4gCj4gCWkgPT0gKGVjYy0+c3RlcHMgLSAxKQo+IAo+IGlzIGFscmVhZHkgYSBib29sZWFu
LCB5b3UgZG9uJ3QgbmVlZAo+IAo+IAkiPyB0cnVlIDogZmFsc2UiCj4gCgogICAgVXBkYXRlZCBp
biBWNiBwYXRjaC4KCj4+IAo+PiAgCQlpZiAoZGF0YV9idWYpCj4+ICAJCQlyZWFkX2RhdGFfZG1h
KG5hbmRjLCBGTEFTSF9CVUZfQUNDLCBkYXRhX2J1ZiwKPj4gQEAgLTE5NDYsNyArMjAyNCw3IEBA
IHN0YXRpYyBpbnQgY29weV9sYXN0X2N3KHN0cnVjdCBxY29tX25hbmRfaG9zdCAKPj4gKmhvc3Qs
IGludCBwYWdlKQo+PiAgCXNldF9hZGRyZXNzKGhvc3QsIGhvc3QtPmN3X3NpemUgKiAoZWNjLT5z
dGVwcyAtIDEpLCBwYWdlKTsKPj4gIAl1cGRhdGVfcndfcmVncyhob3N0LCAxLCB0cnVlKTsKPj4g
Cj4+IC0JY29uZmlnX25hbmRfc2luZ2xlX2N3X3BhZ2VfcmVhZChuYW5kYywgaG9zdC0+dXNlX2Vj
Yyk7Cj4+ICsJY29uZmlnX25hbmRfc2luZ2xlX2N3X3BhZ2VfcmVhZChuYW5kYywgaG9zdC0+dXNl
X2VjYywgdHJ1ZSk7Cj4gCj4gTWF5YmUgaXQncyBiZXN0IHRvIGp1c3QgZm9yd2FyZCB0aGUgY29k
ZXdvcmQgYW5kIGxldCB0aGUgY29kZSB0aGF0Cj4gbmVlZHMgdG8ga25vdyBpZiBpdCBpcyB0aGUg
bGFzdCBvbmUgb3Igbm90IGRvIHRoZSBjb21wYXJpc29uLgo+IAoKICAgVXBkYXRlZCBpbiBWNiBw
YXRjaCwgcGxlYXNlIGNoZWNrLgo+PiAKPj4gIAlyZWFkX2RhdGFfZG1hKG5hbmRjLCBGTEFTSF9C
VUZfQUNDLCBuYW5kYy0+ZGF0YV9idWZmZXIsIHNpemUsIDApOwo+PiAKPiAKPiBUaGFua3MsCj4g
TWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
