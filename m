Return-Path: <SRS0=bx7I=26=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDE61C282DD
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 19:19:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFF4A2067D
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 19:19:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DYfiXjaD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFF4A2067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4JMLsU8khewLD1pm2BVWFIwkK8xWlZmKwJF8hzzFhos=; b=DYfiXjaDt35N+v
	zopqQdHKLX6YXqErmL9eT3cPd0fph/7GOLFZjceK8RQ7hk7p/CZ6cR6okW1KFLlmvg37nYxFxmD9B
	CeBp+a5bkcNAOm5vK/V0ikLtitM9GBBcdoO6H3lQBA1H3XheskYl+cDnXYAAxnIfxNt4vA46r5al3
	9YDjVLP75mZa/zQ6w91OjzrbA6kIirZVCpqGg+MOeh4ExlVYNPGpeBb1XMnykKsAmleLm8D09feoK
	u4L6ANyHHfBc3q+sbZKN5+aLKFE4ZncPl3DOnTUjBGNldPdBZuQLaH/lA8BNQDT6Eh3jI8i0079Zp
	b20idKyamjoJ6Edqrs5g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipdLK-0002iD-P0; Thu, 09 Jan 2020 19:19:42 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipdLI-0002h1-0v
 for linux-mtd@lists.infradead.org; Thu, 09 Jan 2020 19:19:41 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id BBD29293899;
 Thu,  9 Jan 2020 19:19:38 +0000 (GMT)
Date: Thu, 9 Jan 2020 20:19:35 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 4/8] mtd: Add support for emulated SLC mode on MLC NANDs
Message-ID: <20200109201935.3e02b05e@collabora.com>
In-Reply-To: <1885178044.17826.1578595182604.JavaMail.zimbra@nod.at>
References: <20191230165129.11925-1-miquel.raynal@bootlin.com>
 <20191230165129.11925-5-miquel.raynal@bootlin.com>
 <1518112485.16967.1578527342428.JavaMail.zimbra@nod.at>
 <20200109191612.77d987d3@xps13>
 <1885178044.17826.1578595182604.JavaMail.zimbra@nod.at>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_111940_194579_B5784DAD 
X-CRM114-Status: GOOD (  11.61  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gVGh1LCA5IEphbiAyMDIwIDE5OjM5OjQyICswMTAwIChDRVQpClJpY2hhcmQgV2VpbmJlcmdl
ciA8cmljaGFyZEBub2QuYXQ+IHdyb3RlOgoKPiBNaXF1ZWwsCj4gCj4gLS0tLS0gVXJzcHLDvG5n
bGljaGUgTWFpbCAtLS0tLQo+ID4+IEkgc3VnZ2VzdCBnaXZpbmcgYSBuYW1lIHdoaWNoIGluZGlj
YXRlcyB0aGF0IHdlIGFyZSBhY3R1YWxseSBlbXVsYXRpbmcKPiA+PiBhbiBTTEMuIE1heWJlIE1U
RF9TTENfRU1VTEFUSU9OPwo+ID4+IFNvbWUgTUxDIE5BTkRzIHN1cHBvcnQgU0xDIG1vZGUgaW4g
aGFyZHdhcmUsIE1URF9NTENfSU5fU0xDX01PREUgcmVhZHMgbGlrZQo+ID4+IHRoaXMgZmVhdHVy
ZS4gIAo+ID4gCj4gPiBZb3UncmUgcmlnaHQuIFdoYXQgYWJvdXQgTVREX1NMQ19PTl9NTENfRU1V
TEFUSU9OPyAgCj4gCj4gTWFrZXMgc2Vuc2UuCj4gICAKPiA+PiBUaGUgbmFtZSBpcyBtaXNsZWFk
aW5nLiBXZSBkb24ndCBkbyBPT0IgSU8gb24gYSBTTEMgTkFORCwKPiA+PiB3ZSBlbXVsYXRlIFNM
Qy4gIAoKV2Ugc2hvdWxkIHJlYWxseSByZXBsYWNlIHRob3NlIG10ZF9vb2JfIHByZWZpeGVzIGJ5
IHNvbWV0aGluZwptb3JlIGFjY3VyYXRlIGxpa2UgbXRkX2lvXyBhdCBzb21lIHBvaW50ICh0aG9z
ZSBoZWxwZXJzIGNhbiBkbyBtb3JlIHRoYW4KanVzdCByZWFkL3dyaXRlIHRoZSBPT0IgcmVnaW9u
KS4KCj4gPiAKPiA+IFdoYXQgd291bGQgeW91IHJlY29tbWVuZD8gbXRkX29vYl9pb19lbXVsX3Ns
Yz8gIAo+IAo+IFllcy4gTGV0J3MgdXNlICJlbXVsX3NsYyIgdG8gaW5kaWNhdGUgU0xDIGVtdWxh
dGlvbi4KCkhvdyBhYm91dCBtdGRfaW9fZW11bGF0ZWRfc2xjKCk/CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
