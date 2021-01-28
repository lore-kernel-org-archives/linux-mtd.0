Return-Path: <SRS0=HmSd=G7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48EB7C433DB
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Jan 2021 20:24:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C709D64DFD
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Jan 2021 20:24:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C709D64DFD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HzY4RPRuBdSr3jIG6mxT9XZmG2NrqXrakjFiLMESQwo=; b=st1Y7vIdBjftnzbkGjqhX1bQp
	8aBac36w/B0TudTBSB3ftGFpVRxeQPAOSG/uKft+isfZMwLrRdNYFjFLPqeesLxVa0JnGzVemwR9Z
	IjxUNsIF5AOB1E0bber0VpYxSYgIucDia+L3CjKl7nRyXgGvWrwGetwgbI0WY9MpyyJf1LNHi9s+0
	DGEWd7+RKfl4+hgGy+A3AxZYJsAXLf0KNO3OyNvFTemyvnIGIrIVuo2FJ2uYEXXzCZYa9dV4VAqfY
	FTeiabKwBjqXBZF3QdCxXVmP/LlT1sM8fzLyoGZBUkHQ0Ai+Nn6If4SgjuRS78eIPppIrqOFzTgI0
	PizHFhFGg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5DpH-0002wS-F3; Thu, 28 Jan 2021 20:23:35 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5DpE-0002w0-EC
 for linux-mtd@lists.infradead.org; Thu, 28 Jan 2021 20:23:33 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 036DC6083270;
 Thu, 28 Jan 2021 21:23:30 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id wydx1ZZ3JqXG; Thu, 28 Jan 2021 21:23:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 8E6986083271;
 Thu, 28 Jan 2021 21:23:29 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id nM_5qrai2wzW; Thu, 28 Jan 2021 21:23:29 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 6A9DA6083270;
 Thu, 28 Jan 2021 21:23:29 +0100 (CET)
Date: Thu, 28 Jan 2021 21:23:29 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Tomas Winkler <tomas.winkler@intel.com>
Message-ID: <1363048722.339069.1611865409332.JavaMail.zimbra@nod.at>
In-Reply-To: <10c2e98c393a486cab3bc953e9926e38@intel.com>
References: <20210127200319.662842-1-tomas.winkler@intel.com>
 <c8d0f22c5fdf443cb8dda1f996b148d9@intel.com>
 <1776363776.325713.1611782270873.JavaMail.zimbra@nod.at>
 <a6cb6eb10bbb48989d3a9e087951e50e@intel.com>
 <1665542284.336646.1611820031174.JavaMail.zimbra@nod.at>
 <f91d7eff1d764ba7b47f023bc0fafacb@intel.com> <20210128100032.5eb542c6@xps13>
 <10c2e98c393a486cab3bc953e9926e38@intel.com>
Subject: Re: [PATCH] mtd: use refcount to prevent corruption
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Topic: use refcount to prevent corruption
Thread-Index: AQHW9OeD00Da249Jw0qJn6+VIZAeUao7z7AAgAAh5BBxoBSOfPxzntFAEGBJdu//fSiMQP//4NkAAA+XK+AnHY02HQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_152332_591143_534C9CC1 
X-CRM114-Status: GOOD (  11.98  )
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
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VG9tYXMsCgotLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4+IEFzIFJpY2hhcmQgd2Fz
IHNheWluZywgd2UgYXJlIHJlYWxseSBvcGVuIHRvIGVuaGFuY2UgTVREIHJlZmNvdW50aW5nLgo+
PiAKPj4gSG93ZXZlciwgdGhlIGlzc3VlIHlvdSBhcmUgZmFjaW5nIGlzLCBJTUhPLCBub3QgcmVs
YXRlZCB0byBNVEQgYnV0IHRvIE1GRC4KPj4gVGhlcmUgc2hvdWxkIGJlIGEgd2F5IHRvIGF2b2lk
IE1GRCB0byB2YW5pc2ggYnkgdGFraW5nIGEgcmVmZXJlbmNlIG9mIGl0Cj4+IHRocm91Z2ggbXRk
LT5fZ2V0X2RldmljZSgpLiBJIGRvbid0IHRoaW5rIGFkZHJlc3NpbmcgdGhlIGNhc2Ugd2hlcmUg
TUZECj4+IHZhbmlzaGVzIHdoaWxlIE1URCAoYXMgYSB1c2VyKSBpcyBzdGlsbCBhY3RpdmUgaXMg
dGhlIHJpZ2h0IGFwcHJvYWNoLgo+IAo+IEkgdGhpbmsgaXQgd29uJ3Qgd29yayBiZWNhdXNlIE1G
RCBzdWItZHJpdmVyIHJlbW92ZSgpIGlzIGNhbGxlZCAgIGFuZCBpdCBtdXN0Cj4gc3VjY2VlZCBi
ZWNhdXNlIHRoZSBtYWluIGRldmljZSAgaXMgbm90IGFjY2Vzc2libGUgdW5saWtlIGdsdWV1Ymkg
d2hpY2gganVzdAo+IHJldHVybnMgLUVCVVNZLgoKV2VsbCwgdGhlIHRyaWNrIGluIGdsdWJpIChh
bmQgb3RoZXIgTVREcyB3aXRoICJob3RwbHVnIiBzdXBwb3J0KSBpcyBub3QgdG8gcmVqZWN0CnJl
bW92YWwgb2YgdGhlIHN1Yi1kZXZpY2UuIC0+X3B1dF9kZXZpY2UoKSBpcyBvZiByZXR1cm4gdHlw
ZSB2b2lkLgpUaGUga2V5IGlzIGdyYWJiaW5nIGEgcmVmZXJlbmNlIG9uIHRoZSBzdWItZGV2aWNl
IGluIC0+X2dldF9kZXZpY2UoKSBzdWNoIHRoYXQKdGhlIGxheWVyIGJlbG93IGRvZXNuJ3QgZXZl
biB0cnkgdG8gcmVtb3ZlIHdoaWxlIHRoZSBNVEQgaXMgaW4gdXNlLgoKPiBzbyB3ZSBwb3N0cG9u
ZSB0aGUgbXRkIHVucmVnaXN0ZXIgdG8gIG10ZF9pbmZvLT5fcHV0X2RldmljZSgpICBidXQgaXQg
dGhhdCBzdGF0ZQo+IHdlIGhhdmUgbm90aGluZyB0byBob2xkCj4gb24gYXMgdGhlIGRldmljZSBp
cyBnb25lIGluIHJlbW92ZSgpCj4gVXNlciB3aWxsIGZhaWwgYW55d2F5LCBhcyB0aGUgdW5kZXJs
eWluZyBkZXZpY2UgaXMgbm90IGZ1bmN0aW9uYWwgaW4gdGhhdCBzdGF0ZS4KPiBBbnl3YXkgSSd2
ZSB0cmllZCB5b3VyIHN1Z2dlc3Rpb24sIHRoZSBrZXJuZWwgaXMgY3Jhc2hpbmcsIGhvcGUgSSBo
YXZlbid0IGRvbmUKPiBzb21lIHNpbGx5IGJ1Zy4KCkNhbiB5b3UgcG9pbnQgdXMgdG8gdGhlIGFm
ZmVjdGVkIGNvZGU/ClRoaXMgd291bGQgaGVscCBhIGxvdCB0byB1bmRlcnN0YW5kIHRoZSBpc3N1
ZSBiZXR0ZXIuCkknbSBzdXJlIHdlIGNhbiBmaW5kIGEgc29sdXRpb24uCgpUaGFua3MsCi8vcmlj
aGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
