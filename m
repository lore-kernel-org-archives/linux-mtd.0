Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA1AC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Jul 2022 13:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/6sbxRvVTDDK8BlamSRPJkb3Zwe0VO8PWqsj51w+4cQ=; b=IkNdvP9Lghpm1I
	LmbGCW9pXdJICGmKjtK42KmStvkgtQddPvvusRWTkwRsyl/smLNZpjXxyvo7S+nNb03gx+vddOBPh
	PScBl3YyEmlNm992WftyyyUUrEtPUskzQ95scZiNhfNMyjW9iA9sxpchLFcEDDCoVPOwbMA+4bIsX
	hRd+aCnzyw4CA5/idMyBFLxqBQmqo5H+huj/JzGqBgLir3KeD/XNf127hmui2yWVtKRzKCXFq6xTg
	M3pHoFrqwT4aXpm/8eHPP6TVjJpZHXzwH/ljJLHHqkApsvTZxJqyzd3T3kXvzSoxHtxHBg7P9ejTd
	NykINOXXL5Mvidqb5AqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBzGz-00EvYz-VS; Thu, 14 Jul 2022 13:52:58 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBzGs-00EvU6-AC
	for linux-mtd@lists.infradead.org; Thu, 14 Jul 2022 13:52:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1657806770; x=1689342770;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Q+g6Ua55R21KxZs8gSKLd53pDGdsbCuBh0okh1FzeHs=;
  b=fmyCrVHmrr/g0J5kEzG4OKBhM8+H4nMYu6rNaxPDProAIU44QSgSj1q0
   FNUSloD6c62v26I5RPNxgcg2AhyzzPj6NpjU1whMxuKMFb3OdtwBQjfz5
   +8vw3gUGJ0Lf8ji+UTWZxjMtZjuEzDnu3TVbNJEVD1krmxThYeaQeF+MQ
   8=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 14 Jul 2022 06:52:47 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2022 06:52:47 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 14 Jul 2022 06:52:46 -0700
Received: from [10.110.120.249] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 14 Jul
 2022 06:52:45 -0700
Message-ID: <fa7b4a47-8ba7-a105-d216-1b86e0512751@quicinc.com>
Date: Thu, 14 Jul 2022 06:52:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] mtd: spi-nor: winbond: add support for W25Q512NW-IQ
Content-Language: en-US
To: Michael Walle <michael@walle.cc>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
	<p.yadav@ti.com>, Jamie Iles <quic_jiles@quicinc.com>, Graeme Gregory
	<quic_ggregory@quicinc.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
	<clg@kaod.org>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20220713211210.1945044-1-quic_jaehyoo@quicinc.com>
 <4d4a2abab1508fe80e36c2e524f98ed8@walle.cc>
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
In-Reply-To: <4d4a2abab1508fe80e36c2e524f98ed8@walle.cc>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_065250_430428_4FFF30DB 
X-CRM114-Status: UNSURE (   9.14  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gNy8xNC8yMDIyIDEyOjM3IEFNLCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+IEhpLAo+IAo+IHRo
YW5rcyBmb3IgdGhlIHVwZGF0ZS4KPiAKPiBBbSAyMDIyLTA3LTEzIDIzOjEyLCBzY2hyaWViIEph
ZSBIeXVuIFlvbzoKPj4gQWRkIHN1cHBvcnQgZm9yIFdpbmJvbmQgVzI1UTUxMk5XLUlRL0lOCj4+
Cj4+IFNpZ25lZC1vZmYtYnk6IEphZSBIeXVuIFlvbyA8cXVpY19qYWVoeW9vQHF1aWNpbmMuY29t
Pgo+PiBMaW5rOiAKPj4gaHR0cHM6Ly93d3cud2luYm9uZC5jb20vcmVzb3VyY2UtZmlsZXMvVzI1
UTUxMk5XJTIwUmV2QiUyMDA3MTkyMDIxLnBkZgo+PiBSZXZpZXdlZC1ieTogQ8OpZHJpYyBMZSBH
b2F0ZXIgPGNsZ0BrYW9kLm9yZz4KPj4gLS0tCj4+IENoYW5nZXMgaW4gdjI6Cj4+IMKgKiBSZWZp
bmVkIGNvbW1pdCBtZXNzYWdlIChNaWNoYWVsKQo+Pgo+PiBUZXN0IHJlc3VsdCBvbiBBU1QyNjAw
IFNvQydzIFNQSSBjb250cm9sbGVyOgo+PiAkIGNhdAo+PiAvc3lzL2J1cy9wbGF0Zm9ybS9kZXZp
Y2VzLzFlNjIwMDAwLnNwaS9zcGlfbWFzdGVyL3NwaTAvc3BpMC4xL3NwaS1ub3IvamVkZWNfaWQg
Cj4+Cj4+IGVmNjAyMAo+Pgo+PiAkIGNhdAo+PiAvc3lzL2J1cy9wbGF0Zm9ybS9kZXZpY2VzLzFl
NjIwMDAwLnNwaS9zcGlfbWFzdGVyL3NwaTAvc3BpMC4xL3NwaS1ub3IvbWFudWZhY3R1cmVyIAo+
Pgo+PiB3aW5ib25kCj4+Cj4+ICQgY2F0Cj4+IC9zeXMvYnVzL3BsYXRmb3JtL2RldmljZXMvMWU2
MjAwMDAuc3BpL3NwaV9tYXN0ZXIvc3BpMC9zcGkwLjEvc3BpLW5vci9wYXJ0bmFtZSAKPj4KPj4g
dzI1cTUxMm53cQo+Pgo+PiAkIGhleGR1bXAKPj4gL3N5cy9idXMvcGxhdGZvcm0vZGV2aWNlcy8x
ZTYyMDAwMC5zcGkvc3BpX21hc3Rlci9zcGkwL3NwaTAuMS9zcGktbm9yL3NmZHAgCj4+Cj4+IDAw
MDAwMDAgNDY1MyA1MDQ0IDAxMDYgZmYwMSAwNjAwIDEwMDEgMDA4MCBmZjAwCj4+IDAwMDAwMTAg
MDA4NCAwMjAxIDAwZDAgZmYwMCBmZmZmIGZmZmYgZmZmZiBmZmZmCj4+IDAwMDAwMjAgZmZmZiBm
ZmZmIGZmZmYgZmZmZiBmZmZmIGZmZmYgZmZmZiBmZmZmCj4+ICoKPj4gMDAwMDA4MCAyMGU1IGZm
ZmIgZmZmZiAxZmZmIGViNDQgNmIwOCAzYjA4IGJiNDIKPj4gMDAwMDA5MCBmZmZlIGZmZmYgZmZm
ZiAwMDAwIGZmZmYgZWI0MCAyMDBjIDUyMGYKPj4gMDAwMDBhMCBkODEwIDAwMDAgMDIzMyAwMGE2
IGU3ODEgZDkxNCA2M2U5IDMzNzYKPj4gMDAwMDBiMCA3NTdhIDc1N2EgYmRmNyA1Y2Q1IGY3MTkg
ZmY1ZCA3MGU5IGE1ZjkKPj4gMDAwMDBjMCBmZmZmIGZmZmYgZmZmZiBmZmZmIGZmZmYgZmZmZiBm
ZmZmIGZmZmYKPj4gMDAwMDBkMCAwYWZmIGZmZjAgZmYyMSBmZmRjCj4+IDAwMDAwZDgKPiAKPiBt
ZDVzdW0gb2YgdGhpcyBmaWxlIGlzIG1pc3NpbmcuCgpTdXJlLiBJJ2xsIGFkZCBtZDVzdW0gb2Yg
c2ZkcCBpbiB2My4KClRoYW5rcywKSmFlCgo+IEZvciB0aGUgcmVjb3JkOiB0aGVyZSBpcyBzdGls
bCBhbiBvbmdvaW5nIGRpc2N1c3Npb24gb24gdGhlIHYxIG9mCj4gdGhpcyBwYXRjaC4KPiAKPiAt
bWljaGFlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
