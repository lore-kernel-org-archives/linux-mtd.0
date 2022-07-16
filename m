Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC9FEC43334
	for <linux-mtd@archiver.kernel.org>; Sat, 16 Jul 2022 13:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WEN06JSTv7YKtksk48QsCgaAfYp289adpkxtHnIaZmc=; b=4oMtu5tfSIcmoI
	aMgGVFlI6bctur1cgeojK3kep3/rphbR2yXnK3yUgnwlzjLhoh6FQCtAKGdooSlsO5OlgTf5Mhk/2
	mOZLrfB9+V8NOr9Zd4hO7zvbtT3cOt0ECcGYz7y0lSqb1lLxYwMk+p2bQ1jrM58pe5AviW7HXD8qV
	GhSiRD2hkJAzvIEvHLwGADBybzDp3B6qUHSh2b67dnu1FC2e5q/8LQ/A59LFpDv1IA8hDKR6Tnv8j
	vgbmys51iGI3zPKEYZYODbSAtuckDJHpCKOKMS/i1kzi7B28q6jVDIIz5QkLkHB+GAqQvMgaEwm3U
	8UOwCyjjAMm1J4Zi4HOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oChsN-00GGBU-JZ; Sat, 16 Jul 2022 13:30:31 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oChsK-00GG6v-WA
	for linux-mtd@lists.infradead.org; Sat, 16 Jul 2022 13:30:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1657978228; x=1689514228;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=FdNvnC/jXLQVuKQKOh4GkSi9QHzPIjITqKh0ZUq3XZg=;
  b=KnhQg5f9tjZCQlHbiAQB70DhYWN5rJAjtrVu590vBc+ngxj3WOe33xY0
   irUc79e184O4s04BAJ5bCGTVtVSGnleH0AiCtSF1SqedgP7i/W6fqvQln
   CA5oP31z7mcgLjkOb/ZUKc8wIrvWWMRfF9eA9kVamACbG1MQSw9u3AN2u
   0=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 16 Jul 2022 06:30:20 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2022 06:30:20 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Sat, 16 Jul 2022 06:30:20 -0700
Received: from [10.110.64.167] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Sat, 16 Jul
 2022 06:30:19 -0700
Message-ID: <9f734033-ecf1-af99-5d17-140fce910ff6@quicinc.com>
Date: Sat, 16 Jul 2022 06:30:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 2/2] mtd: spi-nor: winbond: add support for
 W25Q512NW-IQ
Content-Language: en-US
To: Michael Walle <michael@walle.cc>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
	<p.yadav@ti.com>, Jamie Iles <quic_jiles@quicinc.com>, Graeme Gregory
	<quic_ggregory@quicinc.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
	<clg@kaod.org>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20220716000643.3541839-1-quic_jaehyoo@quicinc.com>
 <20220716000643.3541839-2-quic_jaehyoo@quicinc.com>
 <52fb683e27b3208d07d9f9d1ab44148d@walle.cc>
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
In-Reply-To: <52fb683e27b3208d07d9f9d1ab44148d@walle.cc>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220716_063029_086085_29625BB1 
X-CRM114-Status: GOOD (  10.14  )
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

SGksCgpPbiA3LzE2LzIwMjIgMjoxMSBBTSwgTWljaGFlbCBXYWxsZSB3cm90ZToKPiBIaSwKPiAK
PiBBbSAyMDIyLTA3LTE2IDAyOjA2LCBzY2hyaWViIEphZSBIeXVuIFlvbzoKPj4gQWRkIHN1cHBv
cnQgZm9yIFdpbmJvbmQgVzI1UTUxMk5XLUlRL0lOCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEphZSBI
eXVuIFlvbyA8cXVpY19qYWVoeW9vQHF1aWNpbmMuY29tPgo+PiBMaW5rOiAKPj4gaHR0cHM6Ly93
d3cud2luYm9uZC5jb20vcmVzb3VyY2UtZmlsZXMvVzI1UTUxMk5XJTIwUmV2QiUyMDA3MTkyMDIx
LnBkZgo+PiBSZXZpZXdlZC1ieTogQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4KPiAK
PiBUaGFua3MgYWdhaW4gZm9yIGZpbmRpbmcgdGhlIHJlYWwgaXNzdWUgaGVyZSEKPiAKPiBSZXZp
ZXdlZC1ieTogTWljaGFlbCBXYWxsZSA8bWljaGFlbEB3YWxsZS5jYz4KClRoYW5rcyBmb3IgeW91
ciByZXZpZXchCgo+IEJ1dCBhbHNvIHNlZSBiZWxvdy4KPiAKPj4gJCBoZXhkdW1wCj4+IC9zeXMv
YnVzL3BsYXRmb3JtL2RldmljZXMvMWU2MjAwMDAuc3BpL3NwaV9tYXN0ZXIvc3BpMC9zcGkwLjEv
c3BpLW5vci9zZmRwIAo+Pgo+PiAwMDAwMDAwIDQ2NTMgNTA0NCAwMTA2IGZmMDEgMDYwMCAxMDAx
IDAwODAgZmYwMAo+PiAwMDAwMDEwIDAwODQgMDIwMSAwMGQwIGZmMDAgZmZmZiBmZmZmIGZmZmYg
ZmZmZgo+PiAwMDAwMDIwIDZmMDAgNzA3NCA3NDIwIDczNjUgZmY3NCBmZmZmIGZmZmYgZmZmZgo+
IAo+IERpZCB5b3Ugbm90aWNlZCB5b3VyIFNGRFAgZGF0YSBjaGFuZ2VkIGNvbXBhcmVkIHRvOgo+
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW10ZC8yMDIyMDcxMDE0NTcyMS4xMjA3MTU3
LTEtcXVpY19qYWVoeW9vQHF1aWNpbmMuY29tLyAKPiAKPiAKPiBXaGljaCBtYWtlcyBtZSB3b25k
ZXIgaWYgeW91IGV2ZXIgaGFkIGFuIG9mZnNldCAwCj4gd2l0aCB0aGUgT1RQX0lORk8oKS4gRm9y
IFdpbmJvbmQgdGhlIGZpcnN0IE9UUAo+IHJlZ2lvbiBpcyBhY3R1YWxseSB0aGUgU0ZEUC4uIFNv
IHlvdSBtaWdodAo+IGFjY2lkZW50YWxseSBtb2RpZmllZCBpdC4KCkluZGVlZC4gTG9va3MgbGlr
ZSB0aGUgcmVnaW9uIGdvdCBtb2RpZmllZCB3aGlsZSBJIHdhcyB0ZXN0aW5nIE9UUC4KUGxlYXNl
IHNlZSBiZWxvdy4gSSB0b29rIHRoZSBzZmRwIGR1bXAgZnJvbSBhIG5ldyBjbGVhbiBwYXJ0LgoK
JCBoZXhkdW1wIAovc3lzL2J1cy9wbGF0Zm9ybS9kZXZpY2VzLzFlNjIwMDAwLnNwaS9zcGlfbWFz
dGVyL3NwaTAvc3BpMC4xL3NwaS1ub3Ivc2ZkcAowMDAwMDAwIDQ2NTMgNTA0NCAwMTA2IGZmMDEg
MDYwMCAxMDAxIDAwODAgZmYwMAowMDAwMDEwIDAwODQgMDIwMSAwMGQwIGZmMDAgZmZmZiBmZmZm
IGZmZmYgZmZmZgowMDAwMDIwIGZmZmYgZmZmZiBmZmZmIGZmZmYgZmZmZiBmZmZmIGZmZmYgZmZm
ZgoqCjAwMDAwODAgMjBlNSBmZmZiIGZmZmYgMWZmZiBlYjQ0IDZiMDggM2IwOCBiYjQyCjAwMDAw
OTAgZmZmZSBmZmZmIGZmZmYgMDAwMCBmZmZmIGViNDAgMjAwYyA1MjBmCjAwMDAwYTAgZDgxMCAw
MDAwIDAyMzMgMDBhNiBlNzgxIGQ5MTQgNjNlOSAzMzc2CjAwMDAwYjAgNzU3YSA3NTdhIGJkZjcg
NWNkNSBmNzE5IGZmNWQgNzBlOSBhNWY5CjAwMDAwYzAgZmZmZiBmZmZmIGZmZmYgZmZmZiBmZmZm
IGZmZmYgZmZmZiBmZmZmCjAwMDAwZDAgMGFmZiBmZmYwIGZmMjEgZmZkYwowMDAwMGQ4CgokIG1k
NXN1bSAKL3N5cy9idXMvcGxhdGZvcm0vZGV2aWNlcy8xZTYyMDAwMC5zcGkvc3BpX21hc3Rlci9z
cGkwL3NwaTAuMS9zcGktbm9yL3NmZHAKMzQ3ZjAwMjdlYzVhMDllOGU3OGQ1Njg1NDg1Y2NlZWQK
ClRoYW5rcywKCkphZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
