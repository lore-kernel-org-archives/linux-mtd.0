Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F1AC021AA
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Feb 2025 16:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sDNcLYr3058AwXoyFpAxWAPmkfkq7MkRPD+XCjOBZEE=; b=tREgsUV4rxM971ISsQamyitO8y
	R+5hlsg9WolGLFXy7G2fKugV7UVX9jJyFgN/uigMmhUEocGzZ1aqbCvKfHyZ+fHevFDA4kK9Yof7B
	X2qnvRYl8yjTyJ3RZ9SELqmf5K2U4t/LK07+13ovLkpbRK0lR8Vf4Mkt64ghejlDXGetCnhKh9hK9
	9rWPkt7YO20tJ9tqz/YfRbEZlkpXc3vowjrAClY2BQDqHjwOpbrRYK9+dqS79YEHT54lM8USDAnsR
	avvrRXA0oiGeQKV3JI5vp5qyRwXJMRfUyaX4+L48CWO7ipwUlmOTPAQhwR8mMnwNwwUb52dLNm+dW
	yHILcroA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkQPQ-00000008xF6-3Xsa;
	Tue, 18 Feb 2025 16:25:20 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkQLf-00000008wIm-2MwY
	for linux-mtd@lists.infradead.org;
	Tue, 18 Feb 2025 16:21:28 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-220c665ef4cso85149685ad.3
        for <linux-mtd@lists.infradead.org>; Tue, 18 Feb 2025 08:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739895686; x=1740500486; darn=lists.infradead.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NgrrDCqeApTDEG66OlLuDp5YeHAygXHEQ1ZxD38RAv8=;
        b=bZjgD0BXbKJ/dUtnIRvybrXXfwcg+3NF/gYRGLWvXYvzuems/ur8L47NRMy/P2wSUT
         aPe7LLGkt2DAKn2L7Afkk8ZUBR/LY2QWwfEq+v/Fg2yLb+bSzzC9w2ESWhSxuRoHN8Mb
         fUAGZ+0YXLrhJZLWOLzLbpA7nmskztRC1cE91wLrWi9vgyfdm3iCrRjexB2zbRogyIMM
         bhI+kSgwxyqQVuoU7QEUSCfn95MhHxwwRw6yzFbo9U0aFDS/O91go/NIb1XMPYaFJmUk
         0aTQTXKK0oiNUxiFX7HFW05pw2buct3KmEBMfpPR3YDBKUN2mUtKeXu6iblIowpDW1IR
         dLkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739895686; x=1740500486;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NgrrDCqeApTDEG66OlLuDp5YeHAygXHEQ1ZxD38RAv8=;
        b=peoou+Cl6o6MBi24Bp6BSisQHBU22841uESCxyUzDqjPQ92Pa/Ex2XZkZTMkU8xggs
         45bxJ60GQwW2f844LWcKDM9+T1Mo4XI54vOP0qF5Dz4lb9PTlZWHgLKl9TO8bBoYMCH5
         jvUHTcRdDx76xNOhFBm/jbrwuhuR4+nSPGD0j9k42qEfuNCwNOrT3TePxQI7Hsj8twdv
         7x8t1KO035P8jt8Hf+mreDhkql8IDR/K3fQSEqlnVgyHbqwY0VcMUmQu9fOfeJnHTfyW
         2+6yvqywMZxgV+TFOV35awOY3+xxiW1MEASc605qJkmwQOlxS2KPkNg2eI3VTFAN8sc2
         xQBA==
X-Forwarded-Encrypted: i=1; AJvYcCXBm+oYZJFV7xG6fvk8L9pq2xUw6lkIv0Td+cXSrM3cGROaOY/1cQD9JW7iUdyOPZAlbpd7PfoaL0M=@lists.infradead.org
X-Gm-Message-State: AOJu0YyexrNE475oNuXNsi2BqE2fIqzy4kU+vrr3Dgp90j0nEimCAxfc
	tEBra6P/ilK4skPDQB4tnZuw5kTW4vu50KOqziLGwGszCgUApnDe
X-Gm-Gg: ASbGncthnfnmZ4kZql1AMjObALokuN08vPlNSadyzw4JHFQGMfvpEnZDEQqV/fUsrmV
	nQmG5vf01qcLXQxPUl5649jZFKmNvvahaJxV56Y88vS29X4jL3PTVCTcYoHUrVD4P5675FINQ5g
	XbzJZCZHnJOlX+GLJhLW/+/Jo6Daucmvvi0oSsGY/k/y42ZHVJDS6O2IfDCaT3yTunAyrE7r2Ke
	BpSGcMCgkodcfD/OEitfuT1l97kz0LsULVVcmoqkiIIZqsa4niKMvHR7AWv7l1UWq1jdEeVf0FK
	ycOzeVUR+LQZFvgs/ZqfMT6OCfto3ITuO807UtqtZDChBMvY6jHOEv2XJUSBEePnXWhuBAE6iKJ
	S4Ew=
X-Google-Smtp-Source: AGHT+IHAd4pR7BxUDxeClWixLEXFV4cx7nOJ13WIqaKZlxlgmgls5s5WO5IMIiblItPc2KK9VZQJGw==
X-Received: by 2002:a05:6a21:4514:b0:1ee:171c:fc7f with SMTP id adf61e73a8af0-1ee8cb4b8bbmr24658710637.14.1739895686179;
        Tue, 18 Feb 2025 08:21:26 -0800 (PST)
Received: from ?IPV6:2601:646:8201:fd20:a0d5:7fc6:9ac6:7366? ([2601:646:8201:fd20:a0d5:7fc6:9ac6:7366])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7326d348076sm5832691b3a.77.2025.02.18.08.21.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2025 08:21:25 -0800 (PST)
Message-ID: <546dee0d-ce9c-48fb-bf79-72349760cb62@gmail.com>
Date: Tue, 18 Feb 2025 08:21:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH mtd-utils 4/5] configure.ac: Add a check for execinfo and
 backtrace
To: Fabio Estevam <festevam@gmail.com>, Zhihao Cheng <chengzhihao1@huawei.com>
Cc: david.oberhollenzer@sigma-star.at, linux-mtd@lists.infradead.org
References: <20250218001512.1862030-1-festevam@gmail.com>
 <20250218001512.1862030-4-festevam@gmail.com>
 <2bdc04b3-05c8-42f4-682b-e46a1a1a10c1@huawei.com>
 <CAOMZO5CnxXYpM0QeuZD4Dwd0RmCEXXD6XUaSSkeBfE9cooLZNQ@mail.gmail.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: <CAOMZO5CnxXYpM0QeuZD4Dwd0RmCEXXD6XUaSSkeBfE9cooLZNQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_082127_610438_8AA1073F 
X-CRM114-Status: GOOD (  21.29  )
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
Content-Type: multipart/mixed; boundary="===============8931904715451468660=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============8931904715451468660==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------cWHNd0vV38kLsV52QY5jP6FD"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------cWHNd0vV38kLsV52QY5jP6FD
Content-Type: multipart/mixed; boundary="------------Di37q2KX077rAhT0082ytWqK";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Fabio Estevam <festevam@gmail.com>, Zhihao Cheng <chengzhihao1@huawei.com>
Cc: david.oberhollenzer@sigma-star.at, linux-mtd@lists.infradead.org
Message-ID: <546dee0d-ce9c-48fb-bf79-72349760cb62@gmail.com>
Subject: Re: [PATCH mtd-utils 4/5] configure.ac: Add a check for execinfo and
 backtrace
References: <20250218001512.1862030-1-festevam@gmail.com>
 <20250218001512.1862030-4-festevam@gmail.com>
 <2bdc04b3-05c8-42f4-682b-e46a1a1a10c1@huawei.com>
 <CAOMZO5CnxXYpM0QeuZD4Dwd0RmCEXXD6XUaSSkeBfE9cooLZNQ@mail.gmail.com>
In-Reply-To: <CAOMZO5CnxXYpM0QeuZD4Dwd0RmCEXXD6XUaSSkeBfE9cooLZNQ@mail.gmail.com>

--------------Di37q2KX077rAhT0082ytWqK
Content-Type: multipart/mixed; boundary="------------LXqybjbMe2LyJGdfSv9rUwzA"

--------------LXqybjbMe2LyJGdfSv9rUwzA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMi8xOC8yNSAzOjAxIEFNLCBGYWJpbyBFc3RldmFtIHdyb3RlOg0KPiBIaSBaaGloYW8s
DQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcmV2aWV3Lg0KPiANCj4gT24gVHVlLCBGZWIgMTgs
IDIwMjUgYXQgNjo0OOKAr0FNIFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5j
b20+IHdyb3RlOg0KPiANCj4+IEhpIEZhYmlvLA0KPj4gSSdtIG5vdCBzdXJlIHdoaWNoIGxp
YiBpcyBkZXBlbmRlZCBmb3IgZXhlY2luZm8gYnkgbXVzbC4gV2UgZG9uJ3QgZGVwZW5kDQo+
PiBhbnkgbGlicyBmb3Igb3RoZXIgY29tbW9uIGNvbXBpbGVycywgb3RoZXJ3aXNlIHdlIGNv
dWxkIGdldCBmb2xsb3dpbmcNCj4+IG1lc3NnYWdzIGZvciBkb2luZyBjb25maWd1cmU6DQo+
IA0KPiBUaGUgbXVzbCBsaWJyYXJ5IGRvZSBub3QgcHJvdmlkZSBleGVjaW5mby4NCj4gSXQg
cmVsaWVzIG9uIGFuIGV4dGVybmFsIGV4ZWNpbmZvIGxpYnJhcnkgdG8gcHJvdmlkZSBiYWNr
dHJhY2Ugc3VwcG9ydC4NCj4gDQo+PiAgICBjaGVja2luZyBmb3Igc3lzL3JhbmRvbS5oLi4u
IHllcw0KPj4gY2hlY2tpbmcgZm9yIGJhY2t0cmFjZSBpbiAtbGV4ZWNpbmZvLi4uIG5vICAj
IEluIGZhY3QgYmFja3RyYWNlIGlzDQo+PiBzdXBwb3J0ZWQsIGJ1dCB0aGUgbWVzc2FnZSB0
ZWxscyB1cyBub3QuDQo+IA0KPiBUaGF0IG1lc3NhZ2UgaXMgT0suIEluIHRoaXMgY2FzZSwg
dGhlIGJhY2t0cmFjZSBkb2VzIG5vdCBjb21lIGZyb20gdGhlDQo+IGV4dGVybmFsIGxpYmV4
ZWNpbmZvLg0KPiBJdCBjb21lcyBmcm9tIHRoZSBDIGxpYnJhcnkuIEl0IGRvZXMgbm90IG1l
YW4gdGhhdCBiYWNrdHJhY2UgaXMgbm90DQo+IHN1cHBvcnRlZC4gSXQgb25seSBtZWFucyB0
aGF0DQo+IGJhY2t0cmFjZSBkb2VzIG5vdCBjb21lIGZyb20gdGhlIGV4dGVybmFsIGxpYmV4
ZWNpbmZvLg0KPiANCj4gV2l0aCBtdXNsLCB0aGUgZm9sbG93aW5nIGlzIHNlZW46DQo+IA0K
PiBjaGVja2luZyBmb3IgYmFja3RyYWNlIGluIC1sZXhlY2luZm8uLi4geWVzDQo+IA0KPiBU
aGlzIG1lYW5zIHRoYXQgYmFja3RyYWNlIGNvbWVzIGZyb20gdGhlIGV4dGVybmFsIGxpYmV4
ZWNpbmZvLg0KDQptYXliZSBjaGVjayBmb3IgYmFja3RyYWNlIGZ1bmN0aW9uIGluIGxpYmMg
Zmlyc3QgYW5kIGlmIG5vdCBmb3VuZCB0aGVuIA0KdHJ5IGxpYmV4ZWNpbmZvIGNoZWNrLg0K
DQo+IA0KPiBJIHdpbGwgYWRkcmVzcyB5b3VyIG90aGVyIGNvbW1lbnRzIGFuZCBzdWJtaXQg
YSB2MiBzb29uLg0KPiANCj4gVGhhbmtzDQo=
--------------LXqybjbMe2LyJGdfSv9rUwzA
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------LXqybjbMe2LyJGdfSv9rUwzA--

--------------Di37q2KX077rAhT0082ytWqK--

--------------cWHNd0vV38kLsV52QY5jP6FD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCZ7SzhAUDAAAAAAAKCRC7BTNVkZ0zFFOt
AJoDXujadHLSxOATym94cVwCmkKVeACfftaSl2g8d+owPUZFtTSeA6kaPCc=
=WEcm
-----END PGP SIGNATURE-----

--------------cWHNd0vV38kLsV52QY5jP6FD--


--===============8931904715451468660==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8931904715451468660==--

