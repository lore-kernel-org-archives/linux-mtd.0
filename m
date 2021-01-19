Return-Path: <SRS0=wdd2=GW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F21BC433DB
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Jan 2021 15:52:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4BBB20780
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Jan 2021 15:52:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4BBB20780
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wYdD164RemF+s0MIGoO+tHqNd6rlAHMJWGab3RZ/U2s=; b=Qz5D2uwVrcA8cEB2alC6hwp2K
	hnpNgfwIjztTFPxR2nCStL9A+1zOUVQyc1p+9XKczAr5lghJGunY7czysMATURlNs497J/lMBfQh3
	2stRlBbcyzi+5QddoXHBzxdP+QcHfOTQuBSEC7mXgstdpQRw3vaYW4ER81eP1j/vbBfahsVKQumjv
	2j0+q/Yf7ttxm0uGYuf+m2awnoljW0AXbme0ERAGcJPxCtI1EYBpehMs/6oI5UwvBhnfg1ajX0jke
	1K81MB0Wxa/Qvv9iHzsfFzn5Mdm8cWsRnnWAm7hBf2uZzMIQ0LS9cwoz+y/tgVY0+t+5g0s0SAaU+
	ByoHEPovw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1tIJ-0005N0-2v; Tue, 19 Jan 2021 15:51:47 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1tIH-0005MQ-8y
 for linux-mtd@lists.infradead.org; Tue, 19 Jan 2021 15:51:46 +0000
X-Originating-IP: 86.201.233.230
Received: from xps13 (lfbn-tou-1-151-230.w86-201.abo.wanadoo.fr
 [86.201.233.230]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 265F4C0008;
 Tue, 19 Jan 2021 15:51:39 +0000 (UTC)
Date: Tue, 19 Jan 2021 16:51:38 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Richard Weinberger
 <richard@nod.at>
Subject: Re: [PATCH 3/3] mtd: parsers: ofpart: support BCM4908 fixed partitions
Message-ID: <20210119165138.4982ae46@xps13>
In-Reply-To: <20210115153901.31052-3-zajec5@gmail.com>
References: <20210115153901.31052-1-zajec5@gmail.com>
 <20210115153901.31052-3-zajec5@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210119_105145_416784_6BD142FD 
X-CRM114-Status: GOOD (  11.09  )
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
Cc: devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 =?UTF-8?B?UmFm?= =?UTF-8?B?YcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUmFmYcWCLAoKUmFmYcWCIE1pxYJlY2tpIDx6YWplYzVAZ21haWwuY29tPiB3cm90ZSBvbiBG
cmksIDE1IEphbiAyMDIxIDE2OjM5OjAxCiswMTAwOgoKPiBGcm9tOiBSYWZhxYIgTWnFgmVja2kg
PHJhZmFsQG1pbGVja2kucGw+Cj4gCj4gQkNNNDkwOCBwYXJ0aXRpb25pbmcgaXMgYmFzZWQgb24g
Zml4ZWQgbGF5b3V0IGJ1dCBhbGxvd3Mgc3BlY2lmeWluZwo+IG11bHRpcGxlIGZpcm13YXJlIHBh
cnRpdGlvbnMuIEl0IHJlcXVpcmVzIGRldGVjdGluZyB3aGljaCBmaXJtd2FyZQo+IHBhcnRpdGlv
biB3YXMgdXNlZCBmb3IgYm9vdGluZyBjdXJyZW50IGtlcm5lbC4KPiAKPiBUbyBzdXBwb3J0IHN1
Y2ggY2FzZXMgd2l0aG91dCBkdXBsaWNhdGluZyBhIGxvdCBvZiBjb2RlICh3aXRob3V0IGNvcHlp
bmcKPiBtb3N0IG9mIHRoZSBvZnBhcnQuYyBjb2RlKSBzdXBwb3J0IGZvciBwb3N0LXBhcnNpbmcg
Y2FsbGJhY2sgd2FzIGFkZGVkLgo+IAo+IEJDTTQ5MDggY2FsbGJhY2sgc2ltcGx5IHJlYWRzIG9m
ZnNldCBvZiBjdXJyZW50bHkgdXNlZCBmaXJtd2FyZQo+IHBhcnRpdGlvbiBmcm9tIHRoZSBEVC4g
Qm9vdGxvYWRlciBzcGVjaWZpZXMgaXQgdXNpbmcgdGhlICJicmNtX2JscGFybXMiCj4gcHJvcGVy
dHkuCj4gCj4gU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBs
PgoKVGhlIGFwcHJvYWNoIGxvb2tzIGZpbmUgYnkgbWUsIGxldCdzIHNlZSB3aGF0IG90aGVyIG1h
aW50YWluZXJzIHRoaW5rLgoKCkNoZWVycywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
