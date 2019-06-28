Return-Path: <SRS0=/mLJ=U3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4635AC4321A
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jun 2019 07:44:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 159BC206E0
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jun 2019 07:44:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GsY5LHJ8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 159BC206E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ev6SSJUxOP4+qNaFhQ2lGPSAmtGrftC1v3SHy9BS314=; b=GsY5LHJ8o9ckU/
	luibUxz8XVrU5mP9693Yybmm/c+l9O8J6m0h8wh5DQYe+fO6J5yEpHYjxd/RtvTJic60za4iHbaj8
	95wY42AiBbN7hA0zHJuE6z7r5wgLuhMHMKE1Of6Fcj6x4DlbPZZnl98NK0My0LWkO0Fgb0bZotHA3
	5XVmCGikJUCdW6fJ9ynZGHZvcMDKCOnJr4vYexTDq1PMK1++PJmp5zjid6PG+SjMeIhMj/DA72uSe
	PfH8zKZKF8PXDBrsD0HZ7OPmCTAyBaVu43VsdbqVO4Wt/E1V8q5t1My9LHz3rKL+jtrFvZaGpxAA6
	u8hcb07jOQbuJQiHr62Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hglYa-0002NA-Rf; Fri, 28 Jun 2019 07:44:28 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hglXC-0001J6-8n
 for linux-mtd@lists.infradead.org; Fri, 28 Jun 2019 07:43:05 +0000
X-Originating-IP: 86.250.200.211
Received: from xps13 (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 6B4AEFF803;
 Fri, 28 Jun 2019 07:42:51 +0000 (UTC)
Date: Fri, 28 Jun 2019 09:42:50 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: masonccyang@mxic.com.tw
Subject: Re: [PATCH v4 2/2] dt-bindings: mtd: Document Macronix raw NAND
 controller bindings
Message-ID: <20190628094250.1fd84505@xps13>
In-Reply-To: <OFFBD1710A.54AC467B-ON48258427.0023FCA3-48258427.00255B71@mxic.com.tw>
References: <1561443056-13766-1-git-send-email-masonccyang@mxic.com.tw>
 <1561443056-13766-3-git-send-email-masonccyang@mxic.com.tw>
 <20190627192609.0965f6d5@xps13>
 <OFFBD1710A.54AC467B-ON48258427.0023FCA3-48258427.00255B71@mxic.com.tw>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190628_004302_601754_1A87ED91 
X-CRM114-Status: GOOD (  18.14  )
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
Cc: devicetree@vger.kernel.org, christophe.kerello@st.com, vigneshr@ti.com,
 jianxin.pan@amlogic.com, bbrezillon@kernel.org, juliensu@mxic.com.tw,
 lee.jones@linaro.org, linux-kernel@vger.kernel.org, stefan@agner.ch,
 paul@crapouillou.net, marek.vasut@gmail.com, paul.burton@mips.com,
 broonie@kernel.org, linux-mtd@lists.infradead.org, richard@nod.at,
 robh+dt@kernel.org, anders.roxell@linaro.org, liang.yang@amlogic.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzb24sCgpQbGVhc2UgYWx3YXlzIENjOiBSb2IgKHJvYmgrZHRAa2VybmVsLm9yZykgd2hl
biB5b3Ugc2VuZCBiaW5kaW5ncwpyZWxhdGVkIHBhdGNoZXMuCgptYXNvbmNjeWFuZ0BteGljLmNv
bS50dyB3cm90ZSBvbiBGcmksIDI4IEp1biAyMDE5CjE0OjQ4OjAyICswODAwOgoKPiBIaSBNaXF1
ZWwsCj4gCj4gPiA+IERvY3VtZW50IHRoZSBiaW5kaW5ncyB1c2VkIGJ5IHRoZSBNYWNyb25peCBy
YXcgTkFORCBjb250cm9sbGVyLgo+ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogTWFzb24gWWFu
ZyA8bWFzb25jY3lhbmdAbXhpYy5jb20udHc+Cj4gPiA+IC0tLQo+ID4gPiAgLi4uL2RldmljZXRy
ZWUvYmluZGluZ3MvbXRkL214aWMtbmFuZC50eHQgICAgICAgICAgfCAyNiAgIAo+ICsrKysrKysr
KysrKysrKysrKysrKysKPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspCj4g
PiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgICAKPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbXRkL214aWMtbmFuZC50eHQKPiA+ID4gCj4gPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL214aWMtbmFuZC50eHQgYi8gIAo+ID4gRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9teGljLW5hbmQudHh0ICAKPiA+ID4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+ID4gaW5kZXggMDAwMDAwMC4uM2QxOThlNAo+ID4gPiAt
LS0gL2Rldi9udWxsCj4gPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9tdGQvbXhpYy1uYW5kLnR4dAo+ID4gPiBAQCAtMCwwICsxLDI2IEBACj4gPiA+ICtNYWNyb25p
eCBSYXcgTkFORCBDb250cm9sbGVyIERldmljZSBUcmVlIEJpbmRpbmdzCj4gPiA+ICstLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiA+ICsKPiA+ID4g
K1JlcXVpcmVkIHByb3BlcnRpZXM6Cj4gPiA+ICstIGNvbXBhdGlibGU6IHNob3VsZCBiZSAibXhp
YyxyYXctbmFuZC1jdGxyIiAgCj4gPiAKPiA+IEkgd291bGQgcHJlZmVyICJtYWNyb25peCxuYW5k
LWNvbnRyb2xsZXIiICAKPiAKPiBva2F5LCB3aWxsIHBhdGNoIGl0Lgo+IAo+ID4gICAKPiA+ID4g
Ky0gcmVnOiBzaG91bGQgY29udGFpbiAxIGVudHJpZSBmb3IgdGhlIHJlZ2lzdGVycyAgCj4gPiAK
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVudHJ5Cj4gPiAgIAo+ID4gPiArLSByZWct
bmFtZXM6IHNob3VsZCBjb250YWluICJyZWdzIiAgCj4gPiAKPiA+IE5vdCBzdXJlIHlvdSBuZWVk
IHRoYXQ/ICAKPiAKPiBmb3IgYSBiYXNlIGFkZHJlc3Mgb2YgY3RsciByZWdpc3RlcnMuCgpZZXMg
SSBrbm93LCBJIG1lYW46IHlvdSBkb24ndCBuZWNlc3NhcmlseSBuZWVkIHRoZSAncmVnLW5hbWVz
JyBwcm9wZXJ0eQphcyBpdCBpcyBzdXBwb3NlZCB0aGF0IHRoZSBvbmx5IGVudHJ5IHdpbGwgYmUg
dGhlIElQIHJlZ2lzdGVycyAodW5sZXNzCnRoZXJlIGFyZSBtb3JlKS4gSSBkb24ndCBrbm93IHdo
YXQncyBSb2IgcHJlZmVyZW5jZSBoZXJlIGJ1dCBJIHdvdWxkCmVpdGhlciBkcm9wIHRoZSByZWct
bmFtZXMgcHJvcGVydHkgb3IgZW5oYW5jZSB0aGUgbmFtZSwgInJlZ3MiIGlzCnRlcnJpYmx5IG5v
dCBkZXNjcmlwdGl2ZS4KCj4gPiA+ICstIGludGVycnVwdHM6IGludGVycnVwdCBsaW5lIGNvbm5l
Y3RlZCB0byB0aGlzIE5BTkQgY29udHJvbGxlcgo+ID4gPiArLSBjbG9jay1uYW1lczogc2hvdWxk
IGNvbnRhaW4gInBzX2NsayIsICJzZW5kX2NsayIgYW5kICJzZW5kX2RseV9jbGsiCj4gPiA+ICst
IGNsb2Nrczogc2hvdWxkIGNvbnRhaW4gMyBlbnRyaWVzIGZvciB0aGUgInBzX2NsayIsICJzZW5k
X2NsayIgYW5kCj4gPiA+ICsgICAgInNlbmRfZGx5X2NsayIgY2xvY2tzICAKPiA+IAo+ID4gcy9l
bnRyaWVzL3BoYW5kbGVzLyA/ICAKPiAKPiA/Cj4gYXMgSSBrbm93IHRoYXQga2VybmVsIHZpZXdz
IHRoZSBwaGFuZGxlIHZhbHVlcyBhcyBkZXZpY2UgdHJlZSBzdHJ1Y3R1cmUKPiBpbmZvcm1hdGlv
biBpbnN0ZWFkIG9mIGRldmljZSB0cmVlIGRhdGEgYW5kIHRodXMgZG9lcyBub3Qgc3RvcmUgdGhl
bSBhcwo+IHByb3BlcnRpZXMuCgpUaGUgYmluZGluZ3MgaGF2ZSBub3RoaW5nIHRvIGRvIHdpdGgg
dGhlIGtlcm5lbCB2aWV3cy4gVGhleSBtaWdodAphY3R1YWxseSBiZSBtZXJnZWQgaW4gYSBkaWZm
ZXJlbnQgcHJvamVjdCwgb3V0IG9mIHRoZSBrZXJuZWwuCgoKVGhhbmtzLApNaXF1w6hsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
