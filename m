Return-Path: <SRS0=eMUk=JE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55BAFC433B4
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Apr 2021 08:03:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EED1961168
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Apr 2021 08:03:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EED1961168
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Nw26RvL+FwDkKRXBUu0L8uPxkyaXKDjxf0753ccFahQ=; b=V/LNYOsXjAH0OOb4BKkYSmW/e
	hIrc0vzUILBljLOPlMSeVeWJF0CTRShG2XJMyX6DtDwydJT2H7iBHEy68okbzVeJ/D0fED+F/YLPp
	80UBjm1VEXxCSexfMMLciAtpXf+RQImtlsfYyXGJDPRTvS/+7bYooP6XZqyggKBuL1+NVM40njUkx
	zgfnCBJjyNh3ooJDfv0TaOPsjMnofUU2O0+FaAatdqlQ00eZcrD5xbMlx+asq9TIws34FpLDR7+jK
	0/V0rSu74uoPWsoKsqh9E96H7LEON1r3fJ2q17UDIS66Sg5oLb31O2ftUCQaz+mY57RxoFp4FFlir
	kHtEPRkIQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lU38e-004SCK-9Q; Wed, 07 Apr 2021 08:02:12 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lU38Z-004SC1-IC
 for linux-mtd@lists.infradead.org; Wed, 07 Apr 2021 08:02:10 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13 (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr [90.89.138.59])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 9D409FF80E;
 Wed,  7 Apr 2021 08:02:05 +0000 (UTC)
Date: Wed, 7 Apr 2021 10:02:04 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Daniel Palmer <daniel@0x0f.com>
Cc: linux-mtd@lists.infradead.org, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] mtd: spinand: add support for Foresee FS35ND01G-S1Y2
Message-ID: <20210407100204.08d894ca@xps13>
In-Reply-To: <CAFr9PXntCmdrmg+i3BB1j-aY4VbE=2iqyLcoSr9cX2090jGiGQ@mail.gmail.com>
References: <20210213095724.3411058-1-daniel@0x0f.com>
 <20210215112409.1a755bf0@xps13>
 <CAFr9PXkh+attaCc6C2UxB=qvXksWriWOaaoEndy4k6SGE0QOHQ@mail.gmail.com>
 <20210215121653.4edd86c4@xps13>
 <CAFr9PXmVehtcm6FjBqi_hmEAj1rgtxMvarisjPmWhgjruVj++Q@mail.gmail.com>
 <20210322193213.18520b9a@xps13>
 <CAFr9PX=mL9UWcr-yWbYa5NXS-R=yHeGgM+hd_MKOa2XiBUAJOQ@mail.gmail.com>
 <20210323113233.3523d66b@xps13>
 <CAFr9PX=KMZuzp61Hq=2WdHyEzE=6J7HEPWZxPs7FEqiH-G8wFw@mail.gmail.com>
 <20210323150603.6b942a60@xps13>
 <CAFr9PXntCmdrmg+i3BB1j-aY4VbE=2iqyLcoSr9cX2090jGiGQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_090207_906024_98D4F0D8 
X-CRM114-Status: GOOD (  21.38  )
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

SGkgRGFuaWVsLAoKRGFuaWVsIFBhbG1lciA8ZGFuaWVsQDB4MGYuY29tPiB3cm90ZSBvbiBGcmks
IDI2IE1hciAyMDIxIDIzOjA5OjI4CiswOTAwOgoKPiBIaSBNaXF1ZWwsCj4gCj4gU29ycnkgZm9y
IHRoZSBjb25zdGFudCBwZXN0ZXJpbmcgb24gdGhpcy4uCj4gCj4gT24gVHVlLCAyMyBNYXIgMjAy
MSBhdCAyMzowNiwgTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3Jv
dGU6Cj4gPiA+ICMgbmFuZGJpdGVycnMgLWkgL2Rldi9tdGQxCj4gPiA+IGluY3JlbWVudGFsIGJp
dGVycm9ycyB0ZXN0Cj4gPiA+IFN1Y2Nlc3NmdWxseSBjb3JyZWN0ZWQgMCBiaXQgZXJyb3JzIHBl
ciBzdWJwYWdlCj4gPiA+IEluc2VydGVkIGJpdGVycm9yIEAgMC81Cj4gPiA+IFJlYWQgcmVwb3J0
ZWQgNCBjb3JyZWN0ZWQgYml0IGVycm9ycwo+ID4gPiBFQ0MgZmFpbHVyZSwgaW52YWxpZCBkYXRh
IGRlc3BpdGUgcmVhZCBzdWNjZXNzICAKPiA+Cj4gPiBUaGlzIGlzIG5vdCBhIHZhbGlkIGJlaGF2
aW9yLiBUaGVyZSBpcyBzb21ldGhpbmcgd3Jvbmcgd2l0aCB0aGUgd2F5IEVDQwo+ID4gc3RhdHVz
IGlzIHJlYWQvcmV0cmlldmVkLiBUaGUgcmVhZCBzaG91bGQgaW5kZWVkIHJlcG9ydCA0IGNvcnJl
Y3RlZCBiaXQKPiA+IGVycm9ycywgYnV0IHRoZW4gdGhlIGRhdGEgc2hvdWxkIGJlIHZhbGlkLiBI
ZXJlIGl0IG1lYW5zIHRoYXQgdGhlCj4gPiBpbnRyb2R1Y2VkIGVycm9yIGFwcGVhcnMgY29ycmVj
dGVkIGJ1dCBpbiBmYWN0IGlzIG5vdC4KPiA+IFdlIG5lZWQgdG8gdW5kZXJzdGFuZCB3aGF0IHN0
YXR1cyBhcmUgYXZhaWxhYmxlIGFuZCB3cml0ZSB0aGUKPiA+IGFwcHJvcHJpYXRlIHZlbmRvciBj
b2RlLiAgCj4gCj4gSSBsb29rZWQgYXQgdGhlIGRhdGFzaGVldCBhZ2FpbiBhbmQgdGhlIGVuY29k
aW5nIGZvciBlY2Mgc3RhdHVzIHNlZW1zCj4gYSBiaXQgZnVua3kuCj4gVGhlIGNoaXAgc2VlbXMg
dG8gaGF2ZSBvbmx5IHR3byBiaXRzIGZvciBFQ0Mgc3RhdHVzIHdpdGggdGhpcyBlbmNvZGluZzoK
PiAwIC0gUmVhZCBzdWNjZXNzIHdpdGggMC0zIGZsaXBwZWQgYml0cy4KPiAxIC0gUmVhZCBzdWNj
ZXNzIHdpdGggNCBmbGlwcGVkIGJpdHMuCj4gMiAtIFVuY29ycmVjdGFibGUuCj4gMyAtIFJlc2Vy
dmVkLgo+IAoKVmVyeSBuaWNlIGluZm9ybWF0aW9uLgoKPiBUaGlzIGxvb2tzIGFsbW9zdCB0aGUg
c2FtZSBhcyB0aGUgV2luYm9uZCBjaGlwcyB3aXRoIDAgYW5kIDEgYmVpbmcgc3VjY2Vzc2VzCj4g
YnV0IHdpdGggbm8gdG90YWxseSBlcnJvciBmcmVlIHN0YXR1cy4KPiAKPiBBbnlob3csIGlmIDQg
Yml0cyB3ZXJlIGNvcnJlY3RlZCBpcyByZXR1cm5lZCBmb3IgMSB0aGVuIG5hbmRiaXRlcnJzCj4g
cmVwb3J0cyAiRUNDIGZhaWx1cmUsIGludmFsaWQgZGF0YSBkZXNwaXRlIHJlYWQgc3VjY2VzcyIu
Cj4gSWYgSSByZXR1cm4gMyBiaXQgZXJyb3JzIGZvciAwIGFuZCAtRUJBRE1TRyBmb3IgYW55dGhp
bmcgZWxzZQo+IG5hbmRiaXRlcnJzIGRvZXNuJ3QgY29tcGxhaW4gYW55bW9yZSBidXQgaXMgdGhp
cyByaWdodD86CgpZb3UgbWF5IGxvb2sgYXQgbWljcm9uXzhfZWNjX2dldF9zdGF0dXMoKSBoZWxw
ZXIgdG8gZ3VpZGUgeW91LiBCdXQKSU1ITywgaWYgdGhlcmUgYXJlIDAtMyBiZiwgeW91IHNob3Vs
ZCBwcm9iYWJseSBhc3N1bWUgdGhlcmUgd2VyZSAzIGJmCmFuZCByZXR1cm4gMywgaWYgdGhlcmUg
d2VyZSA0LCByZXR1cm4gNCwgaWYgaXQncyB1bmNvcnJlY3RhYmxlIHJldHVybgotRUJBRE1TRyBv
dGhlcndpc2UgLUVJTlZBTC4KCldlIHNob3VsZCB2ZXJpZnkgdGhhdCB0aGlzIGRvZXMgbm90IG1l
c3Mgd2l0aCBVQkkgd2VhciBsZXZlbGluZwp0aG91Z2guIFBsZWFzZSBjaGVjayB0aGF0IHJldHVy
bmluZyAzLWJpdCBlcnJvcnMgbm8gbWF0dGVyIHRoZQphY3R1YWwgbnVtYmVyIG9mIGZsaXBwZWQg
Yml0cyBkb2VzIG5vdCBsZWFkIFVCSSB0byBtb3ZlIHRoZSBkYXRhIGF3YXkKKEkgdGhpbmsgaXQn
cyBmaW5lIGJ1dCB3ZSBuZWVkIHRvIGJlIHN1cmUgb3RoZXJ3aXNlIHRoZSBpbXBsZW1lbnRhdGlv
bgpwcm9wb3NhbCBpcyBub3QgdmFsaWQpLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
