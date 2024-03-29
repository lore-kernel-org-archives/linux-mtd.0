Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E308FCD1290
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Mar 2024 15:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:From:To:MIME-Version:Date:Message-ID:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=vbxxMD96VjlwZLqT8Q7+SrPSxW0Tv482BPvg9jMtS5Q=; b=eV7
	OeVYNclZvP1UxYsD2279HfcWv6m99HDcptmDmI2oBpgbVAkjd3+jgh/8Ysp1HLAFPMsPnIZjhaQBi
	BoLc3dqnI4ULQ8Y7mI54xnOqUAWYYWxpygMlVQwRrP52CfWvipOZ1egh8Wp4tWuU1Rg+yxrFZIW9B
	grwKDHqhGYY8rES4UMVjWmWwrqcHMQTFAyVrhdryKdVYZmvyNwT3TbR4iWlkeLEUpuSpQpvUtALHU
	6FqcGFZ7QsVqEdNXaySdAfoWqFZ4LGemVu8uDa6b/VplGfcucF1MthTfdktLy/TjZiQLakdBSv7z0
	WxatEcAWv/xaHIhvm+qtbeySmlVPVhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqET8-00000001CtF-3N3D;
	Fri, 29 Mar 2024 15:48:38 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqET5-00000001CsP-3Eww
	for linux-mtd@lists.infradead.org;
	Fri, 29 Mar 2024 15:48:37 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4154614b47eso9388445e9.1
        for <linux-mtd@lists.infradead.org>; Fri, 29 Mar 2024 08:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1711727312; x=1712332112; darn=lists.infradead.org;
        h=subject:from:to:content-language:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mOpCjJ1R3vcdlB6nM52RthXZ92LEs03kwfpHa7MbaNM=;
        b=PEoPEkYaQiL8hV+1TNrIKoQ3kPINpTxvWrzXqR3tnuWqgfiFxnem1o2XN9fQmQ4yz1
         1ZmGFfbV57hoIf1GJqzq3HJ/6oocqrbO5lSVj0slviqcj/zzlRex/v4dp9EI6Xf4Oj/A
         fX4s3AAjf0z2vIUlXNDmArxbp2DroWxQZxwOUG4218fbEDwAucULjaApW1WSkjgyp/1P
         dl39DiwhjkcPKsmzk55TvqaRLcEMdcPg3hUvMugZghxKXxCcH6vBaNiCGjEfSW476nQK
         4vQTfgj0ON0xaCpehFKY928Ty0VshP1mFvhAmyEWmk8ExfhRXA4sc/OUXz3V1FIahXlh
         ceHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711727312; x=1712332112;
        h=subject:from:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mOpCjJ1R3vcdlB6nM52RthXZ92LEs03kwfpHa7MbaNM=;
        b=R3I5dHukeKSVE+xc96hnJgPZoV4wFQQNrQj0YynE9OhMY1cwMoBtpCmr7V/mTCkx87
         KtKU0Lghkn0pZ64InJtLVqHoFyMz6RWIfX2V6voZUeXVa6LcwCkRYUCJoVF0sPJsNPy0
         jvoF6z2QI/ldYO/T00tGB41ge8dJGFEIX41HYQtQsI4fm8spVFJoOvESywZUEVb6vf7u
         4AYWah/jsRy05I/hWwFdxN+AfmT4pquYIVDeEDJOZgzPzz5d683QKwnslpK8S/PyneqU
         bm6tYzxqHFUFTGd9r5KZ6pUyaxTcOxpmEqNcssBvYWpIJK04SnTPyCG8PCxaY6QRVETm
         nyRg==
X-Gm-Message-State: AOJu0YwnmD89YdAYT0dCBvUQJII9t+hv6ANuQofKtz4mwSHSZuvgHN4g
	+eW1FF1bTX4aLDGc89dOVzysbG51ENaBKhgQgV1FUmKFAXxrHdQTsNHSURCCKslfqtrMgbXtzDJ
	SXyQ8JA==
X-Google-Smtp-Source: AGHT+IEhHq2TnZ6/KrHCMIYvnIh4OGdQDc/N3QmfeAxU84VU4ErmACzZmH6EboD8ImI/TnW3NVakig==
X-Received: by 2002:a05:600c:1d14:b0:414:90ab:9d29 with SMTP id l20-20020a05600c1d1400b0041490ab9d29mr4982566wms.0.1711727311792;
        Fri, 29 Mar 2024 08:48:31 -0700 (PDT)
Received: from [192.168.178.86] (clnet-p04-043.ikbnet.co.at. [83.175.81.43])
        by smtp.gmail.com with ESMTPSA id r12-20020a05600c458c00b004146e58cc35sm8986122wmo.46.2024.03.29.08.48.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Mar 2024 08:48:31 -0700 (PDT)
Message-ID: <d24a0c5f-8096-486c-a6bc-002e0172ea6c@sigma-star.at>
Date: Fri, 29 Mar 2024 16:48:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: MTD Mailing List <linux-mtd@lists.infradead.org>,
 Buildroot Mailing List <buildroot@busybox.net>,
 "Josh Boyer (Fedora)" <mtd-utils-maintainers@fedoraproject.org>,
 "Bastian Germann (Debian)" <bage@debian.org>,
 =?UTF-8?Q?Tomasz_Pawe=C5=82_Gajc_=28OpenMandriva=29?=
 <bero+massbuild@lindev.ch>, =?UTF-8?B?0JDQu9C10LrRgdCw0L3QtNGAIChSb3NhIExp?=
 =?UTF-8?Q?nux=29?= <a.proklov@rosalinux.ru>,
 Embedded Gentoo <embedded@gentoo.org>, "Robin H. Johnson"
 <robbat2@gentoo.org>, "John (Entware)" <john@phrozen.org>,
 "Michael Tross (T2 SDE)" <michael@tross.org>,
 "Oliver Schinagl (Alpine)" <oliver@schinagl.nl>,
 "Orphaned (Void Linux)" <orphan@voidlinux.org>,
 "Sergey Bolshakov (ALT Linux)" <sbolshakov@altlinux.org>,
 "Silvan Calarco (openmamba)" <silvan.calarco@mambasoft.it>,
 "Viric (nixpkgs)" <viric@viric.name>,
 "Pascal Bleser (SUSE)" <pascal.bleser@opensuse.org>,
 "Levente Polyak (Arch)" <anthraxx@archlinux.org>,
 =?UTF-8?Q?Llu=C3=ADs_Batlle_i_Rossell_=28NixOS=29?= <shaba@altlinux.org>,
 Richard Weinberger <richard@nod.at>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [ANNOUNCE] mtd-utils-2.2.0 is released
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_084836_174856_845F8E77 
X-CRM114-Status: GOOD (  13.17  )
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
Content-Type: multipart/mixed; boundary="===============5408277957566851897=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============5408277957566851897==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------7guYSbyktT0Ts6VFupSS0vHK"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------7guYSbyktT0Ts6VFupSS0vHK
Content-Type: multipart/mixed; boundary="------------GdrI1v83fEp0RYiTK0C07N42";
 protected-headers="v1"
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: MTD Mailing List <linux-mtd@lists.infradead.org>,
 Buildroot Mailing List <buildroot@busybox.net>,
 "Josh Boyer (Fedora)" <mtd-utils-maintainers@fedoraproject.org>,
 "Bastian Germann (Debian)" <bage@debian.org>,
 =?UTF-8?Q?Tomasz_Pawe=C5=82_Gajc_=28OpenMandriva=29?=
 <bero+massbuild@lindev.ch>, =?UTF-8?B?0JDQu9C10LrRgdCw0L3QtNGAIChSb3NhIExp?=
 =?UTF-8?Q?nux=29?= <a.proklov@rosalinux.ru>,
 Embedded Gentoo <embedded@gentoo.org>, "Robin H. Johnson"
 <robbat2@gentoo.org>, "John (Entware)" <john@phrozen.org>,
 "Michael Tross (T2 SDE)" <michael@tross.org>,
 "Oliver Schinagl (Alpine)" <oliver@schinagl.nl>,
 "Orphaned (Void Linux)" <orphan@voidlinux.org>,
 "Sergey Bolshakov (ALT Linux)" <sbolshakov@altlinux.org>,
 "Silvan Calarco (openmamba)" <silvan.calarco@mambasoft.it>,
 "Viric (nixpkgs)" <viric@viric.name>,
 "Pascal Bleser (SUSE)" <pascal.bleser@opensuse.org>,
 "Levente Polyak (Arch)" <anthraxx@archlinux.org>,
 =?UTF-8?Q?Llu=C3=ADs_Batlle_i_Rossell_=28NixOS=29?= <shaba@altlinux.org>,
 Richard Weinberger <richard@nod.at>
Message-ID: <d24a0c5f-8096-486c-a6bc-002e0172ea6c@sigma-star.at>
Subject: [ANNOUNCE] mtd-utils-2.2.0 is released

--------------GdrI1v83fEp0RYiTK0C07N42
Content-Type: multipart/mixed; boundary="------------pPDMSec82Ky4JKmYwlg0bNaV"

--------------pPDMSec82Ky4JKmYwlg0bNaV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCm10ZC11dGlscy0yLjIuMCBpcyByZWxlYXNlZC4NCg0KVGFyYmFsbDogICAgICAg
ICAgICAgICBmdHA6Ly9mdHAuaW5mcmFkZWFkLm9yZy9wdWIvbXRkLXV0aWxzL210ZC11dGls
cy0yLjIuMC50YXIuYnoyDQpUYXJiYWxsIGdwZyBzaWduYXR1cmU6IGZ0cDovL2Z0cC5pbmZy
YWRlYWQub3JnL3B1Yi9tdGQtdXRpbHMvbXRkLXV0aWxzLTIuMi4wLnRhci5iejIuYXNjDQpT
aWduZWQgZ2l0IHRhZzogICAgICAgIGdpdDovL2dpdC5pbmZyYWRlYWQub3JnL210ZC11dGls
cy5naXQgdjIuMi4wDQoNCg0KQWx0ZXJuYXRpdmVseSBhbHNvIG1pcnJvcmVkIGhlcmU6DQoN
ClRhcmJhbGw6ICAgICAgICAgICAgICAgaHR0cHM6Ly9pbmZyYXJvb3QuYXQvcHViL210ZC9t
dGQtdXRpbHMtMi4yLjAudGFyLmJ6Mg0KVGFyYmFsbCBncGcgc2lnbmF0dXJlOiBodHRwczov
L2luZnJhcm9vdC5hdC9wdWIvbXRkL210ZC11dGlscy0yLjIuMC50YXIuYnoyLmFzYw0KU2ln
bmVkIGdpdCB0YWc6ICAgICAgICBodHRwczovL2dpdC5pbmZyYXJvb3QuYXQvbXRkLXV0aWxz
LmdpdCB2Mi4yLjANCg0KDQpUaGlzIGlzIGEgc21hbGwgcmVsZWFzZSBvZiBjaGFuZ2VzIHRo
YXQgaGF2ZSBhY2N1bXVsYXRlZCBzaW5jZSBsYXN0IEF1Z3VzdC4NCkFzIGl0IGNvbnRhaW5z
IG1haW5seSBuZXcgY29tbWFuZCBsaW5lIHN3aXRjaGVzIChpLmUuIGZlYXR1cmVzKSBmb3Ig
c29tZQ0Kb2YgdGhlIHRvb2xzLCB0aGlzIHJlY2VpdmVzIGEgbWlub3IgdmVyc2lvbiBidW1w
Lg0KDQpUaGUgQXV0b3Rvb2xzIGJhc2VkIGJ1aWxkIHN5c3RlbSBhbHNvIHJlY2VpdmVkIGEg
c2xpZ2h0IG92ZXJoYXVsLCBjbGVhbmluZw0KdXAgaG93IGNvbmZpZ3VyZSBzd2l0Y2hlcyBh
bmQgZGVwZW5kZW5jaWVzIGFyZSBoYW5kbGVkLiBJdCBzaG91bGQgbm93DQphbHNvIGJlIHBv
c3NpYmxlIHRvIGNvbXBpbGUgbXRkLXV0aWxzIHdpdGhvdXQgcmVxdWlyaW5nIHpsaWIuDQoN
Cg0KQ2hhbmdlcyBmcm9tIDIuMS42IHRvIDIuMi4wOg0KDQpGZWF0dXJlczoNCiAgICAgICB1
YmlhdHRhY2g6IGludHJvZHVjZSBkaXNhYmxlX2ZtIGluIFVCSV9JT0NBVFQNCiAgICAgICB1
YmlhdHRhY2g6IGludHJvZHVjZSBuZWVkX3Jlc3ZfcG9vbCBpbiBVQklfSU9DQVRUDQogICAg
ICAgZmxhc2hfZXJhc2U6IEFkZCBhbiBvcHRpb24gZm9yIEpGRlMyIGNsZWFubWFya2VyIHNp
emUNCiAgICAgICBmbGFzaGNwOiBBZGQgd3JpdGUgbGFzdCBvcHRpb24NCiAgICAgICBBZGQg
YSBSRUFETUUgYW5kIENIQU5HRUxPRyBmaWxlcw0KICAgICAgIEFkZCBhIGJ1aWxkIHN1bW1h
cnkgdG8gY29uZmlndXJlLmFjDQoNCkZpeGVzOg0KICAgICAgIG1rZnMudWJpZnM6IGZpeCB4
YXR0ciBzY2FubmluZyBmb3IgYnVpbGRzIHdpdGggc2VsaW51eCBzdXBwb3J0DQogICAgICAg
amZmczJkdW1wOiBjaGVjayByZXR1cm4gdmFsdWUgb2YgbHNlZWsNCiAgICAgICBBZGQgbWlz
c2luZyBhdXRvY29uZiBjaGVjayBmb3IgQVINCg0KQ2hhbmdlczoNCiAgICAgICBDbGVhbnVw
IGFuZCB1bmlmeSBoYW5kbGluZyBvZiBvcHRpb25hbCBkZXBlbmRlbmNpZXMsIGNvbmZpZ3Vy
ZSBzd2l0Y2hlcw0KICAgICAgIE1ha2UgY29tcGlsYXRpb24gd2l0aCB6bGliIG9wdGlvbmFs
DQoNCg0KUmF3IHNob3J0IGxvZyBzaW5jZSB0aGUgMi4xLjYgcmVsZWFzZToNCg0KRGF2aWQg
T2JlcmhvbGxlbnplciAoMTgpOg0KICAgICAgIGpmZnMyZHVtcDogY2hlY2sgcmV0dXJuIHZh
bHVlIG9mIGxzZWVrDQogICAgICAgUGllY2UgdG9nZXRoZXIgYSBDSEFOR0VMT0cgZmlsZSBm
cm9tIHRoZSByZWxlYXNlIGFubm91bmNtZW50cw0KICAgICAgIFB1bGwgdGhlIGJ1bGsgb2Yg
dGhlIHByZSAyLjAuMCBjaGFuZ2VzIGZyb20gdGhlIGdpdCB0cmVlDQogICAgICAgQWRkIGEg
UkVBRE1FIGZpbGUNCiAgICAgICBDbGVhbnVwOiByZW1vdmUgc2VsZiBhc3NpZ24NCiAgICAg
ICBta2ZzLnViaWZzOiBmaXggeGF0dHIgc2Nhbm5pbmcgZm9yIGJ1aWxkcyB3aXRoIHNlbGlu
dXggc3VwcG9ydA0KICAgICAgIEFkZCBtaXNzaW5nIGF1dG9jb25mIGNoZWNrIGZvciBBUg0K
ICAgICAgIENsZWFudXAgaGFuZGxpbmcgb2Ygb3B0aW9uYWwgZGVwZW5kZW5jaWVzDQogICAg
ICAgRml4IG9wdGlvbmFsIGNvbXBpbGF0aW9uIG9mIGx6byBjb21wcmVzc29ycw0KICAgICAg
IE1ha2UgaXQgcG9zc2libGUgdG8gY29tcGlsZSBqZmZzWC11dGlscyB3aXRob3V0IHpsaWIN
CiAgICAgICBNYWtlIGl0IHBvc3NpYmxlIHRvIGNvbXBpbGUgbWtmcy51YmlmcyB3aXRob3V0
IHpsaWINCiAgICAgICBNYWtlIHpsaWIgYW4gb3B0aW9uYWwgZGVwZW5kZW5jeQ0KICAgICAg
IENsZWFudXA6IFVuaWZ5IGhhbmRsaW5nIG9mIE9wZW5TU0wgZGVwZW5kZW5jeQ0KICAgICAg
IFVuaWZ5IGhhbmRsaW5nIG9mIGNvbmZpZ3VyZSBzd2l0Y2hlcw0KICAgICAgIEFkZCBhIGJ1
aWxkIHN1bW1hcnkgdG8gY29uZmlndXJlLmFjDQogICAgICAgVXBkYXRlIFJFQURNRS50eHQN
CiAgICAgICBVcGRhdGUgQ0hBTkdFTE9HLm1kDQogICAgICAgUmVsZWFzZSBtdGQtdXRpbHMt
Mi4yLjANCg0KUGlvdHIgRXNkZW4tVGVtcHNraSAoMSk6DQogICAgICAgZmxhc2hjcDogQWRk
IHdyaXRlIGxhc3Qgb3B0aW9uLg0KDQpUYWthaGlybyBLdXdhbm8gKDEpOg0KICAgICAgIG10
ZC11dGlsczogZmxhc2hfZXJhc2U6IEFkZCBhbiBvcHRpb24gZm9yIEpGRlMyIGNsZWFubWFy
a2VyIHNpemUNCg0KWmhpaGFvIENoZW5nICgyKToNCiAgICAgICB1YmlhdHRhY2g6IGludHJv
ZHVjZSBkaXNhYmxlX2ZtIGluIFVCSV9JT0NBVFQNCiAgICAgICB1YmlhdHRhY2g6IGludHJv
ZHVjZSBuZWVkX3Jlc3ZfcG9vbCBpbiBVQklfSU9DQVRUDQoNCg0KUmVnYXJkcywNCg0KRGF2
aWQNCg==
--------------pPDMSec82Ky4JKmYwlg0bNaV
Content-Type: application/pgp-keys; name="OpenPGP_0xBCE5DC3C741A02D1.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBCE5DC3C741A02D1.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFZyf0YBCADHyKhABhxthCC9n48pvsuk5p3IEdYXMs8Apenh1N/Z4cViAz/d
/nSCZ+FGFX/PSubEzq8AilZLejchAltaORCvA1Y6FgTlpcdJ6gHDfStDbJL/vk5N
8aL7YNF7VfjTRntBtKbhKcrG05nbdNjIioAm04pt9rx5mV5KMbf22/FdZpOSSsC6
/N7b/cFH9+fx8kwi4pNFuJwrBkWRuQ7rEtCoSpd22t+Vh9qA7kymW9gWY405258j
nN65jBO7ElqU2CCuGRPg6uryAHV3RVCB9j9AE3HLacQReFtt5ylyydSQbaK4K9as
nd7U2/C11vIuuciXCppX4bPap/pMnGpzw0UNABEBAAHNN0RhdmlkIE9iZXJob2xs
ZW56ZXIgPGRhdmlkLm9iZXJob2xsZW56ZXJAc2lnbWEtc3Rhci5hdD7CwHcEEwEI
ACEFAlZyf0YCGwMFCwkIBwIGFQgJCgsCBBYCAwECHgECF4AACgkQvOXcPHQaAtFu
EAgArXOhaoaVvCMVCa5N25Q/+Q6K1wrVpPmkH89yhQqCmfM6f+2VM5MGFDPfaSJ3
5fBDH0iwBQwlXIb7NSXWtzdXX9rMvJkJqv45TgeKtJApf/sRhmcN+clrwzP8oZQb
xkP1YWzoVwo4lOb3Kv7aY9yeCjqNbdJJ57NpvYOUrzrCpGkrDPBBQOvKF3wbq3oU
/o3dT23NDeQ20jXgquJf/PCw6WCzRxqg58wH02MdMDQe8vByzVig2bM2e7DErtt+
hPK/Dmdsqgns+Z+SrQcOvRa3GMAHAuHB0u2LhYO6NyaNCgzdgutorilYcq7FEKr8
XqwOnfVmZdCW3qGKmLbn6qMEdM7ATQRWcn9GAQgAvugF8cFjv2Zs4BBb44SnxGaw
BySC1bMRas/MjA9EMHUAx/StcecQmxnl6BzEyGpr+TRnXIzcb5xI8SxitBDU5MLv
wsHgNvpYp9fscd4kWP7oMir9ta3Q8SvT4OLbO4FZBGaURzGPak8JmjMMtOoOBh4m
eOjz6GrJe9UIGxT94aB01w7YohfBANzK8xyk4ykKC5Op4XgaaMKOEQUah7wajcoj
YSlvgOiXqEisMHlRDAW6sXL2sEM7TIpvYhy9txMLllpkYb0Pu1BvUpY/unsybWKA
FyiTmeiY+nEveUvqX6Ef7BWdClBeCk2UaRvtcoLd22VxMlKTniHQcNMOXlRRawAR
AQABwsBfBBgBCAAJBQJWcn9GAhsMAAoJELzl3Dx0GgLRPtcH/jD6rn2+VIKgrHdt
3ao3Abpu2fqYfwbIyPAtpXOddDptVq+0A/2arXT1Y8+jNSZpbAg8K+bLaEAcSUEj
viKMpfI7ppTUBuGKrpgc5xsiUpKkJCb7oB1ZraIBNBPtPPVUhbwLie4uW/LVt+8r
BKz3W9KEDOsT0ZCG/pW8Ld+EpDR9l0fmqoVHaw8PhLAtez+B7HS7Hv7iJPDtX85k
FYpud8kIPENXVn9EjZudyMWgZb2LhYlcavNcszgR7In6ift5SNySojCOfAV0iKZb
8QUXWktLleY8kQ8jltOsSRTuO4PDfzvtCQDixUw4tQ7WLwDTqyUpot0oG03vtSG4
LIRCdxI=3D
=3DjujX
-----END PGP PUBLIC KEY BLOCK-----

--------------pPDMSec82Ky4JKmYwlg0bNaV--

--------------GdrI1v83fEp0RYiTK0C07N42--

--------------7guYSbyktT0Ts6VFupSS0vHK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEEwY/cjyeWErqzVubvOXcPHQaAtEFAmYG4swFAwAAAAAACgkQvOXcPHQaAtFM
0wgAxqGsY1L7CdAGoc3uF6EjiXa8GiG0RODtBwm2eH7jPXqsYfIobdInyKdW9oV8lthUDnKXG+Ci
5cF5SjDpDhwo4s2a63kftK3bn73FXPrGkaSGEdQQDVmdwR+hZEqR7FB5j0HrTXnfxgUrBu+gPxSE
nMWQlfc5Z1xqsLDrM8VrAfamwrR1OzdDewBQdflcxnqDH955WpdvjZiONZOHWjdybQYqK+/m+VtR
5wiK+5IkMvXfmEWg988ZuMEx67HpSc/pB2sG9m6ej0/tW3khjZkLbAayaWDMJK/FqsOGzpKrkaDW
izYHow9AJVHbxR5gj+ydwXJQ47HUbHbqhPY6pL4+Dg==
=UjeS
-----END PGP SIGNATURE-----

--------------7guYSbyktT0Ts6VFupSS0vHK--


--===============5408277957566851897==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5408277957566851897==--

