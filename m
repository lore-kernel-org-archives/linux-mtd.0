Return-Path: <SRS0=velq=QK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BE57C169C4
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Feb 2019 14:05:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CE2B20823
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Feb 2019 14:05:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PqZA6t1B";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="u34E0pEk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CE2B20823
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M0mC9IupgOXgrJpKNSHjfV3kzgtcVxJyNx9eOg5W/qE=; b=PqZA6t1BkqQLjh
	15/tS0qzJOKed81qLXI4x/cqITo85Mo1bjMvFrUt9snBJ7S6lDsnlI2frqOPeDZKitY6ttb91xoNR
	iaCwYi6L9549MwV8j4wcRcQ9oxVg5eNDIMbxYVExxQOXoPind4CcbjPA24A4P2Ulp5bTxnsKb6i1B
	P05CEGFkbw5QipFR4igIinL3+W30HO/2giYTGoCTGSSSmH0K0B8Fqh4w5sfwbc2AB8FulmGSzijTA
	aNbNwIZK5WZaSFsQvNP9ZYGHbz4w9Jm19cJn669NKGJM6tG1vu0GYR3FP+pn6U19TH1g+RRuYd7Yg
	CAE2y3YfQQZaqBsA+ZUQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqIOU-0007qP-51; Sun, 03 Feb 2019 14:05:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqIOR-000761-C4
 for linux-mtd@lists.infradead.org; Sun, 03 Feb 2019 14:05:08 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 29C882082C;
 Sun,  3 Feb 2019 14:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1549202705;
 bh=CZB1HG99ZKUihx74HfI9K8BuEfDO2OnvC61as8LmKeE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=u34E0pEkXE3Ly4z10xciKB8c+H2wTDEQni8gVWfWAEyVkpamg3Nkax17xsptBR/nB
 Goe43A+d3+LBYeXa6x+e4tSyTGQhLRCVGuGupoQpwQdRfP/7t9cYdpKm+kwMdQuqBW
 XTmeAeK/cv0s58mX6u2wiUFHYlkDQ/ERtAidSTuw=
Date: Sun, 3 Feb 2019 15:04:53 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 0/9] Ingenic JZ4780 NAND patchset v2
Message-ID: <20190203150453.43732f7c@bbrezillon>
In-Reply-To: <1549198896.1950.0@crapouillou.net>
References: <20190202231926.2444-1-paul@crapouillou.net>
 <20190203082032.6e37c523@bbrezillon>
 <1549198896.1950.0@crapouillou.net>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190203_060507_455575_FF96BF34 
X-CRM114-Status: GOOD (  17.15  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Mathieu Malaterre <malat@debian.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gU3VuLCAwMyBGZWIgMjAxOSAxMDowMTozNiAtMDMwMApQYXVsIENlcmN1ZWlsIDxwYXVsQGNy
YXBvdWlsbG91Lm5ldD4gd3JvdGU6Cgo+IEhpLAo+IAo+IExlIGRpbS4gMyBmw6l2ci4gMjAxOSDD
oCA0OjIwLCBCb3JpcyBCcmV6aWxsb24gPGJicmV6aWxsb25Aa2VybmVsLm9yZz4gCj4gYSDDqWNy
aXQgOgo+ID4gT24gU2F0LCAgMiBGZWIgMjAxOSAyMDoxOToxNyAtMDMwMAo+ID4gUGF1bCBDZXJj
dWVpbCA8cGF1bEBjcmFwb3VpbGxvdS5uZXQ+IHdyb3RlOgo+ID4gICAKPiA+PiAgSGksCj4gPj4g
Cj4gPj4gIEFzIHJlcXVlc3RlZCBieSBCb3JpcywgSSBhZGRlZCBhIHBhdGNoIHRvIG1vdmUgYWxs
IHRoZSBJbmdlbmljIE5BTkQKPiA+PiAgZHJpdmVycyB0byB0aGVpciBvd24gZGlyZWN0b3J5Lgo+
ID4+IAo+ID4+ICBJbiB0aGlzIFYyIEkgYWRkZWQgc3VwcG9ydCBmb3IgdGhlIEpaNDc0MCBTb0Mu
IFRoZSBjb21ibyBvZiB0aGUKPiA+PiAgano0NzgwLW5lbWMsIGp6NDc4MC1uYW5kIGFuZCBqejQ3
NDAtYmNoIG5vdyBvYnNvbGV0ZSB0aGUgb2xkIGFuZCAKPiA+PiBkdXN0eQo+ID4+ICBqejQ3NDAt
bmFuZCBkcml2ZXIuICAKPiA+IAo+ID4gQW55IHBsYW4gdG8gZ2V0IHRoZSBvbGQgZHJpdmVyIHJl
bW92ZWQ/IEkgZ3Vlc3MgeW91IHdhbnQgdG8gbWlncmF0ZSAKPiA+IHRoZQo+ID4gYm9hcmRzIHRv
IERUIGZpcnN0LiAgCj4gCj4gWWVzLCB0aGF0J3MgdGhlIHBsYW4gLSBtaWdyYXRlIHRoZSBxaV9s
YjYwIGJvYXJkIGZpcnN0IHRoZW4gZHJvcCB0aGUgb2xkCj4gZHJpdmVyLgoKR29vZCwgSSBoYXRl
IGhhdmluZyAyIGRyaXZlcnMgZm9yIHRoZSBzYW1lIElQIGxpdmUgaW4gcGFyYWxsZWwgZm9yIHRv
bwpsb25nLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
