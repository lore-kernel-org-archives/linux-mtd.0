Return-Path: <SRS0=zmx6=62=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 816FBC54E8D
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 06:50:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5584120752
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 06:50:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IFk0AZtQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=st.com header.i=@st.com header.b="WGIsw95l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5584120752
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mDW8Q+pyQsFHpijByYg4wH/4hNtDA9GNCFmGuUEv8Hs=; b=IFk0AZtQ8Pq4kJbnJW3VMpVZD
	5CDohsLE0/pjKDONMc5wWsIE9q9lEUOoIoen1itSf9L3kWrEkY8esLzfVCNSMEzMqg9ruFUjJOQjG
	myGma30UU6AsPlYldNg8fu0tiS72bOZnryop6pUSKF7fB1YbGMf5VBWMDtiQ0zMWaA+Fcw4NLyqW7
	vUf6BiA6G1+7o6T6n7IwQgKZVJFVhQZegioSRrw14gy5DxNfZo6pr7lOH1zvYiRN7IaKi2HvRxw9y
	+/9HEnXOTe4hYK6zQW2F96RoKxNIEyEGcAcs/YUzPhB6Yg+Y5cwxm5QC3HdYlONsGONliiL53QJbB
	HTH0m1D6A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYOk4-0008Ms-Ab; Tue, 12 May 2020 06:50:16 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93]
 helo=mx07-00178001.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYOjz-0006yK-TH
 for linux-mtd@lists.infradead.org; Tue, 12 May 2020 06:50:14 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04C6mDFD014173; Tue, 12 May 2020 08:49:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=iEKjer/AUZHyZOt8W1uqSZTqu50DObD4a45HBZNn1gg=;
 b=WGIsw95lqD0h3WMhec/jt5cW8wF8MlhfrFKGP/m06rYBvMAlXVCoO0WSKxYFbboKoxmZ
 D0rtymgEp5jsRaZcCf1ON6ck6FQb1fhal73CUajnkQRUvvhEbqQJEMlPA/iVdUALLAw7
 JeQrggkQ81PpYnIfDJHkGbVBehC0DcdJbsTYtgcVFE4Yk9lBkIAom7oXKfJ2G8ZNQm0c
 U/mMkY9GHTTVaOMCp+UtVazLUAg0REwjobdpNhBPNmqiK7FUZbfonJZKZ6sdYPswEyMU
 ra6sXeG8e8tlvbALus+swRodDS9Fsvk2kjSTQxCRX5uB9AdGv1INMl0TJ4eCzMxWX8DZ BA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30whn9ekuy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 May 2020 08:49:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D6295100034;
 Tue, 12 May 2020 08:49:57 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B8BCD221A49;
 Tue, 12 May 2020 08:49:57 +0200 (CEST)
Received: from [10.211.13.100] (10.75.127.46) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 12 May
 2020 08:49:56 +0200
Subject: Re: [PATCH v4 04/10] mtd: rawnand: stm32_fmc2: cleanup
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <1588756279-17289-1-git-send-email-christophe.kerello@st.com>
 <1588756279-17289-5-git-send-email-christophe.kerello@st.com>
 <20200511223900.030fe5f4@xps13>
From: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <49c51a13-96a1-0241-f4d1-c5ff7d52921d@st.com>
Date: Tue, 12 May 2020 08:49:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200511223900.030fe5f4@xps13>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-12_01:2020-05-11,
 2020-05-12 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_235012_433986_4CBAFC13 
X-CRM114-Status: GOOD (  15.09  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, marex@denx.de,
 vigneshr@ti.com, gregkh@linuxfoundation.org, richard@nod.at,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, boris.brezillon@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWlxdWVsLAoKT24gNS8xMS8yMCAxMDozOSBQTSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiAK
PiBDaHJpc3RvcGhlIEtlcmVsbG8gPGNocmlzdG9waGUua2VyZWxsb0BzdC5jb20+IHdyb3RlIG9u
IFdlZCwgNiBNYXkgMjAyMAo+IDExOjExOjEzICswMjAwOgo+IAo+PiBUaGlzIHBhdGNoIHJlbmFt
ZXMgZnVuY3Rpb25zIGFuZCBsb2NhbCB2YXJpYWJsZXMuCj4+IFRoaXMgY2xlYW51cCBpcyBkb25l
IHRvIGdldCBhbGwgZnVuY3Rpb25zIHN0YXJ0aW5nIGJ5IHN0bTMyX2ZtYzJfbmZjCj4+IGluIHRo
ZSBGTUMyIHJhdyBOQU5EIGRyaXZlciB3aGVuIGFsbCBmdW5jdGlvbnMgd2lsbCBzdGFydCBieQo+
PiBzdG0zMl9mbWMyX2ViaSBpbiB0aGUgRk1DMiBFQkkgZHJpdmVyLgo+Pgo+PiBTaWduZWQtb2Zm
LWJ5OiBDaHJpc3RvcGhlIEtlcmVsbG8gPGNocmlzdG9waGUua2VyZWxsb0BzdC5jb20+Cj4+IFJl
dmlld2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+IAo+
IEFwcGxpZWQgdG8gbmFuZC9uZXh0IGFzIHdlbGwgYnV0IGZvciBhbiB1bmtub3duIHJlYXNvbiBJ
IGhhZCB0byBkbyBpdAo+IGJ5IGhhbmQgYmVjYXVzZSB0aGUgcGF0Y2ggd291bGQgbm90IGFwcGx5
Lgo+IAo+IFRoYW5rcywKPiBNaXF1w6hsCj4gClRoaXMgaXMgc3RyYW5nZSwgSSBjYW4gYXBwbHkg
dGhpcyBwYXRjaCBvbiBteSB0cmVlIHdpdGhvdXQgYW55IGNvbmZsaWN0cy4KVGhlcmUgaXMgYSBj
b21waWxhdGlvbiBpc3N1ZSBsaW5lIDEzMDEuCgpAQCAtMTMwMiw0NCArMTI5OCw0NSBAQCBzdGF0
aWMgdm9pZCBzdG0zMl9mbWMyX3dyaXRlX2RhdGEoc3RydWN0IApuYW5kX2NoaXAgKmNoaXAsIGNv
bnN0IHZvaWQgKmJ1ZiwKCiAgCWlmIChmb3JjZV84Yml0ICYmIGNoaXAtPm9wdGlvbnMgJiBOQU5E
X0JVU1dJRFRIXzE2KQogIAkJLyogUmVjb25maWd1cmUgYnVzIHdpZHRoIHRvIDE2LWJpdCAqLwot
CQlzdG0zMl9mbWMyX3NldF9idXN3aWR0aF8xNihmbWMyLCB0cnVlKTsKKwkJc3RtMzJfZm1jMl9u
ZmNfc2V0X2J1c3dpZHRoXzE2KG5mYywgdHJ1ZSk7CiAgfQoKSSB3aWxsIHJlYmFzZSBvbiB0b3Ag
b2YgbmFuZC9uZXh0IHRvZGF5IHRvIGNoZWNrIHRoYXQgdGhlcmUgaXMgbm8gaXNzdWVzIAp3aXRo
IHRoZSBkcml2ZXIuCgpSZWdhcmRzLApDaHJpc3RvcGhlIEtlcmVsbG8uCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
