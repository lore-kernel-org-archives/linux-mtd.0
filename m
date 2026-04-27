Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A18FF8860
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2026 13:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iwJxZOiWpe1jNwG8Kne8j3YNPAWdDvwWrr3vaJ++tGM=; b=1ew8njm9/nq+Dr
	ywlWZPkULRwhV7GCTIgmiHJkPPWQHRVtyun5IYzv9IS07o75CwAGTIzpdQcTA2YSt7Avk+WHJTFtZ
	7131ehClMFfOtf59LNlWdigm5XoCfjANyX1GRlO60PyE+beX7+Uu7lWNXn15MIeYoWZu+XlWTyj3z
	JYl29LqQa8nwlQCE3YgJtIEuLzJF7IyL3xmhvD2a+JDpFImlonj7e1fMAqF+9imMnsnw5fnSg1IUX
	7N9kKjtLKE7Cxd4cuBnkDCcv4Y7Tg1Brn4CbxTEiizM9AO1SYlTBrWnxjbAdAWtN7ruqFF2BIV+Go
	PMAMtNPoru1UMe8vio2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMBV-0000000H0vB-0q9I;
	Mon, 27 Apr 2026 13:39:37 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMBR-0000000H0u1-2nTz
	for linux-mtd@lists.infradead.org;
	Mon, 27 Apr 2026 13:39:35 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 480EF1A3444;
	Mon, 27 Apr 2026 13:39:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1EE3C600D1;
	Mon, 27 Apr 2026 13:39:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BAC70107281FE;
	Mon, 27 Apr 2026 15:39:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777297170; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=u0HjnDBlJRHnuFJtZhpcX7G+V9nt/9IjO9ARqXr88uE=;
	b=0BnMPsQ1Mmc9LvCCnGpqxVA1xDxrZqHjoeHF9/iGUyJIV3DgfY5EnNblpDt+Gi4wIq2/m2
	W7L2mdfEIpgUxtwz2M6bS2ibD5Vtiz4JFkdlVpzcwrAW55TssuDA+0+C9Ycl6S9LdfA7Zv
	gyC9kDdAvQHGS8BYWzZ9y8BPNdQfrZKAwN56HqsRT6GCJsjOhMN1T9ykLnd4phHO2NuVTx
	KD1B0MM5zBC7RpaWcHIdaWKSrMFuN5Ro0MawTW3n6h6zeB3gSDYL7WYYARytouoRgFp2SI
	8Ezvjq7bIs7hBIdKez/Zy9em8tj3DAAPxNRgWHHHDb37reO14YW1XFdCFXM9TA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: <Takahiro.Kuwano@infineon.com>
Cc: <pratyush@kernel.org>,  <mwalle@kernel.org>,  <richard@nod.at>,
  <vigneshr@ti.com>,  <corbet@lwn.net>,  <sean.anderson@linux.dev>,
  <thomas.petazzoni@bootlin.com>,  <STLin2@winbond.com>,
  <linux-mtd@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v4 17/27] mtd: spi-nor: debugfs: Add locking support
In-Reply-To: <c8521e12e49040ce8683f81692644574@infineon.com> (Takahiro
	Kuwano's message of "Fri, 10 Apr 2026 04:39:22 +0000")
References: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-0-833dab5e7288@bootlin.com>
	<20260403-winbond-v6-18-rc1-spi-nor-swp-v4-17-833dab5e7288@bootlin.com>
	<c8521e12e49040ce8683f81692644574@infineon.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 27 Apr 2026 15:39:27 +0200
Message-ID: <87h5owh69c.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_063933_849866_5F4074D7 
X-CRM114-Status: GOOD (  11.07  )
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

SGVsbG8gU1BJIE5PUiBmb2tzLAoKT24gMTAvMDQvMjAyNiBhdCAwNDozOToyMiBHTVQsIDxUYWth
aGlyby5LdXdhbm9AaW5maW5lb24uY29tPiB3cm90ZToKCj4+IFRoZSBpb2N0bCBvdXRwdXQgbWF5
IGJlIGNvdW50ZXIgaW50dWl0aXZlIGluIHNvbWUgY2FzZXMuIEFza2luZyBmb3IgYQo+PiAibG9j
a2VkIHN0YXR1cyIgb3ZlciBhIHJlZ2lvbiB0aGF0IGlzIG9ubHkgcGFydGlhbGx5IGxvY2tlZCB3
aWxsIHJldHVybgo+PiAidW5sb2NrZWQiIHdoZXJlYXMgaW4gcHJhY3RpY2UgbWF5YmUgdGhlIGJp
Z2dlc3QgcGFydCBpcyBhY3R1YWxseQo+PiBsb2NrZWQuCj4+IAo+PiBLbm93aW5nIHdoYXQgaXMg
dGhlIHJlYWwgc29mdHdhcmUgbG9ja2luZyBzdGF0ZSB0aHJvdWdoIGRlYnVnZnMgd291bGQgYmUK
Pj4gdmVyeSBjb252ZW5pZW50IGZvciBkZXZlbG9wbWVudC9kZWJ1Z2dpbmcgcHVycG9zZXMsIGhl
bmNlIHRoaXMgcHJvcG9zYWwKPj4gZm9yIGFkZGluZyBhbiBleHRyYSBibG9jayBhdCB0aGUgZW5k
IG9mIHRoZSBmaWxlOiBhICJsb2NrZWQgc2VjdG9ycyIKPj4gYXJyYXkgd2hpY2ggbGlzdHMgZXZl
cnkgc2VjdGlvbiwgaWYgaXQgaXMgbG9ja2VkIG9yIG5vdCwgc2hvd2luZyBib3RoCj4+IHRoZSBh
ZGRyZXNzIHJhbmdlcyBhbmQgdGhlIHNpemVzIGluIG51bWJlcnMgb2YgYmxvY2tzLgo+PiAKPj4g
SGVyZSBpcyBhbiBleGFtcGxlIG9mIG91dHB1dCwgd2hhdCBpcyBhZnRlciB0aGUgInNlY3RvciBt
YXAiIGlzIG5ldy4KPj4gCj4+ICQgY2F0IC9zeXMva2VybmVsL2RlYnVnL3NwaS1ub3Ivc3BpMC4w
L3BhcmFtcwo+PiBuYW1lICAgICAgICAgICAgKG51bGwpCj4+IGlkICAgICAgICAgICAgICBlZiBh
MCAyMCAwMCAwMCAwMAo+PiBzaXplICAgICAgICAgICAgNjQuMCBNaUIKPj4gd3JpdGUgc2l6ZSAg
ICAgIDEKPj4gcGFnZSBzaXplICAgICAgIDI1Ngo+PiBhZGRyZXNzIG5ieXRlcyAgNAo+PiBmbGFn
cyAgICAgICAgICAgSEFTX1NSX1RCIHwgNEJfT1BDT0RFUyB8IEhBU180QkFJVCB8IEhBU19MT0NL
IHwgSEFTXzE2QklUX1NSIHwgSEFTX1NSX1RCX0JJVDYgfCBIQVNfNEJJVF9CUCB8Cj4+IFNPRlRf
UkVTRVQgfCBOT19XUAo+PiAKPj4gb3Bjb2Rlcwo+PiAgcmVhZCAgICAgICAgICAgMHhlYwo+PiAg
IGR1bW15IGN5Y2xlcyAgNgo+PiAgZXJhc2UgICAgICAgICAgMHhkYwo+PiAgcHJvZ3JhbSAgICAg
ICAgMHgzNAo+PiAgOEQgZXh0ZW5zaW9uICAgbm9uZQo+PiAKPj4gcHJvdG9jb2xzCj4+ICByZWFk
ICAgICAgICAgICAxUy00Uy00Uwo+PiAgd3JpdGUgICAgICAgICAgMVMtMVMtNFMKPj4gIHJlZ2lz
dGVyICAgICAgIDFTLTFTLTFTCj4+IAo+PiBlcmFzZSBjb21tYW5kcwo+PiAgMjEgKDQuMDAgS2lC
KSBbMV0KPj4gIGRjICg2NC4wIEtpQikgWzNdCj4+ICBjNyAoNjQuMCBNaUIpCj4+IAo+PiBzZWN0
b3IgbWFwCj4+ICByZWdpb24gKGluIGhleCkgICB8IGVyYXNlIG1hc2sgfCBvdmVybGFpZAo+PiAg
LS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLSstLS0tLS0tLS0KPj4gIDAwMDAwMDAwLTAz
ZmZmZmZmIHwgICAgIFsgICAzXSB8IG5vCj4+IAo+PiBsb2NrZWQgc2VjdG9ycwo+PiAgcmVnaW9u
IChpbiBoZXgpICAgfCBzdGF0dXMgICB8ICNibG9ja3MKPj4gIC0tLS0tLS0tLS0tLS0tLS0tLSst
LS0tLS0tLS0tKy0tLS0tLS0tCj4+ICAwMDAwMDAwMC0wM2ZmZmZmZiB8IHVubG9ja2VkIHwgMTAy
NAo+PiAKPj4gU2lnbmVkLW9mZi1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290
bGluLmNvbT4KCkkgZG9uJ3Qgd2FudCB0byBiZSB0b28gcHVzaHkgYnV0IHRoaXMgc2VyaWVzIGhh
cyBiZWVuIHBlbmRpbmcgZm9yIGEKd2hpbGUsIHRoZXJlIGFyZSByZWFsIGZpeGVzIGluc2lkZSwg
aXQgKElNTykgZ3JlYXRseSBpbXByb3ZlIHRoZQpkb2N1bWVudGF0aW9uLCBhZGRzIGEgdGVzdGlu
ZyBwcm9jZWR1cmUsIGdpdmVzIGEgZnJpZW5kbHkgaW50ZXJmYWNlIHRvCnVuZGVyc3RhbmQgd2hh
dCBpcyBsb2NrZWQsIGV0Yy4gSSBhbSB3b3JraW5nIG9uIGNsYXJpZnlpbmcgYW5kIGltcHJvdmlu
Zwp0aGUgV2luYm9uZCB2ZW5kb3IgZHJpdmVyIGV2ZW4gbW9yZSBub3cgYW5kIEkgbmVlZCB0aGVz
ZSBjaGFuZ2VzIHRvIGdldAppbiBmb3IgdGhlIGNsZWFudXAgdG8gY29udGludWUuIENhbiBzb21l
b25lIGJ1bXAgc3BpLW5vci9uZXh0IG9uIHRvcCBvZgp2Ny4xLXJjMSBhbmQgYXBwbHkgdGhpcz8g
VW5sZXNzIHRoZXJlIGFyZSBtb3JlIGNoYW5nZXMsIG9mIGNvdXJzZS4KClRoYW5rcyBhIGxvdCEK
TWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
