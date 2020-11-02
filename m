Return-Path: <SRS0=MFHV=EI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F19C3C00A89
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 06:07:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9202C21556
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 06:07:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eNA1FXu4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=adva.com header.i=@adva.com header.b="HbNnm3CI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9202C21556
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=adva.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MF8Fs6Y31xd+u7iAKGaF2X3jNxzz7NxAJthl3nKvaG4=; b=eNA1FXu43gkJFbZzkmGrYOxmF
	ArI06bYXyp8ZRTgwcjQ6RfgGzuPofydyA9EbG5CyQRIXJAqQmRJCk1cKV4n3cZiQpsaPQnDCCiyxL
	wNdNlMiR8e86UYqzbZGdIP1+e363By08Il3AyVwmJLlmFKA+iVKetCUfyoXc5pBtkFUpmF/mFY4On
	kW8szGmnFCLztW2QqPFPFNN3ekdBoha98B+GPlV+7+HpWOuR5Q3bJ+08BeZbOJSbR+kPT0f9LWVBU
	PEd7vShXUrtFLs0I37KrQnbBIi33lJNn03cjGhkbgYnYU4vsa/c9Zg2FB6NSza9ZxDkYQC76+Rq1Y
	TkCjv769w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZSzG-0000t2-At; Mon, 02 Nov 2020 06:06:38 +0000
Received: from mail01.advaoptical.com ([91.217.199.20])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZSzA-0000rs-FL
 for linux-mtd@lists.infradead.org; Mon, 02 Nov 2020 06:06:34 +0000
Received: from pps.filterd (muc-vs-mailppa1.advaoptical.com [127.0.0.1])
 by muc-vs-mailppa1.advaoptical.com (8.16.0.42/8.16.0.42) with SMTP id
 0A266QYm010186; Mon, 2 Nov 2020 07:06:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=adva.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=dkad20200122;
 bh=bPO7McDUlHXoIVBYaBU3zvJ/ik0c8aP3C7WIXDNOCLI=;
 b=HbNnm3CIpUrUKbF6K17uXS3ryQIzR4ClLOJje+jTxFPGDco3TItZ3DNoVfwuirArp9Kt
 gTafyNusRYsX87yDsx2AdSWCepf160qNJOgBOhgbHUxhRidY1vk1ZI+JPIKUUlpcseKO
 sKqXdo4p7eR4XH/hJNvJTKFYuelEVD+neTgNo6x132c9I2IbgN+jJM8fOLrXXVcHvLrZ
 mAurkya+JGGn1y3W0FVtdFvPeM5LuyzwlvB9F35IqW1RBEbJ6ogCG2lp5X/T6ljHOaux
 sUcySucu9lgg2VnbIWXAXQCn03uCHzl3GXCWHPupOgUJxC4oxWBbVXlSzXygvcPw1yKF 7g== 
Received: from muc-s-ex16c.advaoptical.com ([172.20.1.27])
 by muc-vs-mailppa1.advaoptical.com with ESMTP id 34h01rhkkd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
 Mon, 02 Nov 2020 07:06:26 +0100
Received: from MGN-S-EX19A.advaoptical.com (172.25.1.193) by
 MUC-S-EX16C.advaoptical.com (172.20.1.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 2 Nov 2020 07:06:26 +0100
Received: from MGN-S-EX19A.advaoptical.com (172.25.1.193) by
 MGN-S-EX19A.advaoptical.com (172.25.1.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.721.2; 
 Mon, 2 Nov 2020 07:06:25 +0100
Received: from MGN-S-EX19A.advaoptical.com ([fe80::303d:9391:e615:ea37]) by
 MGN-S-EX19A.advaoptical.com ([fe80::303d:9391:e615:ea37%7]) with mapi id
 15.02.0721.002; Mon, 2 Nov 2020 07:06:25 +0100
From: Barak Adam <BAdam@adva.com>
To: Richard Weinberger <richard@nod.at>
Subject: RE: UBIFS corruption in empty space during mount
Thread-Topic: UBIFS corruption in empty space during mount
Thread-Index: AdatrnVGUyizTmJwTt+/2sPCJIuVRgAKHUMAAApdQvCEM+l7GoQuMFZw
Date: Mon, 2 Nov 2020 06:06:25 +0000
Message-ID: <75f2f7306c284860beb1769b93d54269@adva.com>
References: <a60546366eb049698c7a0b5426361833@adva.com>
 <CAFLxGvyZUBgXyNkj0EO5pWntjfn7jObqU7XKZXxvjsQ=RN9WKw@mail.gmail.com>
 <1ffeedca15604810936ebb032b9af57c@adva.com>
 <1907654217.241602.1604006369174.JavaMail.zimbra@nod.at>
In-Reply-To: <1907654217.241602.1604006369174.JavaMail.zimbra@nod.at>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.20.1.232]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-02_01:2020-10-30,
 2020-11-02 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_010632_870047_E47A9163 
X-CRM114-Status: GOOD (  17.36  )
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
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUmljaGFyZCwNCg0KSXQgaXMgZGV0ZWN0ZWQgYXMgYW4gZW1wdHkgYXJlYSBieSBVQklGUy4g
UmVnYXJkaW5nIGJpdGZsaXBzLCBJIGFtIG5vdCBzdXJlLiBJIGFtIHJ1bm5pbmcgaXQgd2l0aCBk
ZWJ1ZyBwcmludG91dHMsIHRvIGR1bXAgdGhlIGNvcnJ1cHRpb24gYW5kIGFuYWx5emUgaXQuDQpB
bnkgb3RoZXIgaWRlYSBob3cgdG8gZGV0ZWN0IGlmIHRoZSB1bmRlcmx5aW5nIGNvcnJ1cHRpb24g
aXMgYml0ZmxpcHMgb3Igc29tZXRoaW5nIGVsc2U/DQpUaGUgcmV0dXJuZWQgZXJyb3IgYnkgdGhl
IGxvd2VyIGxheWVyIGlzIC1FQkFETVNHIHdoaWNoIEkgZ3Vlc3MgaW5kaWNhdGVzIGFuIHVucmVj
b3ZlcmFibGUgRUNDIGVycm9yIGluIHRoZSBtZWRpYS4NCg0KVGhhbmtzLA0KQmFyYWsNCg0KLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFy
ZEBub2QuYXQ+DQpTZW50OiBUaHVyc2RheSwgT2N0b2JlciAyOSwgMjAyMCAxMToxOSBQTQ0KVG86
IEJhcmFrIEFkYW0gPEJBZGFtQGFkdmEuY29tPg0KQ2M6IGxpbnV4LW10ZCA8bGludXgtbXRkQGxp
c3RzLmluZnJhZGVhZC5vcmc+DQpTdWJqZWN0OiBSZTogVUJJRlMgY29ycnVwdGlvbiBpbiBlbXB0
eSBzcGFjZSBkdXJpbmcgbW91bnQNCg0KRXh0ZXJuYWwgZW1haWw6IFtyaWNoYXJkQG5vZC5hdF0N
Cg0KLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLg0KQmFyYWssDQoNCi0tLS0tIFVyc3Byw7xuZ2xpY2hlIE1haWwgLS0t
LS0NCj4+IFZvbjogIkJhcmFrIEFkYW0iIDxCQWRhbUBhZHZhLmNvbT4NCj4+IFRoYW5rcyBSaWNo
YXJkLg0KPj4NCj4+IEkgYWxyZWFkeSBhcHBsaWVkIHRob3NlIHBhdGNoZXMsIGJ1dCB0aGUgaXNz
dWUgaXMgbm90IHlldCBjb3ZlcmVkIC8gcmVzb2x2ZWQuDQo+Pg0KPj4gV2hhdCBraW5kIG9mIGEg
Zml4IHNob3VsZCBJIGFwcGx5IHRvIHRoZSBkcml2ZXIgbGF5ZXIgLSByYWlzZSBFQ0MNCj4+IGVy
cm9ycyBmb3IgdGhlIHVwcGVyIGxheWVycyBldmVuIHdoZW4gcmVhZHkgZW1wdHkgLyBlcmFzZWQg
YXJlYSA/DQoNCj5NYXliZSB5b3UncmUgZmFjaW5nIHNvbWV0aGluZyBlbHNlLiBEaWQgeW91IHZl
cmlmeSB0aGF0IGl0IGlzIHJlYWxseSBmbGlwcGVkIGJpdHMgaW4gZW1wdHkgc3BhY2U/DQoNCj5U
aGFua3MsDQo+Ly9yaWNoYXJkDQpQbGVhc2Ugc2VlIG91ciBwcml2YWN5IHN0YXRlbWVudCBhdCBo
dHRwczovL3d3dy5hZHZhLmNvbS9lbi9hYm91dC11cy9sZWdhbC9wcml2YWN5LXN0YXRlbWVudCBm
b3IgZGV0YWlscyBvZiBob3cgQURWQSBwcm9jZXNzZXMgcGVyc29uYWwgaW5mb3JtYXRpb24uDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
