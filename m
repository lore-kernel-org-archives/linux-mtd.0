Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1732C3DA42
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Jul 2024 08:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PqHaV/ag547loMsjHBIVCJUZxNYWixjrIEuHJAT8E6k=; b=Nxd8BvK3l+7Hzn
	3jDTRZOyfZRpA1ZX8ltwB+DmC/jxhie2lgs/lE4y+e3TAjvjWUmwR4fixBOn8uj1gda6QDVAoEMfM
	wYyOUrltLG5qwMnSoIJmxg9SjWry38McCu765aa72MAYN90U9nAmVRqITTJGs3cv5BY9twBi+jEzv
	sN91j2FF9K5BnWyjD7WfHPa+p3+PAiBTWTlLuLCoE5GFBH04vd+fs7iR9k9q+8uF1rpf23Noqc16i
	oVD2+ajRQL/rOJ/w87mlHFk8WQhFv0Z0AM7BmlTZj0n1daSahG6C0DExpdGzVKu7Lxgj4sBrb8nsv
	HxeoFzqWPyGiMTdUl9WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTzjH-0000000D4ug-1iml;
	Wed, 17 Jul 2024 08:09:39 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTzi2-0000000D4jh-1huI
	for linux-mtd@lists.infradead.org;
	Wed, 17 Jul 2024 08:09:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B0944C0007;
	Wed, 17 Jul 2024 08:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1721203699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MqXRoyu++yzlzJmUG9Y7pYwOlmDuCpEVeJ5eSmjL0cI=;
	b=Y7sa5tEz850gZM1XOiEWwVa4KTa3gRride+NaPYEpMFUeBfpNcFgkKmTordoF++xizsgoe
	EdeijD+RhjKkaNoE8e2k6QqlbQedMDKd/RWtgICfuLkZVFVumJwbwVHs+VOTIaloVTdBhy
	7gPK+ll4b08sjJiOK/iStXozbbk4mzf3PUwY4ZiFjKilbvT3hLVscKz1OnphJRI6cSh3Ml
	Qb7aWIGgSOHXzL/nkEFCHkb6XvfaGSW+QaFUjeN+AkcucLKXB8DRH2qXFm2u4nPo6mddmO
	YGbtVAFzzF+FR5d0SjBY39GzoASlALDBbVabB9JSuy9N9nXWV3IpX1LXcuAJzg==
Date: Wed, 17 Jul 2024 10:08:15 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, richard@nod.at, alvinzhou@mxic.com.tw,
 leoyu@mxic.com.tw, Cheng Ming Lin <chengminglin@mxic.com.tw>, kernel test
 robot <lkp@intel.com>
Subject: Re: [PATCH] mtd: spinand: macronix: Fixed warning: Function
 paramteter or member not described
Message-ID: <20240717100815.238cc0ae@xps-13>
In-Reply-To: <20240711083611.364431-1-linchengming884@gmail.com>
References: <20240711083611.364431-1-linchengming884@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_010822_614933_797BC5FF 
X-CRM114-Status: UNSURE (   8.08  )
X-CRM114-Notice: Please train this message.
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

SGkgQ2hlbmcsCgpsaW5jaGVuZ21pbmc4ODRAZ21haWwuY29tIHdyb3RlIG9uIFRodSwgMTEgSnVs
IDIwMjQgMTY6MzY6MTEgKzA4MDA6Cgo+IEZyb206IENoZW5nIE1pbmcgTGluIDxjaGVuZ21pbmds
aW5AbXhpYy5jb20udHc+Cj4gCj4gRml4ZWQgdGhlIHdhcm5pbmdzOiBGdW5jdGlvbiBwYXJhbXRl
dGVyIG9yIG1lbWJlciAneHh4JyBub3QgZGVzY3JpYmVkCj4gCj4gUmVwb3J0ZWQtYnk6IGtlcm5l
bCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgoKSSBrbm93IHRoaXMgcm9ib3QgdGVsbHMgeW91
IHRvIGNyZWF0ZSBhIHBhdGNoIGFuZCBjcmVkaXQgaXQsIGJ1dCB0aGF0J3MKbm90IGhvdyBpdCBp
cyBzdXBwb3NlZCB0byB3b3JrLiBPbmx5IGRvIHRoYXQgaWYgeW91ciBwYXRjaCBoYXMgYWxyZWFk
eQpiZWVuIGFjY2VwdGVkLiBIZXJlIGluIHRoaXMgY2FzZSB5b3UgbmVlZCB0byBzZW5kIGEgdjIu
Cgo+IENsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb2Uta2J1aWxkLWFsbC8yMDI0MDcx
MTA1MjAucGJQbnJPbE0tbGtwQGludGVsLmNvbS8KPiBTaWduZWQtb2ZmLWJ5OiBDaGVuZyBNaW5n
IExpbiA8Y2hlbmdtaW5nbGluQG14aWMuY29tLnR3PgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
