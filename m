Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED536C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Apr 2022 09:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R0Da5Q6DrZZL+eXvMUgvbvz8BeO/ATzrMMzZd6vnxPA=; b=QcuyaYyuQ5w/Z9
	PhP8+niOcp8QJLb9AEDpLlAdyZJtw6ExXA3IxaV0mjZmwX5OHX5OlRD9o86F+JBsRypf6bIH64iLc
	j+dnmlKx/jRUN20/u3N6LcKkJo5UkWw4vzg0bmxTg+XJCDJJnKR+Z0UTHw2eP4u+oyhP9P4d6o7l6
	JKuYEmj6F27i4DOnmRpyivFlUoIt4anoceCk2iGUaElgmpgcyze2CIdm7QztSeEGvTgiSiret4LZ2
	DiG8h7S2GWClO4VbnPHpmEv7cb8IhIozNPFq8G7QcC6AlbXne1gqy2O30Xd7uZ0gUWTXTYTHWES3b
	rWchmYEwbV8DbiAJciVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhpCt-00HLTs-G3; Fri, 22 Apr 2022 09:04:03 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhpCq-00HLTA-LC
 for linux-mtd@lists.infradead.org; Fri, 22 Apr 2022 09:04:02 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8409EFF810;
 Fri, 22 Apr 2022 09:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650618234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UPMVYhec2n4ijBSVDJoCRRvT2Et2BmFBB1l+ybk9DaY=;
 b=mef9eNbeX0wNdLKSUFm69ZZoEYQVbCUdr9J4swyucDyqPOwq9HiNH5AryejBtU4QREPz4G
 TMjsSjjDbdITDrK9h2LAJUSCjiSaKBKNxU77Wd5Wjx9ScaA5p0Nwz83eRoKijbUzARoGla
 MRo4NhlRHLlKPle/28ezsCQvJZwwpW3Uax31i574l2HVHBBsAjiPpXpIBWQiII1IWc73a1
 //Z93tVewqWJtnnbM4Tys7Xt9oGzId3mJL+N0VJE0R8eAG7rFjTOSDhZ0yXZcvdo81y50H
 jLXRNQC7BFtP2QtsFsm5pDu2BGFOCwGxHe2IbH5JBqGq2orQCsoafBR1FcnuWg==
Date: Fri, 22 Apr 2022 11:03:51 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?QmrDuHJu?= Mork <bjorn@mork.no>
Cc: <Tudor.Ambarus@microchip.com>, <ezequiel@vanguardiasur.com.ar>,
 <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtdblock: warn if opened on NAND
Message-ID: <20220422110351.6b5cd370@xps13>
In-Reply-To: <87wnfhmxlo.fsf@miraculix.mork.no>
References: <20220328161108.87757-1-bjorn@mork.no>
 <c98f728f-2fef-6174-714e-0d31ebe4c43c@microchip.com>
 <877d7io0a1.fsf@miraculix.mork.no>
 <d5c1a7f9-5ae3-4c89-9dd8-939ef4e08c72@microchip.com>
 <87wnfhmxlo.fsf@miraculix.mork.no>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_020400_883987_E46547A7 
X-CRM114-Status: GOOD (  14.18  )
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

SGkgZm9sa3MsCgpiam9ybkBtb3JrLm5vIHdyb3RlIG9uIEZyaSwgMjIgQXByIDIwMjIgMDg6Mzg6
MjcgKzAyMDA6Cgo+IDxUdWRvci5BbWJhcnVzQG1pY3JvY2hpcC5jb20+IHdyaXRlczoKPiAKPiA+
PiBDb21taXQgZTA3NDAzYThjNmJlIGlzIGJhc2VkIG9uIHR3byBmYWxzZSBhc3N1bXB0aW9uczoK
PiA+PiAxKSB0aGUgcHJlc2VuY2Ugb2YgdGhlIG10ZGJsb2NrIGRyaXZlciBpcyBhIHByb2JsZW0g
IAo+ID4KPiA+IEl0IGlzIGEgcHJvYmxlbS4gVXNpbmcgaXQgd2lsbCB3ZWFyIG91dCBwYXJ0cyBv
ZiB5b3VyIHJhdyBmbGFzaCByZWxhdGl2ZWx5Cj4gPiBmYXN0LiAgCj4gCj4gVGhlcmUgaXMgYSBz
aWduaWZpY2FudCBkaWZmZXJlbmNlIGJldHdlZW4gUFJFU0VOQ0UgYW5kIFVTSU5HLgo+IAo+IEkn
bGwganVzdCBzdG9wIHRoaXMgbm93LiBZb3UncmUgbm90IGFyZ3Vpbmcgd2l0aCBtZSBidXQgd29p
dGggc29tZQo+IHN0cmF3IG1hbiB5b3UgY3JlYXRlZC4KClJpZ2h0IG5vdyB0aGVyZSBpcyBhIG1l
c3NhZ2UgZm9yIF9ldmVyeV8gbXRkIGRldmljZSB0aGF0IGdldHMgY3JlYXRlZApvbmx5IGlmIG10
ZGJsb2NrIHN1cHBvcnQgaXMgYnVpbHQtaW4uIE9mIGNvdXJzZSBlbmFibGluZyBtdGRibG9jayBp
Zgp5b3UgZG9uJ3QgdXNlIGl0IGlzIGEgd2FzdGUgb2Ygc3BhY2UsIGJ1dCBpdCBpcyBmYXIgbGVz
cyBhbiBpc3N1ZSB0aGFuCnBlb3BsZSBhY3R1YWxseSB1c2luZyBpdCBhbmQgSSB0aGluayB0aGF0
IGlzIG91ciBtYWluIHRhcmdldC4KClRoZSB3YXJuaW5ncyBmcm9tIEV6ZXF1aWVsIHdlcmUgYSBn
b29kIGlkZWEgYnV0IHJpZ2h0IG5vdyBJIHRoaW5rIHdlCmFsbCBhZ3JlZSB0aGF0IHRoZXkgYXJl
IHRvbyBmcmVxdWVudC4gQSBzaW5nbGUgd2FybmluZyB3b3VsZCBiZSBhbgppbXByb3ZlbWVudCwg
YnV0IG90aGVyd2lzZSBhIHdhcm5pbmcgb25seSB3aGVuIC0+b3BlbigpIGdldHMgY2FsbGVkCnNl
ZW1zIGEgZ29vZCBlbm91Z2ggc3RlcCBmb3J3YXJkIGZvciBtZS4KClRoYW5rcywKTWlxdcOobAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
