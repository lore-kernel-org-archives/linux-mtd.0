Return-Path: <SRS0=L3KX=EL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E76BC00A89
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2020 07:00:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C07D20786
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2020 07:00:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bMTPMMyk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C07D20786
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=geIBDlMbc/G/2UEwC164RrMLyECC6TGqw8HGW4YfGDA=; b=bMTPMMyk0uBBQGU3ZHY90hU2B
	WEPIwyv2BRWo/CZuxdFil7NuT9E3FrpYfPbZ2MCCaCNwd5m7+vGW5DtXmPGgZObskKH+8axui6ZSg
	y8X7uTKXyMEZzla0lS1cIpstfjN2Nx0G1t1wVh/iHOpHcZbsKwSFTL8FXpBtIrvgzGkKKeCPmMqIa
	YBg8Z8ishhDXNbd9MBgPR8DP7EN5guWEJ499WeSpey0+1g6nayq/bYqW9LqZxgCcRwzQKIMEr5Itm
	StV+gEDkpvuecnKYvBFP3y4x79uyoGwTRs3JSc9SxYSBnLCuNQXaVuvkGKvXizXdbQGwDBx2CAYx9
	uIvm8q5zA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaZEj-0000My-66; Thu, 05 Nov 2020 06:59:09 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaZEg-0000MT-TW
 for linux-mtd@lists.infradead.org; Thu, 05 Nov 2020 06:59:08 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id E9264E000A;
 Thu,  5 Nov 2020 06:58:59 +0000 (UTC)
Date: Thu, 5 Nov 2020 07:58:58 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: YouChing Lin <ycllin@mxic.com.tw>
Subject: Re: [PATCH v2] mtd: spinand: macronix: Add support for MX35LFxGE4AD
Message-ID: <20201105075858.404bae3b@xps13>
In-Reply-To: <1604540593-9829-1-git-send-email-ycllin@mxic.com.tw>
References: <1604540593-9829-1-git-send-email-ycllin@mxic.com.tw>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_015907_091924_C0B3F1BE 
X-CRM114-Status: GOOD (  14.05  )
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
Cc: juliensu@mxic.com.tw, richard@nod.at, linux-mtd@lists.infradead.org,
 vigneshr@ti.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgWW91Q2hpbmcsCgpZb3VDaGluZyBMaW4gPHljbGxpbkBteGljLmNvbS50dz4gd3JvdGUgb24g
VGh1LCAgNSBOb3YgMjAyMCAwOTo0MzoxMworMDgwMDoKCj4gVGhlIE1hY3Jvbml4IE1YMzVMRjJH
RTRBRCAvIE1YMzVMRjRHRTRBRCBhcmUgM1YsIDJHIC8gNEdiaXQgc2VyaWFsCj4gU0xDIE5BTkQg
Zmxhc2ggZGV2aWNlICh3aXRoIG9uLWRpZSBFQ0MpLgo+IAo+IFZhbGlkYXRlZCBieSByZWFkLCBl
cmFzZSwgcmVhZCBiYWNrLCB3cml0ZSwgcmVhZCBiYWNrIGFuZCBuYW5kdGVzdAo+IG9uIFhpbGlu
eCBaeW5xIFBpY29aZWQgRlBHQSBib2FyZCB3aGljaCBpbmNsdWRlZCBNYWNyb25peCBTUEkgSG9z
dAo+IChkcml2ZXJzL3NwaS9zcGktbXhpYy5jKS4KPiAKPiB2MjogUmVtb3ZlZCB0aGUgdW5uZWNl
c3NhcnkgIi8qU1BJTkFORF9IQVNfUUVfQklUKi8iIGFzIHBlciB0aGUgY29tbWVudHMuCj4gCj4g
djE6IEFkZCBzdXBwb3J0IGZvciBNWDM1TEZ4R0U0QUQKCllvdSBjYW5ub3QgcHV0IHRoZSBjaGFu
Z2Vsb2cgaGVyZS4gRXZlcnl0aGluZyB5b3Ugd3JpdGUgYWJvdmUgdGhlIHRocmVlCmRhc2hlcyB3
aWxsIGJlIHBhcnQgb2YgdGhlIGZpbmFsIGNvbW1pdCBtZXNzYWdlIGFuZCB3ZSBkb24ndCB3YW50
IHRoaXMKdG8gYXBwZWFyLgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBZb3VDaGluZyBMaW4gPHljbGxp
bkBteGljLmNvbS50dz4KPiAtLS0KClYyOiAuLi4KdjE6IC4uLgoKc2hvdWxkIGJlIGxvY2F0ZWQg
aGVyZQoKPiAgZHJpdmVycy9tdGQvbmFuZC9zcGkvbWFjcm9uaXguYyB8IDIwICsrKysrKysrKysr
KysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL21hY3Jvbml4LmMgYi9kcml2ZXJzL210ZC9uYW5k
L3NwaS9tYWNyb25peC5jCj4gaW5kZXggOGU4MDFlNC4uMzc4NmIxYiAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL210ZC9uYW5kL3NwaS9tYWNyb25peC5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9z
cGkvbWFjcm9uaXguYwo+IEBAIC0xMTksNiArMTE5LDI2IEBAIHN0YXRpYyBpbnQgbXgzNWxmMWdl
NGFiX2VjY19nZXRfc3RhdHVzKHN0cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCwKPiAgCQkJ
CQkgICAgICAmdXBkYXRlX2NhY2hlX3ZhcmlhbnRzKSwKPiAgCQkgICAgIFNQSU5BTkRfSEFTX1FF
X0JJVCwKPiAgCQkgICAgIFNQSU5BTkRfRUNDSU5GTygmbXgzNWxmeGdlNGFiX29vYmxheW91dCwg
TlVMTCkpLAo+ICsJU1BJTkFORF9JTkZPKCJNWDM1TEYyR0U0QUQiLAo+ICsJCSAgICAgU1BJTkFO
RF9JRChTUElOQU5EX1JFQURJRF9NRVRIT0RfT1BDT0RFX0RVTU1ZLCAweDI2KSwKPiArCQkgICAg
IE5BTkRfTUVNT1JHKDEsIDIwNDgsIDY0LCA2NCwgMjA0OCwgNDAsIDEsIDEsIDEpLAo+ICsJCSAg
ICAgTkFORF9FQ0NSRVEoOCwgNTEyKSwKPiArCQkgICAgIFNQSU5BTkRfSU5GT19PUF9WQVJJQU5U
UygmcmVhZF9jYWNoZV92YXJpYW50cywKPiArCQkJCQkgICAgICAmd3JpdGVfY2FjaGVfdmFyaWFu
dHMsCj4gKwkJCQkJICAgICAgJnVwZGF0ZV9jYWNoZV92YXJpYW50cyksCj4gKwkJICAgICAwLAo+
ICsJCSAgICAgU1BJTkFORF9FQ0NJTkZPKCZteDM1bGZ4Z2U0YWJfb29ibGF5b3V0LAo+ICsJCQkJ
ICAgICBteDM1bGYxZ2U0YWJfZWNjX2dldF9zdGF0dXMpKSwKPiArCVNQSU5BTkRfSU5GTygiTVgz
NUxGNEdFNEFEIiwKPiArCQkgICAgIFNQSU5BTkRfSUQoU1BJTkFORF9SRUFESURfTUVUSE9EX09Q
Q09ERV9EVU1NWSwgMHgzNyksCj4gKwkJICAgICBOQU5EX01FTU9SRygxLCA0MDk2LCAxMjgsIDY0
LCAyMDQ4LCA0MCwgMSwgMSwgMSksCj4gKwkJICAgICBOQU5EX0VDQ1JFUSg4LCA1MTIpLAo+ICsJ
CSAgICAgU1BJTkFORF9JTkZPX09QX1ZBUklBTlRTKCZyZWFkX2NhY2hlX3ZhcmlhbnRzLAo+ICsJ
CQkJCSAgICAgICZ3cml0ZV9jYWNoZV92YXJpYW50cywKPiArCQkJCQkgICAgICAmdXBkYXRlX2Nh
Y2hlX3ZhcmlhbnRzKSwKPiArCQkgICAgIDAsCj4gKwkJICAgICBTUElOQU5EX0VDQ0lORk8oJm14
MzVsZnhnZTRhYl9vb2JsYXlvdXQsCj4gKwkJCQkgICAgIG14MzVsZjFnZTRhYl9lY2NfZ2V0X3N0
YXR1cykpLAo+ICAJU1BJTkFORF9JTkZPKCJNWDMxTEYxR0U0QkMiLAo+ICAJCSAgICAgU1BJTkFO
RF9JRChTUElOQU5EX1JFQURJRF9NRVRIT0RfT1BDT0RFX0RVTU1ZLCAweDFlKSwKPiAgCQkgICAg
IE5BTkRfTUVNT1JHKDEsIDIwNDgsIDY0LCA2NCwgMTAyNCwgMjAsIDEsIDEsIDEpLAoKVGhhbmtz
LApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
