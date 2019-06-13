Return-Path: <SRS0=Yojm=UM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D3FAC31E45
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jun 2019 19:33:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 166C02147A
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jun 2019 19:33:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Oz8x34ye"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 166C02147A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=allycomm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8DvHb2QjEzgvkDxceUbuxptYI8AS2pHyQlu+3IRA+Bg=; b=Oz8x34yexF9LGZ
	iOOuzEOHTOlCGFP9o3soSKNRqFlFs+gdq1zrtMXIazE4reJsihgUDPpZQB8jN0n40DEdxXfdejygK
	hAJbxxhq1rn8Wni4WVopPthrr61Ie1PnVXLUgmjciX8Ki2RwYYxK/MQBOoIhU03QanB10X3sKgvNW
	4kkJJLopaRrUW62X9QeQp7bXpN4h611dZzZ5WKcuO2KxwNQq3R9hjIzINmZnxB7YAEwGPrNKMBm6L
	wdldVKJZU3nUkQZMlX/TdhpH8QmtMNa4TKxxB+VVK3KR/5w5jtGiNKdFNe7oxHENgpn/3X05HkWfP
	cMxjpB3gO4uc6ccGkTlw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hbVT2-0002mV-BF; Thu, 13 Jun 2019 19:33:00 +0000
Received: from mx.allycomm.com ([138.68.30.55])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hbVSy-0002lm-Ry
 for linux-mtd@lists.infradead.org; Thu, 13 Jun 2019 19:32:58 +0000
Received: from jkletsky-mbp15.guidewire.com (inet.guidewire.com [199.91.42.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx.allycomm.com (Postfix) with ESMTPSA id 70CB625055;
 Thu, 13 Jun 2019 12:32:53 -0700 (PDT)
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Jeff Kletsky <lede@allycomm.com>
Subject: nand: Proper definition of "extra" OOB regions? (4x interleaved, then
 one bulk user)
Message-ID: <0145346c-f1c3-bc50-6bb7-492bbe4f2da4@allycomm.com>
Date: Thu, 13 Jun 2019 12:32:53 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190613_123256_910461_F805FBAB 
X-CRM114-Status: GOOD (  11.23  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VEw7RFIKCkkndmUgYmVlbiB0cnlpbmcgdG8gdHJhY2sgZG93biB0aGUgcHJvcGVyIHdheSB0byBl
eHByZXNzIHRoZSBQYXJhZ29uClNQSSBOQU5EJ3MgT09CICJ1c2VyIiBkYXRhIHNlZ21lbnRzLCBi
dXQgYW0gbm90IGNsZWFyIGhvdyB1cHBlcgpsYXllcnMgaW50ZXJwcmV0IHRoZSBjb21iaW5hdGlv
biBvZiBgbXRkX29vYmxheW91dF9vcHMuZnJlZWAgYW5kIHRoZQpvdmVyYWxsIE9PQiBzaXplLCB0
eXBpY2FsbHkgc2V0IHRocm91Z2ggdGhlIGBOQU5EX01FTU9SR2AgbWFjcm8uCgpSYXRoZXIgdGhh
biBjaHVybiBQYXRjaHdvcmsgYW5kIHRob3NlIHRoYXQgZG9uYXRlIHRoZWlyIHRpbWUgYW5kCmVu
ZXJneSBmb2xsb3csIHJldmlldywgYW5kIG1hbmFnZSBwYXRjaGVzLCB3b3VsZCBpdCBiZSBwb3Nz
aWJsZSB0bwpjb25maXJtIHRoYXQgdGhlIGxhc3QgNjQgYnl0ZXMgb2YgdGhpcyBjaGlwJ3MgdXNl
ciBPT0IsIHdoaWNoCmlzIG5vdCBjb250aWd1b3VzIHdpdGggYW55IG90aGVyIHVzZXIgYXJlYXMs
IHNob3VsZCAob3Igc2hvdWxkIG5vdCkKYmUgZGVmaW5lZCBpbiBgLmZyZWVgIGFzIGEgZmlmdGgg
c2VjdGlvbj8KCi0tLQoKSW4gdGhlIGNhc2Ugb2YgdGhlIFBhcmFnb24gY2hpcHMsIHRoZXJlIGlz
IGEgdG90YWwgb2YgMTI4IGJ5dGVzIG9mIE9PQiwKc3BsaXQgaW50byBhIDQtYnl0ZSBCQk0gcmVz
ZXJ2YXRpb24sIGZvdXIgcmVwZWF0cyBvZiAxNS1ieXRlIHNlY3Rpb25zCndpdGggImZhY3Rvcnki
IGFuZCAidXNlciIgYXJlYXMgaW50ZXJsZWF2ZWQsIHRoZW4gdGhlIHJlbWFpbmluZyA2NCBieXRl
cwphdmFpbGFibGUgYXMgYSB1c2VyIGFyZWEsIG5vdCBjb250aWd1b3VzIHdpdGggb3RoZXIgdXNl
ciBhcmVhc1sxXS4KCjB4ODAwIC0tIDQgYnl0ZXMgQkJNCgoweDgwNCAtLSAyIGJ5dGVzIHVzZXIK
MHg4MDYgLS0gMTMgYnl0ZXMgZmFjdG9yeSBFQ0MKCjB4ODEzIC0tIDIgYnl0ZXMgdXNlcgoweDgx
NSAtLSAxMyBieXRlcyBmYWN0b3J5IEVDQwoKMHg4MjIgLS0gMiBieXRlcyB1c2VyCjB4ODI0IC0t
IDEzIGJ5dGVzIGZhY3RvcnkgRUNDCgoweDgzMSAtLSAyIGJ5dGVzIHVzZXIKMHg4MzMgLS0gMTMg
Ynl0ZXMgZmFjdG9yeSBFQ0MKCjB4ODQwIC0tIDY0IGJ5dGVzIHVzZXIgICAgICA8PT0gdGhpcyBp
cyB0aGUgc3ViamVjdCBvZiB0aGUgcXVlc3Rpb24KCkNsZWFybHksIHRoZSA0IHJlZ2lvbnMgb2Yg
aW50ZXJsZWF2ZWQgT09CIGRhdGEgbmVlZHMgdG8gYmUgZGVzY3JpYmVkCmluIGJvdGggYC5lY2Ng
IGFuZCBgLmZyZWVgLiBXaGF0IGlzbid0IGNvbXBsZXRlbHkgY2xlYXIgdG8gbWUgaXMgdGhlCnJl
bWFpbmluZyA2NC1ieXRlIGFyZWEuCgpJcyB0aGF0IHRoZSBPT0IgYXJlYSBpcyBkZWZpbmVkIGFz
IDEyOCBieXRlcyBhbmQgdGhhdCBvbmx5IDY0IGJ5dGVzCmhhdmUgYmVlbiByZXNlcnZlZCBzdWZm
aWNpZW50LCBvciBzaG91bGQgdGhvc2UgNjQgYnl0ZXMsIHdoaWNoCmFyZSBub3QgY29udGlndW91
cyB3aXRoIGFueSBvZiB0aGUgb3RoZXIgInVzZXIiIHNlZ21lbnRzIGJlIGEgZmlmdGgKc2VjdGlv
biBpbiBkZWZpbmluZyBgLmZyZWVgPwoKClRoYXQgdGhlIGRyaXZlciAid29ya3MiIHdpdGhvdXQg
ZGVmaW5pbmcgYSBmaWZ0aCByZWdpb24gaW4gYSBzcGVjaWZpYywKVUJJLWJhc2VkIGFwcGxpY2F0
aW9uIGRvZXNuJ3QgYXNzdXJlIG1lIHRoYXQgaXQgd2lsbCB3b3JrIHByb3Blcmx5CmluIGFsbCBh
cHBsaWNhdGlvbnMgd2l0aCBhbGwgdXBwZXItbGF5ZXIgY29uc3VtZXJzLgoKCkV4YW1pbmluZyBz
dXBwb3J0ZWQgY2hpcHMgd2l0aCBzaW1pbGFyIE9PQiBsYXlvdXRzIHdpdGggbXVsdGlwbGUKc2Vj
dGlvbnMgdGhlbiBhbiAiYWRkaXRpb25hbCIgYXJlYSwgc3VjaCBhcyB0aGUgR2lnYURldmljZSBH
RDVGeEdRNHhBLAp3YXMgbm90IHRlcnJpYmx5IGluc2lnaHRmdWwuIFRoZSBHRDVGMUdRNFVBWSBk
YXRhc2hlZXRbMl0gbWFya3MgdGhlCnVwcGVyIDY0LWJ5dGUgcmVnaW9uIGFzICJyZXNlcnZlZCIs
IGluIGNvbnRyYXN0IHRvICJVc2VyIG1ldGEgZGF0YSIKYW5kIGl0IGlzIG5vdCBkZXNjcmliZWQg
aW4gdGhlIGN1cnJlbnQgYGdpZ2FkZXZpY2UuY2BbM10uIEFzIHN1Y2gsCml0IGlzbid0IGNvbnZp
bmNpbmcgZXZpZGVuY2UgdGhhdCBpdCB3YXMgb21pdHRlZCBhcyAibm90IHJlcXVpcmVkIiwKYmVj
YXVzZSBpdCB3YXMgbWFya2VkICJyZXNlcnZlZCIsIG9yIHBlcmhhcHMgZm9yIHNvbWUgb3RoZXIg
cmVhc29uLgoKCkFzIGEgc2lkZSBub3RlLCB0aGUgZGF0YXNoZWV0IGFsc28gbWFya3MgdGhlIGZp
cnN0IGJ5dGUgb2YgZWFjaCByZWdpb24KYXMgInJlc2VydmVkIiwgd2hpY2ggaXMgbm90IHJlZmxl
Y3RlZCBpbiB0aGUgY3VycmVudCBgZ2lnYWRldmljZS5jYCwKd2hpY2ggaW5jbHVkZXMgaXQgaW4g
dGhlIGZyZWUgcmVnaW9uIGZvciBzZWN0aW9ucyAxLTMuCgoKVGhhbmtzIQoKSmVmZgoKCgoKWzFd
aHR0cDovL3d3dy54dHh0ZWNoLmNvbS91cGZpbGUvMjAxNjA4MjUxNzI3NDU5MC5wZGYKIMKgwqDC
oCBwZy4gMzYKClsyXWh0dHBzOi8vZGF0YXNoZWV0NHUuY29tL2RhdGFzaGVldC1wZGYtZmlsZS83
OTE2ODAvR2lnYURldmljZS9HRDVGMUdRNFVBWS8xCiDCoMKgwqAgcGcuIDMzCgpbM11odHRwczov
L2VsaXhpci5ib290bGluLmNvbS9saW51eC92NS4yLXJjNC9zb3VyY2UvZHJpdmVycy9tdGQvbmFu
ZC9zcGkvZ2lnYWRldmljZS5jI0w0NQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
