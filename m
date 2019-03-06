Return-Path: <SRS0=kH4D=RJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAC3CC43381
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Mar 2019 10:08:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AF60206DD
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Mar 2019 10:08:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SgNjr70C";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="c4bFEKWE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AF60206DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bl7K6O7KPEjii8e8eQ1lvZ4ef7s5KhcDYw7vggMm8ZY=; b=SgNjr70CvT/hEp
	4N3BUsGebdD2BgQELeufjMR+40sdWw03BOafwC5jagf9xtriywogZw2/WIjobLkdgQTogAFC8N206
	SGWHl3SZRxChCFO0jBRKW9s10wtomM3K/MOGgoB5gAcrZHSBE9a4L3vysCGFG8KDGMAdsDSJ/Rv6m
	tBFOvOvraNTWnEGdKSJ3bjl/Lz3hbzEFfZKQwnPI/uMlIgsTcN8YlQlQKf4NH80BnLRrIZIaJ2HoM
	tT9qJ3hh+QJEX+VJ1q668edM4LQSaYeK6o5WyVQa9bsZC3K6DmSaEvEfgtoqT+AiRZV/5HK2y/mrS
	WEMgwfPEU1/QCsv5umLw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h1TTc-0004HN-Rr; Wed, 06 Mar 2019 10:08:40 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1TTC-0003LA-KI; Wed, 06 Mar 2019 10:08:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5tPoJgZHQlq5S23gqpQ+bVvTwFLRjnwfo5ikdojWIRQ=; b=c4bFEKWENYiW21Qszne2lBaH8E
 ytCnN1lQIb0m+pQcfGNMPkW3+UeQ4HMCJzTjYGR3SDxitRkxcQq9dk1W+mIHacNUNKrae1tRJTaxX
 GcFzPlCInUyTvv86MWt7V5Ee98wAw8LPYBHZZ69CHsYcuokT1U8OObaE/ogam0lglnKJfHU49g+5m
 5srRzyyOTueKmk1u5Ct3ffvI1L3cg8nro03zHks97rsdRChQ4ti1SHSLCJ2O7kHrRdhhyXkWEV563
 I+vREG8e/+ImJLe8frTZd0joilyUX1faBBSuHCFN1mVsTBr7US38tGx+KGttbAFw+H7utEZ7vlJoK
 KKSlNHIQ==;
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1TEJ-00025M-ME; Wed, 06 Mar 2019 09:52:53 +0000
X-Originating-IP: 90.88.150.179
Received: from xps13 (aaubervilliers-681-1-31-179.w90-88.abo.wanadoo.fr
 [90.88.150.179]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 6CAC51BF20A;
 Wed,  6 Mar 2019 09:52:21 +0000 (UTC)
Date: Wed, 6 Mar 2019 10:52:14 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v2 1/6] mtd: nand: omap: Fix comment in platform data
 using wrong Kconfig symbol
Message-ID: <20190306105214.08bcdbdd@xps13>
In-Reply-To: <2d2d62ab-e76e-7686-f4b7-720ffa7b4ab6@cogentembedded.com>
References: <20190304222226.12682-1-miquel.raynal@bootlin.com>
 <20190304222226.12682-2-miquel.raynal@bootlin.com>
 <2d2d62ab-e76e-7686-f4b7-720ffa7b4ab6@cogentembedded.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190306_095251_780590_E5EAE477 
X-CRM114-Status: GOOD (  10.13  )
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
Cc: Mason Yang <masonccyang@mxic.com.tw>, Vignesh R <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Julien Su <juliensu@mxic.com.tw>,
 Richard Weinberger <richard@nod.at>, Boris Brezillon <bbrezillon@kernel.org>,
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgU2VyZ2VpLAoKU2VyZ2VpIFNodHlseW92IDxzZXJnZWkuc2h0eWx5b3ZAY29nZW50ZW1iZWRk
ZWQuY29tPiB3cm90ZSBvbiBUdWUsIDUKTWFyIDIwMTkgMTE6MjI6MTkgKzAzMDA6Cgo+IEhlbGxv
IQo+IAo+IE9uIDA1LjAzLjIwMTkgMToyMiwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiAKPiA+IFRo
ZSBzeW1ib2wgdGhhdCBpcyBiZWluZyB1c2VkIGluIHRoZSAjaWYvI2VuZGlmIGJsb2MgaXMgbm90
IHRoZSBvbmUgIAo+IAo+ICAgICBCbG9jaz8KClJpZ2h0IQoKVGhhbmtzIGZvciByZXBvcnRpbmcg
dGhlIHR5cG8gSSB3aWxsIGNvcnJlY3QgaXQuCgpNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
