Return-Path: <SRS0=Hg3y=43=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B91CC10F27
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2020 07:44:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED3F12467C
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2020 07:44:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fOsZBvNb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED3F12467C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2E2/zFVCVL2SARxXvP8C57B2LASM6ncpd9Z8hLjGklQ=; b=fOsZBvNb7tY8fX
	X0tYHr1S+N3G7A9mXVw83Qgp8kdwKdJXpvfhLUqaR5zQTnjCC28ug5AXItwEtTEjsxQEtT7FVfvbD
	/TJiVJLDtYEwigFtfwlaOKKvdoTQH3dL4kegVPFuSwkRDpZki7gc0BSTL24MkltS1yCn2MlHMjjNo
	xmM+aAMPX8CqlGkzhilLPSyy/s27R9C8ftVr+W4Qcoqg3L1xwKj5VhFlmsnf45XRvCNvcwLfXXP21
	0/tl/ME3cPeVWMN2V7YtRKO+9bcOJUZD6HuNK2FhnP5H+g3vCIs6ryODQbk/bWar79e750BeFisEb
	xCvbJr+eQzF7Nf1xW03g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBZYr-0002aj-HS; Tue, 10 Mar 2020 07:44:21 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBZYo-0002Q9-8X
 for linux-mtd@lists.infradead.org; Tue, 10 Mar 2020 07:44:20 +0000
X-Originating-IP: 90.89.41.158
Received: from xps13 (lfbn-tou-1-1473-158.w90-89.abo.wanadoo.fr [90.89.41.158])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 19A5660005;
 Tue, 10 Mar 2020 07:44:05 +0000 (UTC)
Date: Tue, 10 Mar 2020 08:44:05 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: masonccyang@mxic.com.tw
Subject: Re: [PATCH v3 0/4] mtd: rawnand: Add support Macronix Block
 Portection & Deep Power Down mode
Message-ID: <20200310084405.407aaf89@xps13>
In-Reply-To: <OFC31C83BB.5F8F8B14-ON48258527.000B6AF2-48258527.000DBE12@mxic.com.tw>
References: <1583220084-10890-1-git-send-email-masonccyang@mxic.com.tw>
 <20200309141403.241e773e@xps13>
 <OFC31C83BB.5F8F8B14-ON48258527.000B6AF2-48258527.000DBE12@mxic.com.tw>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200310_004418_440925_E399528B 
X-CRM114-Status: UNSURE (   9.78  )
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
Cc: vigneshr@ti.com, bbrezillon@kernel.org, juliensu@mxic.com.tw,
 richard@nod.at, s.hauer@pengutronix.de, yuehaibing@huawei.com,
 linux-kernel@vger.kernel.org, frieder.schrempf@kontron.de, rfontana@redhat.com,
 linux-mtd@lists.infradead.org, stefan@agner.ch, tglx@linutronix.de,
 allison@lohutok.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzb24sCgptYXNvbmNjeWFuZ0BteGljLmNvbS50dyB3cm90ZSBvbiBUdWUsIDEwIE1hciAy
MDIwIDEwOjMwOjA5ICswODAwOgoKPiBIaSBNaXF1ZWwsCj4gCj4gPiAKPiA+IE1hc29uIFlhbmcg
PG1hc29uY2N5YW5nQG14aWMuY29tLnR3PiB3cm90ZSBvbiBUdWUsICAzIE1hciAyMDIwIDE1OjIx
OjIwCj4gPiArMDgwMDoKPiA+ICAgCj4gPiA+IEhpLAo+ID4gPiAKPiA+ID4gQ2hhbmdlbG9nCj4g
PiA+IAo+ID4gPiB2MzoKPiA+ID4gcGF0Y2ggbmFuZF9sb2NrX2FyZWEvbmFuZF91bmxvY2tfYXJl
YS4KPiA+ID4gZml4ZWQga2J1aWR0ZXN0IHJvYm90IHdhcm5pbmdzIGFuZCByZXZpZXdlcidzIGNv
bW1lbnRzLiAgCj4gPiAKPiA+IEkga25vdyBpdCBpcyBwYWluZnVsIGZvciB0aGUgY29udHJpYnV0
b3IgYnV0IEkgcmVhbGx5IG5lZWQgbW9yZSBkZXRhaWxzCj4gPiBpbiB0aGUgY2hhbmdlbG9nLiBU
aGlzIGlzIHNvbWV0aGluZyBJIGNhcmUgYWJvdXQgYmVjYXVzZSBJIGNhbiBzcGVlZC11cCAgCj4g
Cj4gb2theSwgbW9yZSBjaGFuZ2Vsb2cgYXMKPiAKPiAxLiBQYXRjaGVkIHRoZSBLZG9jIGZvciBi
b3RoIGxvY2tfYXJlYS91bmxvY2tfYXJlYSBhbmQgX3N1c3BlbmQvX3Jlc3VtZQo+IDIuIENyZWF0
ZWQgYSBoZWxwZXIgdG8gcmVhZCBkZWZhdWx0IHByb3RlY3RlZCB2YWx1ZSAoYWZ0ZXIgZGV2aWNl
IHBvd2VyIAo+IG9uKQo+ICAgICAgICAgZm9yIHByb3RlY3Rpb24gZnVuY3Rpb24gZGV0ZWN0aW9u
Lgo+IDMuIHBhdGNoZWQgdGhlIHByZWZpeCBmb3IgTWFjcm9uaXggZGVlcCBwb3dlciBkb3duIGNv
bW1hbmQsIDB4QjkKPiA0LiBQYXRjaGVkIHRoZSBkZXNjcmlwdGlvbiBvZiBteGljX25hbmRfcmVz
dW1lKCkgYW5kIGFkZCBhIHNtYWxsIHNsZWVwaW5nIAo+IGRlbGF5Lgo+IDUuIENyZWF0ZWQgYSBo
ZWxwZXIgZm9yIGRlZXAgcG93ZXIgZG93biBkZXZpY2UgcGFydCBudW1iZXIgZGV0ZWN0aW9uLgo+
IAoKV2F5IG1vcmUgZGVzY3JpcHRpdmUhIFRoYW5rcyBhIGxvdC4KCgpDaGVlcnMsCk1pcXXDqGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
