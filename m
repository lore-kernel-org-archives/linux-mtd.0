Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B54EEA871
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Feb 2026 01:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vm4i6W1wWURRpWNJLZtBuMsHQAcZyEPOzpVdET4ApnY=; b=pbtnPLjbHvUSSUqAl4beG6S0DV
	6msR4oxkQ2q1P5gxIjQExBZEb+oe8WTASv0H69dIEvdHhUt/P92Q8Nd8BALcPJ2M8sZ7F2Zxdt1og
	PD2cSCAOvyEGyYVAYbC3eJoExnWQkPnWF65JcwIfxeb3cSvZEdfTtvDOTyFQZ4Xx86fZCZw4Zp4Ia
	J1zNKupVf/k7oKp7+PtE0F5FlQAU3P5X08mQD27kZ9gF5V/arORW59IpR3PKkpwt2LzH0Bmqy/F9S
	8mSejgiHaVrMMSpwR4MeNlQTv4fJN2nBsBbP3exb6Du7JJjtNZ6GEoeqWGr0UEidWjTb4GpPPCww1
	z6qJ/l4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqhnc-00000002oci-3N54;
	Fri, 13 Feb 2026 01:16:48 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqhnZ-00000002obD-0fUC
	for linux-mtd@lists.infradead.org;
	Fri, 13 Feb 2026 01:16:47 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=PDBtkcGgE2bTdLWKv0QUvjkQEEOWK7+mQz9j9Ab9Ceo=;
	b=ZmbQ4olQIWAcEio7rudrEETQqIBhx+8NJizP1GUvF513q39jlhvogW1ZuT1f4ZTOh0nb7q27k
	xVcZXRmR1PsNpmDyLwqG5hBFYhPrJxedPp5fhCKFBb+fz79umDcdDyk3keqXqiq8CrTZXPGqvfQ
	ZWvbih2tjEGO+is74ey0u/U=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4fBvJg6S4MzmV6v;
	Fri, 13 Feb 2026 09:11:47 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 2B4914048B;
	Fri, 13 Feb 2026 09:16:28 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 13 Feb 2026 09:16:27 +0800
Subject: Re: [BUG] UBIFS corruption on powerpc 32-bit targets
To: Tomas Alvarez Vanoli <tomas.alvarez-vanoli@hitachienergy.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <DB9PR06MB784979B96C388174F81F9103C29EA@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <d0eb0572-e383-466e-7b4f-97e4a853b7c5@huawei.com>
 <DB9PR06MB7849BCA2FA49A7AEE3D03104C299A@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <2e8dee20-842e-e946-87a0-9ff0190600ab@huawei.com>
 <DB9PR06MB7849E51C72D54F8109C55714C266A@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <581cbf94-a48b-3670-27bf-3ecca07ddcb8@huawei.com>
 <DB9PR06MB78496EADCD11536AA66C22CFC265A@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <8f65d531-b752-b058-4163-09a66fd9a7a1@huawei.com>
 <DB9PR06MB78496CB06BF8E60582CF40F7C262A@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <abfe8c37-11ea-a76d-5aea-014b39fcdf2e@huawei.com>
 <d5c8fe2d-2b78-3459-d176-da15ae24d1ab@huawei.com>
 <DB9PR06MB7849403569974A214C101D77C263A@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <01bac338-856c-599d-85d5-ed6485707310@huawei.com>
 <DB9PR06MB7849BA3437461A502A4C115BC260A@DB9PR06MB7849.eurprd06.prod.outlook.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <34046952-73cc-5a51-330c-ae841cf7cb95@huawei.com>
Date: Fri, 13 Feb 2026 09:16:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <DB9PR06MB7849BA3437461A502A4C115BC260A@DB9PR06MB7849.eurprd06.prod.outlook.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_171645_855985_9F1EBE20 
X-CRM114-Status: GOOD (  15.66  )
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
Content-Type: text/plain; charset="gbk"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

1NogMjAyNi8yLzEyIDIzOjQzLCBUb21hcyBBbHZhcmV6IFZhbm9saSDQtLXAOgo+PiBUaGUgJ3N5
bmMnIHN5c2NhbGwgd2lsbCBjYWxsIHViaWZzX29ycGhhbl9lbmRfY29tbWl0IGlmIHRoZSBvcmhw
YW4gbGlzdAo+PiBpcyBub3QgZW1wdHkuCj4+IHViaWZzX3N5bmNfZnMgLT4gdWJpZnNfcnVuX2Nv
bW1pdCAtPiBkb19jb21taXQgLT4gdWJpZnNfb3JwaGFuX2VuZF9jb21taXQKPj4KPj4gSW4gdWJp
ZnNfY3JlYXRlLCB0aGUgbmV3IGlub2RlIHdpbGwgYmUgYWRkZWQgaW50byBvcnBoYW4gbGlzdC4K
Pj4gdWJpZnNfY3JlYXRlIC0+IHViaWZzX25ld19pbm9kZSAtPiB1Ymlmc19hZGRfb3JwaGFuCj4+
Cj4+IFlvdSBjYW4gYWRkIHNvbWUgZGVidWcgbWVzc2FnZXMgdG8gY2hlY2sgd2hpY2ggY29uZGl0
aW9uIGlzIGJyb2tlbi4KPiAKPiBBbHJpZ2h0LCBpdCB3YXMgc29tZSB1c2VyIGVycm9yIDopIEkg
YW0gYWJsZSB0byByZXByb2R1Y2UgaXQgY29uc2lzdGVudGx5IG5vdy4KPiAKPiBXZSB3aWxsIGhh
dmUgdG8gYW5hbHl6ZSB3aGF0IHRvIGRvIGluIHRoZSBlbmQgYWJvdXQgdGhpcywgYmVjYXVzZSB3
ZSBoYXZlIG5vCj4gY29udHJvbCBvZiB3aGF0IHZlcnNpb25zIGFyZSBiZWluZyByYW4gaW4gd2hh
dCBvcmRlciBpbiB0aGUgZmllbGQuIEJhY2t3YXJkcwo+IGNvbXBhdGliaWxpdHkgYW5kIGJlaW5n
IGFibGUgdG8gc3dpdGNoIHZlcnNpb25zIGlzIGltcG9ydGFudC4gU2luY2UgdGhpcwo+IHZvbHVt
ZSBkb2VzIG5vdCB1c2UgZW5jcnlwdGlvbiBhbmQgM2FmMmQzYThjNTZmZTdkYzI0ZjYwYzRkZjBh
Yjg1YjdhYzk0MTkwMgo+IHNlZW1zIHRvIGJlIGZpeGluZyBhIGJ1ZyByZWxhdGVkIG9ubHkgdG8g
ZW5jcnlwdGlvbiwgd2UgbWlnaHQganVzdCByZXZlcnQgdGhlCj4gY29tbWl0IGZvciB0aGUgYWZm
ZWN0ZWQgYm9hcmRzLiBIb3BlZnVsbHkgdGhpcyB3aWxsIG5vdCBnZW5lcmF0ZSBvdGhlcgo+IHVu
Zm9yc2VlbiBjb25zZWN1ZW5jZXMuCgpJZiB0aGUgeGF0dHIoc2VsaW51eCxlbmNyeXB0aW9uLHVz
ZXJfeGF0dHIpIGlzIG5vdCBlbmFibGVkLCAKM2FmMmQzYThjNTZmZTdkYzI0ZjYwYzRkZjBhYjg1
YjdhYzk0MTkwMiBjYW4gYmUgcmV2ZXJ0ZWQuIEJ1dCB0aGUgCnByb2JsZW0gbWF5IHN0aWxsIGhh
cHBlbmQgaWYgYXBwbGljYXRpb24gbGlua3MgdGVtcGZpbGUuCj4gCj4gSSdsbCBzdWJtaXQgdGhl
IGZpeGVzIGZvciBtdGQtdXRpbHMgdG9tb3Jyb3cuClRoYW5rcy4gSSdsbCB0YWtlIGEgd2Vlay1s
b25nIHZhY2F0aW9uIHN0YXRydGluZyBmcm9tIDIuMTUuIFRoZXJlZm9yZSwgSSAKbWlnaHQgbm90
IGJlIGFibGUgdG8gcmVzcG9uZCBpbiB0aW1lLgo+IAo+IFRoYW5rcyBmb3IgYWxsIHRoZSBoZWxw
Cj4gQmVzdCBSZWdhcmRzLAo+IFRvbWFzLgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
