Return-Path: <SRS0=5+/X=6Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35E48C47255
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 10:26:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06EFD2082E
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 10:26:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f/CJxMGZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=st.com header.i=@st.com header.b="fj7kvXnF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06EFD2082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ooT/KlW+4fGFzGlPyJRMesHxVnL6/u1YZOLAvh43xZE=; b=f/CJxMGZwjXyHcJ/Z5gsRnN93
	Xg2sGGch/f8P5I8L+T/0ylvWjfIXyszDb9zwgB3y8boGx6Ae1qghYpFMj81NXgaWNjRptIz6fzfD7
	nddrNm7p68vOmniOgT4QoJGbscMq0qyy8g+/IcnFfR18VqnL2/JZDnPAOsflstT8cBieBnWXJwccK
	pS4IvdKP8gn4+wbamvIal6byOvZFb7gKPbbK/GNXMw4vNpQcdWnSVKRUt37tREN6ZcjiSTNvg7N5Q
	1Ejen9fBvor3huuWs/Lww4mTsg1yRwx+uMAzvy2qYwpal0U+io7fsaMypjGQbp9yyrDRrts29drti
	xW/jibUSA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jY5dq-0007nH-L2; Mon, 11 May 2020 10:26:34 +0000
Received: from mx07-00178001.pphosted.com ([62.209.51.94])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jY5dn-0007mh-6N
 for linux-mtd@lists.infradead.org; Mon, 11 May 2020 10:26:32 +0000
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04BAM2Jo011706; Mon, 11 May 2020 12:26:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=JOxfg+//EIzdyPpoUcRNv9cDiNoXOl/xkAO+PVn8Imc=;
 b=fj7kvXnFADhcqBRN+KrUKDKMGuiC8N+nrLc5oFawoXZb1SnLBUqKOJfmI/u9KUveYsgs
 p1R/lLegovExqm3p6WaLVcUMWaH4srKLQDZXtfN8P3yDDwVT4xQ4nQyRLP1wHSc0rDUy
 NWp3s/bP1l+jgeTLmAW+Z+1ECKcZd4SVX/ODmhN8xaHuxz66MwFNy26uVXZ04AYdKfYN
 +3b2mySARnFy/1ghBhqusnDGYSFOau0bEK2cCJt93bWZOohjB75oU6lUOZAZG6UE1mU3
 AyQ9P4SI4zJDi8H59bITDmSB1abLg5UW8LqVn43DYuYTmN80J8pSWPUcCSnU37SMrolI ww== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30wj9w9vek-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 May 2020 12:26:16 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8130C100038;
 Mon, 11 May 2020 12:26:15 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7C36C2C38C2;
 Mon, 11 May 2020 12:26:15 +0200 (CEST)
Received: from [10.211.5.64] (10.75.127.51) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 11 May
 2020 12:26:08 +0200
Subject: Re: [PATCH v4 00/10] add STM32 FMC2 EBI controller driver
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <1588756279-17289-1-git-send-email-christophe.kerello@st.com>
 <20200511112237.20751831@xps13>
From: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <a805b5c6-e465-c980-d716-29a655e63b0c@st.com>
Date: Mon, 11 May 2020 12:26:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200511112237.20751831@xps13>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG6NODE3.st.com (10.75.127.18) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-11_04:2020-05-11,
 2020-05-11 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_032631_543808_3AE97CF0 
X-CRM114-Status: GOOD (  19.94  )
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

SGkgTWlxdWVsLAoKT24gNS8xMS8yMCAxMToyMiBBTSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBI
aSBDaHJpc3RvcGhlLAo+IAo+IENocmlzdG9waGUgS2VyZWxsbyA8Y2hyaXN0b3BoZS5rZXJlbGxv
QHN0LmNvbT4gd3JvdGUgb24gV2VkLCA2IE1heSAyMDIwCj4gMTE6MTE6MDkgKzAyMDA6Cj4gCj4+
IFRoZSBGTUMyIGZ1bmN0aW9uYWwgYmxvY2sgbWFrZXMgdGhlIGludGVyZmFjZSB3aXRoOiBzeW5j
aHJvbm91cyBhbmQKPj4gYXN5bmNocm9ub3VzIHN0YXRpYyBkZXZpY2VzIChzdWNoIGFzIFBTTk9S
LCBQU1JBTSBvciBvdGhlciBtZW1vcnktbWFwcGVkCj4+IHBlcmlwaGVyYWxzKSBhbmQgTkFORCBm
bGFzaCBtZW1vcmllcy4KPj4gSXRzIG1haW4gcHVycG9zZXMgYXJlOgo+PiAgICAtIHRvIHRyYW5z
bGF0ZSBBWEkgdHJhbnNhY3Rpb25zIGludG8gdGhlIGFwcHJvcHJpYXRlIGV4dGVybmFsIGRldmlj
ZQo+PiAgICAgIHByb3RvY29sCj4+ICAgIC0gdG8gbWVldCB0aGUgYWNjZXNzIHRpbWUgcmVxdWly
ZW1lbnRzIG9mIHRoZSBleHRlcm5hbCBkZXZpY2VzCj4+IEFsbCBleHRlcm5hbCBkZXZpY2VzIHNo
YXJlIHRoZSBhZGRyZXNzZXMsIGRhdGEgYW5kIGNvbnRyb2wgc2lnbmFscyB3aXRoIHRoZQo+PiBj
b250cm9sbGVyLiBFYWNoIGV4dGVybmFsIGRldmljZSBpcyBhY2Nlc3NlZCBieSBtZWFucyBvZiBh
IHVuaXF1ZSBDaGlwCj4+IFNlbGVjdC4gVGhlIEZNQzIgcGVyZm9ybXMgb25seSBvbmUgYWNjZXNz
IGF0IGEgdGltZSB0byBhbiBleHRlcm5hbCBkZXZpY2UuCj4+Cj4+IENoYW5nZXMgaW4gdjQ6Cj4+
ICAgLSBiaW5kaW5nczoKPj4gICAgIC0gZml4IGZpbGVuYW1lOiBzdCxzdG0zMi1mbWMyLWViaS55
YW1sCj4+Cj4+IENoYW5nZXMgaW4gdjM6Cj4+ICAgLSBOQU5EOgo+PiAgICAgLSByZW5hbWUgbGFi
ZWxzIHVzZWQgb24gZXJyb3JzCj4+ICAgICAtIGFkZCBpbiB0aGUgY29tbWl0IGxvZyB0aGUgcmVh
c29uIHRvIGluY3JlYXNlIEZNQzJfVElNRU9VVF9NUyAocGF0Y2ggMykKPj4gICAgIC0gYWRkIE1p
cXVlbCByZXZpZXdlZC1ieSB0YWcgKHBhdGNoZXMgMi80LzUvOSkKPj4gICAtIEVCSToKPj4gICAg
IC0gbW92ZSBpbiBtZW1vcnkgZm9sZGVyCj4+ICAgICAtIG1lcmdlIE1GRCBhbmQgQlVTIGRyaXZl
cnMgdG8gYXZvaWQgYSBNRkQgZHJpdmVyCj4+ICAgLSBiaW5kaW5nczoKPj4gICAgIC0gcGF0dGVy
biBuYW1lIGhhcyBiZWVuIG1vZGlmaWVkCj4+ICAgICAtIHZlbmRvciBwcm9wZXJ0aWVzIGhhdmUg
YmVlbiBtb2RpZmllZAo+PiAgICAgICAtIHMvXy8tLwo+PiAgICAgICAtIGFkZCB1bml0IHN1ZmZp
eCAoLW5zKSBvbiB0aW1pbmcgcHJvcGVydGllcwo+Pgo+PiBDaHJpc3RvcGhlIEtlcmVsbG8gKDEw
KToKPj4gICAgbXRkOiByYXduYW5kOiBzdG0zMl9mbWMyOiBtYW5hZ2UgYWxsIGVycm9ycyBjYXNl
cyBhdCBwcm9iZSB0aW1lCj4+ICAgIG10ZDogcmF3bmFuZDogc3RtMzJfZm1jMjogcmVtb3ZlIHVz
ZWxlc3MgaW5saW5lIGNvbW1lbnRzCj4+ICAgIG10ZDogcmF3bmFuZDogc3RtMzJfZm1jMjogdXNl
IEZNQzJfVElNRU9VVF9NUyBmb3IgdGltZW91dHMKPj4gICAgbXRkOiByYXduYW5kOiBzdG0zMl9m
bWMyOiBjbGVhbnVwCj4+ICAgIG10ZDogcmF3bmFuZDogc3RtMzJfZm1jMjogdXNlIEZJRUxEX1BS
RVAvRklFTERfR0VUIG1hY3Jvcwo+PiAgICBkdC1iaW5kaW5nczogbXRkOiB1cGRhdGUgU1RNMzIg
Rk1DMiBOQU5EIGNvbnRyb2xsZXIgZG9jdW1lbnRhdGlvbgo+PiAgICBkdC1iaW5kaW5nczogbWVt
b3J5LWNvbnRyb2xsZXI6IGFkZCBTVE0zMiBGTUMyIEVCSSBjb250cm9sbGVyCj4+ICAgICAgZG9j
dW1lbnRhdGlvbgo+PiAgICBtZW1vcnk6IHN0bTMyLWZtYzItZWJpOiBhZGQgU1RNMzIgRk1DMiBF
QkkgY29udHJvbGxlciBkcml2ZXIKPj4gICAgbXRkOiByYXduYW5kOiBzdG0zMl9mbWMyOiB1c2Ug
cmVnbWFwIEFQSXMKPj4gICAgbXRkOiByYXduYW5kOiBzdG0zMl9mbWMyOiBnZXQgcmVzb3VyY2Vz
IGZyb20gcGFyZW50IG5vZGUKPj4KPj4gICAuLi4vbWVtb3J5LWNvbnRyb2xsZXJzL3N0LHN0bTMy
LWZtYzItZWJpLnlhbWwgICAgICB8ICAyNjEgKysrKysKPj4gICAuLi4vYmluZGluZ3MvbXRkL3N0
LHN0bTMyLWZtYzItbmFuZC55YW1sICAgICAgICAgICB8ICAgMTkgKy0KPj4gICBkcml2ZXJzL21l
bW9yeS9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMTAgKwo+PiAgIGRy
aXZlcnMvbWVtb3J5L01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgMSAr
Cj4+ICAgZHJpdmVycy9tZW1vcnkvc3RtMzItZm1jMi1lYmkuYyAgICAgICAgICAgICAgICAgICAg
fCAxMjA2ICsrKysrKysrKysrKysrKysrKysrCj4+ICAgZHJpdmVycy9tdGQvbmFuZC9yYXcvS2Nv
bmZpZyAgICAgICAgICAgICAgICAgICAgICAgfCAgICAxICsKPj4gICBkcml2ZXJzL210ZC9uYW5k
L3Jhdy9zdG0zMl9mbWMyX25hbmQuYyAgICAgICAgICAgICB8IDExNzYgKysrKysrKysrKy0tLS0t
LS0tLQo+PiAgIDcgZmlsZXMgY2hhbmdlZCwgMjA2MSBpbnNlcnRpb25zKCspLCA2MTMgZGVsZXRp
b25zKC0pCj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvc3Qsc3RtMzItZm1jMi1lYmkueWFtbAo+PiAgIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21lbW9yeS9zdG0zMi1mbWMyLWViaS5jCj4+Cj4gCj4g
SSdtIGZpbmUgd2l0aCB0aGUgcHJlcGFyYXRpb24gcGF0Y2hlcyAxLTUgYnV0IHRoZSBvdGhlciBw
YXRjaGVzIG5lZWQKPiBSb2IncyBoYWNrIGFuZCBwcm9iYWJseSBtb3JlIGNoYW5nZXMuIElmIGl0
J3MgZmluZSB3aXRoIHlvdSBJIGNhbiBhcHBseQo+IHRoZXNlIHBhdGNoZXMgZm9yIHRoZSBuZXh0
IG1lcmdlIHdpbmRvdyBhbmQgbGV0IG1vcmUgdGltZSB0byB3b3JrIG9uCj4gdGhlIGxhc3QgNS4K
PiAKCkkgYW0gZmluZSB3aXRoIHlvdXIgcHJvcG9zYWwuCgpSZWdhcmRzLApDaHJpc3RvcGhlIEtl
cmVsbG8uCgo+IFRoYW5rcywKPiBNaXF1w6hsCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
