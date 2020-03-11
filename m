Return-Path: <SRS0=SuWK=44=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98870C10F25
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 07:43:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DADE20578
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 07:43:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ni3MESzd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DADE20578
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=675jrVTnLRZ/OEhiOWvvtoqu3IgxnEMMrZ+EMpUp7DE=; b=Ni3MESzd0+/kfs
	mXIEPLCx9+re3PDAZSfJcKJaxpLJR24+vy4Os7Dlpvbyt9dZ2QSW6tB5PPteR+Q7BiZlSd72jZODl
	yF9y9qgssVNfwmK/5GmBpj1k2l4voOmyJh3T1vePMpEyDhCypZeyLBdUF/KkalpIzdVKLTK/tTBhH
	48bbmfG245Azu/PC7tT0U75ETS6Jh89eS5ZoWNp4SYV+CVGSaaBNUfxXWlvfbxHD7kfRw/UNMfYxN
	M1JK6g/PB9BPKYOcAMH1s1aroaTOOS/bQ5SUhGEAEFEIEKGCZpAv2uU4uRGnJ8mqhAESnwTVB3h74
	2nBoYeIt+FSii8Xm4ajg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBw1J-0004aN-M5; Wed, 11 Mar 2020 07:43:13 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBw1G-0004Zj-Mo
 for linux-mtd@lists.infradead.org; Wed, 11 Mar 2020 07:43:12 +0000
X-Originating-IP: 90.89.41.158
Received: from xps13 (lfbn-tou-1-1473-158.w90-89.abo.wanadoo.fr [90.89.41.158])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id D9B991BF20B;
 Wed, 11 Mar 2020 07:43:04 +0000 (UTC)
Date: Wed, 11 Mar 2020 08:43:04 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: masonccyang@mxic.com.tw
Subject: Re: [PATCH v3 3/4] mtd: rawnand: Add support manufacturer specific
 suspend/resume operation
Message-ID: <20200311084304.580bec79@xps13>
In-Reply-To: <OF5C883176.AD73134D-ON48258528.000F5185-48258528.001F3544@mxic.com.tw>
References: <1583220084-10890-1-git-send-email-masonccyang@mxic.com.tw>
 <1583220084-10890-4-git-send-email-masonccyang@mxic.com.tw>
 <20200310203310.5fe74c57@collabora.com>
 <OF5C883176.AD73134D-ON48258528.000F5185-48258528.001F3544@mxic.com.tw>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_004310_880638_DEADE95D 
X-CRM114-Status: GOOD (  15.66  )
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
Cc: vigneshr@ti.com, bbrezillon@kernel.org, juliensu@mxic.com.tw,
 richard@nod.at, s.hauer@pengutronix.de, yuehaibing@huawei.com,
 linux-kernel@vger.kernel.org, frieder.schrempf@kontron.de, rfontana@redhat.com,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 stefan@agner.ch, tglx@linutronix.de, allison@lohutok.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzb24sCgptYXNvbmNjeWFuZ0BteGljLmNvbS50dyB3cm90ZSBvbiBXZWQsIDExIE1hciAy
MDIwIDEzOjQwOjUyICswODAwOgoKPiBIaSBCb3JpcywKPiAKPiA+ID4gZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvbGludXgvbXRkL3Jhd25hbmQuaCBiL2luY2x1ZGUvbGludXgvbXRkL3Jhd25hbmQuaAo+
ID4gPiBpbmRleCBiYzJmYTNjLi5jMDA1NWVkIDEwMDY0NAo+ID4gPiAtLS0gYS9pbmNsdWRlL2xp
bnV4L210ZC9yYXduYW5kLmgKPiA+ID4gKysrIGIvaW5jbHVkZS9saW51eC9tdGQvcmF3bmFuZC5o
Cj4gPiA+IEBAIC0xMDY0LDYgKzEwNjQsOCBAQCBzdHJ1Y3QgbmFuZF9sZWdhY3kgewo+ID4gPiAg
ICogQGxvY2s6ICAgICAgbG9jayBwcm90ZWN0aW5nIHRoZSBzdXNwZW5kZWQgZmllbGQuIEFsc28g
dXNlZCB0bwo+ID4gPiAgICogICAgICAgICBzZXJpYWxpemUgYWNjZXNzZXMgdG8gdGhlIE5BTkQg
ZGV2aWNlLgo+ID4gPiAgICogQHN1c3BlbmRlZDogICAgICBzZXQgdG8gMSB3aGVuIHRoZSBkZXZp
Y2UgaXMgc3VzcGVuZGVkLCAwIHdoZW4gICAKPiBpdCdzIG5vdC4KPiA+ID4gKyAqIEBfc3VzcGVu
ZDogICAgICBbUkVQTEFDRUFCTEVdIHNwZWNpZmljIE5BTkQgZGV2aWNlIHN1c3BlbmQgICAKPiBv
cGVyYXRpb24KPiA+ID4gKyAqIEBfcmVzdW1lOiAgICAgIFtSRVBMQUNFQUJMRV0gc3BlY2lmaWMg
TkFORCBkZXZpY2UgcmVzdW1lIG9wZXJhdGlvbgo+ID4gPiAgICogQGJidDogICAgICBbSU5URVJO
XSBiYWQgYmxvY2sgdGFibGUgcG9pbnRlcgo+ID4gPiAgICogQGJidF90ZDogICAgICBbUkVQTEFD
RUFCTEVdIGJhZCBibG9jayB0YWJsZSBkZXNjcmlwdG9yIGZvciBmbGFzaAo+ID4gPiAgICogICAg
ICAgICBsb29rdXAuCj4gPiA+IEBAIC0xMTE5LDYgKzExMjEsOCBAQCBzdHJ1Y3QgbmFuZF9jaGlw
IHsKPiA+ID4gCj4gPiA+ICAgICBzdHJ1Y3QgbXV0ZXggbG9jazsKPiA+ID4gICAgIHVuc2lnbmVk
IGludCBzdXNwZW5kZWQgOiAxOwo+ID4gPiArICAgaW50ICgqX3N1c3BlbmQpKHN0cnVjdCBuYW5k
X2NoaXAgKmNoaXApOwo+ID4gPiArICAgdm9pZCAoKl9yZXN1bWUpKHN0cnVjdCBuYW5kX2NoaXAg
KmNoaXApOyAgCj4gPiAKPiA+IEkgdGhvdWdodCB3ZSBhZ3JlZWQgb24gbm90IHByZWZpeGluZyBu
ZXcgaG9va3Mgd2l0aCBfID8gIAo+IAo+IEZvciBbUEFUQ0ggdjJdIHNlcmllcywgeW91IG1lbnRp
b25lZCB0byBkcm9wIHRoZSBfIHByZWZpeCAKPiBvZiBfbG9jay9fdW5sb2NrIG9ubHkgYW5kIHdl
IGZpbmFsbHkgcGF0Y2hlZCB0byBsb2NrX2FyZWEvdW5sb2NrX2FyZWEuCj4gCgpJIG1pc3NlZCB0
aGlzIF8sIHRoaXMgaXMgbm90IHNvbWV0aGluZyB3ZSB3YW50IHRvIGFkZC4KCkFsc28sIHdoZW4g
YXBwbHlpbmcgeW91ciBwYXRjaGVzIEkgaGFkIHNldmVyYWwgaXNzdWVzIGJlY2F1c2UgdGhleQp3
aGVyZSBub3QgYmFzZSBvbiB0aGUgbGFzdCAtcmMxLgoKRmluYWxseSwgSSB0aGluayBJIGZvcmdv
dCBhIGxpbmUgd2hlbiBwYXRjaGluZyBtYW51YWxseSBzbyBpdCBwcm9kdWNlcwphIHdhcm5pbmcg
bm93LgoKSSBhbSBkcm9wcGluZyBwYXRjaCAzIGFuZCA0LCBJIGtlZXAgcGF0Y2ggMSBhbmQgMiB3
aGljaCBzZWVtIGZpbmUuCgpQbGVhc2Ugc2VuZCBhIHJlYmFzZWQgYW5kIGVkaXRlZCB2NCBmb3Ig
dGhlc2UsIGRvbid0IGZvcmdldCB0byBkcm9wIHRoZQprYnVpbGR0ZXN0IHJvYm90IHRhZyBhbmQg
cGxlYXNlIGFsc28gZm9sbG93IHRoZXNlIHNsaWdodGx5IGVkaXRlZApjb21taXQgbG9nczoKCjIv
NAoKICAgIG10ZDogcmF3bmFuZDogQWRkIHN1cHBvcnQgZm9yIG1hbnVmYWN0dXJlciBzcGVjaWZp
YyBzdXNwZW5kL3Jlc3VtZSBvcGVyYXRpb24KICAgIAogICAgUGF0Y2ggbmFuZF9zdXNwZW5kKCkg
JiBuYW5kX3Jlc3VtZSgpIHRvIGxldCBtYW51ZmFjdHVyZXJzIG92ZXJ3cml0ZQogICAgc3VzcGVu
ZC9yZXN1bWUgb3BlcmF0aW9ucy4KCjMvNAoKICAgIG10ZDogcmF3bmFuZDogbWFjcm9uaXg6IEFk
ZCBzdXBwb3J0IGZvciBkZWVwIHBvd2VyIGRvd24gbW9kZQogICAgCiAgICBNYWNyb25peCBBRCBz
ZXJpZXMgc3VwcG9ydCBkZWVwIHBvd2VyIGRvd24gbW9kZSBmb3IgYSBtaW5pbXVtCiAgICBwb3dl
ciBjb25zdW1wdGlvbiBzdGF0ZS4KICAgIAogICAgT3Zlcmxhb2QgbmFuZF9zdXNwZW5kKCkgJiBu
YW5kX3Jlc3VtZSgpIGluIE1hY3Jvbml4IHNwZWNpZmljIGNvZGUgdG8KICAgIHN1cHBvcnQgZGVl
cCBwb3dlciBkb3duIG1vZGUuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
