Return-Path: <SRS0=bx7I=26=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20AB3C282DD
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 15:54:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE700206ED
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 15:54:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a9naj/vJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE700206ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ee/eMW2N7ysvAY3det9SjSZHq9M09mENFrhMvzPkWOo=; b=a9naj/vJUKZ9B4
	NNTQlTC6CIn2wVjMN0X04Ubqabgp8MoEsMGXVuv01D+sYH6IzswamYwsR8oK2YyfB56YelqQ5q68W
	Lt4DnA7KWLUTno6MopNmokC3XD75z44WIAOuCp4j6A5rlvWZeJMGVXeVpQUskUs8ZxT8gTRbBrHvr
	2QHdSH3bbX2De57VYvskA+wwoqKVVug9nMJpN75RHQ8YRczcjbHZwuNNJViLRh3Z6PKzST5O1nln0
	qmwKbJvaNtm1okhJjwVqvS+NCjgN0yC4BjWaeUt8SrKANlIwEMZIrakjEHTdGMJEZtDwhUvKhJsvK
	hldUCYuLqGS4axR3q6ag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipa8J-0008GL-EY; Thu, 09 Jan 2020 15:54:03 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipa8G-0008FG-3w
 for linux-mtd@lists.infradead.org; Thu, 09 Jan 2020 15:54:01 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 62AEE200003;
 Thu,  9 Jan 2020 15:53:57 +0000 (UTC)
Date: Thu, 9 Jan 2020 16:53:56 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH] mtd: rawnand: denali: add missed pci_release_regions
Message-ID: <20200109165356.24a54351@xps13>
In-Reply-To: <CAK7LNAQsK5JD-qeBugp9mn8DgW+SYttp5AwZ_ht5KY2MhPe-Ew@mail.gmail.com>
References: <20191206075432.18412-1-hslester96@gmail.com>
 <CAK7LNAQsK5JD-qeBugp9mn8DgW+SYttp5AwZ_ht5KY2MhPe-Ew@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_075400_297371_55239987 
X-CRM114-Status: GOOD (  11.21  )
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
Cc: Richard Weinberger <richard@nod.at>, Chuhong Yuan <hslester96@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzYWhpcm8sCgpNYXNhaGlybyBZYW1hZGEgPG1hc2FoaXJveUBrZXJuZWwub3JnPiB3cm90
ZSBvbiBGcmksIDYgRGVjIDIwMTkKMTk6MzI6MDMgKzA5MDA6Cgo+IEhpLgo+IAo+IE9uIEZyaSwg
RGVjIDYsIDIwMTkgYXQgNDo1NCBQTSBDaHVob25nIFl1YW4gPGhzbGVzdGVyOTZAZ21haWwuY29t
PiB3cm90ZToKPiA+Cj4gPiBUaGUgZHJpdmVyIGZvcmdldHMgdG8gY2FsbCBwY2lfcmVsZWFzZV9y
ZWdpb25zKCkgaW4gcHJvYmUgZmFpbHVyZQo+ID4gYW5kIHJlbW92ZS4KPiA+IEFkZCB0aGUgbWlz
c2VkIGNhbGxzIHRvIGZpeCBpdC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBDaHVob25nIFl1YW4g
PGhzbGVzdGVyOTZAZ21haWwuY29tPgo+ID4gLS0tICAKPiAKPiBUaGlzIHBhdGNoIGxvb2tzIGVx
dWl2YWxlbnQgdG8gd2hhdCBJIHN1Ym1pdHRlZCwKPiB0aGVuIHdhcyByZWplY3RlZCBhIGNvdXBs
ZSBvZiB5ZWFycyBhZ28uCj4gaHR0cHM6Ly9saXN0cy5ndC5uZXQvbGludXgva2VybmVsLzI1NTc3
NDAKClRoYW5rcyBmb3IgdGhlIHJlbWluZGVyLCBvdGhlcndpc2UgSSB3b3VsZCBoYXZlIGFwcGxp
ZWQgaXQgdG9vLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
