Return-Path: <SRS0=RlT6=RH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54159C43381
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 18:52:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21B31206BA
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 18:52:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZcDiEjFD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21B31206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UvvwLIVfYU5apgYgfJiFx+LC0uMLYrxrtLjS44uHhWk=; b=ZcDiEjFDR7nLGD
	ut6+WFR2mw6TFLcnE3N4IRz6nPiNrFjJoLhtO4Ure8h4YwpBll10QMzTfvnNNWhamRxWprtH4yfMD
	yTPwkBik8PJNjY1Rwy21sl2Z8Um0HRje0fLS1tptv79u+o86qG0Mz86sVjY0gok+obywmeiG1rDqR
	/FIq8x5MBvmRT2Wcw1vN5oPG1eBEywGQt4gnRvlfVPmGWPGnTU6b0pr/IpfJeB7zkm7T3K4yEUIUR
	S63acjh19XNin8mbsROfhw88e//Yq+2IpIBbGdvIQomCIzqYYRWmVRdRaCy+hF7g1+C3jaEyTK0ti
	iz4LGQWSKGEhuUszYWIg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0sh3-0004Aw-Ii; Mon, 04 Mar 2019 18:52:05 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0sh0-00049P-0b
 for linux-mtd@lists.infradead.org; Mon, 04 Mar 2019 18:52:03 +0000
X-Originating-IP: 77.136.15.76
Received: from xps13 (76.15.136.77.rev.sfr.net [77.136.15.76])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id BC6AF1BF203;
 Mon,  4 Mar 2019 18:51:52 +0000 (UTC)
Date: Mon, 4 Mar 2019 19:51:49 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 1/9] dt-bindings: mtd: ingenic: Add compatible
 strings for JZ4740 and JZ4725B
Message-ID: <20190304195149.7cca9c64@xps13>
In-Reply-To: <1551723742.4932.2@crapouillou.net>
References: <20190209192305.4434-1-paul@crapouillou.net>
 <20190304104554.09be4cd4@xps13> <1551723742.4932.2@crapouillou.net>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_105202_207374_45718E7E 
X-CRM114-Status: GOOD (  14.94  )
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
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUGF1bCwKCj4gPj4gIC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
dGQvaW5nZW5pYyxqejQ3ODAtbmFuZC50eHQKPiA+PiAgKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL210ZC9pbmdlbmljLGp6NDc4MC1uYW5kLnR4dAo+ID4+ICBAQCAtNiw3
ICs2LDEwIEBAIG1lbW9yeS1jb250cm9sbGVycy9pbmdlbmljLGp6NDc4MC1uZW1jLnR4dCksIGFu
ZCA+PiB0aHVzIE5BTkQgZGV2aWNlIG5vZGVzIG11c3QKPiA+PiAgIGJlIGNoaWxkcmVuIG9mIHRo
ZSBORU1DIG5vZGUuICAKPiA+PiA+PiAgIFJlcXVpcmVkIE5BTkQgY29udHJvbGxlciBkZXZpY2Ug
cHJvcGVydGllczogIAo+ID4+ICAtLSBjb21wYXRpYmxlOiBTaG91bGQgYmUgc2V0IHRvICJpbmdl
bmljLGp6NDc4MC1uYW5kIi4KPiA+PiAgKy0gY29tcGF0aWJsZTogU2hvdWxkIGJlIG9uZSBvZjoK
PiA+PiAgKyAgKiBpbmdlbmljLGp6NDc0MC1uYW5kCj4gPj4gICsgICogaW5nZW5pYyxqejQ3MjVi
LW5hbmQKPiA+PiAgKyAgKiBpbmdlbmljLGp6NDc4MC1uYW5kICAKPiA+IAo+ID4gV291bGRuJ3Qg
Ii1uYW5kLWNvbnRyb2xsZXIiIHN1ZmZpeCBiZSBiZXR0ZXI/IE9mIGNvdXJzZSBpbiB0aGUgZHJp
dmVyCj4gPiB5b3Ugc2hvdWxkIHN0aWxsIGNoZWNrIGZvciBqejQ3ODAtbmFuZC4gIAo+IAo+IFNv
IEkgd291bGQgYmUgY29tcGF0aWJsZSB3aXRoOgo+ICogaW5nZW5pYyxqejQ3NDAtbmFuZC1jb250
cm9sbGVyCj4gKiBpbmdlbmljLGp6NDcyNWItbmFuZC1jb250cm9sbGVyCj4gKiBpbmdlbmljLGp6
NDc4MC1uYW5kCj4gPwoKRnJvbSBhIGRyaXZlciBQT1YgSSB3b3VsZCBldmVuIHByZWZlciBpbmdl
bmljLGp6NDc4MC1uYW5kLWNvbnRyb2xsZXIuIEkKZG9uJ3Qga25vdyB3aGF0J3MgYmVzdCBoZXJl
LiBNYXliZSBCb3JpcyBvciBSb2IgY2FuIGhlbHA/CgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
