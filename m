Return-Path: <SRS0=I9GG=HQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66CFBC433DB
	for <linux-mtd@archiver.kernel.org>; Sun, 14 Feb 2021 21:22:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CD7D64E12
	for <linux-mtd@archiver.kernel.org>; Sun, 14 Feb 2021 21:22:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CD7D64E12
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7smOzmfdwWdvw5PM4yXcI8gg6epB66/Dqw0xmagNHyA=; b=onksKXhXPyeG6TKqtkyAPd2Cp
	lSbuOOLjYB2/UOYluEKUatY1eWgIzDgVQyKalZcvujn45EE0g04O2OzOLqnEvk38zTN8HfbA15c0p
	b382JBlm8+IPDnmNaYy+ia9KYON/15cO9CRwY9GjcvqMe2BR7MbPCpMZ26xFmypA8LVsI2+fcfFC0
	fnXFZxUhES+6CaPkRyzU1hpfi8IyUThGC9ZqBqHsFDichhICciI+Dhnhejfy0KPiH9kr6fExhuxIN
	hKAzIj2Y6uST4/UTU36uL+DL0O2FZxtKtahYgaEpbVVvNifBM0KnZGd8mcKwCprCD9TdWJ5dr3kRi
	H5UIPk25g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lBOp6-0002fF-6W; Sun, 14 Feb 2021 21:20:56 +0000
Received: from m42-2.mailgun.net ([69.72.42.2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lBOp3-0002eg-56
 for linux-mtd@lists.infradead.org; Sun, 14 Feb 2021 21:20:54 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1613337653; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=2fBzEEXP+sylAHdf+PXHSM7gdpXk57mShuzmCwVtSDg=;
 b=ENul+E8XSqDcYGFXFj9aX34rvnEbC1oXbF6jt9yqByrp4u8nKiyTsT0S7QtUZ17y7Z+jiJqV
 JcgraQgruF0gT0FtwXx3wj5M7M2mP1x1kMx7yrXGYQF4KpkF0ZSLB0Y2orIRNPRZ51g9EPTr
 rGUu60UEmuNfObl+S8N9wP4/s50=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyJkZDQ0ZiIsICJsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 6029942a34db06ef7965a13f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sun, 14 Feb 2021 21:20:42
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 2F8F0C43462; Sun, 14 Feb 2021 21:20:42 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: mdalam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 2BF40C433C6;
 Sun, 14 Feb 2021 21:20:41 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 15 Feb 2021 02:50:41 +0530
From: mdalam@codeaurora.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH V4] mtd: rawnand: qcom: update last code word register
In-Reply-To: <20210212091945.304c2530@xps13>
References: <1611869959-5109-1-git-send-email-mdalam@codeaurora.org>
 <20210210090144.GE19226@work> <20210211150759.506f3463@xps13>
 <fe43b382fd48d7fb494dd66a4b5ac80a@codeaurora.org>
 <20210212091945.304c2530@xps13>
Message-ID: <bd4f0fea5d074c98dc3ce3b2113d30ee@codeaurora.org>
X-Sender: mdalam@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210214_162053_332440_BA566C80 
X-CRM114-Status: GOOD (  32.78  )
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
Cc: vigneshr@ti.com, linux-kernel@vger.kernel.org,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 sricharan@codeaurora.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMjAyMS0wMi0xMiAxMzo0OSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIZWxsbywKPiAKPiBt
ZGFsYW1AY29kZWF1cm9yYS5vcmcgd3JvdGUgb24gRnJpLCAxMiBGZWIgMjAyMSAwMTowMDo0NyAr
MDUzMDoKPiAKPj4gT24gMjAyMS0wMi0xMSAxOTozNywgTWlxdWVsIFJheW5hbCB3cm90ZToKPj4g
PiBIZWxsbywKPj4gPgo+PiA+IE1hbml2YW5uYW4gU2FkaGFzaXZhbSA8bWFuaXZhbm5hbi5zYWRo
YXNpdmFtQGxpbmFyby5vcmc+IHdyb3RlIG9uIFdlZCwKPj4gPiAxMCBGZWIgMjAyMSAxNDozMTo0
NCArMDUzMDoKPj4gPgo+PiA+PiBPbiBGcmksIEphbiAyOSwgMjAyMSBhdCAwMzowOToxOUFNICsw
NTMwLCBNZCBTYWRyZSBBbGFtIHdyb3RlOgo+PiA+PiA+IEZyb20gUVBJQyB2ZXJzaW9uIDIuMCBv
bndhcmRzIG5ldyByZWdpc3RlciBnb3QgYWRkZWQgdG8KPj4gPj4gPiByZWFkIGxhc3QgY29kZXdv
cmQuIFRoaXMgY2hhbmdlIHdpbGwgYWRkIHRoZSBSRUFEX0xPQ0FUSU9OX0xBU1RfQ1dfbgo+PiA+
PiA+IHJlZ2lzdGVyLgo+PiA+PiA+Cj4+ID4+ID4gRm9yIGZpcnN0IHRocmVlIGNvZGUgd29yZCBS
RUFEX0xPQ0FUSU9OX24gcmVnaXN0ZXIgd2lsbCBiZQo+PiA+PiA+IHVzZS5Gb3IgbGFzdCBjb2Rl
IHdvcmQgUkVBRF9MT0NBVElPTl9MQVNUX0NXX24gcmVnaXN0ZXIgd2lsbCBiZQo+PiA+PiA+IHVz
ZS4KPj4gPgo+PiA+IFNvcnJ5IGZvciB0aGUgbGF0ZSBub3RpY2UsIEkgdGhpbmsgdGhlIHBhdGNo
IGlzIGZpbmUgYnV0IGlmIHlvdSBkb24ndAo+PiA+IG1pbmQgSSB3b3VsZCBsaWtlIHRvIHByb3Bv
c2UgYSBzbWFsbCBjaGFuZ2UgdGhhdCBzaG91bGQgc2ltcGxpZnkgeW91cgo+PiA+IHBhdGNoIGEg
bG90LCBzZWUgYmVsb3cuCj4+ID4KPj4gPj4gPgo+PiA+PiA+IFNpZ25lZC1vZmYtYnk6IE1kIFNh
ZHJlIEFsYW0gPG1kYWxhbUBjb2RlYXVyb3JhLm9yZz4KPj4gPj4gPj4gUmV2aWV3ZWQtYnk6IE1h
bml2YW5uYW4gU2FkaGFzaXZhbSA8bWFuaXZhbm5hbi5zYWRoYXNpdmFtQGxpbmFyby5vcmc+Cj4+
ID4+ID4+IFRoYW5rcywKPj4gPj4gTWFuaQo+PiA+PiA+PiA+IC0tLQo+PiA+PiA+IFtWNF0KPj4g
Pj4gPiAgKiBNb2RpZmllZCBjb25kaXRpb24gZm9yIG5hbmRjX3NldF9yZWFkX2xvY19sYXN0KCkg
aW4gcWNvbV9uYW5kY19yZWFkX2N3X3JhdygpLgo+PiA+PiA+ICAqIEFkZGVkIG9uZSBhZGRpdGlv
bmFsIGFyZ3VtZW50ICJsYXN0X2N3IiB0byB0aGUgZnVuY3Rpb24gY29uZmlnX25hbmRfY3dfcmVh
ZCgpCj4+ID4+ID4gICAgdG8gaGFuZGxlIGxhc3QgY29kZSB3b3JkIGNvbmRpdGlvbi4KPj4gPj4g
PiAgKiBDaGFuZ2VkIHRvdGFsIG51bWJlciBvZiBsYXN0IGNvZGUgd29yZCByZWdpc3RlciAiTkFO
RF9SRUFEX0xPQ0FUSU9OX0xBU1RfQ1dfMCIgdG8gNAo+PiA+PiA+ICAgIHdoaWxlIGRvaW5nIGNv
ZGUgd29yZCBjb25maWd1cmF0aW9uLgo+PiA+PiA+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29t
X25hbmRjLmMgfCAxMTAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0KPj4g
Pj4gPiAgMSBmaWxlIGNoYW5nZWQsIDg0IGluc2VydGlvbnMoKyksIDI2IGRlbGV0aW9ucygtKQo+
PiA+PiA+Cj4+ID4+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFu
ZGMuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYwo+PiA+PiA+IGluZGV4IDY2
N2U0YmYuLjk0ODRiZTggMTAwNjQ0Cj4+ID4+ID4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcv
cWNvbV9uYW5kYy5jCj4+ID4+ID4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5k
Yy5jCj4+ID4+ID4gQEAgLTQ4LDYgKzQ4LDEwIEBACj4+ID4+ID4gICNkZWZpbmUJTkFORF9SRUFE
X0xPQ0FUSU9OXzEJCTB4ZjI0Cj4+ID4+ID4gICNkZWZpbmUJTkFORF9SRUFEX0xPQ0FUSU9OXzIJ
CTB4ZjI4Cj4+ID4+ID4gICNkZWZpbmUJTkFORF9SRUFEX0xPQ0FUSU9OXzMJCTB4ZjJjCj4+ID4+
ID4gKyNkZWZpbmUJTkFORF9SRUFEX0xPQ0FUSU9OX0xBU1RfQ1dfMAkweGY0MAo+PiA+PiA+ICsj
ZGVmaW5lCU5BTkRfUkVBRF9MT0NBVElPTl9MQVNUX0NXXzEJMHhmNDQKPj4gPj4gPiArI2RlZmlu
ZQlOQU5EX1JFQURfTE9DQVRJT05fTEFTVF9DV18yCTB4ZjQ4Cj4+ID4+ID4gKyNkZWZpbmUJTkFO
RF9SRUFEX0xPQ0FUSU9OX0xBU1RfQ1dfMwkweGY0Ywo+PiA+PiA+Cj4+ID4+ID4gIC8qIGR1bW15
IHJlZ2lzdGVyIG9mZnNldHMsIHVzZWQgYnkgd3JpdGVfcmVnX2RtYSAqLwo+PiA+PiA+ICAjZGVm
aW5lCU5BTkRfREVWX0NNRDFfUkVTVE9SRQkJMHhkZWFkCj4+ID4+ID4gQEAgLTE4Nyw2ICsxOTEs
MTIgQEAgbmFuZGNfc2V0X3JlZyhuYW5kYywgTkFORF9SRUFEX0xPQ0FUSU9OXyMjcmVnLAkJCVwK
Pj4gPj4gPiAgCSAgICAgICgoc2l6ZSkgPDwgUkVBRF9MT0NBVElPTl9TSVpFKSB8CQkJXAo+PiA+
PiA+ICAJICAgICAgKChpc19sYXN0KSA8PCBSRUFEX0xPQ0FUSU9OX0xBU1QpKQo+PiA+PiA+Cj4+
ID4+ID4gKyNkZWZpbmUgbmFuZGNfc2V0X3JlYWRfbG9jX2xhc3QobmFuZGMsIHJlZywgb2Zmc2V0
LCBzaXplLCBpc19sYXN0KQlcCj4+ID4+ID4gK25hbmRjX3NldF9yZWcobmFuZGMsIE5BTkRfUkVB
RF9MT0NBVElPTl9MQVNUX0NXXyMjcmVnLAkJCVwKPj4gPj4gPiArCSAgICAgICgob2Zmc2V0KSA8
PCBSRUFEX0xPQ0FUSU9OX09GRlNFVCkgfAkJXAo+PiA+PiA+ICsJICAgICAgKChzaXplKSA8PCBS
RUFEX0xPQ0FUSU9OX1NJWkUpIHwJCQlcCj4+ID4+ID4gKwkgICAgICAoKGlzX2xhc3QpIDw8IFJF
QURfTE9DQVRJT05fTEFTVCkpCj4+ID4+ID4gKwo+PiA+Cj4+ID4gWW91IGNvdWxkIHJlbmFtZSB0
aGUgbWFjcm8gbmFuZGNfc2V0X3JlYWRfbG9jKCkgaW50bwo+PiA+IG5hbmRjX3NldF9yZWFkX2xv
Y19maXJzdCgpIG9yIGFueXRoaW5nIGVsc2UgdGhhdCBtYWtlIHNlbnNlLCB0aGVuIGhhdmUKPj4g
PiBhIGhlbHBlciB3aGljaCBkb2VzOgo+PiA+Cj4+ID4gbmFuZGNfc2V0X3JlYWRfbG9jKCkKPj4g
PiB7Cj4+ID4gCWlmIChjb25kaXRpb24gZm9yIGZpcnN0KQo+PiA+IAkJcmV0dXJuIG5hbmRjX3Nl
dF9yZWFkX2xvY19maXJzdCgpOwo+PiA+IAllbHNlCj4+ID4gCQlyZXR1cm4gbmFuZGNfc2V0X3Jl
YWRfbG9jX2xhc3QoKTsKPj4gPiB9Cj4+ID4KPj4gCj4+ICAgIFllcyB0aGlzIGlzIG1vcmUgcHJl
Y2lzZSB3YXkgJiBzaW1wbGlmeSB0aGUgcGF0Y2ggYSBsb3QuCj4+ICAgIEJ1dCBmb3IgdGhpcyBp
IGhhdmUgdG8gY2hhbmdlIHRoZXNlIHR3byBtYWNybyBhcyBhIGZ1bmN0aW9uLgo+PiAKPj4gICAg
bmFuZGNfc2V0X3JlYWRfbG9jKCkgJiBuYW5kY19zZXRfcmVhZF9sb2NfbGFzdCgpLgo+PiAKPj4g
ICAgU2luY2UgZm9yIGxhc3QgY29kZSB3b3JkIHJlZ2lzdGVyIHdlIGFyZSB1c2luZyBUb2tlbiBQ
YXN0aW5nIAo+PiBPcGVyYXRvciMjLgo+PiAKPj4gICAgU28gaWYgaSBhbSBpbXBsZW1lbnRpbmcg
bGlrZSB0aGUgYmVsb3cuCj4+IAo+PiAgICAvKiBoZWxwZXIgdG8gY29uZmlndXJlIGxvY2F0aW9u
IHJlZ2lzdGVyIHZhbHVlcyAqLwo+PiAgICBzdGF0aWMgdm9pZCBuYW5kY19zZXRfcmVhZF9sb2Mo
c3RydWN0IHFjb21fbmFuZF9jb250cm9sbGVyICpuYW5kYywgCj4+IGludCByZWcsCj4+ICAgICAg
ICAgICAgICAgICAgICBpbnQgb2Zmc2V0LCBpbnQgc2l6ZSwgaW50IGlzX2xhc3QsIGJvb2wgbGFz
dF9jdykKPj4gICAgewo+PiAgICAgICAgICAgIGlmIChsYXN0X2N3KQo+PiAgICAgICAgICAgICAg
ICAgICAgcmV0dXJuIG5hbmRjX3NldF9yZWFkX2xvY19sYXN0KG5hbmRjLCByZWcsIG9mZnNldCwg
Cj4+IHNpemUsIGlzX2xhc3QpOwo+PiAgICAgICAgICAgIGVsc2UKPj4gICAgICAgICAgICAgICAg
ICAgIHJldHVybiBuYW5kY19zZXRfcmVhZF9sb2NfZmlyc3QobmFuZGMsIHJlZywgb2Zmc2V0LCAK
Pj4gc2l6ZSwgaXNfbGFzdCk7Cj4+ICAgfQo+PiAKPj4gICAgU28gaGVyZSBmb3IgbWFjcm8gZXhw
YW5zaW9uIHJlZyBzaG91bGQgYmUgYSB2YWx1ZSBub3QgYSB2YXJpYWJsZSAKPj4gZWxzZSBpdCB3
aWxsIGJlIGV4cGVuZGVkIGxpa2UKPj4gICAgTkFORF9SRUFEX0xPQ0FUSU9OX0xBU1RfQ1dfcmVn
IGluc3RlYWQgb2YgCj4+IE5BTkRfUkVBRF9MT0NBVElPTl9MQVNUX0NXXzAsMSwyLDMgZXRjLgo+
IAo+IEkga25vdyBpdCBpbnZvbHZlcyBhIGxpdHRsZSBiaXQgbW9yZSBjb21wdXRhdGlvbiBidXQg
SSB3b25kZXIgaWYgdXNpbmcKPiBmdW5jcyBpbnN0ZWFkIG9mIG1hY3JvcyBoZXJlIHdvdWxkIG5v
dCBiZSBuaWNlcj8gUGVyaGFwcyBzb21ldGhpbmcgCj4gbGlrZToKPiAKPiAJbG9jID0gaXNfbGFz
dCA/IE5BTkRfUkVBRF9MT0NBVElPTiAvKiAweGYyMCAqLyA6Cj4gTkFORF9SRUFEX0xPQ0FUSU9O
X0xBU1QgLyogMHhmNDAgKi87Cj4gCWxvYyArPSByZWcgKiAyOwoKICAgSSBoYXZlIGFkZGVkIGEg
aGVscGVyIGZ1bmN0aW9uIHRvIHVwZGF0ZSBsb2NhdGlvbiByZWdpc3RlciB2YWx1ZSBpbiBWNSAK
cGF0Y2guCiAgIFBsZWFzZSBjaGVjayB0aGUgcGF0Y2guCj4gCj4+ICAgdGhlIGNhbGwgZm9yIG5h
bmRjX3NldF9yZWFkX2xvYygpIGFzIG5hbmRjX3NldF9yZWFkX2xvYyhuYW5kYywgMCwgCj4+IHJl
YWRfbG9jLCBkYXRhX3NpemUxLCAwLCB0cnVlKTsgLS0tPiBmb3IgbGFzdCBjb2RlIHdvcmQuCj4+
ICAgbmFuZGNfc2V0X3JlYWRfbG9jKG5hbmRjLCAwLCByZWFkX2xvYywgZGF0YV9zaXplMSwgMCwg
ZmFsc2UpOyAtLS0+IAo+PiBmb3IgZmlyc3QgdGhyZWUgY29kZSB3cm9kLgo+IAo+IEkgdGhpbmsg
aXQncyBiZXN0IHRvIGZvcndhcmQgJ2N3JyBhcyBhIHBhcmFtZXRlciBhbmQgZG8gdGhlCj4gY29t
cHV0YXRpb24gb2YgaXNfbGFzdCBsb2NhbGx5Lgo+IAo+PiAgIFNvIGlzIHRoaXMgb2sgZm9yIHlv
dSB0byBjb252ZXJ0IHRoZXNlIHR3byBtYWNybyBpbnRvIGZ1bmN0aW9uID8KPj4gCj4+ID4gQW5k
IGluIHRoZSByZXN0IG9mIHlvdXIgcGF0Y2ggeW91IHdvbid0IGhhdmUgdG8gdG91Y2ggYW55dGhp
bmcgZWxzZS4KPj4gPgo+PiA+IFRoYW5rcywKPj4gPiBNaXF1w6hsCj4gCj4gVGhhbmtzLAo+IE1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
