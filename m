Return-Path: <SRS0=A6BC=PZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35BFDC43387
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Jan 2019 21:00:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04A3520859
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Jan 2019 21:00:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SRMxT1KQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ScECyIf+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04A3520859
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6JJEaTRlVQN7vTjgeddDSBU+HX2SruFFvzhnZ1oHuBU=; b=SRMxT1KQ21vovt
	dkiN4YQl1X7PBIb2XsW3JBHf6SwGKOE4dZ+1GDZ6n9bzHP5xEzmzrf1RbgX7vDnjldfTmMOEWs+Zk
	+Xydb2g7NYXYjN2v+Ln/psiDw7Y3KbdQkmfjrsUkuiCup3NowdYsdWx7X+jucBxsb9EQ3cP7QsBWG
	XQy6m7v8OadkYjcBaMBaF5SF9K7ep29m76QMhEN3ouEwzC/6x8p9T1tE2Rji6uTDRA8Ecsq8KEVzs
	c3DvRKRDVBcJPk2MBqC33UOX9eYH1Gv/uKo01/xKiVaVmScvVlqaGVC0s8Y/YP7htzKfNCiitAOe/
	3QTnR7Nfgq/UDHpUsVdA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkEZ9-0000Pg-Et; Thu, 17 Jan 2019 20:47:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkEZ6-0000PJ-JS
 for linux-mtd@lists.infradead.org; Thu, 17 Jan 2019 20:47:05 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2C25520851;
 Thu, 17 Jan 2019 20:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1547758023;
 bh=h5B/RT/Zfdxuni++VuqxlrxhzgmuVzlxrrqjyA1JzAQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ScECyIf+zAxF2jw8Tm0f3OTmVDr6IYuAvSVFPetgb97XvzH98BgE022SKzrqZdWOT
 QWqNfTNEFxUWIxFGDp3/RqHzScdCm8NXgjd+bdL/mvHqI47i9n/SIzLLCsiDX2eyJz
 UIBQnfprVCpc9Oewcyqdo//nPK0mBbgVkoBBPh7w=
Date: Thu, 17 Jan 2019 21:46:54 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Marcin =?UTF-8?B?S3J6ZW1pxYRza2k=?= <mar.krzeminski@gmail.com>, Richard
 Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: VIRTIO iface in mtd
Message-ID: <20190117214654.08542c12@bbrezillon>
In-Reply-To: <7f5ad942-3857-2cbb-5c54-e27a4613cae8@gmail.com>
References: <7f5ad942-3857-2cbb-5c54-e27a4613cae8@gmail.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190117_124704_669065_7684054C 
X-CRM114-Status: GOOD (  14.37  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

K1JpY2hhcmQgYW5kIE1pcXVlbAoKSGkgTWFyY2luLAoKT24gVGh1LCAxNyBKYW4gMjAxOSAyMTox
NjoxOSArMDEwMApNYXJjaW4gS3J6ZW1pxYRza2kgPG1hci5rcnplbWluc2tpQGdtYWlsLmNvbT4g
d3JvdGU6Cgo+IEhlbGxvLAo+IAo+IHJlY2VudGx5IEkgaGF2ZSBzcG9rZW4gd2l0aCBCb3JpcyBy
ZWdhcmRpbmcgbmV3IE1URCBkcml2ZXIKPiB0aGF0IHdpbGwgdXNlIFZJUlRJTyBpbnRlcmZhY2Ug
dG8gY29tbXVuaWNhdGUgd2l0aCBRZW11Lgo+IFRvIHNwZWNpZnkgaG93IHNob3VsZCB0aGlzIGxv
b2sgbGlrZSBleGFjdGx5IEkgYW0gYnJpbmdpbmcgdGhlIHRvcGljCj4gb24gTUwuCgpUaGFua3Mg
Zm9yIHN0YXJ0aW5nIHRoaXMgZGlzY3Vzc2lvbi4KCj4gTXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0
IHRoaXMgZHJpdmVyIHdpbGwgdXNlIFZJUlRJTyB0byBjb21tdW5pY2F0ZQo+IHdpdGggUWVtdS4g
RnJvbSBRZW11IHNpZGUgYXQgdGhlIGVuZCB0aGVyZSB3aWxsIGJlIGEgZmlsZSB0aGF0IHdpbGwK
PiBzaW11bGF0ZSBOQU5EL05PUi4gSXMgaXQgY29ycmVjdD8KClRoYXQncyBteSB1bmRlcnN0YW5k
aW5nLCBidXQgSSdtIG5vdCByZWFsbHkgYSB2aXJ0aW8gb3IgcWVtdSBleHBlcnQgc28KSSBtaWdo
dCBiZSB3cm9uZy4KCj4gV2hhdCB1c2UgY2FzZXMgZG8geW91IGhhdmUgaW4gbWluZCBmb3IgdGhp
cz8KCkkgaGF2ZSBvbmUgaW4gbWluZDogc2ltdWxhdGUgTkFORCAoaW4gcGFydGljdWxhciBNTEMg
TkFORCkgYmVoYXZpb3IgaW4KYSBwc2V1ZG8tcmVhbGlzdGljIHdheSB0byB2YWxpZGF0ZSBVQkkv
VUJJRlMgY29kZSAob3IgYW55IG90aGVyCkZTL3dlYXItbGV2ZWxpbmcvRlRMIGNvZGUpIHdlIG1p
Z2h0IHdhbnQgdG8gdXNlIG9uIHRvcCBvZiBzdWNoIGRldmljZXMKCkknZCBhbHNvIGxpa2UgdG8g
cmVwbGFjZSBuYW5kc2ltIGJ5IHRoaXMgZW11bGF0aW9uIGFwcHJvYWNoLiBJbmRlZWQsCm5hbmRz
aW0gaXMgZW11bGF0aW5nIHRoZSBwYXJhbGxlbCBOQU5EIHByb3RvY29sIG1vcmUgdGhhbiBhbnl0
aGluZwplbHNlLCB3aGljaCB3ZSBkb24ndCByZWFsbHkgY2FyZSBhYm91dCB1bmxlc3Mgd2UgbmVl
ZCB0byB0ZXN0IHRoZSByYXcKTkFORCBmcmFtZXdvcmsgKGFuZCBJIHRoaW5rIHRoZXJlIGFyZSBi
ZXR0ZXIgc29sdXRpb25zIHRvIGRvIHRoYXQpLiBPbgp0aGUgb3RoZXIgaGFuZCwgYmVjYXVzZSBu
YW5kc2ltIHRyaWVzIHRvIHVzZSB0aGUgZnVsbCByYXcgTkFORCBzdGFjaywKaXQncyBvZnRlbiBo
YXJkIHRvIGVtdWxhdGUgcmVhbCBkZXZpY2VzIChJRC1iYXNlZCBkZXRlY3Rpb24gZG9lcyBub3QK
d29yayBmb3IgT05GSS9KRURFQyBjb21wYXRpYmxlIGRldmljZXMpLiBBbGwgb2YgdGhpcyBtYWtl
cyBuYW5kc2ltIGEKcG9vciBjaG9pY2Ugd2hlbiB0aGUgdXNlciB3YW50cyB0byBlbXVsYXRlIGEg
TkFORCBkZXZpY2UgdG8gZG8KcG9zdC1tb3J0ZW0gYW5hbHlzaXMgdXNpbmcgYSBOQU5EIGR1bXAu
CgpSaWNoYXJkIHByb2JhYmx5IGEgZmV3IG1vcmUgdXNlIGNhc2VzIDstKS4KClJlZ2FyZHMsCgpC
b3JpcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
