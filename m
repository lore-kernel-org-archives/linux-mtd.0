Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD28C77B7C
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Jun 2025 18:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ebCV0aXGiOzuwFChssWH0z5uTOP2meFGzATitQNHLF8=; b=Og4pIUnBSnoqT4
	ZSSSuuExoIXLK41Zp7sxZx00Swxnyc5wTjZtEXAa3oP9zZWaGNHK6aiVtZsuKIXwBhJ44VMG9ahaB
	S670C2yN2QHzZ+wVv0PvbuAjxBGODVn7x54ImcDbYTrlF5mFfL1yCcdrLtQLEIkW2+uSZj6X0fH95
	6bud2UZ8eAwYc8r89JI3lX9M/y210S06x0eWLoRoa+OlfMnzUUB57BH/otA3AZnYYycaFtxqyHxIA
	569QPhw6IVXIXqxPmtAIkb86mtfLmiXU40vdfffc5nlkw579F2rvUReAKB6aabfit7cPNepZRjL2/
	VVzzreHbiLxDSZHu/SRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUUse-00000009au5-0Uu3;
	Wed, 25 Jun 2025 18:29:56 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUT1c-00000009Iqg-0xO1
	for linux-mtd@bombadil.infradead.org;
	Wed, 25 Jun 2025 16:31:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=Ar5cY3eqwri9AVFjIOQsbTDZ2wnQ244y0/ufHL/uq/A=; b=W4Et/10I1Xhe7Kb6CA4MegLf0S
	tWeROkibVK5ISU4GITjbLuYpmvxpt+m2l3EpmIQ+/aKKhbPNgRNQQS20ynu96W8Vlb7neJ3KGZPX6
	7LaOa0ctpLuyy12CYB3G7VSvB4s2wASUkI1ffIvqM5cXtkAL5YsasEnZH3KUpXWmHmVXgTpWDS6tf
	xS5SUR/BwDj7k51ieUyhlCxtLl210X5NFUTYx0D7aTbByh53GNvHsitzLMr+GQDT2/rdkroCb0PK7
	iSeBw1pr1CrKs72MYIoRpG7aAXLrZnZXgtwFhfXddLmff1wUsUFzOpKfc7qoJoWlBQymoBbjCTuNX
	hi/nkRxw==;
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUT1Y-00000009kDa-1zR5
	for linux-mtd@lists.infradead.org;
	Wed, 25 Jun 2025 16:31:02 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PFvITO009480;
	Wed, 25 Jun 2025 18:30:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	Ar5cY3eqwri9AVFjIOQsbTDZ2wnQ244y0/ufHL/uq/A=; b=snHTUn8v8zy4BnVf
	bkKsMzALzX/hWB50aMj4MxIHi4bX+SsAYGY3Ta0qS9W+Qov86Hf3IFmC6wwbjXKe
	z+7twjq4QjRMRhSZLUxgBzx2nUR3tozW2d6dCqKxErksVbCQU6VU/JiwQwzNDwcn
	U/1p4bdqn33j4ByolMt6WwqjLdE3h61JA8R5yccQhLkGEskbTqOvCPUA7/8p3XmS
	3qkplYuF9MJHqCdFCqu0QAWkYnOvwX3wSSg4FJ6n+6+HrXVAi9jrPcnDQBoDD8cW
	6WJ6dlJDiRbtJNS8vh0xlq+UK3j8XGCWgrXg1kalJWT759R+wTleuCh44x8N8dF3
	PYWGSA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47dkmjtf7e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 18:30:47 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5E1194002D;
	Wed, 25 Jun 2025 18:29:58 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DD36CBF53B0;
	Wed, 25 Jun 2025 18:29:23 +0200 (CEST)
Received: from [10.48.86.103] (10.48.86.103) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 25 Jun
 2025 18:29:23 +0200
Message-ID: <c1671c5e-d824-4131-861e-470d09371e05@foss.st.com>
Date: Wed, 25 Jun 2025 18:29:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fscrypt: don't use hardware offload Crypto API drivers
To: Eric Biggers <ebiggers@kernel.org>
CC: <linux-fscrypt@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
        <linux-ext4@vger.kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>,
        <ceph-devel@vger.kernel.org>
References: <20250611205859.80819-1-ebiggers@kernel.org>
 <8f4c2f36-71af-4c84-bcee-2554cea991d0@foss.st.com>
 <20250613144239.GA1287@sol>
Content-Language: en-US
From: Maxime MERE <maxime.mere@foss.st.com>
In-Reply-To: <20250613144239.GA1287@sol>
X-Originating-IP: [10.48.86.103]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_05,2025-06-25_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_173100_796219_11A13C51 
X-CRM114-Status: UNSURE (   7.58  )
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

CgpPbiA2LzEzLzI1IDE2OjQyLCBFcmljIEJpZ2dlcnMgd3JvdGU6Cj4gSG9uZXN0bHksIHRoZSBy
ZXNwb25zZXMgdG8gdGhpcyB0aHJlYWQgc28gZmFyIGhhdmUgbWFkZSBpdCBldmVuIG1vcmUgY2xl
YXIgdGhhdAo+IHRoaXMgcGF0Y2ggaXMgdGhlIHJpZ2h0IGRlY2lzaW9uLgoKVGhlIGNoYWluaW5n
IHN5c3RlbSBJIHByZXZpb3VzbHkgcHJlc2VudGVkIGlzIGp1c3QgYW4gZXhhbXBsZSBpbnRlbmRl
ZCAKdG8gZGVtb25zdHJhdGUgdGhlIHZhbHVlIG9mIGhhcmR3YXJlIGRyaXZlcnMgaW4gdGhlIGNv
bnRleHQgb2YgU1QgcGxhdGZvcm1zLgoKVGhlIGtleSBwb2ludCBpcyB0aGF0IG91ciBoYXJkd2Fy
ZSBJUCBhbGxvd3MgdXMgdG8gc2VjdXJlbHkgZW1iZWQgCmVuY3J5cHRpb24ga2V5cyBkaXJlY3Rs
eSBpbiBoYXJkd2FyZSwgbWFraW5nIHN1cmUgdGhleSBhcmUgbmV2ZXIgdmlzaWJsZSAKb3IgYWNj
ZXNzaWJsZSBmcm9tIExpbnV4LCB3aGljaCBydW5zIGluIGEgbm9uLXNlY3VyZSBlbnZpcm9ubWVu
dC4gT3VyIApzb2Z0d2FyZSBhcmNoaXRlY3R1cmVzIHJlbHkgb24gYSBTZWN1cmUgT1MgcnVubmlu
ZyBpbiBwYXJhbGxlbCB3aXRoIApMaW51eCwgc2ltaWxhciB0byB3aGF0IGlzIGRvbmUgb24gQW5k
cm9pZC4gVGhpcyBTZWN1cmUgT1MgaXMgcmVzcG9uc2libGUgCmZvciBzZW5zaXRpdmUgY3J5cHRv
Z3JhcGhpYyBvcGVyYXRpb25zLgoKVGhpcyBTZWN1cmUgT1MgY2FuIG1hbmFnZXMgdGhlIGtleXMg
d2l0aCBhIGRlZGljYXRlZCBoYXJkd2FyZSBwZXJpcGhlcmFsIAooU0FFUykuIFRoZSBMaW51eCBz
aWRlIG5ldmVyIHNlZXMgdGhlIGtleXMgZGlyZWN0bHkuIEluc3RlYWQsIHRoZSBTZWN1cmUgCk9T
IHByZXBhcmVzIHRoZSBrZXlzIGFuZCBzaGFyZXMgdGhlbSBzZWN1cmVseSB3aXRoIHRoZSBjcnlw
dG9ncmFwaGljIAplbmdpbmUgKENSWVApIHRocm91Z2ggYSBkZWRpY2F0ZWQgaGFyZHdhcmUgYnVz
LgoKVGhpcyBhcmNoaXRlY3R1cmUgaW1wcm92ZXMgc2VjdXJpdHkgYm91bmRhcnk6IGtleXMgaXNv
bGF0ZWQgZnJvbSB0aGUgCm5vbi1zZWN1cmUgTGludXggZW52aXJvbm1lbnQuIEJ1dCBkZWNyeXB0
aW9uIGNhbiBiZSBwcm9jZXNzZWQgYnkgdGhlIApsaW51eCBrZXJuZWwuCgpJbiBhZGRpdGlvbiwg
U1TigJlzIGhhcmR3YXJlIGNyeXB0byBwZXJpcGhlcmFscyBjb21lIHdpdGggYnVpbHQtaW4gCnBy
b3RlY3Rpb25zIGFnYWluc3Qgc2lkZS1jaGFubmVsIGF0dGFja3MgYW5kIGhhdmUgYmVlbiBjZXJ0
aWZpZWQgd2l0aCAKU0VTSVAgYW5kIFBTQSBsZXZlbCAzIHNlY3VyaXR5IGFzc3VyYW5jZSwgcHJv
dmlkaW5nIGEgbGV2ZWwgb2Ygc2VjdXJpdHkgCmRpZmZpY3VsdCB0byBhY2hpZXZlIHdpdGggc29m
dHdhcmUgYWxvbmUuCgpSZWdhcmRpbmcgcm9idXN0bmVzcyBhbmQgbWFpbnRlbmFuY2UsIFNUIGVu
c3VyZXMgcmVndWxhciB1cGRhdGVzIG9mIGl0cyAKZHJpdmVycyBhbmQgY2FuIGZpeCBhbnkgcmVw
b3J0ZWQgYnVncy4gV2UgaGF2ZSBjb25kdWN0ZWQgaW50ZXJuYWwgdGVzdHMgCndpdGggZG0tY3J5
cHQgdGhhdCBkZW1vbnN0cmF0ZSB0aGUgcHJvcGVyIGZ1bmN0aW9uaW5nIG9mIHRoZXNlIGRyaXZl
cnMgCmZvciB0aGlzIHR5cGUgb2YgYXBwbGljYXRpb24uCgpNYXhpbWUKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
