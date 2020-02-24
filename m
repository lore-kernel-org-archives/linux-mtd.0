Return-Path: <SRS0=aChT=4M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_RHS_DOB,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EB8FC3567B
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Feb 2020 08:46:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 528AF2080D
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Feb 2020 08:46:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EemkBJVO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 528AF2080D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+GTfAyt/WAw30XyDXxLxqxJGd92kMUkXc3tl2Va816s=; b=EemkBJVOEMjHRK
	lAOKCrdZ8q8DEl5YalXICu09OHXU998Dk1AFsmvolSzF/X/F6GKs09FBQ/g8ZobiGV082J2/dRWyU
	eo/zMt6NvTOzUzsJtCEr3wXkJq03ilOC//t1F5uVuf+3xWbkeg3Hz1cxMT2FKcJ/Q/ook4pNaeIm/
	00FkmcquD6wTqMgALlJn5FIQAiZrfrk48BMIeORCqt9mAzRqCW9T3dIwNIOmNAXFi4SMEUjTx3if5
	sScImhkgJDnSH3NsADR5mO76O3TcAupHgVdsWrK8fscjkbujw035PRJKsNVMFmWKrJt/OHnpMU+Ux
	v7uzSeKq25bIY1XXDJjw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j69NN-0003OA-1a; Mon, 24 Feb 2020 08:46:05 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j69NC-0003Ds-Su; Mon, 24 Feb 2020 08:45:56 +0000
X-Originating-IP: 86.201.231.92
Received: from xps13 (lfbn-tou-1-149-92.w86-201.abo.wanadoo.fr [86.201.231.92])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id B8DBF60015;
 Mon, 24 Feb 2020 08:45:44 +0000 (UTC)
Date: Mon, 24 Feb 2020 09:45:44 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH] docs: dt: fix several broken doc references
Message-ID: <20200224094544.63f10b7c@xps13>
In-Reply-To: <0e530494349b37eb2eab4a8eccf56626e0b18e6d.1582448388.git.mchehab+huawei@kernel.org>
References: <0e530494349b37eb2eab4a8eccf56626e0b18e6d.1582448388.git.mchehab+huawei@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200224_004555_070133_3A1BFFA2 
X-CRM114-Status: UNSURE (   9.41  )
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
Cc: alsa-devel@alsa-project.org, Olivier Moysan <olivier.moysan@st.com>,
 =?UTF-8?B?SsOpcsO0bWU=?= Pouiller <jerome.pouiller@silabs.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-mtd@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 Vignesh Raghavendra <vigneshr@ti.com>, devel@driverdev.osuosl.org,
 Jonathan Corbet <corbet@lwn.net>, Richard Weinberger <richard@nod.at>,
 Piotr Sroka <piotrs@cadence.com>, devicetree@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-spi@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWF1cm8sCgpNYXVybyBDYXJ2YWxobyBDaGVoYWIgPG1jaGVoYWIraHVhd2VpQGtlcm5lbC5v
cmc+IHdyb3RlIG9uIFN1biwgMjMgRmViCjIwMjAgMDk6NTk6NTMgKzAxMDA6Cgo+IFRoZXJlIGFy
ZSBzZXZlcmFsIERUIGRvYyByZWZlcmVuY2VzIHRoYXQgcmVxdWlyZSBtYW51YWwgZml4ZXMuCj4g
SSBmb3VuZCAzIGNhc2VzIGZpeGVkIG9uIHRoaXMgcGF0Y2g6Cj4gCj4gCS0gZGlyZWN0b3J5IG5h
bWVkICJiaW5kaW5nLyIgaW5zdGVhZCBvZiAiYmluZGluZ3MvIjsKPiAJLSAudHh0IHRvIC55YW1s
IHJlbmFtZXM7Cj4gCS0gZmlsZSByZW5hbWVzIChzdGlsbCBvbiB0eHQgZm9ybWF0KTsKPiAKPiBT
aWduZWQtb2ZmLWJ5OiBNYXVybyBDYXJ2YWxobyBDaGVoYWIgPG1jaGVoYWIraHVhd2VpQGtlcm5l
bC5vcmc+Cj4gLS0tCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9jYWRlbmNlLW5hbmQt
Y29udHJvbGxlci50eHQgICAgICAgfCAyICstCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL25l
dC9icmNtLGJjbTc0NDUtc3dpdGNoLXY0LjAudHh0ICAgICAgfCAyICstCj4gIERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9zdCxzdG0zMi1zYWkudHh0ICAgICAgfCAyICst
Cj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9zdCxzdG0zMi1zcGRp
ZnJ4LnR4dCAgfCAyICstCj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkv
c3Qsc3RtMzItc3BpLnlhbWwgICAgICAgfCAyICstCj4gIE1BSU5UQUlORVJTICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCA0ICsrLS0KPiAgLi4uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbmV0L3dpcmVsZXNzL3NpbGlhYnMsd2Z4LnR4dCAgICAgICAgICB8
IDIgKy0KPiAgNyBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0p
CgpGb3IgdGhlIENhZGVuY2UgZmlsZSwKClJldmlld2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1
ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
