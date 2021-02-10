Return-Path: <SRS0=JPnc=HM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60939C433DB
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Feb 2021 11:24:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4BAB64E26
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Feb 2021 11:24:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4BAB64E26
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lkiDxTDIIzYeBIjFdeUWhwY9yJpn0ancsj4tyQoyT3U=; b=y7CDhACGWEyUkZdLDuBLctBY8
	eLte40K5a74QhcRLVNRM09TxGSVDJTDZWvRJ+ICzxfu56ze456ZlmxZzXUHuatrRrY6d0hLUL7m74
	vYXnj6bZOhbM5KvTxNsAqBP06nubIgHUiHrQYcMEFbC42ikL4NCgmdJtUNpAU3KfO5d2mmfvskJeH
	GsTBobrAiBJNupIYvPNX0jpOVaTNQmbCdKAVsP7LaGgBjqJk0qUmf0D4l1sfk5v/pUZLNK/67eHCp
	Mys2z3e9zu30gBXoGy2MHuv0P0cKePnH9h4GHRr01kOBOSsW2KeCH7/czyLSvrGRdKKBtJsKhnA/i
	YHJsOKbbw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9nbD-0006s0-Jy; Wed, 10 Feb 2021 11:23:59 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9nbA-0006rP-Mn
 for linux-mtd@lists.infradead.org; Wed, 10 Feb 2021 11:23:57 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 9C6FF6083270;
 Wed, 10 Feb 2021 12:23:54 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id KtIL8SOfiiUt; Wed, 10 Feb 2021 12:23:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 42FF06083272;
 Wed, 10 Feb 2021 12:23:54 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id CXmfs8niWTKH; Wed, 10 Feb 2021 12:23:54 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 1BDFA6083270;
 Wed, 10 Feb 2021 12:23:54 +0100 (CET)
Date: Wed, 10 Feb 2021 12:23:53 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Message-ID: <1183985773.380599.1612956233979.JavaMail.zimbra@nod.at>
In-Reply-To: <20210210121429.4fb5ecf3@xps13>
References: <20210124232007.21639-1-richard@nod.at>
 <CAJfpegvN2KdMj_7T-OF1PAs8xZiU3f4233AvigaXwwRAsgQEjw@mail.gmail.com>
 <1507208626.379155.1612906761549.JavaMail.zimbra@nod.at>
 <CAJfpegugbvppOKhJ8KjSVGgZOGVuj6NSiy4n18mbD7Ui3wme6g@mail.gmail.com>
 <20210210121429.4fb5ecf3@xps13>
Subject: Re: [PATCH 0/8] MUSE: Userspace backed MTD v3
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Topic: MUSE: Userspace backed MTD v3
Thread-Index: +AWqGsxtpMS2g3tZtveYZHMCEixznQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_062356_872449_D260B28F 
X-CRM114-Status: GOOD (  11.14  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Miklos Szeredi <miklos@szeredi.hu>,
 fuse-devel <fuse-devel@lists.sourceforge.net>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, Ron Minnich <rminnich@google.com>,
 sven <sven@narfation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

TWlxdWVsLAoKLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+PiBEb2VzIGluLWJhbmQg
YW5kIE9PQiBkYXRhIG5lZWQgdG8gYmUgaGFuZGxlZCB0b2dldGhlcj8KPiAKPiBTaG9ydCBhbnN3
ZXI6IHllcy4KPiAKPj4gSWYgc28sIHRoZW4gdHdvIHJlcXVlc3RzIGlzIG5vdCBhIGdvb2Qgb3B0
aW9uLgo+IAo+IE1vcmUgZGV0YWlsZWQgYW5zd2VyOgo+IAo+IFRoZXJlIGlzIGEgdHlwZSBvZiBN
VEQgZGV2aWNlIChOQU5EIGRldmljZXMpIHdoaWNoIGFyZSBjb21wb3NlZCwgZm9yCj4gZWFjaCBw
YWdlLCBvZiBYIGluLWJhbmQgYnl0ZXMgcGx1cyBZIG91dC1vZi1iYW5kIG1ldGFkYXRhIGJ5dGVz
Lgo+IAo+IEFjY2Vzc2luZyBlaXRoZXIgdGhlIGluLWJhbmQgZGF0YSwgb3IgdGhlIG91dC1vZi1i
YW5kIGRhdGEsIG9yIGJvdGggYXQKPiB0aGUgc2FtZSB0aW1lIGFyZSBhbGwgdmFsaWQgdXNlIGNh
c2VzLgo+IAo+ICogUmVhZCBvcGVyYXRpb24gZGV0YWlsczoKPiAgRnJvbSBhIGhhcmR3YXJlIHBv
aW50IG9mIHZpZXcsIHRoZSBvdXQtb2YtYmFuZCBkYXRhIGlzIChhbG1vc3QpCj4gIGFsd2F5cyBy
ZXRyaWV2ZWQgd2hlbiB0aGUgaW4tYmFuZCBkYXRhIGlzIHJlYWQgYmVjYXVzZSBpdCBjb250YWlu
cwo+ICBtZXRhLWRhdGEgdXNlZCB0byBjb3JyZWN0IGV2ZW50dWFsIGJpdGZsaXBzLiBJbiB0aGlz
IGNhc2UsIGlmIGJvdGgKPiAgYXJlYXMgYXJlIHJlcXVlc3RlZCwgaXQgaXMgaGlnaGx5IG5vbi1l
ZmZpY2llbnQgdG8gZG8gdHdvIHJlcXVlc3RzLAo+ICB0aGF0J3Mgd2h5IHRoZSBNVEQgY29yZSBh
bGxvd3MgdG8gZG8gYm90aCBhdCB0aGUgc2FtZSB0aW1lLgo+ICogV3JpdGUgb3BlcmF0aW9uIGRl
dGFpbHM6Cj4gIEV2ZW4gd29yc2UsIGluIHRoZSB3cml0ZSBjYXNlLCB5b3UgKm11c3QqIHdyaXRl
IGJvdGggYXQgdGhlIHNhbWUKPiAgdGltZS4gSXQgaXMgcGh5c2ljYWxseSBpbXBvc3NpYmxlIHRv
IGRvIG9uZSBhZnRlciB0aGUgb3RoZXIgKHN0aWxsCj4gIHdpdGggYWN0dWFsIGhhcmR3YXJlLCBv
ZiBjb3Vyc2UpLgo+IAo+IFRoYXQgaXMgd2h5IGl0IGlzIHByZWZlcmFibGUgdGhhdCBNVVNFIHdp
bGwgYmUgYWJsZSB0byBhY2Nlc3MgYm90aCBpbgo+IGEgc2luZ2xlIHJlcXVlc3QuCgpCeSBzaW5n
bGUgcmVxdWVzdCB3ZSBtZWFudCBGVVNFIG9wLWNvZGVzLiBUaGUgTkFORCBzaW11bGF0b3IgaW4g
VXNlcnNwYWNlCndpbGwgc2VlIGp1c3Qgb25lIGNhbGwuIE15IHBsYW4gaXMgdG8gYWJzdHJhY3Qg
aXQgaW4gbGliZnVzZS4KClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
