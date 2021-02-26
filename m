Return-Path: <SRS0=yHHw=H4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C123C433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Feb 2021 18:26:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D24864F1F
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Feb 2021 18:26:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D24864F1F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KWub2i9XBSJq8MpDIxJCBNk5Qk8VW8KPEnbmG2tP/eI=; b=wgtyuSJZtH7yDxedrE+8sGk9J
	vhuCpMg9z8Dj8O2lwM0RGrvNGlSeP8mXy4i9i9KF/wl4GNmPNuMagfJZ+Y7DBhvgwFgW5C+MGKZP0
	2LiBKqNSN82MZbFm0octO34mwHgtc28sPm7UncPEkiUO0j47r0bRnhjj6rPs+3wfXBrclXYwk/5lW
	KgtJlxDKy6JVJo10UGpwEAmsbBpSHv1dWGLSFApxcADn3HXbIPm2r2FlW0QCSGpbzjph2TIYluFle
	03qYT1lIxoE8AJJtq9l1dm5ZdcsHRSY6GzzjzL0YW4Q7x633o+Nvy2le4o55/7VIyfXzU+/XiwJRB
	6KQIpnhWg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFhoS-0003M8-Ab; Fri, 26 Feb 2021 18:26:04 +0000
Received: from m42-2.mailgun.net ([69.72.42.2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFhoP-0003LZ-FB
 for linux-mtd@lists.infradead.org; Fri, 26 Feb 2021 18:26:02 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1614363959; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=phgrcfweS7Ov1Upp/f1NcxKQ0crVZhRuuofK2pHBaf4=;
 b=CV7JwtM5iQD9Cy15lOX5aNo6AhmkUQWWg0ZsS8n/N/lanuTK2a4yqz46DYU7jcpk4vv8KHtR
 j3rjHizSGy9dsDZhyzfb1zar/TGhRVDfAvs2ox2pAmDRJnaqLGFRTJg3XDrduEu+tT9Ll672
 35ErfhUXbaR8y7Mzpfi960DMsEo=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyJkZDQ0ZiIsICJsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 60393d3322a1e56ef8beb574 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 26 Feb 2021 18:25:55
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5C6E1C433C6; Fri, 26 Feb 2021 18:25:54 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: mdalam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 842A1C433CA;
 Fri, 26 Feb 2021 18:25:53 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 26 Feb 2021 23:55:53 +0530
From: mdalam@codeaurora.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd: rawnand: qcom: update last code word register
In-Reply-To: <20210224173644.592e73dc@xps13>
References: <1614024267-12529-1-git-send-email-mdalam@codeaurora.org>
 <20210223173449.1a55df1e@xps13>
 <a5650f33b493b987d45525ea57fdfd8a@codeaurora.org>
 <38da9d1d4a96f1b42ba0b194da265e6b@codeaurora.org>
 <20210224074850.0c74154d@xps13>
 <e0f0282b8552b0225f15a4c45a6894cd@codeaurora.org>
 <20210224173644.592e73dc@xps13>
Message-ID: <92fc28e79b5f6f56c8bfc6f229807edb@codeaurora.org>
X-Sender: mdalam@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_132601_652907_1D68392E 
X-CRM114-Status: GOOD (  26.79  )
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
Cc: mani@kernel.org, linux-kernel@vger.kernel.org,
 mdalam=codeaurora.org@codeaurora.org, linux-mtd@lists.infradead.org,
 boris.brezillon@collabora.com, sricharan@codeaurora.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMjAyMS0wMi0yNCAyMjowNiwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIZWxsbywKPiAKPiBt
ZGFsYW1AY29kZWF1cm9yYS5vcmcgd3JvdGUgb24gV2VkLCAyNCBGZWIgMjAyMSAyMjowMDowNSAr
MDUzMDoKPiAKPj4gT24gMjAyMS0wMi0yNCAxMjoxOCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPj4g
PiBIZWxsbywKPj4gPgo+PiA+IG1kYWxhbUBjb2RlYXVyb3JhLm9yZyB3cm90ZSBvbiBXZWQsIDI0
IEZlYiAyMDIxIDEwOjA5OjQ4ICswNTMwOgo+PiA+Cj4+ID4+IE9uIDIwMjEtMDItMjQgMDE6MTMs
IG1kYWxhbUBjb2RlYXVyb3JhLm9yZyB3cm90ZToKPj4gPj4gPiBPbiAyMDIxLTAyLTIzIDIyOjA0
LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+PiA+PiA+PiBIZWxsbywKPj4gPj4gPj4gPj4gTWQgU2Fk
cmUgQWxhbSA8bWRhbGFtQGNvZGVhdXJvcmEub3JnPiB3cm90ZSBvbiBUdWUsIDIzIEZlYiAyMDIx
Cj4+ID4+ID4+IDAxOjM0OjI3ICswNTMwOgo+PiA+PiA+PiA+Pj4gRnJvbSBRUElDIHZlcnNpb24g
Mi4wIG9ud2FyZHMgbmV3IHJlZ2lzdGVyIGdvdCBhZGRlZCB0byByZWFkIGxhc3QKPj4gPj4gPj4g
Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGEgbmV3Cj4+ID4+ID4+ID4+PiBjb2Rl
d29yZC4gVGhpcyBjaGFuZ2Ugd2lsbCBhZGQgdGhlIFJFQURfTE9DQVRJT05fTEFTVF9DV19uIHJl
Z2lzdGVyLgo+PiA+PiA+PiA+PiAgICAgICAgICAgICBBZGQgc3VwcG9ydCBmb3IgdGhpcyBSRUFE
X0xPQ0FUSU9OX0xBU1RfQ1dfbiByZWdpc3Rlci4KPj4gPj4gPj4gPj4+ID4+PiBGb3IgZmlyc3Qg
dGhyZWUgY29kZSB3b3JkIFJFQURfTE9DQVRJT05fbiByZWdpc3RlciB3aWxsIGJlCj4+ID4+ID4+
PiB1c2UuRm9yIGxhc3QgY29kZSB3b3JkIFJFQURfTE9DQVRJT05fTEFTVF9DV19uIHJlZ2lzdGVy
IHdpbGwgYmUKPj4gPj4gPj4+IHVzZS4KPj4gPj4gPj4gPj4gIgo+PiA+PiA+PiBJbiB0aGUgY2Fz
ZSBvZiBRUElDIHYyLCBjb2Rld29yZHMgMCwgMSBhbmQgMiB3aWxsIGJlIGFjY2Vzc2VkIHRocm91
Z2gKPj4gPj4gPj4gUkVBRF9MT0NBVElPTl9uLCB3aGlsZSBjb2Rld29yZCAzIHdpbGwgYmUgYWNj
ZXNzZWQgdGhyb3VnaAo+PiA+PiA+PiBSRUFEX0xPQ0FUSU9OX0xBU1RfQ1dfbi4KPj4gPj4gPj4g
Igo+PiA+PiA+PiA+PiBXaGVuIEkgcmVhZCBteSBvd24gc2VudGVuY2UsIEkgZmVlbCB0aGF0IHRo
ZXJlIGlzIHNvbWV0aGluZyB3cm9uZy4KPj4gPj4gPj4gSWYgdGhlcmUgYXJlIG9ubHkgNCBjb2Rl
d29yZHMsIEkgZ3Vlc3MgYSBRUElDIHYyIGlzIGFibGUgdG8gdXNlCj4+ID4+ID4+IFJFQURfTE9D
QVRJT05fMyBvciBSRUFEX0xPQ0FUSU9OX0xBU1RfQ1dfMCBpbnRlcmNoYW5nZWFibHkuIElzbid0
IGl0Pwo+PiA+PiA+PiA+PiBJIGd1ZXNzIHRoZSBwb2ludCBvZiBoYXZpbmcgdGhlc2UgImxhc3Rf
Y3dfbiIgcmVnaXN0ZXJzIGlzIHRvIHN1cHBvcnQKPj4gPj4gPj4gdXAgdG8gOCBjb2Rld29yZHMs
IGFtIEkgd3Jvbmc/IElmIHRoaXMgdGhlIGNhc2UsIHRoZSBjdXJyZW50IHBhdGNoCj4+ID4+ID4+
IGNvbXBsZXRlbHkgZmFpbHMgZG9pbmcgdGhhdCBJIGRvbid0IGdldCB0aGUgcG9pbnQgb2Ygc3Vj
aCBjaGFuZ2UuCj4+ID4+ID4KPj4gPj4gPiBUaGlzIHJlZ2lzdGVyIGlzIG9ubHkgdXNlIHRvIHJl
YWQgbGFzdCBjb2RlIHdvcmQuCj4+ID4+ID4KPj4gPj4gPiBJIGhhdmUgYWRkcmVzcyBhbGwgdGhl
IGNvbW1lbnRzIGZyb20gYWxsIHRoZSBwcmV2aW91cyBzdWIgc2VxdWVudAo+PiA+PiA+IHBhdGNo
ZXMgYW5kIHB1c2hlZAo+PiA+PiA+IGFsbCBwYXRjaGVzIGluIG9ubHkgb25lIHNlcmllcy4KPj4g
Pj4gPgo+PiA+PiA+IFBsZWFzZSBjaGVjay4KPj4gPj4gPj4gICBUaGUgcmVnaXN0ZXJzIFJFQURf
TE9DQVRJT04gJiBSRUFEX0xPQ0FUSU9OX0xBU1QgYXJlIG5vdCBhc3NvY2lhdGVkID4+IHdpdGgg
bnVtYmVyIG9mIGNvZGUgd29yZHMuCj4+ID4+ICAgVGhlc2UgdHdvIHJlZ2lzdGVycyBhcmUgdXNl
ZCB0byBhY2Nlc3MgdGhlIGxvY2F0aW9uIGluc2lkZSBhIGNvZGUgPj4gd29yZC4KPj4gPgo+PiA+
IE9rLiBDYW4geW91IHBsZWFzZSBleHBsYWluIHdoYXQgaXMgYSBsb2NhdGlvbiB0aGVuPyBPciBw
b2ludCBtZSB0byBhCj4+ID4gZGF0YXNoZWV0IHRoYXQgZXhwbGFpbnMgaXQuCj4+IAo+PiAgICBU
aGUgbG9jYXRpb24gaXMgdGhlIHBvc2l0aW9uIGluc2lkZSBhIGNvZGUgd29yZC4KPj4gCj4+ID4K
Pj4gPiBCb3R0b20gbGluZSBxdWVzdGlvbjogd2h5IGhhdmluZyBSRUFEX0xPQ0FUSU9OXzAsIF8x
LC4uLiBhbgo+PiA+IFJFQURfTE9DQVRJT05fTEFTVF8wLCBfMSwgZXRjPwo+PiAKPj4gICBSRUFE
X0xPQ0FUSU9OXzAsIF8xLC4uLiBhcmUgdXNlZCB0byBleHRyYWN0IG11bHRpcGxlIGNodW5rcyBm
cm9tIGEgCj4+IGNvZGUgd29yZC4KPj4gCj4+ICAgZS5nIElmIHdlIHdhbnRlZCB0byBleHRyYWN0
IGZpcnN0IDEwMCBieXRlcyBmcm9tIGEgY29kZSB3b3JkIHRoZW4gCj4+ICgwLi4uOTkpIFJFQURf
TE9DQVRJT05fMCB3aWxsIGJlIGNvbmZpZ3VyZWQuCj4+ICAgICAgIGlmIHdlIHdhbnRlZCB0byBl
eHRyYWN0IG5leHQgMTAwIGJ5dGVzICgxMDAuLi4xOTkpIHRoZW4gCj4+IFJFQURfTE9DQVRJT05f
MSB3aWxsIGJlIGNvbmZpZ3VyZWQuCj4+IAo+PiAgICAgICBzYW1lIHdheSBmb3IgbGFzdCBjb2Rl
IHdvcmQgUkVBRF9MT0NBVElPTl9MQVNUXzAsIF8xLCB3aWxsIGJlIAo+PiB1c2VkLgo+PiAKPiAK
PiBOaWNlIGV4cGxhbmF0aW9uLCBhbmQgdGhhbmtzIGZvciB0aGUgYmVsb3cgZmlndXJlcy4gU28g
SSBndWVzcyB0aGVyZQo+IGlzIHNvbWUga2luZCBvZiAic21hbGwgU1JBTSIgdGhhdCBpcwo+IGRp
cmVjdGx5IGFkZHJlc3NhYmxlIHBlcmhhcHM/Cj4gCj4gSSB0aGluayBJJ20gZmluZSB3aXRoIHlv
dXIgc2VyaWVzIG5vdy4gSnVzdCBhIHNtYWxsIG5pdDogbmV4dCB0aW1lIHlvdQo+IHNlbmQgYSBz
ZXJpZXMsIHBsZWFzZSB1cGRhdGUgdGhlIHZlcnNpb24gbnVtYmVyICJbUEFUQ0ggdjZdIgo+IChh
dXRvbWF0aWNhbGx5IGFkZGVkIHdpdGggdGhlIC12NiBwYXJhbWV0ZXIgaW4gZ2l0LWZvcm1hdC1w
YXRjaCkuIEJ1dAo+IG5vIG5lZWQgdG8gcmVzZW5kIGp1c3QgZm9yIHRoYXQuCj4gCgogICBUaGFu
a3MgTWlxdWVsLiBTbyBub3cgbm8gbmVlZCB0byB0ZXN0IHRoZXNlIHBhdGNoZXMgZnVydGhlci4g
SSBoYXZlIAphbHJlYWR5IHRlc3RlZCB0aGVzZSBwYXRjaGVzIG9uIElQUTUwMTggU29DIHdpdGgg
bXRkX3Rlc3QgbW9kdWxlICYgCm5hbmQtdXRpbHMgdG9vbC4KCj4gCj4gVGhhbmtzLAo+IE1pcXXD
qGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
