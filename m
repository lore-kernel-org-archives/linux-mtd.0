Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6196CEDD8F
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Oct 2024 12:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J0lcLsOAYB6uZYH4GGIBmSfEImLGpKj41EY9mSNoZuY=; b=RN85n2dyaf2fax
	UJQEBuirt4Vu5Sjqk1Ee1BXThrNeO1NIxmhqRnj9aD3nY0Ybv5TB+1LOQZj3fRfLJAIILychRWm+K
	wkyOAUXrOZWDmuIlvQnkV0NRiLfPFE1d+et4emI6ExWzeBhnRuqAmzOaU4t1ePnpj+okTT7L6Z2AE
	LaAZoXD6Qk73DE/7veSStYI5pxyFiqrnjn7AoCZfd2k7m4O+2q5FU07L2nxVjznazu/EXC4zCiDJV
	rcHGoxHQYoyMiBK7XYR833r8CHBX3esVDCpuAehBcy/YckLNhuaklwut5ftKKmJo8Ao/G/ZdoIndK
	CmqnXvFhtB/+mJyShjOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syW7L-00000009HA1-2OLY;
	Wed, 09 Oct 2024 12:48:39 +0000
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25] helo=mx0b-001ae601.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syW7G-00000009H6w-3tJ9;
	Wed, 09 Oct 2024 12:48:36 +0000
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4994xc0x003245;
	Wed, 9 Oct 2024 07:48:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=b9CbWLDMZti2ojgRTihH3RA0WYLUzEcG7aX6pdihoQY=; b=
	WI0sVaycTZYkwMgmtYcXXMdvigsiua8Ix4Qh02mNCGH2fBXcoCmYBNNsEO5BXVde
	1Bz9WSIl3H9aytV4MjeLGq5iNgl4nMnifXKD7gZBG7Nh0M0RDNAmEax34ZlRrQpc
	BqxwXp6rQsj7d8HBI3neZNecBDiZiUXrqk9SjO/XH7GSP3KBa0vc3lo3Nh2evgTs
	vMpU/eouIhXwHQgJkPlVYadHgMk2W3tKDA7WeoPiKLk9i2DcqwNiAeCbgFtNS1E3
	D/03y3ryRn8KcZ7U0bo3WMxdHCmB9tG9qfIm/V0gyX7oGE/Hh+fOgbX3EkFod4UH
	WWLlkgIPTShr+Vylj7CyYA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4232uy5xfs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Oct 2024 07:48:17 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 9 Oct 2024
 13:48:15 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Wed, 9 Oct 2024 13:48:15 +0100
Received: from [198.90.208.18] (ediswws06.ad.cirrus.com [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 33C5E82024A;
	Wed,  9 Oct 2024 12:48:15 +0000 (UTC)
Message-ID: <41a0ad69-912b-4eb3-84f7-fb385433c056@opensource.cirrus.com>
Date: Wed, 9 Oct 2024 13:48:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/51] treewide: Switch to __pm_runtime_put_autosuspend()
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Ulf Hansson
	<ulf.hansson@linaro.org>,
        Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>,
        Sakari Ailus
	<sakari.ailus@linux.intel.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-bluetooth@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-crypto@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>,
        <nouveau@lists.freedesktop.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
        <linux-i3c@lists.infradead.org>, <linux-iio@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <iommu@lists.linux.dev>, <imx@lists.linux.dev>,
        <linux-mediatek@lists.infradead.org>, <linux-media@vger.kernel.org>,
        <linux-mmc@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
        <netdev@vger.kernel.org>, <linux-wireless@vger.kernel.org>,
        <linux-pci@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-pwm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-staging@lists.linux.dev>, <linux-usb@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <greybus-dev@lists.linaro.org>,
        <asahi@lists.linux.dev>, Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
 <CAPDyKFp0N6UJhnHS164Tdf=xkWB0jzq65L9TdvYazeBQ-6WjeQ@mail.gmail.com>
 <20241007184924.GH14766@pendragon.ideasonboard.com>
 <CAPDyKFpQVnF7eQv3dup8k-3EijnMjuveCG9sZ=Rpey1Y6MBJEg@mail.gmail.com>
 <20241007222502.GG30699@pendragon.ideasonboard.com>
 <CAPDyKFrGNwna6Y2pqSRaBbRYHKRaD2ayqQHLtoqLPOu9Et7qTg@mail.gmail.com>
 <CAJZ5v0jvJyS7D5-wURi2kyWN-rmNa+YqupeQJ000pQRVd9VBcQ@mail.gmail.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <CAJZ5v0jvJyS7D5-wURi2kyWN-rmNa+YqupeQJ000pQRVd9VBcQ@mail.gmail.com>
X-Proofpoint-GUID: ltWPFp1gnPUjzPmaRQ9EaXCq91PhMVjU
X-Proofpoint-ORIG-GUID: ltWPFp1gnPUjzPmaRQ9EaXCq91PhMVjU
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_054835_021753_A188963B 
X-CRM114-Status: GOOD (  22.19  )
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

T24gMDgvMTAvMjAyNCA3OjI0IHBtLCBSYWZhZWwgSi4gV3lzb2NraSB3cm90ZToKPiBPbiBUdWUs
IE9jdCA4LCAyMDI0IGF0IDEyOjM14oCvQU0gVWxmIEhhbnNzb24gPHVsZi5oYW5zc29uQGxpbmFy
by5vcmc+IHdyb3RlOgo+Pgo+PiBPbiBUdWUsIDggT2N0IDIwMjQgYXQgMDA6MjUsIExhdXJlbnQg
UGluY2hhcnQKPj4gPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4gd3JvdGU6Cj4+
Pgo+Pj4gSGkgVWxmLAo+Pj4KPj4+IE9uIFR1ZSwgT2N0IDA4LCAyMDI0IGF0IDEyOjA4OjI0QU0g
KzAyMDAsIFVsZiBIYW5zc29uIHdyb3RlOgo+Pj4+IE9uIE1vbiwgNyBPY3QgMjAyNCBhdCAyMDo0
OSwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKPj4+Pj4gT24gRnJpLCBPY3QgMDQsIDIwMjQgYXQg
MDQ6Mzg6MzZQTSArMDIwMCwgVWxmIEhhbnNzb24gd3JvdGU6Cj4+Pj4+PiBPbiBGcmksIDQgT2N0
IDIwMjQgYXQgMTE6NDEsIFNha2FyaSBBaWx1cyB3cm90ZToKPj4+Pj4+Pgo+Pj4+Pj4+IEhlbGxv
IGV2ZXJ5b25lLAo+Pj4+Pj4+Cj4+Pj4+Pj4gVGhpcyBzZXQgd2lsbCBzd2l0Y2ggdGhlIHVzZXJz
IG9mIHBtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKCkgdG8KPj4+Pj4+PiBfX3BtX3J1bnRpbWVf
cHV0X2F1dG9zdXNwZW5kKCkgd2hpbGUgdGhlIGZvcm1lciB3aWxsIHNvb24gYmUgcmUtcHVycG9z
ZWQKPj4+Pj4+PiB0byBpbmNsdWRlIGEgY2FsbCB0byBwbV9ydW50aW1lX21hcmtfbGFzdF9idXN5
KCkuIFRoZSB0d28gYXJlIGFsbW9zdAo+Pj4+Pj4+IGFsd2F5cyB1c2VkIHRvZ2V0aGVyLCBhcGFy
dCBmcm9tIGJ1Z3Mgd2hpY2ggYXJlIGxpa2VseSBjb21tb24uIEdvaW5nCj4+Pj4+Pj4gZm9yd2Fy
ZCwgbW9zdCBuZXcgdXNlcnMgc2hvdWxkIGJlIHVzaW5nIHBtX3J1bnRpbWVfcHV0X2F1dG9zdXNw
ZW5kKCkuCj4+Pj4+Pj4KPj4+Pj4+PiBPbmNlIHRoaXMgY29udmVyc2lvbiBpcyBkb25lIGFuZCBw
bV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZCgpIHJlLXB1cnBvc2VkLAo+Pj4+Pj4+IEknbGwgcG9z
dCBhbm90aGVyIHNldCB0byBtZXJnZSB0aGUgY2FsbHMgdG8gX19wbV9ydW50aW1lX3B1dF9hdXRv
c3VzcGVuZCgpCj4+Pj4+Pj4gYW5kIHBtX3J1bnRpbWVfbWFya19sYXN0X2J1c3koKS4KPj4+Pj4+
Cj4+Pj4+PiBUaGF0IHNvdW5kcyBsaWtlIGl0IGNvdWxkIGNhdXNlIGEgbG90IG9mIGNodXJucy4K
Pj4+Pj4+Cj4+Pj4+PiBXaHkgbm90IGFkZCBhIG5ldyBoZWxwZXIgZnVuY3Rpb24gdGhhdCBkb2Vz
IHRoZQo+Pj4+Pj4gcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQoKSBhbmQgdGhlIHBtX3J1bnRp
bWVfbWFya19sYXN0X2J1c3koKQo+Pj4+Pj4gdGhpbmdzPyBUaGVuIHdlIGNhbiBzdGFydCBtb3Zp
bmcgdXNlcnMgb3ZlciB0byB0aGlzIG5ldyBpbnRlcmZhY2UsCj4+Pj4+PiByYXRoZXIgdGhhbiBo
YXZpbmcgdGhpcyBpbnRlcm1lZGlhdGUgc3RlcD8KPj4+Pj4KPj4+Pj4gSSB0aGluayB0aGUgQVBJ
IHdvdWxkIGJlIG5pY2VyIGlmIHdlIHVzZWQgdGhlIHNob3J0ZXN0IGFuZCBzaW1wbGVzdAo+Pj4+
PiBmdW5jdGlvbiBuYW1lcyBmb3IgdGhlIG1vc3QgY29tbW9uIHVzZSBjYXNlcy4gRm9sbG93aW5n
Cj4+Pj4+IHBtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKCkgd2l0aCBwbV9ydW50aW1lX21hcmtf
bGFzdF9idXN5KCkgaXMgdGhhdAo+Pj4+PiBtb3N0IGNvbW1vbiB1c2UgY2FzZS4gVGhhdCdzIHdo
eSBJIGxpa2UgU2FrYXJpJ3MgYXBwcm9hY2ggb2YgcmVwdXJwb3NpbmcKPj4+Pj4gcG1fcnVudGlt
ZV9wdXRfYXV0b3N1c3BlbmQoKSwgYW5kIGludHJvZHVjaW5nCj4+Pj4+IF9fcG1fcnVudGltZV9w
dXRfYXV0b3N1c3BlbmQoKSBmb3IgdGhlIG9kZCBjYXNlcyB3aGVyZQo+Pj4+PiBwbV9ydW50aW1l
X21hcmtfbGFzdF9idXN5KCkgc2hvdWxkbid0IGJlIGNhbGxlZC4KPj4+Pgo+Pj4+IE9rYXksIHNv
IHRoZSByZWFzb24gZm9yIHRoaXMgYXBwcm9hY2ggaXMgYmVjYXVzZSB3ZSBjb3VsZG4ndCBmaW5k
IGEKPj4+PiBzaG9ydCBhbmQgZGVzY3JpcHRpdmUgbmFtZSB0aGF0IGNvdWxkIGJlIHVzZWQgaW4g
ZmF2b3Igb2YKPj4+PiBwbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZCgpLiBMZXQgbWUgdGhyb3cg
c29tZSBpZGVhcyBhdCBpdCBhbmQgbWF5YmUKPj4+PiB5b3UgbGlrZSBpdCAtIG9yIG5vdC4gOi0p
Cj4+Pgo+Pj4gSSBsaWtlIHRoZSBpZGVhIGF0IGxlYXN0IDotKQo+Pj4KPj4+PiBJIGRvbid0IGtu
b3cgd2hhdCBvcHRpb25zIHlvdSBndXlzIGRpc2N1c3NlZCwgYnV0IHRvIG1lIHRoZSBlbnRpcmUK
Pj4+PiAiYXV0b3N1c3BlbmQiLXN1ZmZpeCBpc24ndCByZWFsbHkgdGhhdCBuZWNlc3NhcnkgaW4g
bXkgb3Bpbmlvbi4gVGhlcmUKPj4+PiBhcmUgbW9yZSB3YXlzIHRoYW4gY2FsbGluZyBwbV9ydW50
aW1lX3B1dF9hdXRvc3VzcGVuZCgpIHRoYXQgdHJpZ2dlcnMKPj4+PiB1cyB0byB1c2UgdGhlIFJQ
TV9BVVRPIGZsYWcgZm9yIHJwbV9zdXNwZW5kKCkuIEZvciBleGFtcGxlLCBqdXN0Cj4+Pj4gY2Fs
bGluZyBwbV9ydW50aW1lX3B1dCgpIGhhcyB0aGUgc2ltaWxhciBlZmZlY3QuCj4+Pgo+Pj4gVG8g
YmUgaG9uZXN0LCBJJ20gbG9zdCB0aGVyZS4gcG1fcnVudGltZV9wdXQoKSBjYWxscwo+Pj4gX19w
bV9ydW50aW1lX2lkbGUoUlBNX0dFVF9QVVQgfCBSUE1fQVNZTkMpLCB3aGlsZQo+Pj4gcG1fcnVu
dGltZV9wdXRfYXV0b3N1c3BlbmQoKSBjYWxscyBfX3BtX3J1bnRpbWVfc3VzcGVuZChSUE1fR0VU
X1BVVCB8Cj4+PiBSUE1fQVNZTkMgfCBSUE1fQVVUTykuCj4+Cj4+IF9fcG1fcnVudGltZV9pZGxl
KCkgZW5kcyB1cCBjYWxsaW5nIHJwbV9pZGxlKCksIHdoaWNoIG1heSBjYWxsCj4+IHJwbV9zdXNw
ZW5kKCkgLSBpZiBpdCBzdWNjZWVkcyB0byBpZGxlIHRoZSBkZXZpY2UuIEluIHRoYXQgY2FzZSwg
aXQKPj4gdGFncyBvbiB0aGUgUlBNX0FVVE8gZmxhZyBpbiB0aGUgY2FsbCB0byBycG1fc3VzcGVu
ZCgpLiBRdWl0ZSBzaW1pbGFyCj4+IHRvIHdoYXQgaXMgaGFwcGVuaW5nIHdoZW4gY2FsbGluZyBw
bV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZCgpLgo+IAo+IFJpZ2h0Lgo+IAo+IEZvciBhbG1vc3Qg
ZXZlcnlib2R5LCBleGNlcHQgZm9yIGEgc21hbGwgYnVuY2ggb2YgZHJpdmVycyB0aGF0Cj4gYWN0
dWFsbHkgaGF2ZSBhIC5ydW50aW1lX2lkbGUoKSBjYWxsYmFjaywgcG1fcnVudGltZV9wdXQoKSBp
cwo+IGxpdGVyYWxseSBlcXVpdmFsZW50IHRvIHBtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKCku
Cj4gCj4gU28gcmVhbGx5IHRoZSBxdWVzdGlvbiBpcyB3aHkgYW55b25lIHdobyBkb2Vzbid0IHBy
b3ZpZGUgYQo+IC5ydW50aW1lX2lkbGUoKSBjYWxsYmFjayBib3RoZXJzIHdpdGggdXNpbmcgdGhp
cyBzcGVjaWFsCj4gcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQoKSB0aGluZywKCkJlY2F1c2Ug
dGhleSBhcmUgZm9sbG93aW5nIHRoZSBkb2N1bWVudGF0aW9uPyBJdCBzYXlzOgoKIkRyaXZlcnMg
c2hvdWxkIGNhbGwgcG1fcnVudGltZV9tYXJrX2xhc3RfYnVzeSgpIHRvIHVwZGF0ZSB0aGlzIGZp
ZWxkCmFmdGVyIGNhcnJ5aW5nIG91dCBJL08sIHR5cGljYWxseSBqdXN0IGJlZm9yZSBjYWxsaW5n
CnBtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKCkuIgoKYW5kCgoiSW4gb3JkZXIgdG8gdXNlIGF1
dG9zdXNwZW5kLCBzdWJzeXN0ZW1zIG9yIGRyaXZlcnMgbXVzdCBjYWxsCnBtX3J1bnRpbWVfdXNl
X2F1dG9zdXNwZW5kKCkgKC4uLiksIGFuZCB0aGVyZWFmdGVyIHRoZXkgc2hvdWxkIHVzZSB0aGUK
dmFyaW91cyBgKl9hdXRvc3VzcGVuZCgpYCBoZWxwZXIgZnVuY3Rpb25zIGluc3RlYWQgb2YgdGhl
IG5vbiMKYXV0b3N1c3BlbmQgY291bnRlcnBhcnRzIgoKU28gdGhlIGRvY3VtZW50YXRpb24gc2F5
cyBJIHNob3VsZCBiZSB1c2luZyBwbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZCgpCmluc3RlYWQg
b2YgcG1fcnVudGltZV9wdXQoKS4KClNlZW1zIHVuZmFpciB0byBjcml0aWNpc2UgcGVvcGxlIGZv
ciBmb2xsb3dpbmcgdGhlIGRvY3VtZW50YXRpb24uCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
