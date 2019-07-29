Return-Path: <SRS0=s9Jc=V2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ADB4C433FF
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jul 2019 21:03:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A6192067D
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jul 2019 21:03:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tD7K/DmF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A6192067D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r7aXyPZcQG8hIO4l5seuShIFL5FKATUSEUuWscKLGmc=; b=tD7K/DmFMFWffO
	+dQA9F8xddVAQy+LHI0bkymazsVY7vUSx8rMhXUK99RxGG7f5S2PRVXGSxP0ehUz1ivR3Kv5QEXLc
	cczfYa1yCTY/Vc2nwBNpbR+0LoySKPPHBb31Jy476VOhyX/G6CW/Oedju2f3rOJXIigwLfCMlRu/O
	GbLnOjlzaz/bWSZp0238MUypKFzw2IxHY/wpELTZum6G7tnz7Da/ptw5Q10bnH2t5XEp7iOnPnNSQ
	Jg5FWUIHMNbKp9x4OL5XQKVrBxGReh3/Y240whkGlpBqjqhLzKRksuPuAYWktEnJHyc9QzeRURyfy
	TIviltvRPajGOcq1+Pxg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsCnZ-0003IG-VS; Mon, 29 Jul 2019 21:03:13 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsCnX-0003Hf-Gs
 for linux-mtd@lists.infradead.org; Mon, 29 Jul 2019 21:03:13 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 901D0E0005;
 Mon, 29 Jul 2019 21:02:59 +0000 (UTC)
Date: Mon, 29 Jul 2019 23:02:58 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Subject: Re: GPMI iMX6ull timeout on DMA
Message-ID: <20190729230258.4d474d2e@xps13>
In-Reply-To: <CAOf5uwmd7LFOS0cRWX5ANnmzf0aZWn0RFF_YWkwxtGUjymmMXA@mail.gmail.com>
References: <89ae32a0-9b19-4735-90eb-4ffa22aad704@kernel.org>
 <20190729103655.095297a2@xps13>
 <18734a1d-17d9-d390-58ef-ad8ca1be925f@kernel.org>
 <20190729144730.4a58de32@xps13>
 <CAOf5uwkGC8upBuePJPUG1hfon_018UT_nz=mYTm2G0c3whHZYg@mail.gmail.com>
 <20190729145538.2352b21f@xps13>
 <CAOf5uwmu_kTViFy4hxZH30aWBynSVhXC6=h-fmX=KJ0ob8Bu1g@mail.gmail.com>
 <20190729152218.362bc58d@xps13>
 <CAOf5uwmd7LFOS0cRWX5ANnmzf0aZWn0RFF_YWkwxtGUjymmMXA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190729_140311_738104_FB0EAECB 
X-CRM114-Status: GOOD (  13.50  )
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
Cc: s.hauer@pengutronix.de, Greg Ungerer <gerg@kernel.org>,
 linux-mtd@lists.infradead.org, Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWljaGFlbCwKCk1pY2hhZWwgTmF6emFyZW5vIFRyaW1hcmNoaSA8bWljaGFlbEBhbWFydWxh
c29sdXRpb25zLmNvbT4gd3JvdGUgb24KTW9uLCAyOSBKdWwgMjAxOSAyMjowMDoyNSArMDIwMDoK
Cj4gSGkgTWlxdWVsCj4gCj4gc29ycnkgd2FzIGRpZmZpY3VsdCBkYXkgOykuIE15IGFuc3dlciBi
ZWxvdwo+IAoKTm8gcGIgOykKClsuLi5dCgo+ID4gPiA+ID4gPiA+ID4gVGhhdCdzIHN0cmFuZ2Uu
Li4gSSBkb24ndCBnZXQgd2hhdCB3b3VsZCBwcm9kdWNlCnN1Y2ggdW5zdGFibGUgaXNzdWUuICAK
PiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IE15IGluaXRpYWwgZ3Vlc3MgaXMgdGhhdCB0aGUg
Y2FsY3VsYXRlZCB0aW1pbmcgaXMgdmVyeSBtYXJnaW5hbC4gIAo+ID4gPiA+ID4gPgo+ID4gPiA+
ID4gPiBXaGF0IGRvIHlvdSBtZWFuIGJ5ICJtYXJnaW5hbCI/Cj4gPiA+ID4gPiA+ICAKPiA+ID4g
PiA+Cj4gPiA+ID4gPiBJIGRvbid0IHRoaW5rIHRoYXQgaXMgdGltaW5nIGNhbGN1bGF0aW9uLiBJ
IGhhdmUgdHJpZWQgdG8gdXNlIHRoZSBzYW1lIHRpbWluZwo+ID4gPiA+ID4gYXMgYmVmb3JlIGJ1
dCB3aGVuIHRob3NlIGFyZSBhcHBsaWRlLiBJcyBpdCBwb3NzaWJsZT8gIAo+ID4gPiA+Cj4gPiA+
ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCj4gPiA+ID4gSSBzdXBw
b3NlIHRoZSBlbmQgb2YgdGhlIHNlbnRlbmNlIGlzIG1pc3Npbmc/ICAKPiA+Cj4gPiBNaWNoYWVs
LCB3aGF0IGRpZCB5b3UgbWVhbiBoZXJlPwo+ID4gIAo+IGNvbW1pdCAwMmM3ODY2MjdiOTNiM2Mz
Mjg2NTcwZjc5MzI5NDgxNjI4NmZmMzk3Cj4gQXV0aG9yOiBNaWNoYWVsIFRyaW1hcmNoaSA8bWlj
aGFlbEBhbWFydWxhc29sdXRpb25zLmNvbT4KPiBEYXRlOiAgIEZyaSBPY3QgNSAwOTo0NjoyOSAy
MDE4ICswMjAwCj4gCj4gICAgIFJldmVydCAibXRkOiByYXduYW5kOiBncG1pOiB1c2UgY29yZSB0
aW1pbmdzIGluc3RlYWQgb2YgYW4KPiBlbXBpcmljYWwgZGVyaXZhdGlvbiIKPiAKPiAgICAgVGhp
cyByZXZlcnRzIGNvbW1pdCBiMTIwNjEyMjA2OWFhZGFiZTFhOGM1MDc4OTI3N2E5NzhhYWE0ZGY3
Lgo+IAo+ICAgICBDaGFuZ2UtSWQ6IEljZDBkZGNkNWUzYWM3ZDgyOTMyYmJmNDEyMjk5Y2NhNDI0
Y2JjNTcxCj4gICAgIEppcmEtSWQ6IFdBTi01MAo+ICAgICBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVs
IFRyaW1hcmNoaSA8bWljaGFlbEBhbWFydWxhc29sdXRpb25zLmNvbT4KPiAKPiBSZXZlcnQgdGhp
cyBvbmUgZG9lcyBub3QgZml4IHRoZSBwcm9ibGVtLiBSaWdodCBub3cgSSBoYXZlIHR3byByZXZl
cnQKPiB0aGlzIG9uZSBhbmQKPiAKPiBjb21taXQgNmFiNTQzYzE5MjRmNzc5NTcwMDQ5OTRiZDY4
MDZhOWRhYTQ1ZjkwMyAodGFnOiBNTUlfMDA0XzAxMV9SMDIpCj4gQXV0aG9yOiBNaWNoYWVsIFRy
aW1hcmNoaSA8bWljaGFlbEBhbWFydWxhc29sdXRpb25zLmNvbT4KPiBEYXRlOiAgIEZyaSBPY3Qg
NSAwOTo0Njo0NCAyMDE4ICswMjAwCj4gCj4gICAgIFJldmVydCAibXRkOiByYXduYW5kOiBncG1p
OiBzdXBwb3J0IC0+c2V0dXBfZGF0YV9pbnRlcmZhY2UoKSIKPiAKPiAgICAgVGhpcyByZXZlcnRz
IGNvbW1pdCA3NmUxYTAwODZhMGMzMjc2YjM4NGY3NzkwNTM0NWUwZmNjODg2ZmRkLgo+IAo+ICAg
ICBDaGFuZ2UtSWQ6IEk2MGZiNmY4NzQzNjRkMWRlZWRhMzQyNGQ0NTA4NTUzYTM4YWM5YjFhCj4g
ICAgIEppcmEtSWQ6IFdBTi01MAo+ICAgICBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIFRyaW1hcmNo
aSA8bWljaGFlbEBhbWFydWxhc29sdXRpb25zLmNvbT4KPiAKPiBJIGRpZCBub3QgaGF2ZSB0aW1l
IHRvIGZpbmlzaCB0byB1bmRlc3RhbmQgd2h5IHRoaXMgd2FzIGZpeGluZyBteSBwcm9ibGVtCgpP
ayBzbyBJIGFtIHByZXR0eSBjb252aW5jZWQgdGhhdCB0aGlzIGlzIHN0aWxsIGEgdGltaW5ncyBp
c3N1ZSB0aGVuOwpidXQgbm90IGVudGlyZWx5IGR1ZSB0byB0aGUgZGlmZmVyZW50IHRpbWluZ3Mg
Y2FsY3VsYXRpb24uIEludGVyZXN0aW5nLgpJJ20gd2FpdGluZyBmb3IgR3JlZydzIHJlc3VsdHMg
bm93LgoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
