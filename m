Return-Path: <SRS0=B2Jc=KF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DF23C433B4
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 11:34:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F003C610A5
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 11:34:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F003C610A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JoJ0qOvq+PU3NPOQ6B7kMFrWcP3FRwheMddzG/ZjFFg=; b=PNn8Z/b6MB5thBKGVEnbZSA/j
	3GhILLd+nfYSWTxjb8OLM2H1eanSQBiDlAvMfDxMalMlwgzMjhkRBYbvvcLy/wFCi0KSJGSI3PyHB
	HRTaMt4oxLST3Rn887mGBw+dajaiVboHjdXy953G7M3x16oL+1TBR0Ty3Z5vc5tj8j+ZHi9MARxKt
	MMB9EZArn3xzF1pT8zrZAzJwmat0ojVPu5JpAJXfmbvaNjNLh+JcEyLZ8eLqJSdmkuNlUeWELwSK7
	n/BZZVNbVK9oKZ3rztURP/7U+Ut2sLlGMzveGCJrA7sJAAWGHySk8NWpiib2KLheR1tw4O6kKzi3r
	J+XJSUw8Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg49R-00E60o-Rc; Mon, 10 May 2021 11:32:42 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg3d9-00E1U3-8e
 for linux-mtd@desiato.infradead.org; Mon, 10 May 2021 10:59:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=1V1hjNy0ikjEDcGsAysvLfVX9zgO6KrdzGI0V4yHr2Y=; b=Wc9GayCDqr373Zj0g3YwCl5mf2
 Hj0RIMAbHqzZ/GutFqujfxDYJ9diKLoiob6LJ41Re4EbYs31hHaZFtobXlWR81wp4K4iCoODdw7rQ
 Wd+aU85OKExwROM+ehSPZ813XdiWcppMxUh1ncvOg2m4bbBC2cK5WSGAMRnGTOj7heykyBE2p0wIa
 0k0znOSUxsjQyAmdReoJi2pvgReEaExosiS/dPJ8YHrQTYTUzaTtJIexbxMZtsiKmPdD9AVwQr7Nn
 ycVKnY9+fS98EY0kyOejNF70W9cNXP8G7qYZXqF9gijCirsBePECAeTm9LBXo+9AFmG70FNESy+1i
 bcq7kcyg==;
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg3d6-008aJ6-FK
 for linux-mtd@lists.infradead.org; Mon, 10 May 2021 10:59:17 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1620644354; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=1V1hjNy0ikjEDcGsAysvLfVX9zgO6KrdzGI0V4yHr2Y=;
 b=g4CuCgy9WIZkFDfb+8/ejSj00Dsn2/OZGXZWR1ZH98IhoRXOZi6cNYLDqeEwYju9jNAeIYNN
 4fm1qHWWF0Rw4fU2ZPCLiNJRc6nhaHf52T2CHnGWYR4lpW9vzySaMbadGrjffHvGi10X8Pc+
 Gx21L//Ay6vamTOWcYo/jvkLnFs=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkZDQ0ZiIsICJsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 609911e18166b7eff75bf275 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 10 May 2021 10:58:41
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 91659C43145; Mon, 10 May 2021 10:58:40 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: mdalam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 44379C43145;
 Mon, 10 May 2021 10:58:33 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 10 May 2021 16:28:33 +0530
From: mdalam@codeaurora.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: mani@kernel.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 sricharan@codeaurora.org
Subject: Re: [PATCH] mtd: rawnand: qcom: avoid write to obsolete register
In-Reply-To: <20210504085805.73e60979@xps13>
References: <1619205694-25645-1-git-send-email-mdalam@codeaurora.org>
 <2667b47434a8f2892ea3d5f304380960@codeaurora.org>
 <20210504085805.73e60979@xps13>
Message-ID: <e5d79f2b18ffe2dcdaa7d2c827d8472f@codeaurora.org>
X-Sender: mdalam@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_035916_588347_83D6CE0E 
X-CRM114-Status: GOOD (  20.18  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMjAyMS0wNS0wNCAxMjoyOCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIZWxsbywKPiAKPiBt
ZGFsYW1AY29kZWF1cm9yYS5vcmcgd3JvdGUgb24gTW9uLCAwMyBNYXkgMjAyMSAyMDoyNDo1NCAr
MDUzMDoKPiAKPj4gT24gMjAyMS0wNC0yNCAwMDo1MSwgTWQgU2FkcmUgQWxhbSB3cm90ZToKPj4g
PiBRUElDX0VCSTJfRUNDX0JVRl9DRkcgcmVnaXN0ZXIgZ290IG9ic29sZXRlIGZyb20gUVBJQyBW
Mi4wIG9ud2FyZHMuCj4+ID4gQXZvaWQgd3JpdGluZyB0aGlzIHJlZ2lzdGVyIGlmIFFQSUMgdmVy
c2lvbiBpcyBWMi4wIG9yIG5ld2VyLgo+PiA+Cj4+ID4gU2lnbmVkLW9mZi1ieTogTWQgU2FkcmUg
QWxhbSA8bWRhbGFtQGNvZGVhdXJvcmEub3JnPgo+PiA+IC0tLQo+PiA+ICBkcml2ZXJzL210ZC9u
YW5kL3Jhdy9xY29tX25hbmRjLmMgfCAxNyArKysrKysrKysrKy0tLS0tLQo+PiA+ICAxIGZpbGUg
Y2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPj4gPgo+PiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMKPj4gPiBiL2RyaXZlcnMv
bXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYwo+PiA+IGluZGV4IGZkNGMzMTguLjhjNTIwNWMgMTAw
NjQ0Cj4+ID4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jCj4+ID4gKysr
IGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jCj4+ID4gQEAgLTcxNCw3ICs3MTQs
OCBAQCBzdGF0aWMgdm9pZCB1cGRhdGVfcndfcmVncyhzdHJ1Y3QgcWNvbV9uYW5kX2hvc3QKPj4g
PiAqaG9zdCwgaW50IG51bV9jdywgYm9vbCByZWFkKQo+PiA+ICAJbmFuZGNfc2V0X3JlZyhuYW5k
YywgTkFORF9ERVYwX0NGRzAsIGNmZzApOwo+PiA+ICAJbmFuZGNfc2V0X3JlZyhuYW5kYywgTkFO
RF9ERVYwX0NGRzEsIGNmZzEpOwo+PiA+ICAJbmFuZGNfc2V0X3JlZyhuYW5kYywgTkFORF9ERVYw
X0VDQ19DRkcsIGVjY19iY2hfY2ZnKTsKPj4gPiAtCW5hbmRjX3NldF9yZWcobmFuZGMsIE5BTkRf
RUJJMl9FQ0NfQlVGX0NGRywgaG9zdC0+ZWNjX2J1Zl9jZmcpOwo+PiA+ICsJaWYgKCFuYW5kYy0+
cHJvcHMtPnFwaWNfdjIpCj4+ID4gKwkJbmFuZGNfc2V0X3JlZyhuYW5kYywgTkFORF9FQkkyX0VD
Q19CVUZfQ0ZHLCBob3N0LT5lY2NfYnVmX2NmZyk7Cj4+ID4gIAluYW5kY19zZXRfcmVnKG5hbmRj
LCBOQU5EX0ZMQVNIX1NUQVRVUywgaG9zdC0+Y2xyZmxhc2hzdGF0dXMpOwo+PiA+ICAJbmFuZGNf
c2V0X3JlZyhuYW5kYywgTkFORF9SRUFEX1NUQVRVUywgaG9zdC0+Y2xycmVhZHN0YXR1cyk7Cj4+
ID4gIAluYW5kY19zZXRfcmVnKG5hbmRjLCBOQU5EX0VYRUNfQ01ELCAxKTsKPj4gPiBAQCAtMTA4
Myw3ICsxMDg0LDggQEAgc3RhdGljIHZvaWQgY29uZmlnX25hbmRfcGFnZV9yZWFkKHN0cnVjdAo+
PiA+IHFjb21fbmFuZF9jb250cm9sbGVyICpuYW5kYykKPj4gPiAgewo+PiA+ICAJd3JpdGVfcmVn
X2RtYShuYW5kYywgTkFORF9BRERSMCwgMiwgMCk7Cj4+ID4gIAl3cml0ZV9yZWdfZG1hKG5hbmRj
LCBOQU5EX0RFVjBfQ0ZHMCwgMywgMCk7Cj4+ID4gLQl3cml0ZV9yZWdfZG1hKG5hbmRjLCBOQU5E
X0VCSTJfRUNDX0JVRl9DRkcsIDEsIDApOwo+PiA+ICsJaWYgKCFuYW5kYy0+cHJvcHMtPnFwaWNf
djIpCj4+ID4gKwkJd3JpdGVfcmVnX2RtYShuYW5kYywgTkFORF9FQkkyX0VDQ19CVUZfQ0ZHLCAx
LCAwKTsKPj4gPiAgCXdyaXRlX3JlZ19kbWEobmFuZGMsIE5BTkRfRVJBU0VEX0NXX0RFVEVDVF9D
RkcsIDEsIDApOwo+PiA+ICAJd3JpdGVfcmVnX2RtYShuYW5kYywgTkFORF9FUkFTRURfQ1dfREVU
RUNUX0NGRywgMSwKPj4gPiAgCQkgICAgICBOQU5EX0VSQVNFRF9DV19TRVQgfCBOQU5EX0JBTV9O
RVhUX1NHTCk7Cj4+ID4gQEAgLTExMzIsOCArMTEzNCw5IEBAIHN0YXRpYyB2b2lkIGNvbmZpZ19u
YW5kX3BhZ2Vfd3JpdGUoc3RydWN0Cj4+ID4gcWNvbV9uYW5kX2NvbnRyb2xsZXIgKm5hbmRjKQo+
PiA+ICB7Cj4+ID4gIAl3cml0ZV9yZWdfZG1hKG5hbmRjLCBOQU5EX0FERFIwLCAyLCAwKTsKPj4g
PiAgCXdyaXRlX3JlZ19kbWEobmFuZGMsIE5BTkRfREVWMF9DRkcwLCAzLCAwKTsKPj4gPiAtCXdy
aXRlX3JlZ19kbWEobmFuZGMsIE5BTkRfRUJJMl9FQ0NfQlVGX0NGRywgMSwKPj4gPiAtCQkgICAg
ICBOQU5EX0JBTV9ORVhUX1NHTCk7Cj4+ID4gKwlpZiAoIW5hbmRjLT5wcm9wcy0+cXBpY192MikK
Pj4gPiArCQl3cml0ZV9yZWdfZG1hKG5hbmRjLCBOQU5EX0VCSTJfRUNDX0JVRl9DRkcsIDEsCj4+
ID4gKwkJCSAgICAgIE5BTkRfQkFNX05FWFRfU0dMKTsKPj4gPiAgfQo+PiA+Cj4+ID4gIC8qCj4+
ID4gQEAgLTExODcsNyArMTE5MCw4IEBAIHN0YXRpYyBpbnQgbmFuZGNfcGFyYW0oc3RydWN0IHFj
b21fbmFuZF9ob3N0ID4gKmhvc3QpCj4+ID4gIAkJCQkJfCAyIDw8IFdSX1JEX0JTWV9HQVAKPj4g
PiAgCQkJCQl8IDAgPDwgV0lERV9GTEFTSAo+PiA+ICAJCQkJCXwgMSA8PCBERVYwX0NGRzFfRUND
X0RJU0FCTEUpOwo+PiA+IC0JbmFuZGNfc2V0X3JlZyhuYW5kYywgTkFORF9FQkkyX0VDQ19CVUZf
Q0ZHLCAxIDw8ID4gRUNDX0NGR19FQ0NfRElTQUJMRSk7Cj4+ID4gKwlpZiAoIW5hbmRjLT5wcm9w
cy0+cXBpY192MikKPj4gPiArCQluYW5kY19zZXRfcmVnKG5hbmRjLCBOQU5EX0VCSTJfRUNDX0JV
Rl9DRkcsIDEgPDwgPiBFQ0NfQ0ZHX0VDQ19ESVNBQkxFKTsKPj4gPgo+PiA+ICAJLyogY29uZmln
dXJlIENNRDEgYW5kIFZMRCBmb3IgT05GSSBwYXJhbSBwcm9iaW5nIGluIFFQSUMgdjEgKi8KPj4g
PiAgCWlmICghbmFuZGMtPnByb3BzLT5xcGljX3YyKSB7Cj4+ID4gQEAgLTI2MjgsNyArMjYzMiw4
IEBAIHN0YXRpYyBpbnQgcWNvbV9uYW5kX2F0dGFjaF9jaGlwKHN0cnVjdCBuYW5kX2NoaXAgPiAq
Y2hpcCkKPj4gPiAgCQkJCXwgZWNjX21vZGUgPDwgRUNDX01PREUKPj4gPiAgCQkJCXwgaG9zdC0+
ZWNjX2J5dGVzX2h3IDw8IEVDQ19QQVJJVFlfU0laRV9CWVRFU19CQ0g7Cj4+ID4KPj4gPiAtCWhv
c3QtPmVjY19idWZfY2ZnID0gMHgyMDMgPDwgTlVNX1NURVBTOwo+PiA+ICsJaWYgKCFuYW5kYy0+
cHJvcHMtPnFwaWNfdjIpCj4+ID4gKwkJaG9zdC0+ZWNjX2J1Zl9jZmcgPSAweDIwMyA8PCBOVU1f
U1RFUFM7Cj4+ID4KPj4gPiAgCWhvc3QtPmNscmZsYXNoc3RhdHVzID0gRlNfUkVBRFlfQlNZX047
Cj4+ID4gIAlob3N0LT5jbHJyZWFkc3RhdHVzID0gMHhjMDsKPj4gCj4+IAo+PiBwaW5nISBIaSBN
aXF1ZWwgY291bGQgeW91IHJldmlldyB0aGlzIGNoYW5nZSBhbmQgbGV0IG1lIGtub3cgaWYgbW9y
ZSAKPj4gaW5mbyBuZWVkZWQuCj4gCj4gQ29tZSBvbiwgdGhhdCdzIG9ubHkgNiBkYXlzIG9mIHdv
cmsgYW5kIHdlIGFyZSBpbiB0aGUgbWlkZGxlIG9mIHRoZQo+IG1lcmdlIHdpbmRvdy4uLgo+IAo+
IEJUVyAiYXZvaWQgd3JpdGUgdG8iIGluIHRoZSB0aXRsZSBpcyBpbmNvcnJlY3QgIndyaXRpbmcg
dG8iIHdvdWxkIGJlCj4gbmljZXIuCgogIFVwZGF0ZWQgY29tbWl0IG1lc3NhZ2UgaW4gVjIgcGF0
Y2guCj4gCj4gVGhhbmtzLAo+IE1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
