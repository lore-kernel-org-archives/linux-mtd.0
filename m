Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A86C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Dec 2021 13:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:CC:To:From:MIME-Version:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=kGllWPusxqpPwx/1WhBqxZ4R3W7/T1JTbHsOVcLED/Q=; b=XQ+
	yz5NB6559OpXSKgtf/uK64LsBzCsgBHd3T0hlnMv/SI8vk/2thj3TZzcoYK2KoNTnmvHSSoKSklpc
	Ub5FowM+XGKVXv3sWoC4c98e1rETov3nu8VSVR8E4xAQfpRmB0RvEVzZvbLinRHXolo4ES6Rcomnn
	cw3MS6ljgziho2yx2zywoMXRBsV4VaLvZbIh9CNaSVJsMoMTaGIcFae2QU7q6oCsiKiE5mko4Mh3q
	VeNjgFPGDXvK0D4RD3c20lwLR+5Tsb9Eu/ffbRZfDgF5wHCBsYgwJYGq+w/ttMikWi9UsU6FqERV1
	IdX49z2vYpdTBhHq2yieNhlsgYDEktQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0kyS-00ECI6-Jq; Fri, 24 Dec 2021 13:51:08 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0kyN-00ECH9-GT
 for linux-mtd@lists.infradead.org; Fri, 24 Dec 2021 13:51:07 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1BODouiJ025195;
 Fri, 24 Dec 2021 07:50:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1640353856;
 bh=atzD/w/TVai0FPN0B6eJVShepwKKCijB+8dorelxp5c=;
 h=Date:From:To:CC:Subject;
 b=m0tOaN+VmTI2pIxZkGNq5WtrZ0YIB9qt/aqI9PCoBbPThPkOmxkxq8YjHLThTvsl/
 NJ9bTudibLGWLDxNQdgSzPe8wFVZActUk28JcTZLeUpBWAlJ/Dm9gXDm7pPnrRfcef
 FllQ3cqHyLg4nIaN+qHziGkIfcq7Fv8HEq8NLG8s=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1BODouXP106066
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 24 Dec 2021 07:50:56 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 24
 Dec 2021 07:50:56 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 24 Dec 2021 07:50:56 -0600
Received: from [172.24.145.18] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1BODosuO057338;
 Fri, 24 Dec 2021 07:50:55 -0600
Message-ID: <cbb28885-fb36-2847-d691-cf1dc5e5c386@ti.com>
Date: Fri, 24 Dec 2021 19:20:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>
CC: MTD Maling List <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?Q?=5bGIT_PULL=5d_CFI_and_HyperFlash_changes_for_v5=2e17-rc1?=
 =?UTF-8?B?4oCL?=
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211224_055103_726183_E22EB7AA 
X-CRM114-Status: GOOD (  10.13  )
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
Content-Type: multipart/mixed; boundary="===============6516109745280894892=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============6516109745280894892==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------n11j1AkCcdbMt7v4MEl7v6m6"

--------------n11j1AkCcdbMt7v4MEl7v6m6
Content-Type: multipart/mixed; boundary="------------nuZVpgtA9NFdZC4thV9SvGhK";
 protected-headers="v1"
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>
Cc: MTD Maling List <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Message-ID: <cbb28885-fb36-2847-d691-cf1dc5e5c386@ti.com>
Subject: =?UTF-8?Q?=5bGIT_PULL=5d_CFI_and_HyperFlash_changes_for_v5=2e17-rc1?=
 =?UTF-8?B?4oCL?=

--------------nuZVpgtA9NFdZC4thV9SvGhK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgIE1pcXVlbCwgUmljaGFyZCwNCg0KSGVyZSBpcyB0aGUgSHlwZXJCdXMvSHlwZXJGbGFz
aCByZWxhdGVkIFBSIGZvciB2NS4xNy1yYzEuIFRoYW5rcyENCg0KUmVnYXJkcw0KVmlnbmVz
aA0KDQpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IGZhNTViN2RjZGM0M2Mx
YWExYmExMmJjYTlkMmRkNDMxOGMyYTBkYmY6DQoNCiAgIExpbnV4IDUuMTYtcmMxICgyMDIx
LTExLTE0IDEzOjU2OjUyIC0wODAwKQ0KDQphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVw
b3NpdG9yeSBhdDoNCg0KICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4
L2tlcm5lbC9naXQvbXRkL2xpbnV4LmdpdCB0YWdzL2NmaS9mb3ItNS4xNw0KDQpmb3IgeW91
IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gYmFhZjk2NWY5NDMwODMwMWQyZGM1NTRkNzJhODdk
NzQzMmNkNWNlNjoNCg0KICAgbXRkOiBoeXBlcmJ1czogcnBjLWlmOiBmaXggYnVnIGluIHJw
Y2lmX2hiX3JlbW92ZSAoMjAyMS0xMS0yMSAxNzoyMTo0MCArMDUzMCkNCg0KLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQ0KSHlwZXJidXMgY2hhbmdlcyBmb3IgdjUuMTctcmMxDQoNCkh5cGVyYnVzIGNoYW5nZXM6
DQoNCkNvdXBsZSBvZiBmaXhlcyBpbiBSZW5lc2FzIGh5cGVyYnVzIHJwYy1pZiBkcml2ZXIg
dG8gYXZvaWQgY3Jhc2ggb24NCm1vZHVsZSByZW1vdmUgYW5kIGZvciBtaXNzaW5nIGNoZWNr
IGZvciBlcnJvciB2YWx1ZSBpbiBwcm9iZS4NCg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KR2VvcmdlIEcuIERh
dmlzICgxKToNCiAgICAgICBtdGQ6IGh5cGVyYnVzOiBycGMtaWY6IGZpeCBidWcgaW4gcnBj
aWZfaGJfcmVtb3ZlDQoNCkxhZCBQcmFiaGFrYXIgKDEpOg0KICAgICAgIG10ZDogaHlwZXJi
dXM6IHJwYy1pZjogQ2hlY2sgcmV0dXJuIHZhbHVlIG9mIHJwY2lmX3N3X2luaXQoKQ0KDQog
IGRyaXZlcnMvbXRkL2h5cGVyYnVzL3JwYy1pZi5jIHwgOCArKysrKy0tLQ0KICAxIGZpbGUg
Y2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KDQotLQ0KUmVnYXJk
cw0KVmlnbmVzaA0K

--------------nuZVpgtA9NFdZC4thV9SvGhK--

--------------n11j1AkCcdbMt7v4MEl7v6m6
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEyRC2zAhGcGjrhiNExEYeRXyRFuMFAmHF0D0FAwAAAAAACgkQxEYeRXyRFuMv
sQgApD4ZRkT87u6AZ6A4ONUL6IOJwXhXI09rZ99Ysd/GVQeOrOgh+6NtFpYNfMxy8u+5mptNHjft
G0Pi/K+T29i3bhSGZKpIzJ/hBbuyJ9zj3fOUSiqOpCVZdgP4eg2E1+78vadbQKz3SViZROoIxEYZ
9ZrWIWSy0q9HyvyFeojy1CkTJK+Zer+Px5yEpZFkprlHmi/1KJ4aWKs9hqokv0+JiA4JLM00Jjx2
Sbh5QjTysg/DALJ7Ln0zLNdu56q74Bm3jZ+w7Suo2gSB1jlDIjXaIeoKzT9qUnlT3MQ61R4tycbX
32tcoLSt7GPq04ZTkWTne5I07Kgs7SXnAfOUe40vRg==
=G+50
-----END PGP SIGNATURE-----

--------------n11j1AkCcdbMt7v4MEl7v6m6--


--===============6516109745280894892==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6516109745280894892==--

