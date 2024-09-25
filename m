Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC4A5CF9C7A
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Sep 2024 14:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:From:To:MIME-Version:Date:Message-ID:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=sYSv9vqQ0hLTbokljeLMeYLm2Rf66gkQM19yQn8uKbA=; b=L2e
	ifllKl3TqLpTmzxzb7NdgPcCLuPFXZCdTEzyqH48Cc27tBXI9v043FXlR6wu4d1E9ENh4Z2+q61X5
	XJq9F8N5G0EdlfPWa2GbtmNMogk2ykNl/1oy4Hhm+J4f8U8uruC29OLlMHnaJZqip9lSFXnSisN+q
	G32haLnDotPru0Jc9quyci+HXbWlLIDfNJk6RCQR6qLnrq9kQsuQINHQPUn5UbPhIinlPm8dqp94Y
	QDV+9ODq4LdVnuuEyQNXwpxrhD3qVCiBdL62/UZYKaWepdzTc8EwKCCd6xt0JGyB0DlvAhsiWLXJY
	2zuK0Rh+/tcwunK5MkbJlzbVfiWfX/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stTI5-00000005hcK-19DQ;
	Wed, 25 Sep 2024 14:46:53 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stTGC-00000005hOj-0aZr
	for linux-mtd@lists.infradead.org;
	Wed, 25 Sep 2024 14:46:51 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5c42e7adbe0so7924230a12.2
        for <linux-mtd@lists.infradead.org>; Wed, 25 Sep 2024 07:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1727275494; x=1727880294; darn=lists.infradead.org;
        h=subject:from:to:content-language:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3bcVt9docIOi0IW07bgSJvxTaZCOXvRBfktXeoptuB0=;
        b=Csp9L4mLtk2AMtToX8GmJcv4FKr4+0vI0+0d8L+uu+l77l0FXoqhM2Ysnk9eggEIU4
         F61Tqc1U4psVfGpw3Es2WJn2P9nNnne3XnkmXxJeU6ESr2LiD3XmBJbShtzue/G3ufdU
         DFRdxBSW0OJ/J/uq50OJLs7RQs5875iewnSVaLmQNhMl7o9rIoIaYEPKVbMQ+gAtopSX
         JIbzYBYn2CmiWRPLlK+6eApJKRUkQP7cshWm+adnbJLTUfmHVlEBbkFtx+aiPQoVAkga
         E+sxwPdL2SKjgAIjy8jOCzpQRcbvqsGb8YDE3tBlXZ0pRTrKJggAxqFuCqzbKL2iLBLX
         RkKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727275494; x=1727880294;
        h=subject:from:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3bcVt9docIOi0IW07bgSJvxTaZCOXvRBfktXeoptuB0=;
        b=oUvYR8r6sd4tKWf3nXjkMiV2rQRZnl33KAgXbfX7weuGftfK67dXo+8lm/5sg33vh+
         SQ/tHx7jbOld8oxZ43hXdSHN/GbW6qaMXlLUnG2FNhNOMdLnFQ/oQrDbaqFiqU+BLVmS
         LZ2gJQDAdczzeIRFKDSA77eEJaGWB0TvW6zoWnvDKqhgnETTkRMP4PjqS515d4goAuIq
         FFNn/4wmCsAcpU77ntgJx2tYtZbsP3s6ITvaAGTe933dWVMU83qbHKnZFRb70JaZH/am
         IlGXC5f9sgUV/yAYPJq/NDGw8Un0J4YkGodtqscBVEDkuv4uA7oUKWbVCN3ork6gOzmr
         XS0w==
X-Gm-Message-State: AOJu0YwBoly8uQ66ftsNQaARzy2CsVSPNezlL7T+VzPOSTAEjfl14fut
	xWdlVBaLckehxPojqKREZeGylJEj8jm/skSqykD2X6Kz7ymmHfoZFaORn2HzMQGnI3sD0pedfX1
	3uT0=
X-Google-Smtp-Source: AGHT+IGim/otQGiCvx3ciGQg32gB+hyHim3ez5OY9QGu76J6ZpU7ZEI6pVGHR43sN2dW+Mnbo8/PYA==
X-Received: by 2002:a17:906:c144:b0:a8a:5bfb:7d1a with SMTP id a640c23a62f3a-a93a03c10a8mr282238466b.35.1727275493817;
        Wed, 25 Sep 2024 07:44:53 -0700 (PDT)
Received: from [192.168.40.74] (046075014122.atmpu0009.highway.a1.net. [46.75.14.122])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93930f46ffsm213807666b.155.2024.09.25.07.44.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Sep 2024 07:44:53 -0700 (PDT)
Message-ID: <5dcaf594-e727-4ec3-af69-86e578029160@sigma-star.at>
Date: Wed, 25 Sep 2024 16:44:51 +0200
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
Subject: [ANNOUNCE] mtd-utils-2.2.1 is released
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_074456_513667_69A835FD 
X-CRM114-Status: GOOD (  10.34  )
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
Content-Type: multipart/mixed; boundary="===============4848957002187361121=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============4848957002187361121==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------V6g9PkV5wDBS7TWJKqwZEdgL"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------V6g9PkV5wDBS7TWJKqwZEdgL
Content-Type: multipart/mixed; boundary="------------RzJtmEoBC39K0SQ4xJAaRejh";
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
Message-ID: <5dcaf594-e727-4ec3-af69-86e578029160@sigma-star.at>
Subject: [ANNOUNCE] mtd-utils-2.2.1 is released

--------------RzJtmEoBC39K0SQ4xJAaRejh
Content-Type: multipart/mixed; boundary="------------XlaSHLS0X4D1seAfO0Xsmb9d"

--------------XlaSHLS0X4D1seAfO0Xsmb9d
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCm10ZC11dGlscy0yLjIuMSBpcyByZWxlYXNlZC4NCg0KVGFyYmFsbDogICAgICAg
ICAgICAgICBmdHA6Ly9mdHAuaW5mcmFkZWFkLm9yZy9wdWIvbXRkLXV0aWxzL210ZC11dGls
cy0yLjIuMS50YXIuYnoyDQpUYXJiYWxsIGdwZyBzaWduYXR1cmU6IGZ0cDovL2Z0cC5pbmZy
YWRlYWQub3JnL3B1Yi9tdGQtdXRpbHMvbXRkLXV0aWxzLTIuMi4xLnRhci5iejIuYXNjDQpT
aWduZWQgZ2l0IHRhZzogICAgICAgIGdpdDovL2dpdC5pbmZyYWRlYWQub3JnL210ZC11dGls
cy5naXQgdjIuMi4xDQoNCkFsdGVybmF0aXZlbHkgYWxzbyBtaXJyb3JlZCBoZXJlOg0KDQpU
YXJiYWxsOiAgICAgICAgICAgICAgIGh0dHBzOi8vaW5mcmFyb290LmF0L3B1Yi9tdGQvbXRk
LXV0aWxzLTIuMi4xLnRhci5iejINClRhcmJhbGwgZ3BnIHNpZ25hdHVyZTogaHR0cHM6Ly9p
bmZyYXJvb3QuYXQvcHViL210ZC9tdGQtdXRpbHMtMi4yLjEudGFyLmJ6Mi5hc2MNClNpZ25l
ZCBnaXQgdGFnOiAgICAgICAgaHR0cHM6Ly9naXQuaW5mcmFyb290LmF0L210ZC11dGlscy5n
aXQgdjIuMi4xDQoNClRoaXMgaXMgYSBzbWFsbCByZWxlYXNlIG9mIGZpeGVzIHRoYXQgaGF2
ZSBhY2N1bXVsYXRlZCBzaW5jZSBNYXJjaC4NCg0KQ2hhbmdlcyBmcm9tIDIuMi4wIHRvIDIu
Mi4xOg0KDQpGaXhlczoNCiAgLSBmZWN0ZXN0OiBGaXggdGltZSBmb3JtYXR0aW5nIHdpdGgg
X1RJTUVfQklUUz02NCBvbiAzMi1iaXQgc3lzdGVtDQogIC0gYWxzbyBjaGVjayBmb3Igc3Rh
dGljIGxpYnV1aWQNCiAgLSBta2ZzLnViaWZzOiBDbGVhciBkaXJlY3Rfd3JpdGUgcHJvcGVy
dHkgd2hlbiBjbG9zaW5nIHRhcmdldA0KICAtIG1rZnMudWJpZnM6IEluaXRpYWxpemUgJ2Np
cGhlcl9uYW1lJyBhcyBOVUxMDQogIC0gbWtmcy51YmlmczogRml4IHdyb25nIHhhdHRyIGVu
dHJ5IHR5cGUNCiAgLSBta2ZzLnViaWZzOiBGaXggaW5jb3JyZWN0IGRpciBzaXplIGNhbGN1
bGF0aW9uIGluIGVuY3J5cHRpb24gc2NlbmFyaW8NCiAgLSBta2ZzLnViaWZzOiBDbG9zZSBs
aWJ1YmkgaW4gZXJyb3IgaGFuZGxpbmcgcGF0aHMNCiAgLSBta2ZzLnViaWZzOiBGaXggbWlz
c2VkIGNsb3Npbmcgb3V0X2ZkDQogIC0gbWtmcy51YmlmczogRml4IG1lbWxlYWsgZm9yICdv
dXRwdXQnIGluIGVycm9yIHBhdGhzDQoNCkNoYW5nZXM6DQogIC0gbGlidWJpOiB1YmlfdXBk
YXRlX3N0YXJ0OiBzbGlnaHRseSBpbXByb3ZlIGRvY3VtZW50YXRpb24NCiAgLSBmcy10ZXN0
czogaW50ZWdjazogUmVmYWN0b3I6IHNwbGl0IG91dCBjb21tb24gcmVtb3VudCBsb2dpYw0K
ICAtIGZzLXRlc3RzOiBpbnRlZ2NrOiBSZWZhY3Rvcjogc3BsaXQgb3V0IGNvbW1vbiByZW1v
dW50IGxvZ2ljDQogIC0gRXh0cmFjdCBsaXN0IGltcGxlbWVudGF0aW9uIHRvIGNvbW1vbiBs
aWIgYW5kIGFkZCBsaXN0X3NvcnQgc3VwcG9ydA0KICAtIEV4dHJhY3QgcmJ0cmVlIGltcGxl
bWVudGF0aW9uIHRvIGNvbW1vbiBsaWINCg0KDQpSYXcgc2hvcnQgbG9nIHNpbmNlIHRoZSAy
LjIuMCByZWxlYXNlOg0KDQpCZW4gSHV0Y2hpbmdzICgxKToNCiAgICAgICBtdGQtdXRpbHM6
IGZlY3Rlc3Q6IEZpeCB0aW1lIGZvcm1hdHRpbmcgd2l0aCBfVElNRV9CSVRTPTY0IG9uIDMy
LWJpdCBzeXN0ZW0NCg0KQ2hyaXN0aWFuIEVnZ2VycyAoMSk6DQogICAgICAgbGlidWJpOiB1
YmlfdXBkYXRlX3N0YXJ0OiBzbGlnaHRseSBpbXByb3ZlIGRvY3VtZW50YXRpb24NCg0KQ3PD
s2vDoXMsIEJlbmNlICgyKToNCiAgICAgICBmcy10ZXN0czogaW50ZWdjazogUmVmYWN0b3I6
IHNwbGl0IG91dCBjb21tb24gcmVtb3VudCBsb2dpYw0KICAgICAgIGZzLXRlc3RzOiBpbnRl
Z2NrOiBSZWZhY3Rvcjogc3BsaXQgb3V0IGNvbW1vbiByZW1vdW50IGxvZ2ljDQoNClJvc2Vu
IFBlbmV2ICgxKToNCiAgICAgICBtdGQtdXRpbHM6IGFsc28gY2hlY2sgZm9yIHN0YXRpYyBs
aWJ1dWlkDQoNClpoaWhhbyBDaGVuZyAoOSk6DQogICAgICAgbWtmcy51YmlmczogQ2xlYXIg
ZGlyZWN0X3dyaXRlIHByb3BlcnR5IHdoZW4gY2xvc2luZyB0YXJnZXQNCiAgICAgICBta2Zz
LnViaWZzOiBJbml0aWFsaXplICdjaXBoZXJfbmFtZScgYXMgTlVMTA0KICAgICAgIG1rZnMu
dWJpZnM6IEZpeCB3cm9uZyB4YXR0ciBlbnRyeSB0eXBlDQogICAgICAgbWtmcy51Ymlmczog
Rml4IGluY29ycmVjdCBkaXIgc2l6ZSBjYWxjdWxhdGlvbiBpbiBlbmNyeXB0aW9uIHNjZW5h
cmlvDQogICAgICAgbWtmcy51YmlmczogQ2xvc2UgbGlidWJpIGluIGVycm9yIGhhbmRsaW5n
IHBhdGhzDQogICAgICAgbWtmcy51YmlmczogRml4IG1pc3NlZCBjbG9zaW5nIG91dF9mZA0K
ICAgICAgIG1rZnMudWJpZnM6IEZpeCBtZW1sZWFrIGZvciAnb3V0cHV0JyBpbiBlcnJvciBw
YXRocw0KICAgICAgIG10ZC11dGlsczogRXh0cmFjdCBsaXN0IGltcGxlbWVudGF0aW9uIHRv
IGNvbW1vbiBsaWIgYW5kIGFkZCBsaXN0X3NvcnQgc3VwcG9ydA0KICAgICAgIG10ZC11dGls
czogRXh0cmFjdCByYnRyZWUgaW1wbGVtZW50YXRpb24gdG8gY29tbW9uIGxpYg0KDQpSZWdh
cmRzLA0KDQpEYXZpZA0K
--------------XlaSHLS0X4D1seAfO0Xsmb9d
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

--------------XlaSHLS0X4D1seAfO0Xsmb9d--

--------------RzJtmEoBC39K0SQ4xJAaRejh--

--------------V6g9PkV5wDBS7TWJKqwZEdgL
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEEwY/cjyeWErqzVubvOXcPHQaAtEFAmb0IeMFAwAAAAAACgkQvOXcPHQaAtH9
mQf+PYcFNimZ8zryuYOZKlZJ4P2nLFZfIqsosbDIInXLqtTUPZyqThtC4ESHCrE6yAT+j6mqSVj3
P0YNEWjiRpHKEz4zGIlZEoCG5TZVoFDPkE0c4whd4UwEGc1AuvRHvyAT45iLSO1S5lCyC9zYu7wE
3jxUhfAm+9DUSXod61IDqcPuSJUWSZg5aL5BRxTkbSM3oDNRdFET5E1nsrxohs4OhFdwTBkPfItq
Uw9TLvH6CwuChtr8furIYkBpJK8QCbQ5uXVRgqehI6Qy8o/eJjsgyfWatORieEk/ptLWHNbSUMMa
P0tl0Fu0I9MMvyeE63J/VmjV89zbR/hOO5CD5aPzIQ==
=kgBP
-----END PGP SIGNATURE-----

--------------V6g9PkV5wDBS7TWJKqwZEdgL--


--===============4848957002187361121==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4848957002187361121==--

