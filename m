Return-Path: <SRS0=y4VE=FU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBDA1C4361B
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Dec 2020 07:52:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7234D23343
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Dec 2020 07:52:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7234D23343
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lci3jUZYfMWfNLNJPIbck3TYdWrHS9ayLDPEbLGI5NA=; b=Fdmtel1RVok5ZGIMjQ5uSTWoy
	p9/u5Oc95C3w6cc2rkY3AEdwCuYbxv5Flp6HpA2QTagJ+mrratvlwg4n1EZpX1SUiQBo4Po1qRzbO
	DYWx6CZ5s23afchCz+r7lO2QlOoZeDzvqFiCrxEChB0T8NHaO3IROS0Ld3nJhcV2aJJssJ1LBOEDU
	7MYIJ5CbW02OLdwWglvEUvLYrwa77sFV1g90mpdKZQEaDtVcPsgKO0T+CAxRsp9oMMZbxLlq5RLlU
	RbomDWI/Q8c2GU1B+OMKlswX8iOxJfhwaIMVn+HD/Yp1LX7jBODSw6q5fYmoOOzntbAlnDwDn3qMC
	j+6kejt0Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpRbB-000060-WA; Wed, 16 Dec 2020 07:51:50 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpRb4-00005D-Jt
 for linux-mtd@lists.infradead.org; Wed, 16 Dec 2020 07:51:43 +0000
X-Originating-IP: 90.1.135.213
Received: from xps13 (alille-651-1-136-213.w90-1.abo.wanadoo.fr [90.1.135.213])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 7368E1BF20C;
 Wed, 16 Dec 2020 07:51:36 +0000 (UTC)
Date: Wed, 16 Dec 2020 08:51:35 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: David Schaefer <david.tillmann.schaefer@gmail.com>
Subject: Re: WD MyCloud Ex, Armada-370, pxa3xx-nand, marvell-nfc
Message-ID: <20201216085135.367f1f61@xps13>
In-Reply-To: <CAK+FTGgZV2CnTBT6i+1G=fLzpNcCBFhY04a_hfSeV_kmoDcaSA@mail.gmail.com>
References: <CAK+FTGhwM02y_eg6cE=GNcOH8G8eQjia0PD+JVrR=eSedQxWAA@mail.gmail.com>
 <CAFLxGvyNtHOQZ1OnSsh=Md9Lx7e8j307uRCNvS_qvNp6FW1_pg@mail.gmail.com>
 <CAK+FTGjg1sMtE0Vk=mztO6_HP0VJ=mYy1b0nAEXDw6Dtx6AtUw@mail.gmail.com>
 <2020191742.126461.1607959229137.JavaMail.zimbra@nod.at>
 <CAK+FTGirwvd5Sdww4kkYCy0BMmnZsP=Tq=cAePxraXa3AcGbiQ@mail.gmail.com>
 <CAK+FTGhhFCVM4wazP5epp9E9kPf7=iAYRCmwZECXmszBmRERzw@mail.gmail.com>
 <20201215165636.41d69087@xps13>
 <CAK+FTGin3jY2B6Ym4iZma0xs-YhRU24b90yPgQS9ZNTVi84SDA@mail.gmail.com>
 <20201215174621.0a9d1c3f@xps13>
 <CAK+FTGhaXiS-jYbqYD1b-hAG7M4qbbQGQVGnSYeE6CqMOw4fLA@mail.gmail.com>
 <CAK+FTGgZV2CnTBT6i+1G=fLzpNcCBFhY04a_hfSeV_kmoDcaSA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_025142_868578_E03C4C32 
X-CRM114-Status: GOOD (  26.78  )
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
Cc: Richard Weinberger <richard@nod.at>,
 linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgRGF2aWQsCgpEYXZpZCBTY2hhZWZlciA8ZGF2aWQudGlsbG1hbm4uc2NoYWVmZXJAZ21haWwu
Y29tPiB3cm90ZSBvbiBUdWUsIDE1IERlYwoyMDIwIDIzOjA0OjI0ICswMTAwOgoKPiBIaSBNaXF1
ZWwsCj4gCj4gQW0gRGkuLCAxNS4gRGV6LiAyMDIwIHVtIDIyOjIwIFVociBzY2hyaWViIERhdmlk
IFNjaGFlZmVyCj4gPGRhdmlkLnRpbGxtYW5uLnNjaGFlZmVyQGdtYWlsLmNvbT46Cj4gPgo+ID4g
SGkgTWlxdcOobAo+ID4gIAo+ID4gPiBNYXliZSBJIHNob3VsZCBhc2sgeW91IHdoeSB5b3UgYXJl
IHVzaW5nIG10ZGJsb2NrIGFuZCB1c2luZyBkZCBvbiB0b3AKPiA+ID4gb2YgaXQ/IElmIHlvdSB3
YW50IHRvIHRhY2tsZSBhIE5BTkQgaXNzdWUsIHlvdSBzaG91bGQgcHJvYmFibHkgIGFkZHJlc3MK
PiA+ID4gdGhlIG10ZCBkZXZpY2UgZGlyZWN0bHkgYW5kIHVzZSB0aGUgdG9vbHMgcHJvdmlkZWQg
YnkgdGhlIG10ZC11dGlscwo+ID4gPiB1c2Vyc3BhY2UgdGVzdCBzdWl0ZSAobmFuZHBhZ2V0ZXN0
IHNlZW1zIGEgZ29vZCBmaXQpLiAgCj4gPiBXaGF0IEkgYW0gdHJ5aW5nIHRvIGFjY29tcGxpc2gg
aXMgcnVubmluZyBhIGRlYmlhbiB3aXRoIGEga2VybmVsIG1vcmUKPiA+IHRoYW4gNC4xNSBvbiBh
IFdEIE15Q2xvdWQgRXgyLiBJIGZvbGxvdyBhIHdyaXR0ZW4gZG93biBhcHByb2FjaCB0aGF0Cj4g
PiBoYXMgYmVlbiBsZWQgdG8gc3VjY2VzcyBieSBvdGhlcnMuIEl0IGludm9sdmVzCj4gPiBkZCBp
Zj0vZGV2L3plcm8gb2Y9L2Rldi9tdGRibG9jazEKPiA+IGRkIGlmPXVJbWFnZSBvZj0vZGV2L210
ZGJsb2NrMQo+ID4gZGQgaWY9L2Rldi96ZXJvIG9mPS9kZXYvbXRkYmxvY2syCj4gPiBkZCBpZj11
UmFtZGlzayBvZj0vZGV2L210ZGJsb2NrMgo+ID4KPiA+IEkgY291bGQgdXNlIG1vcmUgYXBwcm9w
cmlhdGUgd2F5cyB0byBkZWFsIHdpdGggdGhlc2UgZGV2aWNlcyBpZiBJIGtuZXcgb2YgYW55Lgo+
ID4gIAo+ID4gPiBZb3UgbWlnaHQgd2FudCB0byB0cnkgYSBtdWNoIG1vcmUgcmVjZW50IGtlcm5l
bCB0aGVuLiBQcm9iYWJseSB0aGF0Cj4gPiA+IHVzaW5nIGEgNS45IG9yIDUuMTAgaXMgYSBnb29k
IHRhcmdldCBmb3Igbm93LiAgCj4gPiBJIGFtIGNvbXBpbGluZyA1LjEwIHJpZ2h0IG5vdyBhbmQg
YW0gbG9va2luZyBmb3J3YXJkIHRvIHRoZSByZXN1bHRzLiBJCj4gPiBoYXZlIGhhZCA1LjQgcnVu
bmluZyBhbHJlYWR5IHdpdGggbm8gbXRkYmxvY2sgZGV2aWNlcyBzaG93aW5nIHVwLgo+ID4gIAo+
ID4gPiBJIHJlYWxseSBkb24ndCB0aGluayB1c2luZyAtWCB0aGVpcnMgYmxpbmRseSBpcyB3aXNl
LCB5b3Ugc2hvdWxkCj4gPiA+IGRlZmluaXRlbHkgdHJ5IHRvIHVuZGVyc3RhbmQgdGhlIGNvbmZs
aWN0IGFuZCBtZXJnZSBpdCBieSBoYW5kLiAgCj4gPiBJIHRyaWVkIGJ1dCBkaWRuJ3QgZmVlbCB0
byBiZSBpbiB0aGUgcG9zaXRpb24gdG8gbWFrZSB0aGUgY2FsbC4KPiA+IEFueWhvdywgc2luY2Ug
SSBoYXZlIHNlZW4gdGhlIGNvbW1pdHMgYXJlIGFsbCBwYXJ0IG9mIGtlcm5lbHMgNC4xNywKPiA+
IDQuMjAsIDUuMCwgYW5kIDUuMTAgdGhpcyB3aWxsIG5vdCBiZSBhbiBpc3N1ZSBub3cgd2hlbiBJ
IHJ1biA1LjEwLgo+ID4gIAo+ID4gPiA+IC0gbWFydmVsbC1uZmMgZjEwZDAwMDAubmFuZDogVGlt
ZW91dCB3YWl0aW5nIGZvciBSQiBzaWduYWwgIAo+ID4gPiBUaGlzIG9uZSBpcyBhIHJlYWwgZXJy
b3IgYnV0IGdvdCBmaXhlZCBieSBhbm90aGVyIGNvbW1pdC4gIAo+ID4gPiA+IC0gcHJpbnRfcmVx
X2Vycm9yOiBJL08gZXJyb3IsIGRldiBtdGRibG9jazYsIHNlY3RvciAwCj4gPiA+ID4gcHJpbnRf
cmVxX2Vycm9yOiBJL08gZXJyb3IsIGRldiBtdGRibG9jazYsIHNlY3RvciAwCj4gPiA+ID4gcHJp
bnRfcmVxX2Vycm9yOiBJL08gZXJyb3IsIGRldiBtdGRibG9jazYsIHNlY3RvciAwCj4gPiA+ID4g
cHJpbnRfcmVxX2Vycm9yOiBJL08gZXJyb3IsIGRldiBtdGRibG9jazUsIHNlY3RvciAwCj4gPiA+
ID4gcHJpbnRfcmVxX2Vycm9yOiBJL08gZXJyb3IsIGRldiBtdGRibG9jazUsIHNlY3RvciAwCj4g
PiA+ID4gcHJpbnRfcmVxX2Vycm9yOiBJL08gZXJyb3IsIGRldiBtdGRibG9jazUsIHNlY3RvciAw
Cj4gPiA+ID4gcHJpbnRfcmVxX2Vycm9yOiBJL08gZXJyb3IsIGRldiBtdGRibG9jazQsIHNlY3Rv
ciAwCj4gPiA+ID4gcHJpbnRfcmVxX2Vycm9yOiBJL08gZXJyb3IsIGRldiBtdGRibG9jazQsIHNl
Y3RvciAwCj4gPiA+ID4gcHJpbnRfcmVxX2Vycm9yOiBJL08gZXJyb3IsIGRldiBtdGRibG9jazQs
IHNlY3RvciAwCj4gPiA+ID4gcHJpbnRfcmVxX2Vycm9yOiBJL08gZXJyb3IsIGRldiBtdGRibG9j
azMsIHNlY3RvciAwICAKPiA+ID4gVGhpcyBvbmUgc2VlbSByZWxhdGVkIGJ1dCBJIGRvbid0IGtu
b3cgZnJvbSB3aGVyZSBpdCBjb21lcy4gIAo+ID4gPiA+IGRkOiB3cml0aW5nICcvZGV2L210ZGJs
b2NrMSc6IElucHV0L291dHB1dCBlcnJvciAgCj4gPiBJIHdpbGwgY2hlY2sgaWYgSSBzZWUgdGhl
c2UgaXNzdWVzIHdpdGggNS4xMCB3aGVuIGl0J3MgYnVpbHQuICAKPiAKPiBydW5uaW5nIDUuMTAg
ZG9lcyBub3Qgc2hvdyBhbnkgL2Rldi9tdGRibG9jayBkZXZpY2VzLiBUaGVyZSBhcmUgZXJyb3Jz
Cj4gaW4gdGhlIGJvb3Qgc2hvd2luZyB1cCBhcwo+IG1hcnZlbGwtbmZjIHNvYzppbnRlcm5hbC1y
ZWdzOm5hbmRAZDAwMDA6IGludmFsaWQgcmVzb3VyY2UKPiBtYXJ2ZWxsLW5mYzogcHJvYmUgb2Yg
c29jOmludGVybmFsLXJlZ3M6bmFuZEBkMDAwMCBmYWlsZWQgd2l0aCBlcnJvciAtMjIKClBlcmhh
cHMgdGhlIGlzc3VlcyBjb21lcyBmcm9tIHlvdXIgZGV2aWNlIHRyZWUsIGFzIHRoaXMgbGluZXMg
c2F5cy4gWW91CnNob3VsZCBjaGVjayB0aGUgYmluZGluZ3MgYW5kIHZlcmlmeSB0aGV5IGFyZSBp
biBzeW5jLgoKQmluZGluZ3Mgc2hvdWxkIGJlIGJhY2t3YXJkIGNvbXBhdGlibGUgYnV0IHdobyBr
bm93cy4uLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
