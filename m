Return-Path: <SRS0=rMW0=J7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6384EC433B4
	for <linux-mtd@archiver.kernel.org>; Tue,  4 May 2021 07:43:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7B6B6103E
	for <linux-mtd@archiver.kernel.org>; Tue,  4 May 2021 07:43:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7B6B6103E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Iehw4o+4j1hjhD/8ZzeU1PxQ5QtbWtURcUZ6IOT2bGw=; b=Tqv79N8Q2PWROAvIcL/F/ZWg6
	A5m9ey11XTKZNbWlTyTONBNJQo1nVojdmgTzdYsuQVJCEpmaGDG+EHv1wvAEJf+PjpBsBC7ygYTJ8
	DeKtDZpXTCBXtOJ3cMNTiiHAQUuz8XUaIimVfBmoOMxrNpFwy/UvI07lKA76ej/Jbal7Z84KMUSqY
	tuAh1jHqXvVck9UGJa72dkoeEN3O9KElLHMIdOJZqZLr/JhcOpBXJfPa+fcy7bAjDKzAOLMP3tzc9
	FvnW8Y2LFpI7OAxE2LKdlQNdPSqGT6uQ3xPdaJVu72C2Xz8NWnV33QwSnPD1kPH1qED+jGNVOzQAO
	wSepcZNMQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldphP-00FdJu-LW; Tue, 04 May 2021 07:42:31 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldphM-00FdJH-PN
 for linux-mtd@desiato.infradead.org; Tue, 04 May 2021 07:42:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=dfU3OUcVoRBJbR3Exsd2SHBYTLZkiu3fPn4CwADJUF8=; b=tayADbek/EhyrACQuoczUtQ5kj
 mxicjzGTSF4nDmzHtKtlGx7To5ZUnSC3SkEudeJBG869tNtc8Q69uI6o3lUpM1Iue2GXWCbkRkJDO
 U8h1UWXgM9oy1Bl/6GLL9WTu9uAx19Q9/Sz6oHH7NLO1OfHLDAyo6F/V2NWQUk8rLTxwK/7zFlLOU
 JWWdikvS8jPr1ikTpIUg2SlReo9aNk5yOHQsQdUMtauTihUN+GE5LNQY0OTg4U59PJmKsniF41F/J
 w2BXZSp4JNKiT6pi8f1/tRn2S6++PfKaTY7UuK+e7aJycuWPM7V+WHOwjyvlUPICRj2WprWpW3SVP
 oj0wnu8w==;
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldphJ-003m4f-VC
 for linux-mtd@lists.infradead.org; Tue, 04 May 2021 07:42:27 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1447gLMl109806;
 Tue, 4 May 2021 02:42:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1620114141;
 bh=dfU3OUcVoRBJbR3Exsd2SHBYTLZkiu3fPn4CwADJUF8=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=d6KcoZ4HCaCCrjUlx/wSPeKxYlt48C6UyQ7ng5VZlpNZnDymW/ZB5FmpRNWA+wR3a
 oguojS8xWiOZ1VvyvuDtO8wm0izXjRJFCJz8M27bnIlohYQcMruesa3YOdnKVszaD4
 ZbAglvqTT463wyYGp1FwckAjBK9jxPpmQhMkbA9Q=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1447gLNc098473
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 4 May 2021 02:42:21 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 4 May
 2021 02:42:21 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 4 May 2021 02:42:21 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1447gKu5018786;
 Tue, 4 May 2021 02:42:21 -0500
Date: Tue, 4 May 2021 13:12:20 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <zhengxunli@mxic.com.tw>
CC: <broonie@kernel.org>, <jaimeliao@mxic.com.tw>,
 <linux-mtd@lists.infradead.org>, <linux-spi@vger.kernel.org>,
 <miquel.raynal@bootlin.com>, <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v3 1/3] mtd: spi-nor: macronix: add support for Macronix
 octal dtr operation
Message-ID: <20210504074218.s2zezkt3imaanfmr@ti.com>
References: <1618900179-14546-1-git-send-email-zhengxunli@mxic.com.tw>
 <1618900179-14546-2-git-send-email-zhengxunli@mxic.com.tw>
 <20210427023604.vamgepl4myrhpiwu@ti.com>
 <OF2365AB9C.87E8927D-ON482586CA.0029B8EB-482586CB.001E5C1A@mxic.com.tw>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OF2365AB9C.87E8927D-ON482586CA.0029B8EB-482586CB.001E5C1A@mxic.com.tw>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_004226_113114_C3DFA8EC 
X-CRM114-Status: GOOD (  28.28  )
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

T24gMDQvMDUvMjEgMDE6MzFQTSwgemhlbmd4dW5saUBteGljLmNvbS50dyB3cm90ZToKPiBIaSBQ
cmF0eXVzaCwKPiAKPiBUaGFua3MgZm9yIHlvdXIgY29tbWVudCBvbiB0aGlzIHBhdGNoLgo+IAo+
ICJQcmF0eXVzaCBZYWRhdiIgPHAueWFkYXZAdGkuY29tPiB3cm90ZSBvbiAyMDIxLzA0LzI3IOS4
iuWNiCAxMDozNjowNjoKPiAKWy4uLl0KPiA+ID4gKyAgIGlmICghZW5hYmxlKQo+ID4gPiArICAg
ICAgc3BpX25vcl9zcGltZW1fc2V0dXBfb3Aobm9yLCAmb3AsIFNOT1JfUFJPVE9fOF84XzhfRFRS
KTsKPiA+IAo+ID4gV2hlbiBkaXNhYmxpbmcsIHRoZSBvcCB3b3VsZCBiZSBpbiA4RC04RC04RCBt
b2RlIHNvIGhhdmluZyBhIGRhdGEgbGVuZ3RoIAo+IAo+ID4gb2YgMSB3b3VsZCBiZSBpbnZhbGlk
LiBUaGlzIGlzIGN1cnJlbnRseSB0aGUgY2FzZSBldmVuIGluIHRoZSBwYXRjaGVzIAo+ID4gdGhh
dCBJIHNlbnQgZm9yIE1pY3JvbiBhbmQgQ3lwcmVzcy4KPiA+IAo+ID4gSSBhbSBub3Qgc3VyZSB3
aGF0IHRoZSBjb3JyZWN0IGZpeCBmb3IgdGhpcyBpcyB0aG91Z2guIE9uZSBvcHRpb24gaXMgdG8g
Cj4gPiBzZW5kIHRoZSBzYW1lIGJ5dGUgdHdpY2UsIGJ1dCBJIHJlbWVtYmVyIHRoYXQgb24gdGhl
IEN5cHJlc3MgZmxhc2ggdGhlIAo+ID4gc2Vjb25kIGJ5dGUgb3Zlci13cml0ZXMgdGhlIHJlZ2lz
dGVyIGF0IHRoZSBuZXh0IGFkZHJlc3MuIEknbSBub3Qgc3VyZSAKPiA+IGhvdyBNYWNyb25peCBm
bGFzaGVzIGhhbmRsZSB0aGUgc2Vjb25kIGJ5dGUuIENhbiB5b3UgY2hlY2sgd2hhdCB0aGUgCj4g
PiBiZWhhdmlvciBmb3IgeW91ciBmbGFzaCBpcyB3aGVuIHlvdSB3cml0ZSAyIGJ5dGVzIHRvIHRo
ZSByZWdpc3Rlcj8KPiAKPiBJIGNoZWNrZWQgdGhlIGJlaGF2aW9yIG9mIE1hY3Jvbml4IGFuZCB0
aGUgc2Vjb25kIGJ5dGUgd2lsbCBvdmVyd3JpdGVzIHRoZSAKPiByZWdpc3Rlci4KClllcywgSSBz
ZWUgdGhlIHNhbWUgYmVoYXZpb3VyIG9uIE1pY3JvbiBhbmQgQ3lwcmVzcyBmbGFzaGVzLiBDYW4g
eW91ciAKY29udHJvbGxlciBzZW5kIGEgMS1ieXRlIHdyaXRlIGluIDhEIG1vZGU/IEkgYW0gY3Vy
aW91cyBpZiB0aGlzIGlzIApwb3NzaWJsZSBhbmQgaG93IGZsYXNoZXMgcmVhY3QgdG8gaXQuCgpN
eSB0aGVvcnkgaXMgdGhhdCBldmVuIGlmIHlvdSBhc2sgdGhlIGNvbnRyb2xsZXIgdG8gc2VuZCAx
IGJ5dGUgaW4gOEQgCm1vZGUsIGl0IHdvbid0IGRlYXNzZXJ0IHRoZSBDUyB0aWxsIHRoZSBlbmQg
b2YgdGhlIGN5Y2xlLiBUaGlzIHdvdWxkIApyZXN1bHQgdGhlIGZsYXNoIGluIHRha2luZyB0aGUg
ZGVmYXVsdCB2YWx1ZSBvZiB0aGUgbGluZXMgYXMgdGhlIHNlY29uZCAKYnl0ZS4KCj4gRG8gd2Ug
bmVlZCB0byBzZW5kIHRoZSBzYW1lIGJ5dGVzIHRvIHJlc29sdmUgdGhpcyBlcnJvcj8KCkkgdGhp
bmsgdGhpcyBpcyBhIGRlc2lnbiBvdmVyc2lnaHQgYnkgZmxhc2ggbWFudWZhY3R1cmVycy4gSGF2
aW5nIHR3byAKcmVnaXN0ZXJzIGF0IGNvbnNlY3V0aXZlIGFkZHJlc3NlcyBpcyBwcm9ibGVtYXRp
YyBpbiA4RC04RC04RCBtb2RlLiBUaGUgCm9ubHkgc29sdXRpb24gSSBzZWUgaXMgdG8gcmVhZCB0
aGUgcmVnaXN0ZXIgYXQgdGhlIG5leHQgYWRkcmVzcywgYW5kIHNldCAKaXRzIHZhbHVlIGFzIHRo
ZSBzZWNvbmQgYnl0ZSBpbiB0aGUgdHJhbnNhY3Rpb24uIFRoaXMgd2F5IGl0cyB2YWx1ZSB3aWxs
IApzdGF5IHRoZSBzYW1lIGF0IHRoZSBlbmQgb2YgdGhlIHRyYW5zYWN0aW9uLgoKUFM6IElmIHBv
c3NpYmxlLCBwbGVhc2UgdHJ5IHRvIHJlbGF5IHRoaXMgaXNzdWUgdG8geW91ciBoYXJkd2FyZSBk
ZXNpZ24gCnRlYW0uIEhvcGVmdWxseSB0aGV5IGNhbiBjb21lIHVwIHdpdGggYSBjbGV2ZXIgc29s
dXRpb24gZm9yIGZ1dHVyZSAKZGV2aWNlcyBhbmQgbWFrZSBvdXIgbGl2ZXMgZWFzaWVyIDstKQoK
LS0gClJlZ2FyZHMsClByYXR5dXNoIFlhZGF2ClRleGFzIEluc3RydW1lbnRzIEluYy4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
