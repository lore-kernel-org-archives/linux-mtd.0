Return-Path: <SRS0=cBb+=FT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E97EC4361B
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Dec 2020 21:21:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBF8122CB8
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Dec 2020 21:21:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBF8122CB8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iK4hpvlh6qJrMIFnRiLpph7Z9iY6wAL4X1Wja9wjElo=; b=HvGiIru/4Kvm5Gz3GmDdIe22E
	cv4pbupG+/tLySUwOwL/Qnc4f2u0lIK1t5OFtSDx/SFCetowJgb/nYs13Ckp4/QKdtDEJ2Y0VGIEX
	0spENHBxEz+PBqomd+HeB6ZAqdOOGJesXdPhm0qvtFyB8/1otDSdyrZfr0tAMh+p/QnwPOKi8g4+j
	V+HlNsSAgUHjawiVexvKo69MPiNoprUBPS3NGILWl7X3bb7HXVbg6NQFgq1Q4glcUb+3c1n0anjt1
	Md9m20pRWPDr9NgIS6FwHtlq8BV7SUPjBq89iHjxZ9mkoHrccTWXVPTCjhq68cw4jd1RKsXpy9u0o
	8vEPnTQjA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpHkY-00049g-FC; Tue, 15 Dec 2020 21:20:50 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpHkV-00048a-1E
 for linux-mtd@lists.infradead.org; Tue, 15 Dec 2020 21:20:48 +0000
Received: by mail-io1-xd2b.google.com with SMTP id n4so21966545iow.12
 for <linux-mtd@lists.infradead.org>; Tue, 15 Dec 2020 13:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BSY++fu+JOJy4wBPbgXtb2icREa1Qg8NcQwcGp7j2BE=;
 b=aomtLnNj7j8/dl8z/TAdoZk/3EA1VzsFYtya9gmeUGSHGjGAc8TXGUL/m4YgaxZC7Q
 GWo+EWxmvJCFfBKuk87Jhirf6W+wNabJIUpvZxMEybwoioMmCZ+sfT4lFeJ2Bhae/Pom
 4n0/PR8EOynap4boD0MnAoaGN94pwPyhDH+IDIoDCUY78kBECje8Jspi/GTjBVR5ShaS
 wGxX9l9B4Gs4BCH9s+emVcPDTPuU+z0nHe6dBVBmg1greywV5cZWuX8uOANFtDzV9JuR
 R6+MiuRVOy2fRUl23fSMf651xEhI1azzpMyMr47lerOSmKJoOJBoX3i2u86gSgaXLTAo
 DfjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BSY++fu+JOJy4wBPbgXtb2icREa1Qg8NcQwcGp7j2BE=;
 b=WqoEDfrbKfMIyYFZYgimBMHo0RsEwUQefp5B7DY3FlSt/BOhLPJ2k62TZSLvdID9QJ
 8n6z2xMoB+j/rnEL3ByRjqh6F18ln5K/hmPR/IC9H91gFXE/mFkeBy4uzTws0lsPNuwM
 oPGPxLCnfDkL3W3UiNpf8GAMPcBi2i/1gaFMEZJ0oa006ZdzhR0pOOYUK0iMKgAlZNcl
 oQEt/8i13bw31g56PHSY9yusbIO2LxqJ73bLdoBiRHX04JDsfSTxc+1TVmyK9XRVqu7J
 qAglHgG2WJNV0ar/VUAsTC2w/3vmK/sz3pPjSI+wLAZq87UJxsVguCTnjgM+aJu2ueKY
 1slw==
X-Gm-Message-State: AOAM531BPcJ/obczWdQEg3VpW1+vBOaAXe8E6Af8Lyt/oyS4aRUPWn4y
 V1QXiatE9R2iZZ9HiZsswBDcGBGf5+x3ZbYNFWzp9qICk+DvDQ==
X-Google-Smtp-Source: ABdhPJxZWmc7RlWjXHKyHc1/pQRBE7d4kzvw/flszUyaSHPoA/ZBgXqebccIhOPQVJs2UEnbP0mla1KT6F13dXhlPBw=
X-Received: by 2002:a02:6a0e:: with SMTP id l14mr41012664jac.58.1608067242717; 
 Tue, 15 Dec 2020 13:20:42 -0800 (PST)
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
In-Reply-To: <20201215174621.0a9d1c3f@xps13>
From: David Schaefer <david.tillmann.schaefer@gmail.com>
Date: Tue, 15 Dec 2020 22:20:31 +0100
Message-ID: <CAK+FTGhaXiS-jYbqYD1b-hAG7M4qbbQGQVGnSYeE6CqMOw4fLA@mail.gmail.com>
Subject: Re: WD MyCloud Ex, Armada-370, pxa3xx-nand, marvell-nfc
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201215_162047_107658_B6C02F90 
X-CRM114-Status: GOOD (  18.78  )
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

SGkgTWlxdcOobAoKPiBNYXliZSBJIHNob3VsZCBhc2sgeW91IHdoeSB5b3UgYXJlIHVzaW5nIG10
ZGJsb2NrIGFuZCB1c2luZyBkZCBvbiB0b3AKPiBvZiBpdD8gSWYgeW91IHdhbnQgdG8gdGFja2xl
IGEgTkFORCBpc3N1ZSwgeW91IHNob3VsZCBwcm9iYWJseSAgYWRkcmVzcwo+IHRoZSBtdGQgZGV2
aWNlIGRpcmVjdGx5IGFuZCB1c2UgdGhlIHRvb2xzIHByb3ZpZGVkIGJ5IHRoZSBtdGQtdXRpbHMK
PiB1c2Vyc3BhY2UgdGVzdCBzdWl0ZSAobmFuZHBhZ2V0ZXN0IHNlZW1zIGEgZ29vZCBmaXQpLgpX
aGF0IEkgYW0gdHJ5aW5nIHRvIGFjY29tcGxpc2ggaXMgcnVubmluZyBhIGRlYmlhbiB3aXRoIGEg
a2VybmVsIG1vcmUKdGhhbiA0LjE1IG9uIGEgV0QgTXlDbG91ZCBFeDIuIEkgZm9sbG93IGEgd3Jp
dHRlbiBkb3duIGFwcHJvYWNoIHRoYXQKaGFzIGJlZW4gbGVkIHRvIHN1Y2Nlc3MgYnkgb3RoZXJz
LiBJdCBpbnZvbHZlcwpkZCBpZj0vZGV2L3plcm8gb2Y9L2Rldi9tdGRibG9jazEKZGQgaWY9dUlt
YWdlIG9mPS9kZXYvbXRkYmxvY2sxCmRkIGlmPS9kZXYvemVybyBvZj0vZGV2L210ZGJsb2NrMgpk
ZCBpZj11UmFtZGlzayBvZj0vZGV2L210ZGJsb2NrMgoKSSBjb3VsZCB1c2UgbW9yZSBhcHByb3By
aWF0ZSB3YXlzIHRvIGRlYWwgd2l0aCB0aGVzZSBkZXZpY2VzIGlmIEkga25ldyBvZiBhbnkuCgo+
IFlvdSBtaWdodCB3YW50IHRvIHRyeSBhIG11Y2ggbW9yZSByZWNlbnQga2VybmVsIHRoZW4uIFBy
b2JhYmx5IHRoYXQKPiB1c2luZyBhIDUuOSBvciA1LjEwIGlzIGEgZ29vZCB0YXJnZXQgZm9yIG5v
dy4KSSBhbSBjb21waWxpbmcgNS4xMCByaWdodCBub3cgYW5kIGFtIGxvb2tpbmcgZm9yd2FyZCB0
byB0aGUgcmVzdWx0cy4gSQpoYXZlIGhhZCA1LjQgcnVubmluZyBhbHJlYWR5IHdpdGggbm8gbXRk
YmxvY2sgZGV2aWNlcyBzaG93aW5nIHVwLgoKPiBJIHJlYWxseSBkb24ndCB0aGluayB1c2luZyAt
WCB0aGVpcnMgYmxpbmRseSBpcyB3aXNlLCB5b3Ugc2hvdWxkCj4gZGVmaW5pdGVseSB0cnkgdG8g
dW5kZXJzdGFuZCB0aGUgY29uZmxpY3QgYW5kIG1lcmdlIGl0IGJ5IGhhbmQuCkkgdHJpZWQgYnV0
IGRpZG4ndCBmZWVsIHRvIGJlIGluIHRoZSBwb3NpdGlvbiB0byBtYWtlIHRoZSBjYWxsLgpBbnlo
b3csIHNpbmNlIEkgaGF2ZSBzZWVuIHRoZSBjb21taXRzIGFyZSBhbGwgcGFydCBvZiBrZXJuZWxz
IDQuMTcsCjQuMjAsIDUuMCwgYW5kIDUuMTAgdGhpcyB3aWxsIG5vdCBiZSBhbiBpc3N1ZSBub3cg
d2hlbiBJIHJ1biA1LjEwLgoKPiA+IC0gbWFydmVsbC1uZmMgZjEwZDAwMDAubmFuZDogVGltZW91
dCB3YWl0aW5nIGZvciBSQiBzaWduYWwKPiBUaGlzIG9uZSBpcyBhIHJlYWwgZXJyb3IgYnV0IGdv
dCBmaXhlZCBieSBhbm90aGVyIGNvbW1pdC4KPiA+IC0gcHJpbnRfcmVxX2Vycm9yOiBJL08gZXJy
b3IsIGRldiBtdGRibG9jazYsIHNlY3RvciAwCj4gPiBwcmludF9yZXFfZXJyb3I6IEkvTyBlcnJv
ciwgZGV2IG10ZGJsb2NrNiwgc2VjdG9yIDAKPiA+IHByaW50X3JlcV9lcnJvcjogSS9PIGVycm9y
LCBkZXYgbXRkYmxvY2s2LCBzZWN0b3IgMAo+ID4gcHJpbnRfcmVxX2Vycm9yOiBJL08gZXJyb3Is
IGRldiBtdGRibG9jazUsIHNlY3RvciAwCj4gPiBwcmludF9yZXFfZXJyb3I6IEkvTyBlcnJvciwg
ZGV2IG10ZGJsb2NrNSwgc2VjdG9yIDAKPiA+IHByaW50X3JlcV9lcnJvcjogSS9PIGVycm9yLCBk
ZXYgbXRkYmxvY2s1LCBzZWN0b3IgMAo+ID4gcHJpbnRfcmVxX2Vycm9yOiBJL08gZXJyb3IsIGRl
diBtdGRibG9jazQsIHNlY3RvciAwCj4gPiBwcmludF9yZXFfZXJyb3I6IEkvTyBlcnJvciwgZGV2
IG10ZGJsb2NrNCwgc2VjdG9yIDAKPiA+IHByaW50X3JlcV9lcnJvcjogSS9PIGVycm9yLCBkZXYg
bXRkYmxvY2s0LCBzZWN0b3IgMAo+ID4gcHJpbnRfcmVxX2Vycm9yOiBJL08gZXJyb3IsIGRldiBt
dGRibG9jazMsIHNlY3RvciAwCj4gVGhpcyBvbmUgc2VlbSByZWxhdGVkIGJ1dCBJIGRvbid0IGtu
b3cgZnJvbSB3aGVyZSBpdCBjb21lcy4KPiA+IGRkOiB3cml0aW5nICcvZGV2L210ZGJsb2NrMSc6
IElucHV0L291dHB1dCBlcnJvcgpJIHdpbGwgY2hlY2sgaWYgSSBzZWUgdGhlc2UgaXNzdWVzIHdp
dGggNS4xMCB3aGVuIGl0J3MgYnVpbHQuCgo+ID4gUGxlYXNlIGFkdmlzZSBtZSBpZiBJIGRpZAo+
ID4gYW55dGhpbmcgd3Jvbmcgb3IgeW91IG5lZWQgYW55IG1vcmUgaW5mb3JtYXRpb24uCj4gR29v
ZCBsdWNrIDopClRoYW5rcyA6KQoKS2luZCByZWdhcmRzCkRhdmlkCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
