Return-Path: <SRS0=xunr=65=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11A49C433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 15 May 2020 07:34:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D428B20657
	for <linux-mtd@archiver.kernel.org>; Fri, 15 May 2020 07:34:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ax2bnKwB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D428B20657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nH9MO+jEsKsSNUMt+LT4Fnm5207nA5mp30AjfsVV8tI=; b=ax2bnKwBfvPnT/
	aRWkpdLFGDsPxilkYcRsnC6B49YlDTcFLPebFyxoXus2RrgSYLzCGfFmjlfdGG4yRkwI+EhlSku6m
	3psuYQu7gZdEnH6DCaMnyS+qd7dPGe+OqGBSoDD0LEIM5DDQs0L1IC+TKwOXptZD8pm8gkefpujUt
	UJjTs409ozd7IfRkrg5BLasuOHM8xdfRbDtwjcGHsb8EbnCeTXmg1D6JPQiDeCxbuoeF4ZxMKzobn
	vereapNM8luB2Mf72IPFScrmDvzaObBf9eHwTMDBDi1J39eovlVwLLMzlDx1nztvj4VogNw97dzeS
	EglKnT866H/l2s4KOHdw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZUqo-0007p3-3i; Fri, 15 May 2020 07:33:46 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZUqk-0007o4-1v
 for linux-mtd@lists.infradead.org; Fri, 15 May 2020 07:33:43 +0000
Received: from xps13 (126.249.23.93.rev.sfr.net [93.23.249.126])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 7CA4C100006;
 Fri, 15 May 2020 07:33:32 +0000 (UTC)
Date: Fri, 15 May 2020 09:33:30 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Poonam Aggrwal <poonam.aggrwal@nxp.com>
Subject: Re: [PATCH v7 0/6] Add new series Micron SPI NAND devices
Message-ID: <20200515093330.7e3b2911@xps13>
In-Reply-To: <VI1PR04MB70232F2A753142DE7E0D3A6986BD0@VI1PR04MB7023.eurprd04.prod.outlook.com>
References: <20200311175735.2007-1-sshivamurthy@micron.com>
 <CA+G9fYuavikY4yjc+bjnvDGHGwQRs6bf31gUa3gyFzd=0zLR7Q@mail.gmail.com>
 <VI1PR04MB70232F2A753142DE7E0D3A6986BD0@VI1PR04MB7023.eurprd04.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200515_003342_367747_6D28F3E2 
X-CRM114-Status: GOOD (  12.63  )
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
 "shiva.linuxworks@gmail.com" <shiva.linuxworks@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Ashish Kumar <ashish.kumar@nxp.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 open list <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "lkft-triage@lists.linaro.org" <lkft-triage@lists.linaro.org>,
 Suram Suram <suram@nxp.com>, Chuanhong Guo <gch981213@gmail.com>,
 Shivamurthy Shastri <sshivamurthy@micron.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUG9vbmFtLAoKUG9vbmFtIEFnZ3J3YWwgPHBvb25hbS5hZ2dyd2FsQG54cC5jb20+IHdyb3Rl
IG9uIEZyaSwgMTUgTWF5IDIwMjAKMDU6Mjk6MDcgKzAwMDA6Cgo+IEFkZGluZyBBc2hpc2guCj4g
Cj4gUmVnYXJkcwo+IFBvb25hbQo+IAo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+
IEZyb206IE5hcmVzaCBLYW1ib2p1IDxuYXJlc2gua2FtYm9qdUBsaW5hcm8ub3JnPgo+ID4gU2Vu
dDogRnJpZGF5LCBNYXkgMTUsIDIwMjAgMTA6NTcgQU0KPiA+IFRvOiBzaGl2YS5saW51eHdvcmtz
QGdtYWlsLmNvbTsgTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT47Cj4g
PiBTaGl2YW11cnRoeSBTaGFzdHJpIDxzc2hpdmFtdXJ0aHlAbWljcm9uLmNvbT4KPiA+IENjOiBS
aWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0PjsgVmlnbmVzaCBSYWdoYXZlbmRyYQo+
ID4gPHZpZ25lc2hyQHRpLmNvbT47IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNv
bGxhYm9yYS5jb20+Owo+ID4gQ2h1YW5ob25nIEd1byA8Z2NoOTgxMjEzQGdtYWlsLmNvbT47IEZy
aWVkZXIgU2NocmVtcGYKPiA+IDxmcmllZGVyLnNjaHJlbXBmQGtvbnRyb24uZGU+OyBsaW51eC1t
dGRAbGlzdHMuaW5mcmFkZWFkLm9yZzsgb3BlbiBsaXN0IDxsaW51eC0gIAo+ID4ga2VybmVsQHZn
ZXIua2VybmVsLm9yZz47IFBvb25hbSBBZ2dyd2FsIDxwb29uYW0uYWdncndhbEBueHAuY29tPjsg
IAo+ID4gU3VyYW0gU3VyYW0gPHN1cmFtQG54cC5jb20+OyBsa2Z0LXRyaWFnZUBsaXN0cy5saW5h
cm8ub3JnCj4gPiBTdWJqZWN0OiBSZTogW1BBVENIIHY3IDAvNl0gQWRkIG5ldyBzZXJpZXMgTWlj
cm9uIFNQSSBOQU5EIGRldmljZXMKPiA+IAo+ID4gT24gV2VkLCAxMSBNYXIgMjAyMCBhdCAyMzoy
OCwgPHNoaXZhLmxpbnV4d29ya3NAZ21haWwuY29tPiB3cm90ZTogIAo+ID4gPgo+ID4gPiBGcm9t
OiBTaGl2YW11cnRoeSBTaGFzdHJpIDxzc2hpdmFtdXJ0aHlAbWljcm9uLmNvbT4KPiA+ID4KPiA+
ID4gVGhpcyBwYXRjaHNldCBpcyBmb3IgdGhlIG5ldyBzZXJpZXMgb2YgTWljcm9uIFNQSSBOQU5E
IGRldmljZXMsIGFuZAo+ID4gPiB0aGUgZm9sbG93aW5nIGxpbmtzIGFyZSB0aGVpciBkYXRhc2hl
ZXRzLiAgCj4gPiAKPiA+IFdoaWxlIGJvb3QgTlhQIGxzMjA4OCBkZXZpY2Ugd2l0aCBtYWlubGlu
ZSBrZXJuZWwgdGhlIGZvbGxvd2luZyBuYW5kIHdhcm5pbmcKPiA+IG5vdGljZWQuIEhvdyBjcml0
aWNhbCB0aGlzIHdhcm5pbmcgPwoKQXJlIHlvdSBzdXJlIHRoaXMgaXMgdGhlIHJpZ2h0IHRocmVh
ZD8gU2hpdmFtdXJ0aHkgYWRkZWQgU1BJLU5BTkQKc3VwcG9ydCwgeW91IGFyZSB0YWxraW5nIGFi
b3V0IGEgcmF3IE5BTkQgZGV2aWNlLgo+ID4gCj4gPiBbICAgIDEuMzU3NzIyXSBuYW5kOiBkZXZp
Y2UgZm91bmQsIE1hbnVmYWN0dXJlciBJRDogMHgyYywgQ2hpcCBJRDogMHg0OAo+ID4gWyAgICAx
LjM2NDA4NV0gbmFuZDogTWljcm9uIE1UMjlGMTZHMDhBQkFDQVdQCj4gPiBbICAgIDEuMzY4MTgx
XSBuYW5kOiAyMDQ4IE1pQiwgU0xDLCBlcmFzZSBzaXplOiA1MTIgS2lCLCBwYWdlIHNpemU6Cj4g
PiA0MDk2LCBPT0Igc2l6ZTogMjI0Cj4gPiBbICAgIDEuMzc1OTMyXSBuYW5kOiBXQVJOSU5HOiA1
MzAwMDAwMDAuZmxhc2g6IHRoZSBFQ0MgdXNlZCBvbiB5b3VyCj4gPiBzeXN0ZW0gaXMgdG9vIHdl
YWsgY29tcGFyZWQgdG8gdGhlIG9uZSByZXF1aXJlZCBieSB0aGUgTkFORCBjaGlwCgpJZiB5b3Ug
YXJlIHRhbGtpbmcgYWJvdXQgdGhpcyBvbmUsIGl0IGlzIHByZXR0eSBzZWxmIGV4cGxhbmF0b3J5
OiB0aGUKTkFORCBjaGlwIHJlcXVpcmVzIGEgbWluaW11bSBjb3JyZWN0aW9uIHdoaWNoIGlzIG5v
dCBhY2hpZXZlZCBoZXJlLgpFaXRoZXIgYmVjYXVzZSB0aGUgRUNDIGVuZ2luZSBjYW5ub3QgcmVh
Y2ggdGhlIHJlcXVlc3RlZCBhbW91bnQgKHlvdQpjYW5ub3QgZG8gYW55dGhpbmcpIG9yIGJlY2F1
c2UgeW91IHJlcXVlc3RlZCBhIHRvbyBsb3cgY29ycmVjdGlvbiB3aXRoCkRUIHByb3BlcnRpZXMu
Cgo+ID4gCj4gPiBbICAgIDEuMzg4NzY3XSBCYWQgYmxvY2sgdGFibGUgZm91bmQgYXQgcGFnZSA1
MjQxNjAsIHZlcnNpb24gMHgwMQo+ID4gWyAgICAxLjM5NjgzM10gQmFkIGJsb2NrIHRhYmxlIGZv
dW5kIGF0IHBhZ2UgNTI0MDMyLCB2ZXJzaW9uIDB4MDEKPiA+IFsgICAgMS40MDM3ODFdIG5hbmRf
cmVhZF9iYnQ6IGJhZCBibG9jayBhdCAweDAwMDAwMmQwMDAwMAo+ID4gWyAgICAxLjQwODkyMV0g
bmFuZF9yZWFkX2JidDogYmFkIGJsb2NrIGF0IDB4MDAwMDAyZDgwMDAwCj4gPiBbICAgIDEuNDE0
NzUwXSBmc2wsaWZjLW5hbmQgNTMwMDAwMDAwLm5hbmQ6IElGQyBOQU5EIGRldmljZSBhdAo+ID4g
MHg1MzAwMDAwMDAsIGJhbmsgMgo+ID4gCj4gPiAKPiA+IEZ1bGwgdGVzdCBsb2csCj4gPiBodHRw
czovL2V1cjAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0El
MkYlMkZxYS0KPiA+IHJlcG9ydHMubGluYXJvLm9yZyUyRmxrZnQlMkZsaW51eC1tYWlubGluZS1v
ZSUyRmJ1aWxkJTJGdjUuNy1yYzUtNTUtCj4gPiBnMWFlN2VmYjM4ODU0JTJGdGVzdHJ1biUyRjE4
MjU0JTJGbG9nJmFtcDtkYXRhPTAyJTdDMDElN0Nwb29uYW0uCj4gPiBhZ2dyd2FsJTQwbnhwLmNv
bSU3QzE0NmY2MzRjODY5ZjRjNzBiYWExMDhkN2Y4OTA5ZmZiJTdDNjg2ZWExZDNiYzIKPiA+IGI0
YzZmYTkyY2Q5OWM1YzMwMTYzNSU3QzAlN0MwJTdDNjM3MjUxMTcyMzU0NjM4Mjk4JmFtcDtzZGF0
YT0lMkIKPiA+IEpocyUyRmI5MiUyQkE1Nld6WWRIZSUyQkJoWFdmams4ZmVDR0FGdiUyQlJ6RktD
OVBNJTNEJmFtcDtyZXNlCj4gPiBydmVkPTAKPiA+IAo+ID4gLSBOYXJlc2ggIAoKVGhhbmtzLApN
aXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
