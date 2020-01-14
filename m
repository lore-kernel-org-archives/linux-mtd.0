Return-Path: <SRS0=A3dn=3D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57EA8C33C9E
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2020 17:30:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27F4A2075B
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2020 17:30:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UfvNJZvK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27F4A2075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nnU1MEqmdoqbvbpoSoRDrgzzDKlMRX/tWBpb+dUfKDI=; b=UfvNJZvK9raCXM
	ryS/F7830ewgy21g3zmXGJ/TNQgT/4bb0SxDbQTBSWSmTgMlXJLdPckRcOaLFCSF14HhshQzByntz
	b98FIyA/WrVLnmTZybMdPQ7abzy2inTtDx5eCRPQiV3EsADNE4ctP4XlBVI+J8v8mAgmeFk3tEO3N
	mB9J6oGT/rr4OfJhbJO41s69A0dj0oLMzzigeflBk8Enj0oVqAP0wCkBxEbccTin9aD6k7uhbDBgY
	qIa6YggxMLwpy2KUrIU1mHi41wVngGiMahyN+IHaTFYLfqAwU4p6bDeU0E2wUo0wXh+7MoupaY1r+
	k1Xatd8eSMDk31DZmfew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irQ11-0005pN-PN; Tue, 14 Jan 2020 17:30:07 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irQ0t-0005J9-ND
 for linux-mtd@lists.infradead.org; Tue, 14 Jan 2020 17:30:01 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id B916F60005;
 Tue, 14 Jan 2020 17:29:50 +0000 (UTC)
Date: Tue, 14 Jan 2020 18:29:49 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chen Wandun <chenwandun@huawei.com>, kyungmin.park@samsung.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nand: onenand: samsung: remove variable 'tmp' set but
 not used
Message-ID: <20200114182949.5b5165b7@xps13>
In-Reply-To: <20200114170849.2229-1-miquel.raynal@bootlin.com>
References: <1574424534-141265-1-git-send-email-chenwandun@huawei.com>
 <20200114170849.2229-1-miquel.raynal@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200114_092959_905431_5FB35CF3 
X-CRM114-Status: UNSURE (   6.50  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZSBv
biBUdWUsIDE0IEphbiAyMDIwCjE4OjA4OjQ5ICswMTAwOgoKPiBPbiBGcmksIDIwMTktMTEtMjIg
YXQgMTI6MDg6NTQgVVRDLCBDaGVuIFdhbmR1biB3cm90ZToKPiA+IEZpeGVzIGdjYyAnLVd1bnVz
ZWQtYnV0LXNldC12YXJpYWJsZScgd2FybmluZzoKPiA+IGRyaXZlcnMvbXRkL25hbmQvb25lbmFu
ZC9zYW1zdW5nX210ZC5jOiBJbiBmdW5jdGlvbiBzM2Nfb25lbmFuZF9jaGVja19sb2NrX3N0YXR1
czoKPiA+IGRyaXZlcnMvbXRkL25hbmQvb25lbmFuZC9zYW1zdW5nX210ZC5jOjczMTo2OiB3YXJu
aW5nOiB2YXJpYWJsZSB0bXAgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJp
YWJsZV0KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogQ2hlbiBXYW5kdW4gPGNoZW53YW5kdW5AaHVh
d2VpLmNvbT4gIAo+IAo+IEFwcGxpZWQgdG8gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2Nt
L2xpbnV4L2tlcm5lbC9naXQvbXRkL2xpbnV4LmdpdCBuYW5kL25leHQsIHRoYW5rcy4KCkFzIGFu
IEZZSSwgdGhlIHN1YmplY3QgcHJlZml4IHNob3VsZCBoYXZlIGJlZW4gIm10ZDogb25lbmFuZDog
c2Ftc3VuZzoiLiBJCmNoYW5nZWQgaXQgYmVmb3JlIGFwcGx5aW5nLgoKClRoYW5rcywKTWlxdcOo
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
