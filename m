Return-Path: <SRS0=tJq/=TF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 745CCC004C9
	for <linux-mtd@archiver.kernel.org>; Sun,  5 May 2019 09:57:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EDE42082F
	for <linux-mtd@archiver.kernel.org>; Sun,  5 May 2019 09:57:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L04ggLyg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EDE42082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qBESaInTj6hDuUCKEtyGrW6qEi6Q/FESTKeCfJP0Pjs=; b=L04ggLygoFfwOe
	t0m1m5A2QIhiy9AKad3DsVWbYQZtYBbOwo5SZxOl6h1qvbMaQ3QCicvAWXIIc8pM7FtN14+JqnJKY
	6T9E7zRFatiNksih6KEaVB8Xhhh/0K9cviLb8IndTwpS0gBdAAxh7/QdlhfdMtZZUjRsCfT6++c/g
	ICsc7MTWRB/wfQPoIRinWxvJl/NDxyD1zJousP/QCynLEUSQgGxP/9Vty9X+39R5exbDIU8GNT+xL
	Zostcjz6JHGBZ3/BqMMh0WS3fYSRZrY6QmGsClU/cn9vVvcxRjC0+VrLGEa21YfK+5U7GeMfysOm6
	+L9lvejsQnrw+QGEmJYw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hNDtV-0001az-PK; Sun, 05 May 2019 09:57:17 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNDtS-0001a3-6O
 for linux-mtd@lists.infradead.org; Sun, 05 May 2019 09:57:16 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id BD4C9608A381;
 Sun,  5 May 2019 11:57:01 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id CNB_X3BcVDai; Sun,  5 May 2019 11:56:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 4DB46608A38A;
 Sun,  5 May 2019 11:56:59 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id PspQ58i46p0n; Sun,  5 May 2019 11:56:59 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 18DC4608A381;
 Sun,  5 May 2019 11:56:59 +0200 (CEST)
Date: Sun, 5 May 2019 11:56:59 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Message-ID: <617545110.45884.1557050219045.JavaMail.zimbra@nod.at>
In-Reply-To: <20190418191455.66b4249d@xps13>
References: <20190418191455.66b4249d@xps13>
Subject: Re: [GIT PULL] mtd: nand: Changes for 5.2
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.8_GA_3025 (ZimbraWebClient - FF60 (Linux)/8.8.8_GA_1703)
Thread-Topic: nand: Changes for 5.2
Thread-Index: XNzoWN63UZMw+YpgKSQ9Lxasr7UeuA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190505_025714_389911_8338C07F 
X-CRM114-Status: UNSURE (   7.89  )
X-CRM114-Notice: Please train this message.
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIk1pcXVlbCBSYXluYWwiIDxt
aXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+IEFuOiAiQm9yaXMgQnJlemlsbG9uIiA8Ym9yaXMu
YnJlemlsbG9uQGNvbGxhYm9yYS5jb20+Cj4gQ0M6ICJsaW51eC1tdGQiIDxsaW51eC1tdGRAbGlz
dHMuaW5mcmFkZWFkLm9yZz4sICJyaWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+LCAiTWFyZWsgVmFz
dXQiIDxtYXJlay52YXN1dEBnbWFpbC5jb20+LAo+ICJCcmlhbiBOb3JyaXMiIDxjb21wdXRlcnNm
b3JwZWFjZUBnbWFpbC5jb20+LCAiRGF2aWQgV29vZGhvdXNlIiA8ZHdtdzJAaW5mcmFkZWFkLm9y
Zz4sICJUdWRvciBBbWJhcnVzIgo+IDxUdWRvci5BbWJhcnVzQG1pY3JvY2hpcC5jb20+LCAiVmln
bmVzaCBSYWdoYXZlbmRyYSIgPHZpZ25lc2hyQHRpLmNvbT4sICJTY2hyZW1wZiBGcmllZGVyIgo+
IDxmcmllZGVyLnNjaHJlbXBmQGtvbnRyb24uZGU+Cj4gR2VzZW5kZXQ6IERvbm5lcnN0YWcsIDE4
LiBBcHJpbCAyMDE5IDE5OjE0OjU1Cj4gQmV0cmVmZjogW0dJVCBQVUxMXSBtdGQ6IG5hbmQ6IENo
YW5nZXMgZm9yIDUuMgoKPiBIZWxsbywKPiAKPiBUaGlzIGlzIHRoZSBOQU5EIFBSIGZvciA1LjIu
Cj4gCj4gVGhhbmtzLAo+IE1pcXXDqGwKPiAKPiAKPiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2lu
Y2UgY29tbWl0IDllOThjNjc4YzJkNmFlM2ExN2NiMmRlNTVkMTdmNjlkZGRhYTIzMWI6Cj4gCj4g
IExpbnV4IDUuMS1yYzEgKDIwMTktMDMtMTcgMTQ6MjI6MjYgLTA3MDApCj4gCj4gYXJlIGF2YWls
YWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6Cj4gCj4gIHNzaDovL2dpdEBnaXRvbGl0ZS5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9tdGQvbGludXguZ2l0Cj4gIHRhZ3Mv
bmFuZC9mb3ItNS4yCj4gCj4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDFjMTRmZTIx
NjdlZjQyOTRiNDE5NDliY2MzNzJlYTM5YzA1MTBjMDA6CgpQdWxsZWQuCgpUaGFua3MsCi8vcmlj
aGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
