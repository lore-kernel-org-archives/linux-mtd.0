Return-Path: <SRS0=xwS+=ES=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0FE8C2D0A3
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2020 15:44:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 360DE20A8B
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2020 15:44:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DzYk/una"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 360DE20A8B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bhBE/j1R7JFcQ5X/6rdu+e0SWjnVmcQzNSKhMT6ST/I=; b=DzYk/unaHHytNad4ZRfykGLJV
	dzVqMbZ6d8sJXPOY7QpB8dVJxHFAX0LIsFTWfyxcSe6rFcnl1dowUVgghRen+WjWxft46bgHzkNg1
	AlhqbTppixsi0Y8RLip1zlXSSyIcK/MHxxCBShkfAVmyPXMVgygiQnms9HEvZxa2GKrJg6mDpiqwU
	AmUPONqv2KAKv3+tCtPVdXQtk4hJwfzvyZJWNyhqmQ7fOalwy96UYt2YjUvZ0zMacoj8NzCiuI1G+
	mmt1HGi9ZWEw4ppy3d7nWROz5vmY6COAOI5BvmFDj0iiNEipO32+m2lZMnudumP7Ce6Lk3c+oB+SD
	g0hpRuNFg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdEkm-0006FO-Ai; Thu, 12 Nov 2020 15:43:16 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdEkf-0006Ct-2c
 for linux-mtd@lists.infradead.org; Thu, 12 Nov 2020 15:43:13 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 94DAF20001A;
 Thu, 12 Nov 2020 15:43:02 +0000 (UTC)
Date: Thu, 12 Nov 2020 16:43:01 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: drivers/mtd/maps/physmap-bt1-rom.c:78:18: sparse: sparse: cast
 removes address space '__iomem' of expression
Message-ID: <20201112164301.60032276@xps13>
In-Reply-To: <20201112152739.r4673zyeixkcwukx@mobilestation>
References: <202011021254.XC70BaQT-lkp@intel.com>
 <20201110113827.hl5i27cpl6exo3md@mobilestation>
 <20201110163556.3e3423f6@xps13>
 <20201111192259.ovdyjcuue7fx2bqa@mobilestation>
 <20201112092715.7e466405@xps13>
 <8cdc6166-7183-c8a9-5c27-93a511e6471a@ti.com>
 <20201112152739.r4673zyeixkcwukx@mobilestation>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_104309_383640_8B9E9BC5 
X-CRM114-Status: GOOD (  18.57  )
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
Cc: kbuild-all@lists.01.org, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 linux-mtd@lists.infradead.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgU2VyZ2UsCgpTZXJnZSBTZW1pbiA8U2VyZ2V5LlNlbWluQGJhaWthbGVsZWN0cm9uaWNzLnJ1
PiB3cm90ZSBvbiBUaHUsIDEyIE5vdgoyMDIwIDE4OjI3OjM5ICswMzAwOgoKPiBIZWxsbyBWaWdu
ZXNoCj4gCj4gT24gVGh1LCBOb3YgMTIsIDIwMjAgYXQgMDg6MzA6NDJQTSArMDUzMCwgVmlnbmVz
aCBSYWdoYXZlbmRyYSB3cm90ZToKPiA+IAo+ID4gCj4gPiBPbiAxMS8xMi8yMCAxOjU3IFBNLCBN
aXF1ZWwgUmF5bmFsIHdyb3RlOiAgCj4gPiA+IEhpIFNlcmdleSwKPiA+ID4gCj4gPiA+IFNlcmdl
IFNlbWluIDxTZXJnZXkuU2VtaW5AYmFpa2FsZWxlY3Ryb25pY3MucnU+IHdyb3RlIG9uIFdlZCwg
MTEgTm92Cj4gPiA+IDIwMjAgMjI6MjI6NTkgKzAzMDA6Cj4gPiA+ICAgCj4gPiA+PiBPbiBUdWUs
IE5vdiAxMCwgMjAyMCBhdCAwNDozNTo1NlBNICswMTAwLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOiAg
Cj4gPiA+Pj4gSGkgU2VyZ2UsCj4gPiA+Pj4KPiA+ID4+PiBTZXJnZSBTZW1pbiA8U2VyZ2V5LlNl
bWluQGJhaWthbGVsZWN0cm9uaWNzLnJ1PiB3cm90ZSBvbiBUdWUsIDEwIE5vdgo+ID4gPj4+IDIw
MjAgMTQ6Mzg6MjcgKzAzMDA6Cj4gPiA+Pj4gICAgIAo+ID4gPj4+PiBIZWxsbyBNaXF1ZWwsCj4g
PiA+Pj4+Cj4gPiA+Pj4+IEEgc2l0dWF0aW9uIG5vdGVkIGJ5IHRoZSB3YXJuaW5nIGJlbG93IHdv
bid0IGNhdXNlIGFueSBwcm9ibGVtIGJlY2F1c2UKPiA+ID4+Pj4gdGhlIGNhc3RpbmcgaXMgZG9u
ZSB0byBhIG5vbi1kZXJlZmVyZW5jZWQgdmFyaWFibGUuIEl0IGlzIHV0aWxpemVkCj4gPiA+Pj4+
IGFzIGEgcG9pbnRlciBiaWFzIGxhdGVyIGluIHRoYXQgZnVuY3Rpb24uIFNoYWxsIHdlIGp1c3Qg
aWdub3JlIHRoZQo+ID4gPj4+PiB3YXJuaW5nIG9yIHN0aWxsIGZpeCBpdCBzb21laG93PyAgICAK
PiA+ID4+PiAgICAgCj4gPiA+PiAgCj4gPiA+Pj4gRG8geW91IHRoaW5rIHRoZSBjYXN0IHRvIGEg
IV9faW9tZW0gdmFsdWUgaXMgbWFuZGF0b3J5IGhlcmU/ICAgIAo+ID4gPj4KPiA+ID4+IEl0J3Mg
bm90IG1hbmRhdG9yeSB0byBoYXZlIHRoZSBjYXN0aW5nIHdpdGggbm8gX19pb21lbSwgYnV0IHdv
dWxkbid0Cj4gPiA+PiBkb2luZyBsaWtlIHRoaXM6Cj4gPiA+PiArIAlzaGlmdCA9IChzc2l6ZV90
IF9faW9tZW0pc3JjICYgMHgzOwo+ID4gPj4gYmUgbG9va2luZyB3ZWlyZD8gUmVhbGx5LCBpcyB0
aGVyZSBhIGdvb2Qgd2F5IHRvIHNvbWVob3cgZXh0cmFjdCB0aGUgZmlyc3QKPiA+ID4+IHR3byBi
aXRzIG9mIGEgX19pb21lbSBwb2ludGVyIHdpdGhvdXQgZ2V0dGluZyB0aGUgc3BhcnNlIHdhcm5p
bmc/ICAKPiA+ID4gCj4gPiA+IEkgYXNrZWQgYXJvdW5kIG1lLCB3aGF0IGFib3V0IHRyeWluZyB1
aW50cHRyX3Q/Cj4gPiA+ICAgCj4gPiAgIAo+IAo+ID4gT25lIG1vcmUgd2F5IGlzIHRvIHVzZSBf
X2ZvcmNlIHRvIHRlbGwgc3BhcnNlIHRoYXQgdGhpcyBjYXN0aW5nIGlzCj4gPiBpbnRlbnRpb25h
bDoKPiA+IAo+ID4gICAgICAgIHNoaWZ0ID0gKF9fZm9yY2Ugc3NpemVfdClzcmMgJiAweDM7ICAK
PiAKPiBPaCwgZ3JlYXQhIFRoYXQgc29sdXRpb24gaXMgYWN0dWFsbHkgbXVjaCBiZXR0ZXIgdGhh
biB1c2luZyBzb21lCj4gY3VycmVudGx5IHVuZXhwbGFpbmVkIHNwYXJzZSBwZWN1bGlhcml0eSEg
SSB3YXMgdGhpbmtpbmcgYWJvdXQgYXBwbHlpbmcKPiBzb21lIG90aGVyIGF0dHJpYnV0ZSwgYnV0
IF9fZm9yY2UganVzdCBkaWRuJ3QgY29tZSB0byBteSBtaW5kLiBUaGFuawo+IHlvdSB2ZXJ5IG11
Y2ggZm9yIHRoZSBzdWdnZXN0aW9uLiBJJ2xsIHBvc3QgdGhlIGZpeCB3aXRoIHRoZSBzb2x1dGlv
bgo+IHN1Z2dlc3RlZCBieSB5b3UuCgpJcyB0aGUgc3NpemVfdCBjYXN0IHRoZSByaWdodCBvbmUg
YnR3PyBJIHdvdWxkIGRlZmluaXRlbHkgcHJlZmVyIGFuCnVuc2lnbmVkIHR5cGUgaGVyZS4KClRo
YW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
