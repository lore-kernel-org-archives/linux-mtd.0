Return-Path: <SRS0=O8Pa=FO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42EFFC4361B
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Dec 2020 21:25:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDB9023340
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Dec 2020 21:25:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDB9023340
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jLXWrsVm7kiZ4eipbx3kd778CLLJsepfXpQZTJZuztc=; b=mdJygq3IkvfLQ8OuepbhX84MC
	RMYE1AdMN/0OENOWziVrGha9Yf6uBxDYEc5RnH5PkR3NeFjcXPzSEI92MuLQD8M77cJYQoXQBXZpe
	xc6+w3rZFLp3TXEUHdq9Yy4bXaqYORLGJPLnw3+1ufZ4SPXfQniVBdyuo69ldD8Z31ieg//H6sHbC
	kmaSPrMO9hFVS4LBh7xhZsYp5q+ThGfT8ZznYwvNg3UPW81de6Ig5Uk35auNwsNwlbaY9kUhiAt3s
	DKQwBgLwUEXE7qG42TPZ0wBh53BE5GzjOcuIpX2UwC+lpEBPsuTtAfn8XDtw/8ETBd1LFmrP80CuP
	LSnYuNLBA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knTQl-0001UA-R8; Thu, 10 Dec 2020 21:24:55 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knTQi-0001TA-Sh
 for linux-mtd@lists.infradead.org; Thu, 10 Dec 2020 21:24:54 +0000
Received: from xps13 (lfbn-tou-1-1617-103.w109-220.abo.wanadoo.fr
 [109.220.208.103]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id B52EE240008;
 Thu, 10 Dec 2020 21:24:48 +0000 (UTC)
Date: Thu, 10 Dec 2020 22:24:47 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v3 0/4] Add support for Qcom SMEM based NAND parser
Message-ID: <20201210222447.63f5dbcf@xps13>
In-Reply-To: <20201210040942.GD6466@thinkpad>
References: <20201119071308.9292-1-manivannan.sadhasivam@linaro.org>
 <20201210040942.GD6466@thinkpad>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_162453_063291_761A49E6 
X-CRM114-Status: GOOD (  13.09  )
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
Cc: devicetree@vger.kernel.org, vigneshr@ti.com, richard@nod.at,
 linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFuaXZhbm5hbiwKCk1hbml2YW5uYW4gU2FkaGFzaXZhbSA8bWFuaXZhbm5hbi5zYWRoYXNp
dmFtQGxpbmFyby5vcmc+IHdyb3RlIG9uIFRodSwKMTAgRGVjIDIwMjAgMDk6Mzk6NDIgKzA1MzA6
Cgo+IEhpLAo+IAo+IE9uIFRodSwgTm92IDE5LCAyMDIwIGF0IDEyOjQzOjA0UE0gKzA1MzAsIE1h
bml2YW5uYW4gU2FkaGFzaXZhbSB3cm90ZToKPiA+IEhlbGxvLAo+ID4gCj4gPiBUaGlzIHNlcmll
cyBhZGRzIHN1cHBvcnQgZm9yIHBhcnNpbmcgdGhlIHBhcnRpdGlvbnMgZGVmaW5lZCBpbiBTaGFy
ZWQKPiA+IE1lbW9yeSAoU01FTSkgb2YgdGhlIFF1YWxjb21tIHBsYXRmb3JtcyBzdXBwb3J0aW5n
IE5BTkQgaW50ZXJmYWNlLgo+ID4gQ3VycmVudCBwYXJzZXIgb25seSBzdXBwb3J0cyBWMyBhbmQg
VjQgb2YgdGhlIHBhcnRpdGlvbiB0YWJsZXMuCj4gPiAKPiA+IFRoaXMgc2VyaWVzIGhhcyBiZWVu
IHRlc3RlZCBvbiBTRFg1NSBNVFAgYm9hcmQgd2hpY2ggaGFzIGFuIG9uYm9hcmQgTkFORAo+ID4g
ZGV2aWNlLgo+ID4gICAKPiAKPiBBbnkgdXBkYXRlIG9uIHRoaXMgc2VyaWVzPwoKUGF0Y2hlcyBs
Z3RtLCBJIHRoaW5rIFJvYidzIEFjayBpcyBzdGlsbCBtaXNzaW5nLCBsZXQncyB3YWl0IGZvciBo
aXMKcmV2aWV3LgoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
