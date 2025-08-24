Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA25CA0EEB
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Aug 2025 16:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mZxXVeEQrs9yTBTe4mQuXZaUXPnMcS01XbLgYwWX1Wg=; b=vVR6uKGaznBMMf
	ebG4QLI1FEtNQFcnqQmGlbzchyQ25NXg81hDJ6VnOHMqv5szKEcQxNnD0KgwGjTdHlprOD0r9oREQ
	7ziFQuu6EdcPYMKzWGq0fprp0nvnwZA3pOp2Bzdch21j5RdV0pYqhPGPb+J2z2kTmOrWrJdWI2lvh
	pv23HheWChSzyFBK2ArM0p5K46xvNsfiwqkpgAGPIJwbXC+z2QWJRNTvG46AHANfzvTKExr0E1HgA
	jC/fOv1blwJ4IC601qghXn8Rf0y8uP2yNVKqhTVJAJp/QYBnovkUZV85HgrEbrKiXKPiFMqrRBRj5
	8Y8Tl/0jZ782alAlXvlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqDiV-00000006MAh-2No7;
	Sun, 24 Aug 2025 16:37:15 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqDiS-00000006MAK-2QXe
	for linux-mtd@lists.infradead.org;
	Sun, 24 Aug 2025 16:37:14 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 76080C6B393
	for <linux-mtd@lists.infradead.org>; Sun, 24 Aug 2025 16:36:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 36330605F1;
	Sun, 24 Aug 2025 16:37:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D72F51C22C8F8;
	Sun, 24 Aug 2025 18:37:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756053429; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TOR07+op99gmkoh5m1rzWNu2UhjxorgYof+Hvu4K3U0=;
	b=wCKPFHAx7htZXHXz/fcGIsvaB2kaberm9QlWFxxhy3wx399PtyZFP4lV/9+YrZ9BxEuDr2
	WM+wkQJTvqw+ZnZj/IpEKvWZTmtdR18LT2B3OfVLRtfxcT3L25+6eufB92kB0XX52N2N8o
	OOAxX1vwb98iGvavgcEfk8uay9aHYRTdzcD373lHM7YMHXtZ+dH+Zl4SuWHMQSedKS6A5H
	dOUqxpW9W1pVoHnR8o1G9kzDmfZnmRm9sVLF4vO8l7RJ+Q4YOO+vhM7idW6xt1SOoV0UKY
	1NcBgvFPH63jKE45/ngiR5eVe8CSgor2zK+8tbmzbPqXMoKlQffMLj+Wp27coQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christian Eggers <ceggers@arri.de>
Cc: Richard Weinberger <richard@nod.at>,  <linux-mtd@lists.infradead.org>,
  <linux-kernel@vger.kernel.org>
Subject: Re: mtd: rawnand: Inconsistent parameter page on Foresee FSNS8A002G ?
In-Reply-To: <3542795.LZWGnKmheA@n9w6sw14> (Christian Eggers's message of
	"Mon, 18 Aug 2025 19:02:49 +0200")
References: <3542795.LZWGnKmheA@n9w6sw14>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Sun, 24 Aug 2025 18:37:06 +0200
Message-ID: <87tt1whe19.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_093712_796756_2AE64B36 
X-CRM114-Status: GOOD (  18.32  )
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

SGkgQ2hyaXN0aWFuLAoKT24gMTgvMDgvMjAyNSBhdCAxOTowMjo0OSArMDIsIENocmlzdGlhbiBF
Z2dlcnMgPGNlZ2dlcnNAYXJyaS5kZT4gd3JvdGU6Cgo+IEkgdHJ5IHRvIHVzZSBhIEZvcmVzZWUg
RlNOUzhBMDAyRyBTTEMgZmxhc2ggY2hpcCBvbiBhbiBpLk1YNiBHUE1JIGNvbnRyb2xsZXI6Cj4K
PiBodHRwczovL3d3dy5sY3NjLmNvbS9kYXRhc2hlZXQvQzUxMjY4MzUucGRmCj4KPiBUaGUga2Vy
bmVsIG91dHB1dCBsb29rcyBwcm9taXNpbmcsIGJ1dCBvbmUgbGluZSBsb29rcyBzdXNwaWNpb3Vz
Ogo+Cj4gLi4uCj4gbmFuZDogZGV2aWNlIGZvdW5kLCBNYW51ZmFjdHVyZXIgSUQ6IDB4Y2QsIENo
aXAgSUQ6IDB4ZGEKPiBuYW5kOiBGb3Jlc2VlIEZTTlM4QTAwMkcKPiBuYW5kOiAyNTYgTWlCLCBT
TEMsIGVyYXNlIHNpemU6IDEyOCBLaUIsIHBhZ2Ugc2l6ZTogMjA0OCwgT09CIHNpemU6IDY0Cj4g
bmFuZDogU0RSIHRpbWluZyBtb2RlIDQgbm90IGFja25vd2xlZGdlZCBieSB0aGUgTkFORCBjaGlw
Cj4gXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5e
Xl5eCj4gQmFkIGJsb2NrIHRhYmxlIGZvdW5kIGF0IHBhZ2UgMTMxMDA4LCB2ZXJzaW9uIDB4MDEK
PiBCYWQgYmxvY2sgdGFibGUgZm91bmQgYXQgcGFnZSAxMzA5NDQsIHZlcnNpb24gMHgwMQo+IDMg
Zml4ZWQtcGFydGl0aW9ucyBwYXJ0aXRpb25zIGZvdW5kIG9uIE1URCBkZXZpY2UgZ3BtaS1uYW5k
Cj4gLi4uCj4KPiBBY2NvcmRpbmcgdG8gdGhlIGRvY3VtZW50YXRpb24gb2YgIlJlYWQgUGFyYW1l
dGVyIFBhZ2UiLCBieXRlIDEyOS0xMzAsIAo+IFNEUiBtb2RlcyAwIHRvIDUgc2hvdWxkIGJlIHN1
cHBvcnRlZCAocGFnZSAxOSBvbiB0aGUgZGF0YSBzaGVldCkuCj4gQnV0IHRoZSBkb2N1bWVudGF0
aW9uIG9mIHRoZSBHRVRfRkVBVFVSRS9TRVRfRkVBVFVSRSBvcGVyYXRpb24gbWlzc2VzCj4gdGhl
ICJUaW1pbmcgbW9kZSIgcmVnaXN0ZXIgKGRhdGEgc2hlZXQsIHBhZ2UgMjQpLgo+Cj4gSSBzYXcg
dGhhdCB0aGVyZSBpcyBhIHF1aXJrIGZvciBzb21lIE1hY3Jvbml4IGNoaXBzIHdoaWNoIGFsc28g
c2VlbQo+IG5vdCB0byBzdXBwb3J0IGdldHRpbmcvc2V0dGluZyB0aGUgdGltaW5nIG1vZGUgKGJ1
dCBkZWNsYXJpbmcgdGhlbQo+IGluIHRoZSBwYXJhbWV0ZXIgcGFnZSkuCgpVbmZvcnR1bmF0ZWx5
LCBpdCBoYXBwZW5zIHRoYXQgc29tZXRpbWVzIGZsYXNoIHZlbmRvciBtZXNzIHVwIHBhcmFtZXRl
cgpwYWdlcywgc28gZWl0aGVyIHRoZSBmbGFzaCBzdXBwb3J0cyBtb2RlIDUgYW5kIGl0IGlzIGx5
aW5nIHRvIHlvdSAoeW91CmNhbiB0ZXN0IGl0IGFuZCBhZGQgYSBxdWlyaykgb3IgdGhlIGZsYXNo
IGRvZXMgbm90IGJlY2F1c2UgdGhpcyBiYXRjaApjb3VsZCBub3Qgc3RhbmQgYSBmYXN0ZXIgcmF0
ZSAoPykuCgo+IE15IG1haW4gcXVlc3Rpb24gaXMgd2hldGhlciB0aGlzIGlzICJub3JtYWwgdmFy
aWF0aW9uIHdpdGhpbiB0aGUgZmxhc2gKPiBtYXJrZXQiIG9yIGEgc2VyaW91cyBpc3N1ZS4gSW4g
Y29udHJhc3QgdG8gYW5vdGhlciBkZXZpY2UgSSBjdXJyZW50bHkKPiB1c2UsIHRoZSBGb3Jlc2Vl
IGNoaXAgYWxzbyBkb2Vzbid0IHN1cHBvcnQgImNhY2hlZCIgb3BlcmF0aW9ucy4gSXMgdGhlcmUK
PiBtdWNoIHZhbHVlIHdyaXRpbmcgYSBmaXggZm9yIFRpbWluZyBNb2RlIGlzc3VlLCBvciBzaG91
bGQgSSBiZXR0ZXIKPiB1c2UgYW5vdGhlciBmbGFzaCBkZXZpY2U/CgpJIGNhbm5vdCB0ZWxsIGZv
ciBzdXJlLCBJIGhvcGUgaXQgaXMgcmFyZSBlbm91Z2ggYnV0IHdlJ3ZlIGFscmVhZHkgc2Vlbgp2
YXJpYXRpb25zIGJldHdlZW4gaWRlbnRpY2FsIGRldmljZXMgd2l0aCB0aGUgc2FtZSBJRC4uLiBT
byBpdCBpcyB1cCB0bwp5b3UgdG8gdGFsayB0byB5b3VyIE5BTkQgdmVuZG9yIGluIG9yZGVyIHRv
IGtub3cgd2hldGhlciB0aGVyZSdzIGJlZW4gYQpjaGFuZ2UgaW4gdGhlaXIgbGluZSBvciBpZiB0
aGlzIGNoaXAgaXMgc3BlY2lhbCBhbmQgZGVjaWRlIHdoYXQncwpiZXN0LiBJZiB5b3UgdGhpbmsg
YSBxdWlyayBpcyByZWxldmFudCwgZG9uJ3QgaGVzaXRhdGUgdG8gc3VibWl0IHRoYXQKKGFuZCB5
ZXMsIHRoZSBNYWNyb25peCBOQU5EIGZsYXNoIGRyaXZlciBnaXZlcyB5b3UgYW4gZXhhbXBsZSBv
ZiBob3cgdG8KZG8gdGhhdCkuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
