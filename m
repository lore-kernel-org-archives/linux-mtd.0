Return-Path: <SRS0=rTSM=7C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BCE1C433DF
	for <linux-mtd@archiver.kernel.org>; Wed, 20 May 2020 14:30:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B851205CB
	for <linux-mtd@archiver.kernel.org>; Wed, 20 May 2020 14:30:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rnAOOvI1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B851205CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z8Zxi0LVEpOpuaQHdHagm4vK4P6xxI1Y7IS8u+jjKaU=; b=rnAOOvI11uRcN8
	upBrHpEnALsY2rpw9pWRLJ8mAOCUGJ07Q/RiHNQycmeJnE8+5RZejSP74rPPY0wQr3ZmlLtbuAhnO
	Fypz0RUkiHXLQ3d6yK9bQWzOWZYYD6UACD14Gf7F2IFszkWxcUZ4bY5PjMr9isnOrnhZXj9ftVXmt
	RTw29zP5+jb+cZ+3jUg8I/biCp4rK4zlm6kNYpZTsi5XPCXgigSply1vBUXTUUgrQj7A37aDM1dHH
	JiH3XE+FwHq1RHEOdlwTJv0LGJCWKS+Yulob/LO2ogTS33JHjiHEk8/z2p1kalyHozZc0m5qSco6B
	aH0vLClaFa9UOKk/wzKA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbPj9-0003rX-Ok; Wed, 20 May 2020 14:29:47 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbPj7-0003qn-1u
 for linux-mtd@lists.infradead.org; Wed, 20 May 2020 14:29:46 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 7B330FF817;
 Wed, 20 May 2020 14:29:38 +0000 (UTC)
Date: Wed, 20 May 2020 16:29:36 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rickard X Andersson <Rickard.Andersson@axis.com>
Subject: Re: [PATCH 2/2] mtd: rawnand: Add timings for Kioxia TH58NVG2S3HBAI4
Message-ID: <20200520162936.6eb499fb@xps13>
In-Reply-To: <1589984216684.8771@axis.com>
References: <1589981533129.2663@axis.com> <20200520154343.2ce58cc6@xps13>
 <1589984216684.8771@axis.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200520_072945_231478_F7192F1E 
X-CRM114-Status: GOOD (  17.93  )
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
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Boris
 Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUmlja2FyZCwKClJpY2thcmQgWCBBbmRlcnNzb24gPFJpY2thcmQuQW5kZXJzc29uQGF4aXMu
Y29tPiB3cm90ZSBvbiBXZWQsIDIwIE1heQoyMDIwIDE0OjE2OjU3ICswMDAwOgoKPiA+ID4gSSBo
YXZlIGNyZWF0ZWQgYSBuZXcgcGF0Y2hzZXQgdGhhdCBJIHdpbGwgc2VuZCBzaG9ydGx5LiBUaGlz
IHBhdGNoc2V0IGRvZXMgaG93ZXZlciBub3QgdXNlIG9uZmlfZmluZF9lcXVpdmFsZW50X3Nkcl9t
b2RlKC4uKSwgdGhhdCBjb3VsZCBiZSBhIGZ1dHVyZSBpbXByb3ZtZW50LiBNeSBwYXRjaHNldCBm
YWxscyBiYWNrIHRvIG1vZGUgMCBpZiB0aGUgc3BlY2lhbGl6ZWQgdGltaW5ncyBkb2VzIG5vdCB3
b3JrIGZvciB0aGUgY29udHJvbGxlci4gIAo+ID4KPiA+IFRoYW5rcyBmb3IgdXBkYXRpbmchCj4g
Pgo+ID4gQWN0dWFsbHkgSSB3cm90ZSBpdCBiZWNhdXNlIG9mIGEgcHJldmlvdXMgZGlzY3Vzc2lv
biB3aXRoIEJvcmlzIHdobwo+ID4gdG9sZCBtZSB0aGF0IHRoaXMgbW9kZSBmaWVsZCB3b3VsZCBi
ZSBiYWRseSB1bmRlcnN0b29kIGFuZCBoZSBhY3R1YWxseQo+ID4gZ290IGl0IHJpZ2h0IGFzIGlu
IHlvdXIgcHJldmlvdXMgc3VibWlzc2lvbiB0aGlzIGZpZWxkIHdhcyBzZXQgdG8gMAo+ID4gd2hp
bGUsIElJUkMsIHlvdSB0b2xkIG1lIGl0IHdhcyBjbG9zZSB0byBtb2RlIDMuIFRoaXMgaXMgaW1w
b3J0YW50IHRvCj4gPiBjb250cm9sbGVycyB0aGF0IGNhbm5vdCB0d2VhayB0aGUgcGFyYW1ldGVy
cyBidXQganVzdCBwaWNrIGFuIE9ORkkKPiA+IG1vZGUuIFNvIHRoZSB0aW1pbmdzIHRoZXkgY2hv
b3NlIG11c3QgZml0IHRoZSBzbG93ZXN0IG1pbnMgYW5kIGZhc3Rlc3QKPiA+IG1heHMgb2YgeW91
ciBuZXcgc2V0IG9mIHRpbWluZ3MuIEhlbmNlIHRoZSB1c2Ugb2YgdGhlIGhlbHBlciB3aGljaAo+
ID4gc2VlbXMgbmVlZGVkLiBJdCBpcyBhY3R1YWxseSBwcmV0dHkgc3RyYWlnaHRmb3J3YXJkIHNv
IEkgZG9uJ3QKPiA+IHVuZGVyc3RhbmQgeW91ciBjaG9pY2Ugb2Ygbm90IG1ha2luZyB1c2Ugb2Yg
aXQ/Cj4gPgo+ID4gQXMgdGhpcyBpcyB0aGUgcHJpbWFyeSBjb250cmlidXRpb24gb2YgdGhpcyB0
eXBlLCBJIHdvdWxkIGxpa2UgdG8gZ2V0Cj4gPiBpdCByaWdodCBzbyB0aGF0IG90aGVyIGNvbnRy
aWJ1dG9ycyBjYW4gcmVmZXIgdG8gaXQgOikgIAo+IAo+IElmIEkgdW5kZXJzdGFuZCB5b3UgY29y
cmVjdGx5IHlvdSB3YW50IG1lIHRvIHVzZSBvbmZpX2ZpbmRfZXF1aXZhbGVudF9zZHJfbW9kZSBp
biBvcmRlciB0byBmaW5kIHRoZSBjb3JyZXNwb25kaW5nIG9uZmkgbW9kZS4gVGhlbiB5b3Ugd2Fu
dCBtZSB0byB1c2Ugb25maV9maWxsX2RhdGFfaW50ZXJmYWNlIGFuZCBsb29wIHRvd2FyZHMgbW9k
ZSAwIGNoZWNraW5nIHdoaWNoIG1vZGUgdGhlIGNvbnRyb2xsZXIgYWNjZXB0cz8gSSBqdXN0IHRo
b3VnaHQgaXQgd2FzIGEgIm1lc3N5IiB0byBkdXBsaWNhdGUgdGhpcyBjb2RlIGluIGFsbCB2ZW5k
b3IgZHJpdmVycy4KPiBPciBkbyB5b3UgbWVhbiB0aGF0IEkgc2hvdWxkIGp1c3QgdXNlIG9uZmlf
ZmluZF9lcXVpdmFsZW50X3Nkcl9tb2RlIHRvIHNldCAuInRpbWluZ3MubW9kZSIgYW5kIGxldCBu
YW5kX2Jhc2UgdG8gZG8gdGhlIGxvb3BpbmcgaW4gY2FzZSBlcnJvciBpcyByZXR1cm5lZCBmcm9t
IHRoNThudmcyczNoYmFpNF9jaG9vc2VfZGF0YV9pbnRlcmZhY2UgKGkuZSBzcGVjaWFsaXplZCB0
aW1pbmdzIG5vdCBhY2NlcHRlZCBieSB0aGUgY29udHJvbGxlcikuCgpTb3JyeSBmb3IgdGhlIG1p
c3VuZGVyc3RhbmRpbmcuIFdoYXQgSSB0aGluayB5b3Ugc2hvdWxkIHRyeSBpczoKMS8gY2FsbCBv
bmZpX2ZpbmRfZXF1aXZhbGVudF9zZHJfbW9kZSgpIHRvIHNldCB0aGUgdGltaW5ncy5tb2RlIGZp
ZWxkLgoyLyBjYWxsIG5hbmRfY29udHJvbGxlcl9zdXBwb3J0c19kYXRhX2ludGVyZmFjZSgpCjMv
IGlmIHRoZSBjb250cm9sbGVyIHN1cHBvcnRzIHRoZSB0aW1pbmdzLCBzZXQKY2hpcC0+ZGVmYXVs
dF90aW1pbmdfbW9kZSBhY2NvcmRpbmdseSBhbmQgcmV0dXJuIDAuCjQvIGlmIHRoZSBjb250cm9s
bGVyIGRvZXMgbm90IHN1cHBvcnQgdGhlIHRpbWluZ3MsIHlvdSBtYXkgd2FudCB0bwpwcm9wb3Nl
IG90aGVyIHN0YW5kYXJkIHRpbWluZ3MgdG8gdGVzdCBieSBzZXR0aW5nCmNoaXAtPmRlZmF1bHRf
dGltaW5nX21vZGUgYW55d2F5IGJ1dCByZXR1cm5pbmcgYW4gZXJyb3Igd2hpY2ggbWVhbnMKImJl
c3QgaW50ZXJmYWNlIGhhcyBub3QgYmVlbiBmb3VuZCB5ZXQiIHNvIHRoZSByZXN0IG9mIHRoZQpj
aG9vc2VfZGF0YV9pbnRlcmZhY2UoKSBoZWxwZXIgd2lsbCB0cnkgdGhlIHJlbWFpbmluZyBPTkZJ
IG1vZGVzCmF1dG9tYXRpY2FsbHkgKGZhbGxiYWNrcyB0byAwIGFueXdheSkuCgpUaGFua3MsCk1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
