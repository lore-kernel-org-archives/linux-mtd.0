Return-Path: <SRS0=cBb+=FT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 425BCC4361B
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Dec 2020 16:48:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD9B322571
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Dec 2020 16:48:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD9B322571
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zemXEUzKh650McE3xLx9pMEckBOnoNYt7gJdhHvX6Jc=; b=xoos7E7bloR3L/e6HyjC7zgVm
	v4T7iOholTDr0ShRGJHRb/JKwF0A5c51PcYLPqOUiSaCm9n8CCJ0kGy6s4mqhsDzYfYOJ6aAqiDR5
	fc3iD1OYTsM5fXv3c0tEjiW+TTgV9JgSEZ60U2JYsy0Po9FmTzciEYnnWTc8vnxbVMhR1IJ0rDz80
	1seMwJ4ijzg8M6JFkTgnK501+wxSLMepBWvRRwfg3Y0dj0IfwX0mUYxpDMAW7ofaqeasc2hMRYEtU
	Q50k7/OFTPLDiQn3fWYDou6CKcW2fk2CkBRY6X9OVniHO7/VvEwlNqEnUomUjZG4XvFXHDp0MXEqB
	rpMoTP/Dw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpDTn-0006Jc-0v; Tue, 15 Dec 2020 16:47:15 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpDT0-0005nB-3k
 for linux-mtd@lists.infradead.org; Tue, 15 Dec 2020 16:46:27 +0000
Received: from xps13 (lfbn-tou-1-1326-205.w90-89.abo.wanadoo.fr
 [90.89.139.205]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 2D35F240007;
 Tue, 15 Dec 2020 16:46:22 +0000 (UTC)
Date: Tue, 15 Dec 2020 17:46:21 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: David Schaefer <david.tillmann.schaefer@gmail.com>
Subject: Re: WD MyCloud Ex, Armada-370, pxa3xx-nand, marvell-nfc
Message-ID: <20201215174621.0a9d1c3f@xps13>
In-Reply-To: <CAK+FTGin3jY2B6Ym4iZma0xs-YhRU24b90yPgQS9ZNTVi84SDA@mail.gmail.com>
References: <CAK+FTGhwM02y_eg6cE=GNcOH8G8eQjia0PD+JVrR=eSedQxWAA@mail.gmail.com>
 <CAFLxGvyNtHOQZ1OnSsh=Md9Lx7e8j307uRCNvS_qvNp6FW1_pg@mail.gmail.com>
 <CAK+FTGjg1sMtE0Vk=mztO6_HP0VJ=mYy1b0nAEXDw6Dtx6AtUw@mail.gmail.com>
 <2020191742.126461.1607959229137.JavaMail.zimbra@nod.at>
 <CAK+FTGirwvd5Sdww4kkYCy0BMmnZsP=Tq=cAePxraXa3AcGbiQ@mail.gmail.com>
 <CAK+FTGhhFCVM4wazP5epp9E9kPf7=iAYRCmwZECXmszBmRERzw@mail.gmail.com>
 <20201215165636.41d69087@xps13>
 <CAK+FTGin3jY2B6Ym4iZma0xs-YhRU24b90yPgQS9ZNTVi84SDA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201215_114626_413769_44A7A580 
X-CRM114-Status: GOOD (  25.05  )
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
Y29tPiB3cm90ZSBvbiBUdWUsIDE1IERlYwoyMDIwIDE3OjM0OjQ1ICswMTAwOgoKPiBIaSBNaXF1
ZWwsCj4gQW0gRGkuLCAxNS4gRGV6LiAyMDIwIHVtIDE2OjU2IFVociBzY2hyaWViIE1pcXVlbCBS
YXluYWwKPiA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT46Cj4gPiA+IFdlbGwsIEkgbm93IHdh
cyBicmF2ZSBlbm91Z2ggdG8gdHJ5IHRvIHdyaXRlIHRvIHRoZSBibG9jayBkZXZpY2VzIHdpdGgK
PiA+ID4gdGhlIGxhc3Qga2VybmVsIGFuZCBpdCBmYWlsZWQsIGlvIGVycm9yLiAgCj4gPgo+ID4g
SSBzYXcgc3VjY2Vzc2Z1bCBsb2dzIGluIHlvdXIgcHJldmlvdXMgZS1tYWlsLiBXYXMgSSBtaXN1
bmRlcnN0YW5kaW5nCj4gPiBzb21ldGhpbmc/Cj4gPgo+ID4gQWxzbyB0aGVyZSBpcyBhYnNvbHV0
ZWx5IG5vdGhpbmcgd2UgY2FuIGRvIHdpdGhvdXQgdGhlIGxvZ3MgKGluY2x1ZGluZwo+ID4gYm9v
dCkuICAKPiAKPiBJbiBteSBsYXN0IG1haWwgSSBzZW50IDggbm9uLWNvbXBsZXRlIGJvb3Rsb2dz
IGZyb20gdGhlIHJlZ2lvbiB0aGF0Cj4gbWlnaHQgYmUgaW1wb3J0YW50IGFzCj4gSSB1bmRlcnN0
YW5kIGl0LiBTdGFydGluZyB3aXRoIHRoZSBzZWNvbmQgY29tbWl0IHRoZSBzeXN0ZW0gYm9vdHMg
dXAKPiBhbmQgdGhlIGRldmljZXMKPiBhcHBlYXIgYnV0IEkgaGF2ZSBzZXZlcmFsIGRpZmZlcmVu
dCBpc3N1ZXMgbGlrZQo+IC0gbWFydmVsbC1uZmMgZjEwZDAwMDAubmFuZDogVGltZW91dCB3YWl0
aW5nIGZvciBSQiBzaWduYWwKClRoaXMgb25lIGlzIGEgcmVhbCBlcnJvciBidXQgZ290IGZpeGVk
IGJ5IGFub3RoZXIgY29tbWl0LgoKPiAtIGFybWFkYS0zNzAtcGluY3RybCBmMTAxODAwMC5waW4t
Y3RybDogdW5zdXBwb3J0ZWQgZnVuY3Rpb24gZ3BpbyBvbiBwaW4gbXBwNTQKPiBwaW5jdHJsIGNv
cmU6IGZhaWxlZCB0byByZWdpc3RlciBtYXAgZGVmYXVsdCAoMCk6IGludmFsaWQgdHlwZSBnaXZl
bgo+IHJlZy1maXhlZC12b2x0YWdlOiBwcm9iZSBvZiByZWd1bGF0b3JzOnJlZ3VsYXRvckAyIGZh
aWxlZCB3aXRoIGVycm9yIC0yMgo+IC0gaGN0b3N5czogdW5hYmxlIHRvIG9wZW4gcnRjIGRldmlj
ZSAocnRjMCkKClRoZXNlIGFyZSBjb21wbGV0ZWx5IHVucmVsYXRlZC4KCj4gLSBwcmludF9yZXFf
ZXJyb3I6IEkvTyBlcnJvciwgZGV2IG10ZGJsb2NrNiwgc2VjdG9yIDAKPiBwcmludF9yZXFfZXJy
b3I6IEkvTyBlcnJvciwgZGV2IG10ZGJsb2NrNiwgc2VjdG9yIDAKPiBwcmludF9yZXFfZXJyb3I6
IEkvTyBlcnJvciwgZGV2IG10ZGJsb2NrNiwgc2VjdG9yIDAKPiBwcmludF9yZXFfZXJyb3I6IEkv
TyBlcnJvciwgZGV2IG10ZGJsb2NrNSwgc2VjdG9yIDAKPiBwcmludF9yZXFfZXJyb3I6IEkvTyBl
cnJvciwgZGV2IG10ZGJsb2NrNSwgc2VjdG9yIDAKPiBwcmludF9yZXFfZXJyb3I6IEkvTyBlcnJv
ciwgZGV2IG10ZGJsb2NrNSwgc2VjdG9yIDAKPiBwcmludF9yZXFfZXJyb3I6IEkvTyBlcnJvciwg
ZGV2IG10ZGJsb2NrNCwgc2VjdG9yIDAKPiBwcmludF9yZXFfZXJyb3I6IEkvTyBlcnJvciwgZGV2
IG10ZGJsb2NrNCwgc2VjdG9yIDAKPiBwcmludF9yZXFfZXJyb3I6IEkvTyBlcnJvciwgZGV2IG10
ZGJsb2NrNCwgc2VjdG9yIDAKPiBwcmludF9yZXFfZXJyb3I6IEkvTyBlcnJvciwgZGV2IG10ZGJs
b2NrMywgc2VjdG9yIDAKClRoaXMgb25lIHNlZW0gcmVsYXRlZCBidXQgSSBkb24ndCBrbm93IGZy
b20gd2hlcmUgaXQgY29tZXMuCgo+IAo+IGFuZCBkZCByZXBvcnRzCj4gCj4gZGQ6IHdyaXRpbmcg
Jy9kZXYvbXRkYmxvY2sxJzogSW5wdXQvb3V0cHV0IGVycm9yCgpNYXliZSBJIHNob3VsZCBhc2sg
eW91IHdoeSB5b3UgYXJlIHVzaW5nIG10ZGJsb2NrIGFuZCB1c2luZyBkZCBvbiB0b3AKb2YgaXQ/
IElmIHlvdSB3YW50IHRvIHRhY2tsZSBhIE5BTkQgaXNzdWUsIHlvdSBzaG91bGQgcHJvYmFibHkg
IGFkZHJlc3MKdGhlIG10ZCBkZXZpY2UgZGlyZWN0bHkgYW5kIHVzZSB0aGUgdG9vbHMgcHJvdmlk
ZWQgYnkgdGhlIG10ZC11dGlscwp1c2Vyc3BhY2UgdGVzdCBzdWl0ZSAobmFuZHBhZ2V0ZXN0IHNl
ZW1zIGEgZ29vZCBmaXQpLgoKQmUgY2FyZWZ1bCB0aGVzZSBhcmUgZGVzdHJ1Y3RpdmUgdGVzdHMu
IEFueXdheSB5b3UgcGVyaGFwcyBhbHJlYWR5IGxvc3QKdGhlIGNvbnRlbnQgb2YgeW91ciBkZXZp
Y2UgKGF0IGxlYXN0IHlvdSBsb3N0IHRoZSBCQlQpLgoKPiBJIGFtIG5vdCBzdXJlIHdoaWNoIG9m
IHRoZXNlIG1lc3NhZ2VzIGFib3ZlIGFyZSBkdWUgdG8gdGhlIGRyaXZlcgo+IGlzc3VlLiBBbHNv
IEkgd291bGQKPiBsaWtlIHRvIGJlIGNsZWFyIHRoYXQgZXZlbnR1YWxseSBJIHdvdWxkIGxpa2Ug
dG8gcnVuIGEgcmVjZW50IGtlcm5lbCwKCllvdSBtaWdodCB3YW50IHRvIHRyeSBhIG11Y2ggbW9y
ZSByZWNlbnQga2VybmVsIHRoZW4uIFByb2JhYmx5IHRoYXQKdXNpbmcgYSA1Ljkgb3IgNS4xMCBp
cyBhIGdvb2QgdGFyZ2V0IGZvciBub3cuCgo+IEkgYW0gcnVubmluZyA0LjE2IG9ubHkKPiBmb3Ig
ZGVidWdnaW5nIHRoZSBkcml2ZXIgaXNzdWUuCj4gCj4gSSBoYXZlIGF0dGFjaGVkIGEgY29tcGxl
dGUgYm9vdGxvZyBmb3IgdGhlIGtlcm5lbCBJIG9idGFpbmVkIGJ5Cj4gY2hlcnJ5LXBpY2tpbmcg
YWxsIHRoZQo+IGNvbW1pdHMgKGFuZCBzb2x2aW5nIGNvbmZsaWN0cyB3aXRoIC1YIHRoZWlycykg
b24gdGhlIHY0LjE2IHRhZy4KCkkgcmVhbGx5IGRvbid0IHRoaW5rIHVzaW5nIC1YIHRoZWlycyBi
bGluZGx5IGlzIHdpc2UsIHlvdSBzaG91bGQKZGVmaW5pdGVseSB0cnkgdG8gdW5kZXJzdGFuZCB0
aGUgY29uZmxpY3QgYW5kIG1lcmdlIGl0IGJ5IGhhbmQuCgo+IFBsZWFzZSBhZHZpY2UgbWUgaWYg
SSBkaWQKPiBhbnl0aGluZyB3cm9uZyBvciB5b3UgbmVlZCBhbnkgbW9yZSBpbmZvcm1hdGlvbi4K
PiAKCkdvb2QgbHVjayA6KQoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
