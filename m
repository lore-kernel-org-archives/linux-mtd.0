Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE889CA5FAE
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2026 08:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ixWIOOOcWOcUhZa7RfRtBhEkYCK2/mtg/wUqt5oU3vw=; b=OI9I5RkZQikI9B
	1IHpxYR5Nze44SxBbcxVzLynf/rWDInIn2ssPEC+qqTvM31w0P+QpB0H2thhuWE9vpGoBGhxq36YS
	bFVdIvzFG82nlxB3HlHWVhardOWMZqb3eTufpLPVbZ3dkF7++RbR1Yxv6aToRRABnDDx/9jDQl8W9
	YckfZ6A8og6VMoK5+kfkQIR5omwJRKIICS0vigrDhK/tWCB55v3m+3h6ik6XSPIPS2P0t13ZojHu4
	wu0gvKsyR5VSN6gBOWp3v5OeZ6pxpMr95PBleOCU06ZfGJXMFBv1bIvWk0a1xeLWMgfg2thyGvlt9
	zE3lcWep9TORQXlntzCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBT7U-00000002jI1-0Zua;
	Tue, 29 Sep 2026 08:23:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBT7T-00000002jHk-2MtY
	for linux-mtd@bombadil.infradead.org;
	Tue, 29 Sep 2026 08:23:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=BZho5NU2J1k/6TkVIQ7kSNkpmYeTDm7thl3IqkMW6R4=; b=jSF4sbvyJRrpAVgnOmOtT8d1Ex
	4LLp0skprIHkqZkoWPtps98xVSnmPxta1FQzBBdIHGMSoagCd7XvXiMWUuWSTOQASEFheausKgc1s
	AW/NNjvV8a7/Iy0RJFn73gjse/Pq4zEWK5yHJEoGF6pDEqMc7cZx/AKXpcqxO3Ou1cJnUQ/5W/hZs
	qy7J9UjZu4fi3eOiJal1bMIvfyi0A3CYQqNkpst0P6dXHegQa0Y5JwSGYc3XkdDSD/+s4IXvMvcyf
	DLN449L6pQqgbUVtrtndUBbRMxlpZzH5OA1ZYmFPKRAI+1LHWokTokn0dxfOwO1fW/7qz3awDIUox
	x4xH40iw==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBT7O-00000002LRn-1KdK
	for linux-mtd@lists.infradead.org;
	Tue, 29 Sep 2026 08:23:21 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7CA6D4E40755;
	Tue, 29 Sep 2026 08:23:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 430D0601BD;
	Tue, 29 Sep 2026 08:23:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CB555103297A6;
	Tue, 29 Sep 2026 10:23:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790670194; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BZho5NU2J1k/6TkVIQ7kSNkpmYeTDm7thl3IqkMW6R4=;
	b=2agg/1bAAnLOjBulIJEP+QXGD+D9LPaNS3t8wqnOKJ/XDLim/A5G+6ux4a+Mj2aygjkwAw
	4TtKXZJh+jN3sx0z0MgTHuOm8cc8/Fps1ye3uu97kJM1AMyjB0r4xCKdjXZHwlWmE+1Fjd
	AkBvge2Okp+fbkE09tuZJsFewDeoC5jTUAvadEfGUwO55FpmDwgH1hhtnCSkeHyOrnczL5
	98C11OOu2XPY3YUaQD+yOK2wYMmSQet6aGMf7tJ6cltLkraTFgajbPUZlwPPDQJPe/eE6E
	7G7diBC+lIsa5pxhrPMPL9bzOiCJ0i921wi3lmAkQmWhltQpfdo4sIFEffB+GA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: haibo.chen@oss.nxp.com
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Takahiro Kuwano <takahiro.kuwano@infineon.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  michael@walle.cc,  Haibo Chen
 <haibo.chen@nxp.com>
Subject: Re: [PATCH v2] mtd: spi-nor: clear the default RDCR opcode when
 entering Octal DTR
In-Reply-To: <20260929-spi-nor-fix-v2-1-75440cfe4e76@nxp.com> (haibo chen's
	message of "Tue, 29 Sep 2026 14:53:07 +0800")
References: <20260929-spi-nor-fix-v2-1-75440cfe4e76@nxp.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 29 Sep 2026 10:23:08 +0200
Message-ID: <87zex05uvn.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_092318_942419_B3248D16 
X-CRM114-Status: GOOD (  18.46  )
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

T24gMjkvMDkvMjAyNiBhdCAxNDo1MzowNyArMDgsIGhhaWJvLmNoZW5Ab3NzLm54cC5jb20gd3Jv
dGU6Cgo+IEZyb206IEhhaWJvIENoZW4gPGhhaWJvLmNoZW5AbnhwLmNvbT4KPgo+IFRoZSBjb3Jl
IGRlZmF1bHRzIG9wY29kZXMucmVhZF9zcjIgdG8gdGhlIGxlZ2FjeSBSRENSIG9wY29kZSAoMHgz
NSkuIEluCj4gOEQtOEQtOEQgbW9kZSB0aGUgb3Bjb2RlIGlzIGV4dGVuZGVkIHRvIHR3byBieXRl
cyBwZXIgY21kX2V4dF90eXBlLCBidXQKPiB0aGUgcmVzdWx0aW5nIGNvbW1hbmQgaXMgbm90IGEg
dmFsaWQgU1IyIHJlYWQgZm9yIHRoZXNlIGZsYXNoZXMsIHdoaWNoCj4gYWNjZXNzIHRoZWlyIHN0
YXR1cy9jb25maWcgcmVnaXN0ZXJzIHRocm91Z2ggYSB2ZW5kb3Itc3BlY2lmaWMgaW5kaXJlY3QK
PiByZWdpc3RlciBzcGFjZS4gU2luY2Ugc3BpX25vcl9jYWNoZV9zcl9sb2NrX2JpdHMoKSBub3cg
cmVhZHMgU1IyIGR1cmluZwo+IGluaXQsIGkuZS4gYWZ0ZXIgdGhlIHN3aXRjaCB0byBPY3RhbCBE
VFIsIHRoZSBleHRlbmRlZCBSRENSIGdldHMgbm8gZGF0YQo+IGJhY2sgYW5kIHRoZSByZWFkIHRp
bWVzIG91dCAob24gaS5NWCBGbGV4U1BJOiAtRVRJTUVET1VUIGFuZCBhIGNvbnRyb2xsZXIKPiBX
QVJOKCkgZHVyaW5nIHByb2JlIHdpdGggTWljcm9uIE1UMzV4VSBhbmQgTWFjcm9uaXggb2N0YWwg
cGFydHMpLgo+Cj4gQ2xlYXIgcmVhZF9zcjIgd2hlbiB0aGUgc3dpdGNoIHRvIE9jdGFsIERUUiBh
Y3R1YWxseSBzdWNjZWVkcywgc28gdGhlIFNSMgo+IHJlYWQgaXMgc2tpcHBlZCAoYSBjbGVhcmVk
IG9wY29kZSBhbHJlYWR5IG1lYW5zICJ1bnN1cHBvcnRlZCIpLiBEb2luZyBpdAo+IGluIHNwaV9u
b3Jfc2V0X29jdGFsX2R0cigpIGtleXMgb2ZmIHRoZSByZWFsIHJ1bnRpbWUgcHJvdG9jb2w6IGEg
Zmxhc2gKPiB0aGF0IGFkdmVydGlzZXMgT2N0YWwgRFRSIGJ1dCBydW5zIGluICh4KVNUUiBiZWNh
dXNlIHRoZSBob3N0IGxhY2tzCj4gc3VwcG9ydCBrZWVwcyBpdHMgdXNhYmxlIFJEQ1IuCj4KPiBB
c3Npc3RlZC1ieTogTExNCj4gRml4ZXM6IGI3YjYzNDc1OTAzYyAoIm10ZDogc3BpLW5vcjogQ3Jl
YXRlIGEgbG9jYWwgU1IgY2FjaGUiKQo+IEZpeGVzOiA2MzQ4OTAwMmQzOTcgKCJtdGQ6IHNwaS1u
b3I6IFJlZmFjdG9yIFJlYWQgU3RhdHVzL1dyaXRlIFN0YXR1cyBzdXBwb3J0IikKPiBTaWduZWQt
b2ZmLWJ5OiBIYWlibyBDaGVuIDxoYWliby5jaGVuQG54cC5jb20+Cj4gLS0tCj4gQ2hhbmdlcyBp
biB2MjoKPiAtIFJld29yayB0aGUgZml4IGZvbGxvd2luZyByZXZpZXc6IGluc3RlYWQgb2YgZ3Vh
cmRpbmcgdGhlIHJlYWQgYXQgcnVudGltZQo+ICAgaW4gc3BpX25vcl9yZWFkX3NyMigpLCBjbGVh
ciB0aGUgZGVmYXVsdCBSRENSIG9wY29kZS5yZWFkX3NyMiBvbmNlLCBhdCB0aGUKPiAgIHBvaW50
IHRoZSBzd2l0Y2ggdG8gT2N0YWwgRFRSIHN1Y2NlZWRzIChzcGlfbm9yX3NldF9vY3RhbF9kdHIo
KSkuCgpJIGRvbid0IGdldCB0aGF0IGNob2ljZS4gV2h5IHN3aXRjaGluZyB3aGVuIE9jdGFsIERU
UiBzdWNjZWVkcyBvbmx5PyBTUjIKaXMgZWl0aGVyIHN1cHBvcnRlZCBvciBub3Qgc3VwcG9ydGVk
LCBJIGRvbid0IHRoaW5rIGl0IGlzIGFueXdheQpkaWZmZXJlbnQgd2hlbiBlbnRlcmluZyBvY3Rh
bCBEVFIgbW9kZSwgaXMgaXQ/IFNvIEkgd291bGQgZXhwZWN0IFNSMiB0bwpiZSBjbGVhcmVkIGVh
cmxpZXIgdGhhbiB0aGF0LCBvbmNlIHdlIGtub3cgdGhlIGNoaXAgaXMgb2N0YWwgRFRSCmNhcGFi
bGUuIEFuZCB0aGlzIG11c3QgYmUgZWFybHkgZW5vdWdoIHNvIHRoYXQgbWFudWZhY3R1cmVyIGRy
aXZlcnMgY2FuCnN0aWxsIHNldCB0aGVpciBvd24gdmFsdWUuCgpJIGFtIHdvbmRlcmluZyB3aGV0
aGVyIHdlIHNob3VsZCBzaW1wbHkgZHJvcCBzcjIgb3Bjb2RlIGluIHRoZSBRRVIgU0ZEUApwYXJz
aW5nIGVudGlyZWx5IGZvciBvY3RhbCBEVFIgZGV2aWNlcyAoTWljaGFlbD8pLgoKCj4gLSBLZXkg
dGhlIGNsZWFyIG9mZiB0aGUgcmVhbCBydW50aW1lIHByb3RvY29sIHNvIGEgZmxhc2ggdGhhdCBh
ZHZlcnRpc2VzCj4gICBPY3RhbCBEVFIgYnV0IHJ1bnMgaW4gKHgpU1RSIChob3N0IHdpdGhvdXQg
OEQgc3VwcG9ydCkga2VlcHMgaXRzCj4gICBSRENSLgoKQXJlIHlvdSBzdXJlIHRoaXMgaXMgYSB2
YWxpZCBjYXNlPwoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
