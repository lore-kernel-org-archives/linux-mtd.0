Return-Path: <SRS0=s0lc=QE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA054C282C8
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jan 2019 09:27:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A9BF20880
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jan 2019 09:27:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZJLz9UfC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A9BF20880
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f5Gte7TZmZSt8HmMz97Aefy+vKVzPghxseHwpHkmQow=; b=ZJLz9UfCughLja
	ptthko+Aq6oG1nXPuDX49TITsmS6+U0eXd3rpAuHb6A92cqa/I8lMZ7+Ma2JB9GESp2WAd23Yplwo
	nnMLIXLZBUjNmabWL5lLOUDUpDxllBupyHroTowFUxsvjkLLltQVo/OnQdqRye5NiciP17iqEVdwl
	fyrLrBqjOikScRaMwlS/1ezWl61tvjTLiDnF7IQzZSXqv1XL579WsseDt0+zeBa1pxfhsTkkdL+kf
	QWORcyKO37HuvQJOOd1Xaq17tXVmPFJrbmu45dhBC0Sa/Pw3j9oqc5hjaG+ItL57hX70SjQ5IeK7k
	WUFRnmbjZmzX1OmDv/ug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1go3Cv-0003Ji-7n; Mon, 28 Jan 2019 09:27:57 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1go3Cs-0003JO-1n
 for linux-mtd@lists.infradead.org; Mon, 28 Jan 2019 09:27:55 +0000
X-Originating-IP: 90.88.29.206
Received: from xps13 (aaubervilliers-681-1-87-206.w90-88.abo.wanadoo.fr
 [90.88.29.206]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id BD00F1BF206;
 Mon, 28 Jan 2019 09:27:41 +0000 (UTC)
Date: Mon, 28 Jan 2019 10:27:39 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Naga Sureshkumar Relli <nagasure@xilinx.com>
Subject: Re: [LINUX PATCH v12 3/3] mtd: rawnand: arasan: Add support for
 Arasan NAND Flash Controller
Message-ID: <20190128102720.70a52da7@xps13>
In-Reply-To: <MWHPR02MB262328DF62906C01DCDF18E5AF960@MWHPR02MB2623.namprd02.prod.outlook.com>
References: <1541739641-17789-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <20181120120244.7d2442b5@bbrezillon>
 <20181120133624.3fa4742d@xps13>
 <MWHPR02MB26238A2271B33470ABFA1023AFD40@MWHPR02MB2623.namprd02.prod.outlook.com>
 <MWHPR02MB26239C2B2A7050310BEF1E9CAFA70@MWHPR02MB2623.namprd02.prod.outlook.com>
 <20181212091135.1d0cc9a6@xps13>
 <MWHPR02MB26236CEF8A2110B20C825198AFA70@MWHPR02MB2623.namprd02.prod.outlook.com>
 <20181212100931.149b0cac@xps13>
 <MWHPR02MB2623EDA15BE59304795F3034AFA70@MWHPR02MB2623.namprd02.prod.outlook.com>
 <20181212141825.69711c57@xps13>
 <MWHPR02MB26235AE6567A06EF4C6362E6AFBC0@MWHPR02MB2623.namprd02.prod.outlook.com>
 <20181217174114.24196d17@xps13>
 <MWHPR02MB26237B932D7F3CCEE0476FE0AFBD0@MWHPR02MB2623.namprd02.prod.outlook.com>
 <20181219152647.76f77711@xps13>
 <MWHPR02MB262396FFF946A95D7821D61BAFB80@MWHPR02MB2623.namprd02.prod.outlook.com>
 <MWHPR02MB262328DF62906C01DCDF18E5AF960@MWHPR02MB2623.namprd02.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_012754_240614_598A3C2A 
X-CRM114-Status: UNSURE (   9.53  )
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
Cc: "robh@kernel.org" <robh@kernel.org>,
 "martin.lund@keep-it-simple.com" <martin.lund@keep-it-simple.com>,
 "richard@nod.at" <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "nagasuresh12@gmail.com" <nagasuresh12@gmail.com>,
 Michal Simek <michals@xilinx.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTmFnYSwKCk5hZ2EgU3VyZXNoa3VtYXIgUmVsbGkgPG5hZ2FzdXJlQHhpbGlueC5jb20+IHdy
b3RlIG9uIE1vbiwgMjggSmFuIDIwMTkKMDY6MDQ6NTMgKzAwMDA6Cgo+IEhpIEJvcmlzICYgTWlx
dWVsLAo+IAo+IENvdWxkIHlvdSBwbGVhc2UgcHJvdmlkZSB5b3VyIHRob3VnaHRzIG9uIHRoaXMg
ZHJpdmVyIHRvIHN1cHBvcnQgSFctRUNDPwo+IEFzIEkgc2FpZCBwcmV2aW91c2x5LCB0aGVyZSBp
cyBubyB3YXkgdG8gZGV0ZWN0IGVycm9ycyBiZXlvbmQgTiBiaXQuCj4gSSBhbSBvayB0byB1cGRh
dGUgdGhlIGRyaXZlciBiYXNlZCBvbiB5b3VyIGlucHV0cy4KCldlIHdvbid0IHN1cHBvcnQgdGhl
IEVDQyBlbmdpbmUuIEl0IHNpbXBseSBjYW5ub3QgYmUgdXNlZCByZWxpYWJseS4KCkkgYW0gd29y
a2luZyBvbiBhIGdlbmVyaWMgRUNDIGVuZ2luZSBvYmplY3QuIEl0J3MgZ29ubmEgdGFrZSBhIGZl
dwptb250aHMgdW50aWwgaXQgZ2V0cyBtZXJnZWQgYnV0IGFmdGVyIHRoYXQgeW91IGNvdWxkIHVw
ZGF0ZSB0aGUKY29udHJvbGxlciBkcml2ZXIgdG8gZHJvcCBhbnkgRUNDLXJlbGF0ZWQgZnVuY3Rp
b24uIEFsdGhvdWdoIHRoZSBFQ0MKZW5naW5lIHBhcnQgaXMgYmxvY2tpbmcsIHJhdyBhY2Nlc3Mg
c3RpbGwgbG9vayB3cm9uZyBhbmQgdGhlIGRyaXZlcgpzdGlsbCBuZWVkcyBjaGFuZ2VzLgoKClRo
YW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
