Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 251A7C282D8
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 16:20:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CECDD218A4
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 16:20:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d7xOQmRH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="F5LvEntl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CECDD218A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E91uhNvdrf/NNAT62+p7NsDbPmuuItGLQkYhkSypHEE=; b=d7xOQmRH0k+v4T
	lUDrS3AAloHT6JwDirTdU+o2BuIm8W3c9MOswynGL5gucqSt1oAtFOs1phMsD93M+AcTFodVvAV+j
	XvveFAqBFv1DLb5nF0uKsGASomka/xwssnFBIxEQ96tisHJynYjaNIPpqnNrHuqrRKhnQ5YwdRgPf
	rZvdelWnu8Ztn6dFI7dn3j5AxEKy97RKSo5Z+ugypuwTVLwGz7rgCWYJYz3h5EDLhsrjj5W0mreRJ
	PnBbdkWbDhYTHcgdGNSuI0WN6woqUoKR/ftxenMExpiJRI+HB0eRyS+LyddZKXK7GUIx31Csy26Ss
	MukuFsDoNIOM9F3B/Ueg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gosbZ-0003ws-0m; Wed, 30 Jan 2019 16:20:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gosbW-0003wO-1Y
 for linux-mtd@lists.infradead.org; Wed, 30 Jan 2019 16:20:47 +0000
Received: from [192.168.1.31] (cpe-70-114-128-244.austin.res.rr.com
 [70.114.128.244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C7C4520989;
 Wed, 30 Jan 2019 16:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548865245;
 bh=RohCd0lxHnX1A7Rw77DyLrvqmrbVDfs2dXOkeRkFna0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=F5LvEntlxnqi1GpMGlUFz5EI2yvDDAjsJC3ElWWbDGEIyeYNlCmxiTDQHC7i+EoRw
 1H2R6LAz36pPc0+v8j2w77NcHxTmjacSG1w6pr3mw4QSWlTiMCZpOrNblDYcYPtRfC
 vROJ/ikv1Ap9V9Ca0L2wrfXnkGKui9FyOPD00oHo=
Subject: Re: [PATCH] mtd: rawnand: denali_dt: remove single anonymous clock
 support
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>
References: <1547539894-12898-1-git-send-email-yamada.masahiro@socionext.com>
 <20190115092229.59e09c2d@xps13>
 <CAK7LNATnfTQXHrXJQp7732-e7hvd8ORcYubyDmz0KHaRXRMDqQ@mail.gmail.com>
 <20190128112007.440046e6@xps13>
From: Dinh Nguyen <dinguyen@kernel.org>
Openpgp: preference=signencrypt
Autocrypt: addr=dinguyen@kernel.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <e78d9b9e-05e3-aa47-8e66-14f35334a873@kernel.org>
Date: Wed, 30 Jan 2019 10:20:43 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190128112007.440046e6@xps13>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190130_082046_201923_97580D57 
X-CRM114-Status: GOOD (  16.20  )
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
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWlxdWVsLAoKTGV0IG1lIHJldmlldyB0aGlzIHRvZGF5LgoKVGhhbmtzLApEaW5oCgpPbiAx
LzI4LzE5IDQ6MjAgQU0sIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gSGkgRGluaCwKPiAKPiBNYXNh
aGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQuY29tPiB3cm90ZSBvbiBXZWQs
IDE2IEphbgo+IDIwMTkgMTA6Mjc6MTEgKzA5MDA6Cj4gCj4+ICgrQ0MgRGluaCBOZ3V5ZW4pCj4+
Cj4+IE9uIFR1ZSwgSmFuIDE1LCAyMDE5IGF0IDU6MjIgUE0gTWlxdWVsIFJheW5hbCA8bWlxdWVs
LnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6Cj4+Pgo+Pj4gSGkgTWFzYWhpcm8sCj4+Pgo+Pj4g
TWFzYWhpcm8gWWFtYWRhIDx5YW1hZGEubWFzYWhpcm9Ac29jaW9uZXh0LmNvbT4gd3JvdGUgb24g
VHVlLCAxNSBKYW4KPj4+IDIwMTkgMTc6MTE6MzQgKzA5MDA6Cj4+PiAgCj4+Pj4gQ29tbWl0IDZm
MWZlOTdiZWMzNCAoIm10ZDogcmF3bmFuZDogZGVuYWxpX2R0OiBhZGQgbW9yZSBjbG9ja3MgYmFz
ZWQKPj4+PiBvbiBJUCBkYXRhc2hlZXQiKSBpbnRyb2R1Y2VkIGEgbW9yZSBjb3JyZWN0IGJpbmRp
bmcgdGhhdCByZXF1aXJlcwo+Pj4+IHRocmVlIG5hbWVkIGNsb2Nrcy4KPj4+Pgo+Pj4+IE5vdyB0
aGF0IGFsbCB1cHN0cmVhbSBEVCBmaWxlcyBtaWdyYXRlZCBvdmVyIHRvIGl0LCByZW1vdmUgdGhl
IHNpbmdsZQo+Pj4+IGFub255bW91cyBjbG9jayBzdXBwb3J0LiAgCj4+Pgo+Pj4gSSB3b3VsZCBs
b3ZlIHRvIGRvIHRoYXQgYnV0IEkgdGhpbmsgdGhpcyBpcyBhZ2FpbnN0IHRoZSAiRFQgYmFja3dh
cmQKPj4+IGNvbXBhdGliaWxpdHkgcnVsZSIuICAKPj4KPj4gWWVhaCwgSSBrbm93IHRoaXMgcnVs
ZSwgYnV0IHdlIGJyZWFrIERUIGJpbmRpbmcgZnJvbSB0aW1lIHRvIHRpbWUuCj4+Cj4+Cj4+Cj4+
PiBBbnl3YXksIElJUkMgaXQgaXMgYWNjZXB0ZWQgdGhhdCB0aGlzIGtpbmQgb2YKPj4+IHJ1bGUg
bWlnaHQgYmUgYnJva2VuIGlmIGRlY2lkZWQgcGVyIHRoZSBhcmNoLW1haW50YWluZXIgKGluIHRo
aXMKPj4+IGNhc2UsIHlvdSBJIHN1cHBvc2UpLiBTbyBpZiB0aGlzIGlzIHJlYWxseSB3aGF0IHlv
dSB3YW50LCBJJ2xsIHF1ZXVlCj4+PiBpdC4gIAo+Pgo+PiBNeSBwbGF0Zm9ybSBpcyBmaW5lLCBi
dXQgdGhpcyBkcml2ZXIgaXMgdXNlZCBieSBTT0NGUEdBIGJvYXJkcyBhcyB3ZWxsLgo+Pgo+PiBJ
IENDZWQgdGhlIFNPQ0ZQR0EgbWFpbnRhaW5lciwgRGluaCBOZ3V5ZW4uCj4+Cj4gCj4gR2VudGxl
IHBpbmcgb24gdGhpcyB0b3BpYy4KPiAKPiAKPiBUaGFua3MsCj4gTWlxdcOobAo+IAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
