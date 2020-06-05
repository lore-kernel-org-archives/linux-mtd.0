Return-Path: <SRS0=qxWv=7S=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CEA0C433DF
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Jun 2020 17:09:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FCAD2074B
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Jun 2020 17:09:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LynKXGaP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B6p4AbOC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FCAD2074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TPeIs2QM4X/4SzAR1qrCHl1Cj12WLLv9waY8stgREDI=; b=LynKXGaPtIpeew
	DgtCqMo0v5xDzYftFSIc43e2funWLVtee3i5zLnc7vjcF78AIEzrDQHjFaYZOSJq8hjDQmfbroPkp
	ZjMjqtofBlsONBexZCatEvkDl3bSrUZmJl8MvHqAMBhLrNi98tW/fwS+UbFHA9J1fomdCcyrTk401
	Fdw0Hxyg3+b9szustGxiAdccAFRWpL2iVtEkQ6Omwlk56UPN3jZv7uykzNPqxgFFJsmK0L+yP34tx
	l6qpKMymjI/MAt4Rc4fLoKHp13HDsz4Q5fFlP5Lg0c4e6YTd7bvYzceGuJBbbkIKFHs1krsHVaFpU
	szG393rrL4W2506/kLJQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jhFqQ-0005Il-5H; Fri, 05 Jun 2020 17:09:26 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jhFqN-0005Hk-Aa
 for linux-mtd@lists.infradead.org; Fri, 05 Jun 2020 17:09:24 +0000
Received: by mail-wr1-x444.google.com with SMTP id x13so10505690wrv.4
 for <linux-mtd@lists.infradead.org>; Fri, 05 Jun 2020 10:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=s8YWD9RCnqEF4TZaQVMC5oFYjtu6s69kpDgaIZvDX7A=;
 b=B6p4AbOC2tchrb7j1nE5PmzEUdbj76lAx/xfAF4yGBUfLE5tJrSly2BRWptm1E8/2e
 egyq91a3tGiPIhv3bLzh17tyFqDfPRJXnaSRQIw886dqHnpXmD+kNCQkecvXAwwcbpwu
 VD72x5nvy1QHn3SrsMOthLTgaLs8jGhrrsh84WG/xufnoIDfoAPT3ya6E+Q6/evmF2I/
 hGU91OzsdNzXwZMxOaS1JXEqFEA6L7MO4K5n9tTHInlAywOWpMBFKwqU/CuS8cC8/d+R
 jqtu9u375hKyB8K7jmIarfK5S9tiyi5PTTfytMlAZOAz02gJNDauKRtgjOZ9Wvciclmk
 /Uxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=s8YWD9RCnqEF4TZaQVMC5oFYjtu6s69kpDgaIZvDX7A=;
 b=HjDQtSb0jzE4E5V5I9mlcadBiJRZGmlHARq8EFZrFsVVyN3dniO7vjHMdeh56SaJ2a
 BN1o/ibPPuIhVNxe0wTJ3SfMZGkxchMWLPcq95ucju3VBgXJRXcnrsE+VNiaw/wdd7RW
 CXFYzfX9g6F2eGQ5jyMRMVV3WVLfg7ZZoNqPw+7fau/ZkPSxicG0/ZlmWTEu9Xh0VMPs
 ZXhzjb3HJTlv5ZHKKzT0rH8SmrOL9T1CdurLz6OIIHwnUIupFuXIkiiZackDy2ALyz/d
 /nHI98AX51tMBt5U1GTaAtS16wAlg6w13ZlNy/YzJN/XoVpRcyprJvjEElGL7X9alOsd
 rd9w==
X-Gm-Message-State: AOAM530JFSgVQxOqT3jtCW1PJ4CRNB5MRz3oIB5JEXso33KjaMSUqXYz
 ZR/a+D6Vbil12G2m8O3t+X4=
X-Google-Smtp-Source: ABdhPJxDgfq1TXJSVZJQPfGWvL3363/0SYV4tVsvkpykIJ7ziNxGgI9QtuyfL4fmvH5ZcERaULj++Q==
X-Received: by 2002:a5d:5112:: with SMTP id s18mr10297675wrt.160.1591376961391; 
 Fri, 05 Jun 2020 10:09:21 -0700 (PDT)
Received: from macbook-pro-alvaro-eth.lan
 (28.red-83-49-61.dynamicip.rima-tde.net. [83.49.61.28])
 by smtp.gmail.com with ESMTPSA id o10sm11812792wrq.40.2020.06.05.10.09.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 05 Jun 2020 10:09:20 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH] nand: raw: use write_oob_raw for MTD_OPS_AUTO_OOB mode
From: =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
In-Reply-To: <20200512105409.785febfe@collabora.com>
Date: Fri, 5 Jun 2020 19:09:19 +0200
Message-Id: <56DB91B3-ACCC-4E78-B489-2B4B71B8C1C2@gmail.com>
References: <20200504094253.2741109-1-noltari@gmail.com>
 <20200504123237.5c128668@collabora.com> <20200511182923.6a4961ab@xps13>
 <6F41AA9B-71D6-47FA-BC12-24941F84DA71@gmail.com>
 <20200512104422.4c31f7e0@xps13> <20200512105409.785febfe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200605_100923_365973_8F8A377F 
X-CRM114-Status: GOOD (  18.74  )
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
Cc: christophe.kerello@st.com, vigneshr@ti.com, richard@nod.at,
 s.hauer@pengutronix.de, devik@eaxlabs.cz, linux-kernel@vger.kernel.org,
 stefan@agner.ch, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, tglx@linutronix.de,
 masonccyang@mxic.com.tw, piotrs@cadence.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SeKAmXZlIG5vdyBzZW50IGFub3RoZXIgcGF0Y2gg4oCcbXRkOiByYXduYW5kOiBicmNtbmFuZDog
Zm9yY2UgcmF3IE9PQiB3cml0ZXPigJ0gYXMgYW4gYWx0ZXJuYXRpdmUgc29sdXRpb24gdG8gdGhp
cyBpc3N1ZS4KCkJlc3QgcmVnYXJkcywKw4FsdmFyby4KCj4gRWwgMTIgbWF5IDIwMjAsIGEgbGFz
IDEwOjU0LCBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPiBl
c2NyaWJpw7M6Cj4gCj4gT24gVHVlLCAxMiBNYXkgMjAyMCAxMDo0NDoyMiArMDIwMAo+IE1pcXVl
bCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+IAo+PiBIZWxsbywK
Pj4gCj4+IFJpY2hhcmQsIG1heWJlIHlvdSdsbCBoYXZlIGFuIGlkZWEgdG8gZml4IHRoZSBzaXR1
YXRpb24gaGVyZT8KPj4gCj4+IMOBbHZhcm8gRmVybsOhbmRleiBSb2phcyA8bm9sdGFyaUBnbWFp
bC5jb20+IHdyb3RlIG9uIFR1ZSwgMTIgTWF5IDIwMjAKPj4gMTA6MzY6MjUgKzAyMDA6Cj4+IAo+
Pj4gSGksCj4+PiAKPj4+PiBFbCAxMSBtYXkgMjAyMCwgYSBsYXMgMTg6MjksIE1pcXVlbCBSYXlu
YWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IGVzY3JpYmnDszoKPj4+PiAKPj4+PiBIZWxs
bywKPj4+PiAKPj4+PiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEu
Y29tPiB3cm90ZSBvbiBNb24sIDQgTWF5Cj4+Pj4gMjAyMCAxMjozMjozNyArMDIwMDoKPj4+PiAK
Pj4+Pj4gT24gTW9uLCAgNCBNYXkgMjAyMCAxMTo0Mjo1MyArMDIwMAo+Pj4+PiDDgWx2YXJvIEZl
cm7DoW5kZXogUm9qYXMgPG5vbHRhcmlAZ21haWwuY29tPiB3cm90ZToKPj4+Pj4gCj4+Pj4+PiBT
b21lIE5BTkQgY29udHJvbGxlcnMgY2hhbmdlIHRoZSBFQ0MgYnl0ZXMgd2hlbiBPT0IgaXMgd3Jp
dHRlbiB3aXRoIEVDQwo+Pj4+Pj4gZW5hYmxlZC4KPj4+Pj4+IFRoaXMgaXMgYSBwcm9ibGVtIGlu
IGJyY21uYW5kLCBzaW5jZSBhZGRpbmcgSkZGUzIgY2xlYW5tYXJrZXJzIGFmdGVyIHRoZSBwYWdl
Cj4+Pj4+PiBoYXMgYmVlbiBlcmFzZWQgd2lsbCBjaGFuZ2UgdGhlIEVDQyBieXRlcyB0byAwIGFu
ZCB0aGUgY29udHJvbGxlciB3aWxsIHRoaW5rCj4+Pj4+PiB0aGUgYmxvY2sgaXMgYmFkLgo+Pj4+
Pj4gSXQgY2FuIGJlIGZpeGVkIGJ5IHVzaW5nIHdyaXRlX29vYl9yYXcsIHdoaWNoIGVuc3VyZXMg
RUNDIGlzIGRpc2FibGVkLgo+Pj4+Pj4gCj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiDDgWx2YXJvIEZl
cm7DoW5kZXogUm9qYXMgPG5vbHRhcmlAZ21haWwuY29tPgo+Pj4+Pj4gLS0tCj4+Pj4+PiBkcml2
ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYyB8IDIgKy0KPj4+Pj4+IDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pj4+Pj4gCj4+Pj4+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9uYW5kX2Jhc2UuYwo+Pj4+Pj4gaW5kZXggYzI0ZTVlMmJhMTMwLi43NTVkMjUyMDA1MjAgMTAw
NjQ0Cj4+Pj4+PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYwo+Pj4+Pj4g
KysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMKPj4+Pj4+IEBAIC00ODgsNyAr
NDg4LDcgQEAgc3RhdGljIGludCBuYW5kX2RvX3dyaXRlX29vYihzdHJ1Y3QgbmFuZF9jaGlwICpj
aGlwLCBsb2ZmX3QgdG8sCj4+Pj4+PiAKPj4+Pj4+IAluYW5kX2ZpbGxfb29iKGNoaXAsIG9wcy0+
b29iYnVmLCBvcHMtPm9vYmxlbiwgb3BzKTsKPj4+Pj4+IAo+Pj4+Pj4gLQlpZiAob3BzLT5tb2Rl
ID09IE1URF9PUFNfUkFXKQo+Pj4+Pj4gKwlpZiAob3BzLT5tb2RlID09IE1URF9PUFNfQVVUT19P
T0IgfHwgb3BzLT5tb2RlID09IE1URF9PUFNfUkFXKQo+Pj4+Pj4gCQlzdGF0dXMgPSBjaGlwLT5l
Y2Mud3JpdGVfb29iX3JhdyhjaGlwLCBwYWdlICYgY2hpcC0+cGFnZW1hc2spOyAgICAgIAo+Pj4+
PiAKPj4+Pj4gVGhlIGRvYyBzYXlzOgo+Pj4+PiAKPj4+Pj4gQE1URF9PUFNfUExBQ0VfT09COiAg
T09CIGRhdGEgYXJlIHBsYWNlZCBhdCB0aGUgZ2l2ZW4gb2Zmc2V0IChkZWZhdWx0KQo+Pj4+PiBA
TVREX09QU19BVVRPX09PQjogICBPT0IgZGF0YSBhcmUgYXV0b21hdGljYWxseSBwbGFjZWQgYXQg
dGhlIGZyZWUgYXJlYXMKPj4+Pj4gICAgICAgICAgICAgICAgICAgIHdoaWNoIGFyZSBkZWZpbmVk
IGJ5IHRoZSBpbnRlcm5hbCBlY2NsYXlvdXQKPj4+Pj4gQE1URF9PUFNfUkFXOiAgICAgICAgZGF0
YSBhcmUgdHJhbnNmZXJyZWQgYXMtaXMsIHdpdGggbm8gZXJyb3IKPj4+Pj4gCQkgICAgIGNvcnJl
Y3Rpb247IHRoaXMgbW9kZSBpbXBsaWVzICVNVERfT1BTX1BMQUNFX09PQgo+Pj4+PiAKPj4+Pj4g
VG8gbWUsIHRoYXQgbWVhbnMgTVREX09QU19QTEFDRV9PT0IgYW5kIE1URF9PUFNfQVVUT19PT0Ig
ZG8gbm90IGltcGx5Cj4+Pj4+IE1URF9PUFNfUkFXLiBBbnl3YXkgdGhvc2UgbW9kZXMgYXJlIGp1
c3QgdG9vIHZhZ3VlLiBXZSByZWFsbHkgc2hvdWxkCj4+Pj4+IHNlcGFyYXRlIHRoZSBFQ0MtZGlz
YWJsZWQvRUNDLWVuYWJsZWQgY29uY2VwdCAoQUtBIHJhdyB2cyBub24tcmF3IG1vZGUpCj4+Pj4+
IGZyb20gdGhlIE9PQiBwbGFjZW1lbnQgc2NoZW1lLiBJSVJDLCBNaXF1ZWwgaGFkIGEgcGF0Y2hz
ZXQgZG9pbmcgdGhhdC4KPj4+Pj4gCj4+Pj4+IFdlIGFsc28gc2hvdWxkIGhhdmUgdGhlIGNvbmNl
cHQgb2YgcHJvdGVjdGVkIE9PQi1yZWdpb24gdnMKPj4+Pj4gdW5wcm90ZWN0ZWQtT09CLXJlZ2lv
biBpZiB3ZSB3YW50IEpGRlMyIHRvIHdvcmsgd2l0aCBjb250cm9sbGVycyB0aGF0Cj4+Pj4+IHBy
b3RlY3QgcGFydCBvZiB0aGUgT09CIHJlZ2lvbi4gT25jZSB3ZSBoYXZlIHRoYXQgd2UgY2FuIHBh
dGNoIEpGRlMyCj4+Pj4+IHRvIHdyaXRlIHRoaW5ncyB3aXRoICJFQ0MtZGlzYWJsZWQiKyJhdXRv
LU9PQi1wbGFjZW1lbnQtb24tdW5wcm90ZWN0ZWQKPj4+Pj4gYXJlYSIuICAgIAo+Pj4+IAo+Pj4+
IEkgc2VlIHRoZSBwcm9ibGVtIGJ1dCBhcyBCb3JpcyBzYWlkIHRoZSBmaXggaXMgbm90IHZhbGlk
IGFzLWlzLgo+Pj4+IFByb2JsZW0gaXM6IEkgZG9uJ3QgaGF2ZSBhIGJldHRlciBwcm9wb3NhbCB5
ZXQuCj4+Pj4gCj4+Pj4gSXMgZm9yY2luZyBKRkZTMiB0byB3cml0ZSBjbGVhbm1hcmtlcnMgaW4g
cmF3IG1vZGUgb25seSBhbiBvcHRpb24/ICAgIAo+Pj4gCj4+PiBUaGUgZG9jIHNheXMgdGhhdCBm
b3IgTVREX09QU19BVVRPX09PQiAidGhlIGRhdGEgaXMgYXV0b21hdGljYWxseSBwbGFjZWQgYXQg
dGhlIGZyZWUgYXJlYXMgd2hpY2ggYXJlIGRlZmluZWQgYnkgdGhlIGludGVybmFsIGVjY2xheW91
dOKAnS4KPj4+IFNvLCBpZiB3ZeKAmXJlIHBsYWNpbmcgdGhpcyBkYXRhIGluIHRoZSBmcmVlIE9P
QiBhcmVhIGxlZnQgYnkgdGhlIEVDQyBieXRlcyBpdCBtZWFucyB0aGF0IHRoaXMgYXV0b21hdGlj
YWxseSBwbGFjZWQgZGF0YSB3b27igJl0IGJlIGVycm9yIGNvcnJlY3RhYmxlLCBzaW5jZSBpdOKA
mXMgaW4gdGhlIE9PQiwgYW5kIHRoZSBPT0IgZGF0YSBpc27igJl0IGVycm9yIGNvcnJlY3RlZCwg
cmlnaHQ/ICAKPj4gCj4+IE5vLCBmcmVlIGJ5dGVzIHNvbWV0aW1lcyBhcmUgYW5kIHNvbWV0aW1l
cyBhcmUgbm90IGNvdmVyZWQgYnkgdGhlIEVDQwo+PiBlbmdpbmUuIEl0IGRlcGVuZHMgb24gdGhl
IGNvbnRyb2xsZXIuCj4+IAo+Pj4gVGhlIHByb2JsZW0gaXMgdGhhdCAiZmxhc2hfZXJhc2UgLWri
gJ0gdXNlcyBNVERfT1BTX0FVVE9fT09CIHRvIHdyaXRlIHRoZSBPT0IgSkZGUzIgY2xlYW4gbWFy
a2VycyBhbmQgaWYgdGhpcyBpcyB3cml0dGVuIHdpdGggRUNDIGVuYWJsZWQgdGhlIE5BTkQgY29u
dHJvbGxlciB3aWxsIGNoYW5nZSB0aGUgRUNDIGJ5dGVzIHRvIGFuIGludmFsaWQgdmFsdWUgKG9y
IGF0IGxlYXN0IGJyY21uYW5kIGNvbnRyb2xsZXIpLgo+Pj4gCj4+PiBBbm90aGVyIG9wdGlvbiBj
b3VsZCBiZSBhZGRpbmcgYW5vdGhlciBtb2RlLCBzb21ldGhpbmcgbGlrZSBNVERfT1BTX0FVVE9f
T09CX1JBVyBhbmQgdXNpbmcgaXQgaW4gbXRkLXV0aWxzIGFuZCBKRkZTMi4gIAo+PiAKPj4gTm8s
IHRoZXNlIG1vZGVzIGFscmVhZHkgYXJlIGNvbXBsZXRlbHkgd3JvbmcsIEkgbXVzdCByZXNlbmQg
bXkgc2VyaWVzCj4+IGZpeGluZyB0aGVtLgo+PiAKPiAKPiBUb3RhbGx5IGFncmVlIHdpdGggTWlx
dWVsIG9uIHRoYXQgb25lOiBsZXQncyBmaXggdGhlCj4gd3JpdGUvcmVhZC9lY2MtbGF5b3V0IHNl
bWFudGljcyBpbnN0ZWFkIG9mIGFkZGluZyBtb3JlIG9ic2N1cmUgbW9kZXMuCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
