Return-Path: <SRS0=bCBt=FV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BF41C4361B
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Dec 2020 20:16:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BB36239FE
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Dec 2020 20:16:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BB36239FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+RPGs5UAs4+4aSxylgEtmYaE0y8Ln5AL/eF3ycc4+M0=; b=egLFQRQ6uYXGWHCTF/5yUqpn6
	3FqQlxlQrREIlUHOdUsaQ1zWOxVnBYjxeGjCwXpwxnGslbT2HrEDzjVFIZ3CZwE821zL42mi5EDpR
	OvI1G9VEE6SqjpuB1S1Qqkujd+ffKJCeGpPZLPVbYO0WBNJh8nYnYdSx2VxtbIlUZuiM49Yd1J+XU
	kBdkZdUxIJ+TfUL7TIZiZMECMvua3/bcqwFdMdlr3JeR2v30vKNWBqfnnXfQ7uGIgxZLI7XIVTezM
	7NiU8aFc+KCIPc42q8buKrrsAdaKNL5Py7b3SAL4DcOefbwTA3OY56Wbu/OsZ+DUTOS6h9l8ujUae
	Y6JyIYrug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpzge-00008l-DY; Thu, 17 Dec 2020 20:15:44 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpzgc-00008I-41
 for linux-mtd@lists.infradead.org; Thu, 17 Dec 2020 20:15:42 +0000
Received: by mail-il1-x132.google.com with SMTP id p5so72265iln.8
 for <linux-mtd@lists.infradead.org>; Thu, 17 Dec 2020 12:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Kvhcwn9KbBL2Zsg8/YAUeh/JR7DRE7+KGDQkN2B3hjw=;
 b=UCCNPhoFlWcF8JhbI1hFlULHzW+OQJFGAFUtqzDnullQ3tSDZw77C15zlDjlHNrTwK
 WT+Q5lNLGLr4L0wYICbX8AGo6uIKlQxdiiiWjJ0Z1FNZ3Kus1wSkZaJRXojLBQ7cYP3Z
 SXBVA8p/eOH8xIFhwqGCXAZtOzA53qjTLoVqHMWLwVaqQ0zem4jIPBG/hSv/iHLzoW6u
 KEriaHqw7+hTErEpsRYehfTt+4gag1b2ysd8l6WKkfpABYoFLitHFbChyZVQFFwvNYdq
 VAMdCjGKnui8TNXI8S2VY9XrUUkqEDDO6pEqfTxbvKj77NqMiwKt+u8agzafwW28kAsJ
 SwHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Kvhcwn9KbBL2Zsg8/YAUeh/JR7DRE7+KGDQkN2B3hjw=;
 b=mU+qMsSdre+c891U1HZNWl4ckIXuK+kdpgsFE8R1RUiDaezKB9LYXO8DCCpXOeF9SX
 g4S32QyA4TaBLJSwA+nhoL7S2nNvT9YpTKuNYwf7Q69fm33+BIon5Z/fPBZVwCxxL9Qi
 vOeQuRrGu6a4/F/mNNCT+XWxM57LkGEiYSuIqG5w8SUmttKf/L3pIV75s3zCIHPJ68Os
 bog7JaOgG1w4SZ3I8USFRnPDqTv1ZPD7O67e+RisHXTsNp5A4dMpIWIBBvJY+eXkRqkQ
 H3XkF/e4c5w39IWAt7V1KqBtQtlB9xDCzIgcJnpnYLVITWFBHykRPK0Qmly/K295Sj/z
 94UA==
X-Gm-Message-State: AOAM530gB+STQD9USNWPh6NIOuqZ8ogtdOJhOB6/3EWHGtzgSB3AeMqx
 3QxFX7oXQhy3EQ8iYAZd3W4qFZkVafUM8BKm0fZ9yUgi5GzyAg==
X-Google-Smtp-Source: ABdhPJzUka1l44Ye+wbLkOjQEX8V7TJP52PiYDx7r9KJ9Sj4cxuJjKtxyFsrC+oOi6b5bkFokPaAPDVrx1qjpCriE1Y=
X-Received: by 2002:a92:cec3:: with SMTP id z3mr542024ilq.256.1608236140053;
 Thu, 17 Dec 2020 12:15:40 -0800 (PST)
MIME-Version: 1.0
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
 <20201216085135.367f1f61@xps13>
In-Reply-To: <20201216085135.367f1f61@xps13>
From: David Schaefer <david.tillmann.schaefer@gmail.com>
Date: Thu, 17 Dec 2020 21:15:29 +0100
Message-ID: <CAK+FTGgrPc=qsiQ_DCbG1D0a6BD74f0iT0JgEJ7P=BpR+oqWWQ@mail.gmail.com>
Subject: Re: WD MyCloud Ex, Armada-370, pxa3xx-nand, marvell-nfc
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_151542_291944_A8B6ECE0 
X-CRM114-Status: GOOD (  29.19  )
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

SGkgTWlxdWVsIGFuZCBSaWNoYXJkCgpUaGFua3MgZm9yIGFsbCB0aGUgaGVscCBhbmQgc3VwcG9y
dC4gSSBtaWdodCBiZSBsb29raW5nIGludG8gdGhpcyBwZXQKcHJvamVjdCBpbiB0aGUgZnV0dXJl
IGFuZCBhcHByZWNpYXRlIHRoZSBjb252ZXJzYXRpb24gd2UgaGFkLiBTdGF5CnNhZmUhCgpLaW5k
IHJlZ2FyZHMKRGF2aWQKCkFtIE1pLiwgMTYuIERlei4gMjAyMCB1bSAwODo1MSBVaHIgc2Nocmll
YiBNaXF1ZWwgUmF5bmFsCjxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPjoKPgo+IEhpIERhdmlk
LAo+Cj4gRGF2aWQgU2NoYWVmZXIgPGRhdmlkLnRpbGxtYW5uLnNjaGFlZmVyQGdtYWlsLmNvbT4g
d3JvdGUgb24gVHVlLCAxNSBEZWMKPiAyMDIwIDIzOjA0OjI0ICswMTAwOgo+Cj4gPiBIaSBNaXF1
ZWwsCj4gPgo+ID4gQW0gRGkuLCAxNS4gRGV6LiAyMDIwIHVtIDIyOjIwIFVociBzY2hyaWViIERh
dmlkIFNjaGFlZmVyCj4gPiA8ZGF2aWQudGlsbG1hbm4uc2NoYWVmZXJAZ21haWwuY29tPjoKPiA+
ID4KPiA+ID4gSGkgTWlxdcOobAo+ID4gPgo+ID4gPiA+IE1heWJlIEkgc2hvdWxkIGFzayB5b3Ug
d2h5IHlvdSBhcmUgdXNpbmcgbXRkYmxvY2sgYW5kIHVzaW5nIGRkIG9uIHRvcAo+ID4gPiA+IG9m
IGl0PyBJZiB5b3Ugd2FudCB0byB0YWNrbGUgYSBOQU5EIGlzc3VlLCB5b3Ugc2hvdWxkIHByb2Jh
Ymx5ICBhZGRyZXNzCj4gPiA+ID4gdGhlIG10ZCBkZXZpY2UgZGlyZWN0bHkgYW5kIHVzZSB0aGUg
dG9vbHMgcHJvdmlkZWQgYnkgdGhlIG10ZC11dGlscwo+ID4gPiA+IHVzZXJzcGFjZSB0ZXN0IHN1
aXRlIChuYW5kcGFnZXRlc3Qgc2VlbXMgYSBnb29kIGZpdCkuCj4gPiA+IFdoYXQgSSBhbSB0cnlp
bmcgdG8gYWNjb21wbGlzaCBpcyBydW5uaW5nIGEgZGViaWFuIHdpdGggYSBrZXJuZWwgbW9yZQo+
ID4gPiB0aGFuIDQuMTUgb24gYSBXRCBNeUNsb3VkIEV4Mi4gSSBmb2xsb3cgYSB3cml0dGVuIGRv
d24gYXBwcm9hY2ggdGhhdAo+ID4gPiBoYXMgYmVlbiBsZWQgdG8gc3VjY2VzcyBieSBvdGhlcnMu
IEl0IGludm9sdmVzCj4gPiA+IGRkIGlmPS9kZXYvemVybyBvZj0vZGV2L210ZGJsb2NrMQo+ID4g
PiBkZCBpZj11SW1hZ2Ugb2Y9L2Rldi9tdGRibG9jazEKPiA+ID4gZGQgaWY9L2Rldi96ZXJvIG9m
PS9kZXYvbXRkYmxvY2syCj4gPiA+IGRkIGlmPXVSYW1kaXNrIG9mPS9kZXYvbXRkYmxvY2syCj4g
PiA+Cj4gPiA+IEkgY291bGQgdXNlIG1vcmUgYXBwcm9wcmlhdGUgd2F5cyB0byBkZWFsIHdpdGgg
dGhlc2UgZGV2aWNlcyBpZiBJIGtuZXcgb2YgYW55Lgo+ID4gPgo+ID4gPiA+IFlvdSBtaWdodCB3
YW50IHRvIHRyeSBhIG11Y2ggbW9yZSByZWNlbnQga2VybmVsIHRoZW4uIFByb2JhYmx5IHRoYXQK
PiA+ID4gPiB1c2luZyBhIDUuOSBvciA1LjEwIGlzIGEgZ29vZCB0YXJnZXQgZm9yIG5vdy4KPiA+
ID4gSSBhbSBjb21waWxpbmcgNS4xMCByaWdodCBub3cgYW5kIGFtIGxvb2tpbmcgZm9yd2FyZCB0
byB0aGUgcmVzdWx0cy4gSQo+ID4gPiBoYXZlIGhhZCA1LjQgcnVubmluZyBhbHJlYWR5IHdpdGgg
bm8gbXRkYmxvY2sgZGV2aWNlcyBzaG93aW5nIHVwLgo+ID4gPgo+ID4gPiA+IEkgcmVhbGx5IGRv
bid0IHRoaW5rIHVzaW5nIC1YIHRoZWlycyBibGluZGx5IGlzIHdpc2UsIHlvdSBzaG91bGQKPiA+
ID4gPiBkZWZpbml0ZWx5IHRyeSB0byB1bmRlcnN0YW5kIHRoZSBjb25mbGljdCBhbmQgbWVyZ2Ug
aXQgYnkgaGFuZC4KPiA+ID4gSSB0cmllZCBidXQgZGlkbid0IGZlZWwgdG8gYmUgaW4gdGhlIHBv
c2l0aW9uIHRvIG1ha2UgdGhlIGNhbGwuCj4gPiA+IEFueWhvdywgc2luY2UgSSBoYXZlIHNlZW4g
dGhlIGNvbW1pdHMgYXJlIGFsbCBwYXJ0IG9mIGtlcm5lbHMgNC4xNywKPiA+ID4gNC4yMCwgNS4w
LCBhbmQgNS4xMCB0aGlzIHdpbGwgbm90IGJlIGFuIGlzc3VlIG5vdyB3aGVuIEkgcnVuIDUuMTAu
Cj4gPiA+Cj4gPiA+ID4gPiAtIG1hcnZlbGwtbmZjIGYxMGQwMDAwLm5hbmQ6IFRpbWVvdXQgd2Fp
dGluZyBmb3IgUkIgc2lnbmFsCj4gPiA+ID4gVGhpcyBvbmUgaXMgYSByZWFsIGVycm9yIGJ1dCBn
b3QgZml4ZWQgYnkgYW5vdGhlciBjb21taXQuCj4gPiA+ID4gPiAtIHByaW50X3JlcV9lcnJvcjog
SS9PIGVycm9yLCBkZXYgbXRkYmxvY2s2LCBzZWN0b3IgMAo+ID4gPiA+ID4gcHJpbnRfcmVxX2Vy
cm9yOiBJL08gZXJyb3IsIGRldiBtdGRibG9jazYsIHNlY3RvciAwCj4gPiA+ID4gPiBwcmludF9y
ZXFfZXJyb3I6IEkvTyBlcnJvciwgZGV2IG10ZGJsb2NrNiwgc2VjdG9yIDAKPiA+ID4gPiA+IHBy
aW50X3JlcV9lcnJvcjogSS9PIGVycm9yLCBkZXYgbXRkYmxvY2s1LCBzZWN0b3IgMAo+ID4gPiA+
ID4gcHJpbnRfcmVxX2Vycm9yOiBJL08gZXJyb3IsIGRldiBtdGRibG9jazUsIHNlY3RvciAwCj4g
PiA+ID4gPiBwcmludF9yZXFfZXJyb3I6IEkvTyBlcnJvciwgZGV2IG10ZGJsb2NrNSwgc2VjdG9y
IDAKPiA+ID4gPiA+IHByaW50X3JlcV9lcnJvcjogSS9PIGVycm9yLCBkZXYgbXRkYmxvY2s0LCBz
ZWN0b3IgMAo+ID4gPiA+ID4gcHJpbnRfcmVxX2Vycm9yOiBJL08gZXJyb3IsIGRldiBtdGRibG9j
azQsIHNlY3RvciAwCj4gPiA+ID4gPiBwcmludF9yZXFfZXJyb3I6IEkvTyBlcnJvciwgZGV2IG10
ZGJsb2NrNCwgc2VjdG9yIDAKPiA+ID4gPiA+IHByaW50X3JlcV9lcnJvcjogSS9PIGVycm9yLCBk
ZXYgbXRkYmxvY2szLCBzZWN0b3IgMAo+ID4gPiA+IFRoaXMgb25lIHNlZW0gcmVsYXRlZCBidXQg
SSBkb24ndCBrbm93IGZyb20gd2hlcmUgaXQgY29tZXMuCj4gPiA+ID4gPiBkZDogd3JpdGluZyAn
L2Rldi9tdGRibG9jazEnOiBJbnB1dC9vdXRwdXQgZXJyb3IKPiA+ID4gSSB3aWxsIGNoZWNrIGlm
IEkgc2VlIHRoZXNlIGlzc3VlcyB3aXRoIDUuMTAgd2hlbiBpdCdzIGJ1aWx0Lgo+ID4KPiA+IHJ1
bm5pbmcgNS4xMCBkb2VzIG5vdCBzaG93IGFueSAvZGV2L210ZGJsb2NrIGRldmljZXMuIFRoZXJl
IGFyZSBlcnJvcnMKPiA+IGluIHRoZSBib290IHNob3dpbmcgdXAgYXMKPiA+IG1hcnZlbGwtbmZj
IHNvYzppbnRlcm5hbC1yZWdzOm5hbmRAZDAwMDA6IGludmFsaWQgcmVzb3VyY2UKPiA+IG1hcnZl
bGwtbmZjOiBwcm9iZSBvZiBzb2M6aW50ZXJuYWwtcmVnczpuYW5kQGQwMDAwIGZhaWxlZCB3aXRo
IGVycm9yIC0yMgo+Cj4gUGVyaGFwcyB0aGUgaXNzdWVzIGNvbWVzIGZyb20geW91ciBkZXZpY2Ug
dHJlZSwgYXMgdGhpcyBsaW5lcyBzYXlzLiBZb3UKPiBzaG91bGQgY2hlY2sgdGhlIGJpbmRpbmdz
IGFuZCB2ZXJpZnkgdGhleSBhcmUgaW4gc3luYy4KPgo+IEJpbmRpbmdzIHNob3VsZCBiZSBiYWNr
d2FyZCBjb21wYXRpYmxlIGJ1dCB3aG8ga25vd3MuLi4KPgo+IFRoYW5rcywKPiBNaXF1w6hsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
