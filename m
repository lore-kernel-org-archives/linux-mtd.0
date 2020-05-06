Return-Path: <SRS0=eoWp=6U=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54315C28CBC
	for <linux-mtd@archiver.kernel.org>; Wed,  6 May 2020 19:02:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C67C2076D
	for <linux-mtd@archiver.kernel.org>; Wed,  6 May 2020 19:02:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oQHYUmXY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C67C2076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=80VJcjFBzzVMWBPUKcdmSfZWJbNpXT0hSMIVN9D2znM=; b=oQHYUmXY2JzKCN
	VUuLHgpUzvHnN1iQE7v2ahTy6n52NzNAfNKY+rxz+61RGTsr5uelknl2iyJ1liUW5bamtVwjNDFJL
	HXhIUlw46WSzcdtGJy/ITZuTfeK/ZPuom0FMRCBCuNZIQDOLcEbfxPpd03uuOZ64lqPYUW98W6fXp
	iiFl3azOok38kX7ANhGR/znkPmOP+y/dp/aHPsLQZVw15FkU3Q9NQf+09ApvWdGsFhOMW21Hz/ay0
	wqTjqvKn7TGj9lBnEiMREhiUOD3jp9lNWueuNoGLTlhSnXJKSNxjz08NH3TJKWpdma4JyT16soxEh
	4o/iRRBOMxk4qtHbs8zw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWPJ0-0004ce-TW; Wed, 06 May 2020 19:02:06 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWPIx-0004bU-VJ
 for linux-mtd@lists.infradead.org; Wed, 06 May 2020 19:02:05 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 6618D2A0213;
 Wed,  6 May 2020 20:02:01 +0100 (BST)
Date: Wed, 6 May 2020 21:01:58 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [EXT] [PATCH v2 3/3] mtd: rawnand: micron: Address the shallow
 erase issue
Message-ID: <20200506210158.7fe33cec@collabora.com>
In-Reply-To: <1414270659.192477.1588790669444.JavaMail.zimbra@nod.at>
References: <20200503114029.30257-1-miquel.raynal@bootlin.com>
 <20200503114029.30257-4-miquel.raynal@bootlin.com>
 <BN7PR08MB5684D285CAE2438B355DCE80DBA40@BN7PR08MB5684.namprd08.prod.outlook.com>
 <20200506104522.6c90f88f@collabora.com>
 <BN7PR08MB5684D8DFC50CB93B53705619DBA40@BN7PR08MB5684.namprd08.prod.outlook.com>
 <20200506180420.13996633@collabora.com>
 <BN7PR08MB56843895500F4ADA88262C59DBA40@BN7PR08MB5684.namprd08.prod.outlook.com>
 <1414270659.192477.1588790669444.JavaMail.zimbra@nod.at>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_120204_140442_76F1240C 
X-CRM114-Status: GOOD (  17.26  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Steve deRosier <derosier@gmail.com>,
 "Zoltan Szubbocsev \(zszubbocsev\)" <zszubbocsev@micron.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, tglx <tglx@linutronix.de>,
 Piotr Wojtaszczyk <WojtaszczykP@cumminsallison.com>,
 "Bean Huo \(beanhuo\)" <beanhuo@micron.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gV2VkLCA2IE1heSAyMDIwIDIwOjQ0OjI5ICswMjAwIChDRVNUKQpSaWNoYXJkIFdlaW5iZXJn
ZXIgPHJpY2hhcmRAbm9kLmF0PiB3cm90ZToKCj4gQmVhbiwgQm9yaXMsCj4gCj4gLS0tLS0gVXJz
cHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+ID4+ID4gQ29uY2VybmluZyB0aGlzLCBJIHN0aWxsIGhh
dmUgcXVlc3Rpb24sIGZvciB0aGUgVUJJRlMsICBJZiBJIGFtCj4gPj4gPiBjb3JyZWN0LCB0aGVy
ZSBhcmUgRUMgYW5kIFZJRCBoZWFkZXIgYm90aCBiZWluZyBkYW1hZ2VkLCB0aGVuIFVCSUZTCj4g
Pj4gPiB3aWxsIHJlLWVyYXNlIGl0LiBJIGRvbid0IGtub3cgaWYgVUJJRlMgY2FuIGhhbmRsZSB0
aGVyZSBpcyBkaXJ0eS9maWxsaW5nIGRhdGEKPiA+PiA+IGluIHRoZSAgCj4gPj4gc29tZSBwYWdl
cyAgYW5kIEVDL1ZJRCB2YWxpZC4gIAo+IAo+IFVoaC4gRGFtYWdpbmcganVzdCBwYXlsb2FkIGFz
a3MgZm9yIHRyb3VibGUuCgpJJ2QgZXhwZWN0IFVCSSB0byBqdXN0IG1hcmsgdGhlIExFQiBhcyBi
YWQgYW5kIHNjaGVkdWxlIGl0IGZvciBlcmFzdXJlCihhZ2FpbiwgcHJldHR5IHNpbWlsYXIgdG8g
YW4gaW50ZXJydXB0ZWQgZXJhc2UpLgoKPiAKPiA+PiA+IE1heWJlIFJpY2hhcmQgaGFzIGZpeGVk
IGl0LiAgCj4gPj4gCj4gPj4gSWYgdGhlIGJsb2NrIGlzIGJlaW5nIGVyYXNlZCB0aGF0IG1lYW5z
IHRoZXJlJ3MgYW5vdGhlciBvbmUgbWFwcGVkIHRvIHRoZSBzYW1lCj4gPj4gTEVCLCBvciB0aGUg
YmxvY2sgaXMgc2ltcGx5IG5vdCBuZWVkZWQgYW55bW9yZS4gSW4gYm90aCBjYXNlcywgdGhpcyBv
bGQgYmxvY2sKPiA+PiBzaG91bGRuJ3QgYmUgcmVmZXJlbmNlZC4gQWdhaW4sIGlmIHRoYXQgaGFw
cGVucywgaXQncyBhIGJ1Zy4gIAo+IAo+IFNhZGx5IGl0IGlzIG5vdCBzbyBlYXN5Lgo+IAo+IElJ
UkMgdGhlIFVCSUZTIGxvZyByaW5nIGlzIHN1Y2ggYSBjb3JuZXIgY2FzZSwgaXQgdXNlcyBhIGZp
eGVkIExFQiByYW5nZSBmb3IKPiB0aGlzIHB1cnBvc2UuIEJlZm9yZSB3cml0aW5nIHRvIGEgbmV3
IExFQiBpdCB1bm1hcHMgaXQuIElmIHRoZSByZXN1bHRpbmcgZXJhc2Ugb3BlcmF0aW9uCj4gaXMg
aW50ZXJydXB0ZWQgYmVmb3JlIGEgbmV3IHZlcnNpb24gb2YgdGhlIHNhbWUgTEVCIGlzIHdyaXR0
ZW4gcmVhZGluZyBmcm9tIHRoYXQKPiBMRUIgd291bGQgcmVzdWx0IGluIEVDQyBlcnJvcnMuCgpE
dWguIFdoYXQgaGFwcGVucyB3aGVuIHlvdSBoYXZlIEVDQyBlcnJvcnM/IERvZXMgdGhhdCBzdG9w
IHRoZSBtb3VudD8KU2hvdWxkbid0IHdlIG1ha2UgdGhhdCBwYXJ0IG1vcmUgcm9idXN0PwoKPiAg
Cj4gPiBXb3VsZCB5b3UgcGxlYXNlIGhlbHAgdXMgY29uZmlybSB0aGlzPyAgaG93IGRvZXMgdWJp
ZnMgaGFuZGxlIHRoaXMgc2l0dWF0aW9uPwo+ID4gQWxzbyBvdGhlciBGUz8gRWcsIGpmZnMyLCB5
YWZmcyAgCj4gCj4gVGhlcmUgYXJlIGNhc2VzIHdoZXJlIChwYXJ0aWFsbHkpIGVyYXNlZCBMRUJz
IGFyZSBzdGlsbCByZWZlcmVuY2VkLgo+IFVCSUZTIGFzc3VtZXMgdGhhdCBhIExFQiBpdCB1bm1h
cHMgaXMgYWZ0ZXIgYSBwb3dlci1jdXQgZWl0aGVyIDB4RkYgb3IgaW50YWN0Lgo+IEluIHJlbGll
cyBpbiB0aGUgZmFjdCB0aGF0IFVCSSB3aWxsIGRldGVjdCBhbiBpbnRlcnJ1cHRlZCBlcmFzZSBv
cGVyYXRpb24gYW5kCj4gcmUtZXJhc2VzIHRoZSBQRUIuCj4gRmFzdG1hcCBvbmNlIHZpb2xhdGVk
IHRoaXMgcnVsZSwgaXQgdG9vayB5ZWFycyB1bnRpbCB0aGUgZmlyc3QgdXNlciBoaXQgdGhpcy4K
PiAKPiBTbyBwbGVhc2UgbWFrZSBzdXJlIHRoYXQgdGhlIFZJRCBoZWFkZXIgd2lsbCBiZSBkZXN0
cm95ZWQuCgpJIHJlYWxseSBoYXRlIHRoZSBpZGVhIG9mIGhhdmluZyBGUy1zcGVjaWZpYyBsb2dp
YyBpbiB0aGUgTWljcm9uCnF1aXJrLiBJc24ndCB0aGVyZSBhIHdheSB3ZSBjYW4gZml4IHRoYXQg
aW4gVUJJRlM/IFBsdXMsIGRvIHdlIGhhdmUgYW55Cmd1YXJhbnRlZSB0aGF0IHRoZSBFQy9WSUQg
aGVhZGVycyB3aWxsIGJlIGNvcnJ1cHRlZCBhbG9uZyB3aXRoIFVCSUZTCmRhdGEgd2hlbiBhbiBl
cmFzZSBpcyBpbnRlcnJ1cHRlZD8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
