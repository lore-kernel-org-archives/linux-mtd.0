Return-Path: <SRS0=YYID=FS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8DDFC4361B
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Dec 2020 07:48:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79912225AC
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Dec 2020 07:48:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79912225AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2yeKkl15K1LzPVaMiDHpsig2lmYOjikwgsBQVB2o65s=; b=RDK8P5maHcI6ivmc+lzt92zf3Q
	7YuzAcJxpyh7TZaqI2c//j7WQRQeO3eQsYlp74dCRDdHtx/Xy50V6FOBhPHITpk/G8bRlQB/oS1RR
	NSDZ8/ABpeetXvc9jezt7CKosc7YyhpvvsiNY2W7DLdmMHGwm0RgSjnfrXIjaAB0xoN8eAym8dg8P
	A+eocU2MWt+1m+EHuf1TzzXIVMdWLCc6qQ7flmZ47Jjohd2VVU6uDb2CqR3UzfeUaJ8ECtWul2DgC
	nok34NCFwBgw64C9uNBWCb8XBh2bZ5MkJgjWrmYA/vbOgy1AMxFa1FQonOGI/LnVeXmF0/oVrFqMB
	YynfhYtA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1koiaK-0003hI-LF; Mon, 14 Dec 2020 07:47:56 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1koiaH-0003gs-Tq
 for linux-mtd@lists.infradead.org; Mon, 14 Dec 2020 07:47:55 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BE7lnT7087235;
 Mon, 14 Dec 2020 01:47:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1607932069;
 bh=iocDzUalopMm/mbo0zURSG/+IpI0aMKkS/05ZYw+zos=;
 h=To:From:CC:Subject:Date;
 b=cFcuhedptsuTfBFzyrPx/XN3GnWbXJCYZDG2CwV3Kbg2SMCaEmMupBjJZCe9RPCSB
 2UejCGqBzyG/ZZiToZPouGxBX93jHJS5PlGRYBj7uAWvdLuGru/XGlitZg8QDi8Hwt
 pMe9EGDSQIjN73ZEgepvMiuRr965XjJmS9QW4WyI=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BE7lnJO119335
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 14 Dec 2020 01:47:49 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 14
 Dec 2020 01:47:48 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 14 Dec 2020 01:47:49 -0600
Received: from [10.250.233.179] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BE7lkTj032696;
 Mon, 14 Dec 2020 01:47:47 -0600
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Tudor Ambarus <Tudor.Ambarus@microchip.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Subject: [GIT PULL] mtd: spi-nor: Changes for 5.11
Message-ID: <6d3e787f-f969-0f09-2679-6afc1e8e6121@ti.com>
Date: Mon, 14 Dec 2020 13:17:46 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201214_024754_414387_2F5A2D27 
X-CRM114-Status: GOOD (  14.10  )
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
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWlxdWVsLCBSaWNoYXJkCgpQbGVhc2UgcHVsbCBTUEkgTk9SIGNoYW5nZXMgZm9yIDUuMTEt
cmMxLiBQUiBpcyBiYXNlZCBvbiB2NS4xMC1yYzMuCgpSZWdhcmRzClZpZ25lc2gKClRoZSBmb2xs
b3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgZjgzOTRmMjMyYjFlYWI2NDljZTJkZjVjNWYxNWIw
ZTUyOGM5MjA5MToKCiAgTGludXggNS4xMC1yYzMgKDIwMjAtMTEtMDggMTY6MTA6MTYgLTA4MDAp
CgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKCiAgZ2l0Oi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9saW51eC5naXQgdGFncy9zcGkt
bm9yL2Zvci01LjExCgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gMzFhZDNlZmYwOTNj
ZjIxODcyZjM4NTAyMTI0MmMwMGM3YTJhYmY2YjoKCiAgbXRkOiBzcGktbm9yOiBrZWVwIGxvY2sg
Yml0cyBpZiB0aGV5IGFyZSBub24tdm9sYXRpbGUgKDIwMjAtMTItMDcgMjM6MDE6MTUgKzA1MzAp
CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tClNQSSBOT1IgY29yZSBjaGFuZ2VzOgoKLSBJbml0aWFsIHN1cHBvcnQgZm9yIHN0
YXRlZnVsIE9jdGFsIERUUiBtb2RlIHVzaW5nIHZvbGF0aWxlIHNldHRpbmdzCi0gUHJlbGltaW5h
cnkgc3VwcG9ydCBmb3IgSkVERUMgMjUxICh4U1BJKSBhbmQgSkVERUMgMjE2RCBzdGFuZGFyZHMK
LSBTdXBwb3J0IGZvciBDeXByZXNzIFNlbXBlciBmbGFzaAotIFN1cHBvcnQgdG8gc3BlY2lmeSBF
Q0MgYmxvY2sgc2l6ZSBvZiBTUEkgTk9SIGZsYXNoZXMKLSBGaXhlcyB0byBhdm9pZCBjbGVhcmlu
ZyBvZiBub24tdm9sYXRpbGUgQmxvY2sgUHJvdGVjdGlvbiBiaXRzIGF0IHByb2JlCgotLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
CkpvbmF0aGFuIE5ldXNjaMOkZmVyICgxKToKICAgICAgbXRkOiBzcGktbm9yOiBGaXggbXVsdGlw
bGUgdHlwb3MKCk1pY2hhZWwgV2FsbGUgKDcpOgogICAgICBtdGQ6IHNwaS1ub3I6IHNzdDogZml4
IEJQbiBiaXRzIGZvciB0aGUgU1NUMjVWRjA2NEMKICAgICAgbXRkOiBzcGktbm9yOiBpZ25vcmUg
ZXJyb3JzIGluIHNwaV9ub3JfdW5sb2NrX2FsbCgpCiAgICAgIG10ZDogc3BpLW5vcjogYXRtZWw6
IHJlbW92ZSBnbG9iYWwgcHJvdGVjdGlvbiBmbGFnCiAgICAgIG10ZDogc3BpLW5vcjogc3N0OiBy
ZW1vdmUgZ2xvYmFsIHByb3RlY3Rpb24gZmxhZwogICAgICBtdGQ6IHNwaS1ub3I6IGludGVsOiBy
ZW1vdmUgZ2xvYmFsIHByb3RlY3Rpb24gZmxhZwogICAgICBtdGQ6IHNwaS1ub3I6IGF0bWVsOiBm
aXggdW5sb2NrX2FsbCgpIGZvciBBVDI1RlMwMTAvMDQwCiAgICAgIG10ZDogc3BpLW5vcjoga2Vl
cCBsb2NrIGJpdHMgaWYgdGhleSBhcmUgbm9uLXZvbGF0aWxlCgpQcmF0eXVzaCBZYWRhdiAoMTUp
OgogICAgICBtdGQ6IHNwaS1ub3I6IGNvcmU6IHVzZSBFT1BOT1RTVVBQIGluc3RlYWQgb2YgRU5P
VFNVUFAKICAgICAgbXRkOiBzcGktbm9yOiBhZGQgc3BpX25vcl9jb250cm9sbGVyX29wc197cmVh
ZF9yZWcsIHdyaXRlX3JlZywgZXJhc2V9KCkKICAgICAgbXRkOiBzcGktbm9yOiBhZGQgc3VwcG9y
dCBmb3IgRFRSIHByb3RvY29sCiAgICAgIG10ZDogc3BpLW5vcjogc2ZkcDogZ2V0IGNvbW1hbmQg
b3Bjb2RlIGV4dGVuc2lvbiB0eXBlIGZyb20gQkZQVAogICAgICBtdGQ6IHNwaS1ub3I6IHNmZHA6
IHBhcnNlIHhTUEkgUHJvZmlsZSAxLjAgdGFibGUKICAgICAgbXRkOiBzcGktbm9yOiBjb3JlOiB1
c2UgZHVtbXkgY3ljbGUgYW5kIGFkZHJlc3Mgd2lkdGggaW5mbyBmcm9tIFNGRFAKICAgICAgbXRk
OiBzcGktbm9yOiBjb3JlOiBkbyAyIGJ5dGUgcmVhZHMgZm9yIFNSIGFuZCBGU1IgaW4gRFRSIG1v
ZGUKICAgICAgbXRkOiBzcGktbm9yOiBjb3JlOiBlbmFibGUgb2N0YWwgRFRSIG1vZGUgd2hlbiBw
b3NzaWJsZQogICAgICBtdGQ6IHNwaS1ub3I6IHNmZHA6IGRldGVjdCBTb2Z0IFJlc2V0IHNlcXVl
bmNlIHN1cHBvcnQgZnJvbSBCRlBUCiAgICAgIG10ZDogc3BpLW5vcjogY29yZTogcGVyZm9ybSBh
IFNvZnQgUmVzZXQgb24gc2h1dGRvd24KICAgICAgbXRkOiBzcGktbm9yOiBjb3JlOiBkaXNhYmxl
IE9jdGFsIERUUiBtb2RlIG9uIHN1c3BlbmQuCiAgICAgIG10ZDogc3BpLW5vcjogc3BhbnNpb246
IGFkZCBzdXBwb3J0IGZvciBDeXByZXNzIFNlbXBlciBmbGFzaAogICAgICBtdGQ6IHNwaS1ub3I6
IG1pY3Jvbi1zdDogYWxsb3cgdXNpbmcgTVQzNVhVNTEyQUJBIGluIE9jdGFsIERUUiBtb2RlCiAg
ICAgIG10ZDogc3BpLW5vcjogY29yZTogQWxsb3cgZmxhc2hlcyB0byBzcGVjaWZ5IE1URCB3cml0
ZXNpemUKICAgICAgbXRkOiBzcGktbm9yOiBzcGFuc2lvbjogU2V0IEVDQyBibG9jayBzaXplCgpU
dWRvciBBbWJhcnVzICgyKToKICAgICAgbXRkOiBzcGktbm9yOiBJbnRyb2R1Y2UgU05PUl9GX0lP
X01PREVfRU5fVk9MQVRJTEUKICAgICAgbXRkOiBzcGktbm9yOiBQYXJzZSBTRkRQIFNDQ1IgTWFw
CgogZHJpdmVycy9tdGQvc3BpLW5vci9LY29uZmlnICAgICB8ICA0NCArCiBkcml2ZXJzL210ZC9z
cGktbm9yL2F0bWVsLmMgICAgIHwgMTkxICsrLQogZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMg
ICAgICB8IDU5NSArKysrKysrLS0tCiBkcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuaCAgICAgIHwg
IDM4ICsKIGRyaXZlcnMvbXRkL3NwaS1ub3IvZXNtdC5jICAgICAgfCAgIDIgKy0KIGRyaXZlcnMv
bXRkL3NwaS1ub3IvaW50ZWwuYyAgICAgfCAgMTkgKy0KIGRyaXZlcnMvbXRkL3NwaS1ub3IvbWlj
cm9uLXN0LmMgfCAxMTUgKy0KIGRyaXZlcnMvbXRkL3NwaS1ub3Ivc2ZkcC5jICAgICAgfCAxNzIg
KystCiBkcml2ZXJzL210ZC9zcGktbm9yL3NmZHAuaCAgICAgIHwgICA4ICsKIGRyaXZlcnMvbXRk
L3NwaS1ub3Ivc3BhbnNpb24uYyAgfCAxNzIgKysrCiBkcml2ZXJzL210ZC9zcGktbm9yL3NzdC5j
ICAgICAgIHwgIDMyICstCiBpbmNsdWRlL2xpbnV4L210ZC9zcGktbm9yLmggICAgIHwgIDU1ICst
CiAxMiBmaWxlcyBjaGFuZ2VkLCAxMjM2IGluc2VydGlvbnMoKyksIDIwNyBkZWxldGlvbnMoLSkK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
