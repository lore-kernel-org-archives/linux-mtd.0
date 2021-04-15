Return-Path: <SRS0=g3N+=JM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04E51C433B4
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Apr 2021 09:46:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E7E160FD8
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Apr 2021 09:46:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E7E160FD8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=q07M481Mn1743LJESQWO8YnPQeVca3n9LILDJSTooUU=; b=ni2zoPULGdZaSdtclbc0YClg/
	ny26okiG9diRQ7YpFVLhp2hU4wI+avO2vz0Aut6u7tDaVJKsgX65O55ER2GGPGDXUfbxzfHigFHan
	rCbtLerXCf0zdx4inDhwSdwidykH1hAZel72s+aIVF3KIDJI/Vog901gfkOBY6DKSB1jcxZ1iGR+0
	BkLTLBH9K26gS9byWoWxryNbaq0u02KaxrKrUdLU44yjABmzDPGNPM0689MMlz5bHjvcivMhjMLt0
	wpB0FxDmVobGUIdX3AV9HL1inlY1bpmPpO6LEicIYnF/yLRT4IZOcoS6oLeMwcW3IWHpHFXqzqM4y
	dHlU2DM7g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWyYb-00FbK9-R7; Thu, 15 Apr 2021 09:45:05 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWyXl-00Fb2U-SH
 for linux-mtd@desiato.infradead.org; Thu, 15 Apr 2021 09:44:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
 Subject:Sender:Reply-To:Cc:Content-ID:Content-Description;
 bh=TwJMfqcmNkJpWejn+h+g2Z+p62IbRsU/67+CH16fW48=; b=iX188Vu5eydcs0wlM13g3IqPPv
 tVUyED19Cc3upU85uOflO5mpEnWsL81lOfKzn6rkCwM3rgUvJ6CfmZYUXIw35qJNEonDGzQtGvWFj
 boMjLLRZI2Fg+d3x4h00e1x8tQPxywBOmA+ZGaDYR4XLwwMRWcl7oSTGSrV4L5XW9i5jEsa3uXAvO
 MJyXmdh4IGew2oq79LD5Q3MqyAqbKQT+RgU9yydws3Aqq508ZYkTm6gPN6o+/314kue5ylzoMDMY/
 LAE0wHUtHknzqJM4Dk6JlkQouJOl/wySrMNDcJC1U1SGQzIIYaZMEDDV4jZn+KVRPnB361FD6Bp/m
 E46xOFdw==;
Received: from mout-u-107.mailbox.org ([91.198.250.252])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWyXj-008RJt-Ar
 for linux-mtd@lists.infradead.org; Thu, 15 Apr 2021 09:44:12 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:2:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-u-107.mailbox.org (Postfix) with ESMTPS id 4FLZDT5YHzzQk2B;
 Thu, 15 Apr 2021 11:44:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
 by spamfilter06.heinlein-hosting.de (spamfilter06.heinlein-hosting.de
 [80.241.56.125]) (amavisd-new, port 10030)
 with ESMTP id gsPziHVGcP0A; Thu, 15 Apr 2021 11:44:03 +0200 (CEST)
Subject: Re: MT25Q Advanced Sector Protection support
To: Tudor.Ambarus@microchip.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com
References: <f59dc821-22fe-27cf-b93d-147709d64983@denx.de>
 <72427f10-4a3a-a0a4-f429-6638f9d428d0@microchip.com>
From: Stefan Roese <sr@denx.de>
Message-ID: <4d74e69e-270b-9ef8-71fe-11538e8f72a2@denx.de>
Date: Thu, 15 Apr 2021 11:44:02 +0200
MIME-Version: 1.0
In-Reply-To: <72427f10-4a3a-a0a4-f429-6638f9d428d0@microchip.com>
Content-Language: en-US
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -4.33 / 15.00 / 15.00
X-Rspamd-Queue-Id: C570A1819
X-Rspamd-UID: 85eac7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_024411_542501_6697A3DF 
X-CRM114-Status: GOOD (  18.69  )
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

SGkgVHVkb3IsCgpPbiAxNS4wNC4yMSAxMTo0MCwgVHVkb3IuQW1iYXJ1c0BtaWNyb2NoaXAuY29t
IHdyb3RlOgo+IE9uIDQvMTUvMjEgMTI6MjAgUE0sIFN0ZWZhbiBSb2VzZSB3cm90ZToKPj4gRVhU
RVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVz
cyB5b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlCj4+Cj4+IEhpLAo+IAo+IEhpLAo+IAo+Pgo+
PiBJJ20gcmlnaHQgbm93IHdvcmtpbmcgb24gYSBib2FyZCBlcXVpcHBlZCB3aXRoIGFuIE1UMjVR
VTEyOEFCQTFFU0UuCj4+IEFuZCBhZnRlciBkb2luZyBzb21lIGludGVuc2l2ZSBRU1BJIE5PUiB0
ZXN0cywgb25lIHNlY3RvciAoYXQgMHg0MDAwMCkKPj4gc2VlbXMgdG8gYmUgcGVybWFuZW50bHkg
bG9ja2VkLiBUaGUgbm9ybWFsIHVubG9ja2luZyBkb2VzIG5vdCBzZWVtIHRvCj4+IGhlbHA6Cj4+
Cj4+ICMgZmxhc2hfZXJhc2VhbGwgLXUgL2Rldi9tdGQwCj4gCj4gaGF2ZSB5b3UgdHJpZWQgdG8g
dW5sb2NrIGl0IGJlZm9yZSBlcmFzaW5nPyBZb3UgY2FuIHVzZSBmbGFzaF91bmxvY2suCgpJSVVU
QywgdGhlICItdSIgcGFyYW1ldGVyIGluIGVyYXNlYWxsIHNob3VsZCBwcm92aWRlIHRoaXMgdW5s
b2NraW5nIGFzCndlbGwuIEJ1dCBoZXksIEkgYWxzbyB0cmllZCAiZmxhc2hfdW5sb2NrIiB3aXRo
b3V0IGFueSBzdWNjZXNzLiBJIGFzc3VtZQp0aGF0IHRoaXMgY29tbWFuZCB1bmxvY2tzIGFsbCBz
ZWN0b3JzIGluIHRoZSBNVEQgZGV2aWNlIGF1dG9tYXRpY2FsbHkuCgo+PiBmbGFzaF9lcmFzZWFs
bCBoYXMgYmVlbiByZXBsYWNlZCBieSBgZmxhc2hfZXJhc2UgPG10ZGRldj4gMCAwYDsgcGxlYXNl
Cj4+IHVzZSBpdAo+PiBFcmFzaW5nIDY0IEtpYnl0ZSBAIDQwMDAwIC0tIDIyICUgY29tcGxldGUg
bGlibXRkOiBlcnJvciE6IE1FTUVSQVNFNjQKPj4gaW9jdGwgZmFpbGVkIGZvciBlcmFzZWJsb2Nr
IDQgKG10ZDApCj4+ICDCoMKgwqDCoMKgwqDCoCBlcnJvciA1IChJbnB1dC9vdXRwdXQgZXJyb3Ip
Cj4+IGZsYXNoX2VyYXNlOiBlcnJvciE6IC9kZXYvbXRkMDogTVREIEVyYXNlIGZhaWx1cmUKPj4g
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlcnJvciA1IChJbnB1dC9vdXRwdXQgZXJyb3IpCj4+
IEVyYXNpbmcgNjQgS2lieXRlIEAgMTEwMDAwIC0tIDEwMCAlIGNvbXBsZXRlCj4+Cj4+IE15IGJl
c3QgZ3Vlc3MgcmlnaHQgbm93IGlzIHRoYXQgc29tZWhvdyB0aGUgbm9udm9sYXRpbGUgbG9ja2lu
ZyB2aWEgdGhlCj4+IGFkdmFuY2VkIHNlY3RvciBwcm90ZWN0aW9uIGlzIGFjdGl2ZSBhbmQgbG9j
a2luZyB0aGlzIHNlY3Rvci4KPj4KPj4gRG9lcyBhbnlvbmUgaGF2ZSBzb21lIGlkZWFzIG9uIGhv
dyB0byBjb250aW51ZSBoZXJlPyBJcyB0aGVyZSBzb21lCj4gCj4gSWYgaXQncyBpbmRlZWQgYWJv
dXQgdGhlIGluZGl2aWR1YWwgYmxvY2sgcHJvdGVjdGlvbiwgeW91J2xsIGhhdmUgdG8KPiByZWFk
IHRoZSByZWdpc3RlciB0aGF0IGRlc2NyaWJlcyB3aGljaCByZWdpc3RlcnMgYXJlIGxvY2tlZC4K
ClllcywgSSdtIGRpZ2dpbmcgaW50byBpdCByaWdodCBub3cuIDspCgo+PiBvbmdvaW5nIHdvcmsg
dG8gc3VwcG9ydCB0aGUgTWljcm9uIGFkdmFuY2VkIHNlY3RvciBwcm90ZWN0aW9uIGluIExpbnV4
Pwo+IAo+IEknbSBhZGRpbmcgc3VwcG9ydCBmb3IgaW5kaXZpZHVhbCBibG9jayBwcm90ZWN0aW9u
IG9uIHNzdDI2IGZsYXNoZXMsCj4gd2hpY2ggc2hvdWxkIGJlIHNpbWlsYXIuCgpEbyB5b3UgYnkg
YW55IGNoYW5jZSBoYXZlIGEgV0lQIHZlcnNpb24gdG8gc2hhcmUsIHNvIHRoYXQgSSBjb3VsZCBi
YXNlCm15IHdvcmsgb24gdGhpcz8KClRoYW5rcywKU3RlZmFuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
