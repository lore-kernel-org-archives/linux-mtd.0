Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2974C021A0
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Feb 2025 16:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:From:To:MIME-Version:Date:Message-ID:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=DgDPDGxHHIYvl8YNlyd4MCgBzf+O9H3WH/2dEaWbpPY=; b=HDB
	OG2hMdRpSbbmtG1k30ATwzdWeJrHuyyVWP4++mQap8JRPF2cbGD4Odt2k9jnwQItDt+qyhm/EN43d
	nEG24hHMhBXncpqHI/rHjlrEKVuoUnkCXfn4uItAF/HMvRe32niIGZTHBolnIQz+HFNvdK35gyu9W
	hN/t2inEHFIRIBWUYEnYQeP97SefHJ1re9ypPbR8f/sx5cp4PflebahkYo44klmqpaBq414tDIdql
	CnVO8kc+kndfuBw2UwjzclWAc1RP5/YGk07hjz2q1GawCL05xIq4vs+J1jBIxON5dCMHrGg4HS46P
	Qo1aMD1tk++0DONxx9T8D1fj2B6LIRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjKg7-00000000NJW-2BIv;
	Sat, 15 Feb 2025 16:06:03 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjKg2-00000000NJ6-2qBV
	for linux-mtd@lists.infradead.org;
	Sat, 15 Feb 2025 16:06:00 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-abadccdfe5aso223322866b.0
        for <linux-mtd@lists.infradead.org>; Sat, 15 Feb 2025 08:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1739635556; x=1740240356; darn=lists.infradead.org;
        h=subject:from:to:content-language:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MOSg0rodnhdX6e59KB0qg98+vkf/u6K3hkUeCKWmUOw=;
        b=eAfpqf3rag8EiDgD7Zsu8hoGYUe36ByP/fTT/SFJt9n/0PObZYYqVmnrxFNFCihNjS
         UzLr4EpP0TQBaXboGOtpE6bsBqfqszg4I/o9EcbSaCB8YnrOSk9IsYFKMdWz5Jpg9d/9
         QcnJNrBdpLhAOj0VwxCWyMQ75tCcmvjHJgGGagNuFg8U/D4BUR7Gtdsw1h2TqpbuwALi
         xI6GfkMZES59rE+Ir/+pArKjfVgN7rxweBoD3OEeH6PxgLIFZlPrhJPG+Wfx9a0LZe/P
         kZqptYOQAiKMc21USnQAu4jxkDJDPDVI/uFL694T2IrY8ku2E/oSGE5zzHYlxHN/YYJQ
         v74w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739635556; x=1740240356;
        h=subject:from:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MOSg0rodnhdX6e59KB0qg98+vkf/u6K3hkUeCKWmUOw=;
        b=Skb+EhpkKRgOmoe0YxIKBrMQmAkhrkOLqNuMAacZPydYEuAWXm+MuEWmrOaXafD/zt
         UugaQORWIK5j4cR+qhmQfKBHPw/M8zqHRr9gRDe8DU5pCdlvjhX0ljBYIp+KoPnNxWkt
         rXNeFzjVUjsa1H9tojekbqr8tY56vyvoJsi72mX2fkCcVZpeR1pKt7OrFyxxApfzbJXC
         gNthsDHr+R8DwnDuCDPTU4m7Ls2FmwfiaYTfvqsrcW62EG93I874FJPvoFSb8pUnhb2i
         hU1AVs7yDkxTSuMpQA8Of0qrsHAg/GvRpLO6wbylGNqx7JHoI51PVXx+NKukEjXkOlV3
         BSCw==
X-Gm-Message-State: AOJu0YxZDzoxvIiTm+C5QJihuY42dp1ZzxP50RylUKt1VWcSOtt0eWOb
	vPi7T5Tue1aV3EJLEem29WPj1A4BlFIBGsrsCygKmTEG9TbYZ36/HiJPKIGiEtG12xl95rvLqMo
	6epk=
X-Gm-Gg: ASbGncsjj622+tTt9vQ5dniFwjeYM2lJawr1QNF+9htl17z0DSL64X7CR75knAJSmL4
	oL/4qhXRmzEt/6OkcX0e7c8vjFwgIZ+Hecsfa3c3P4AsYrZW+86alIJaNhY7J5DCjn8xo3zQav9
	kCtjCLi/fFDM9oHfbMCSOh3Y9oG6iSiEujewNpBWGoot3YNWEPHFT0h1T1vdKDJnC6+Pmo/VK5Q
	iQy4OtTkNkr9IopkibiiinhMFGozchq/Ao6ys094gve8ondCVxED1/SV0NqnKEg1L5lbzFwUUEf
	PwPOUlme2TnfJTehUwu/CEFSZHjs2MSjU6/c2lnG9dUU6baO86/WLONJsIEH4mI2TRB+aw1aY4C
	nJQ==
X-Google-Smtp-Source: AGHT+IHqZO/2Ov7nIfI6GPb166D9t86y2jfOKdgO+Qu6uWlKdDEibuugr+sCKzjxY3JlOf+9zzbMZg==
X-Received: by 2002:a17:907:784b:b0:ab7:c6a2:7a43 with SMTP id a640c23a62f3a-abb70b7c310mr297450366b.31.1739635555577;
        Sat, 15 Feb 2025 08:05:55 -0800 (PST)
Received: from ?IPV6:2a0d:f302:e054:54:ffff:d714:229c:6eed? ([2a0d:f302:e054:54:ffff:d714:229c:6eed])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba53397f47sm553561766b.127.2025.02.15.08.05.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Feb 2025 08:05:54 -0800 (PST)
Message-ID: <1b7a55a6-1c5b-4e86-8006-e2010e54367e@sigma-star.at>
Date: Sat, 15 Feb 2025 17:05:53 +0100
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
 <robbat2@gentoo.org>, "John (OpenWRT)" <john@phrozen.org>,
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
Subject: [ANNOUNCE] mtd-utils-2.3.0 is released
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_080559_028211_418FF0E1 
X-CRM114-Status: GOOD (  13.97  )
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
Content-Type: multipart/mixed; boundary="===============4020015404324974391=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============4020015404324974391==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------h4vScc9Vkza90305df50MuT0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------h4vScc9Vkza90305df50MuT0
Content-Type: multipart/mixed; boundary="------------58jzVTGOPdaewPOcTbVSj8yH";
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
 <robbat2@gentoo.org>, "John (OpenWRT)" <john@phrozen.org>,
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
Message-ID: <1b7a55a6-1c5b-4e86-8006-e2010e54367e@sigma-star.at>
Subject: [ANNOUNCE] mtd-utils-2.3.0 is released

--------------58jzVTGOPdaewPOcTbVSj8yH
Content-Type: multipart/mixed; boundary="------------xOiKIRTskYVX9fchPe4UnPwU"

--------------xOiKIRTskYVX9fchPe4UnPwU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCm10ZC11dGlscy0yLjMuMCBpcyByZWxlYXNlZC4NCg0KVGFyYmFsbDogICAgICAg
ICAgICAgICBmdHA6Ly9mdHAuaW5mcmFkZWFkLm9yZy9wdWIvbXRkLXV0aWxzL210ZC11dGls
cy0yLjMuMC50YXIuYnoyDQpUYXJiYWxsIGdwZyBzaWduYXR1cmU6IGZ0cDovL2Z0cC5pbmZy
YWRlYWQub3JnL3B1Yi9tdGQtdXRpbHMvbXRkLXV0aWxzLTIuMy4wLnRhci5iejIuYXNjDQpT
aWduZWQgZ2l0IHRhZzogICAgICAgIGdpdDovL2dpdC5pbmZyYWRlYWQub3JnL210ZC11dGls
cy5naXQgdjIuMy4wDQoNCg0KQWx0ZXJuYXRpdmVseSBhbHNvIG1pcnJvcmVkIGhlcmU6DQoN
ClRhcmJhbGw6ICAgICAgICAgICAgICAgaHR0cHM6Ly9pbmZyYXJvb3QuYXQvcHViL210ZC9t
dGQtdXRpbHMtMi4zLjAudGFyLmJ6Mg0KVGFyYmFsbCBncGcgc2lnbmF0dXJlOiBodHRwczov
L2luZnJhcm9vdC5hdC9wdWIvbXRkL210ZC11dGlscy0yLjMuMC50YXIuYnoyLmFzYw0KU2ln
bmVkIGdpdCB0YWc6ICAgICAgICBodHRwczovL2dpdC5pbmZyYXJvb3QuYXQvbXRkLXV0aWxz
LmdpdCB2Mi4zLjANCg0KDQpCZXNpZGVzIHRoZSB1c3VhbCBvZGQgZml4ZXMsIHRoaXMgcmVs
ZWFzZSByZS1zeW5jcyBoZWFkZXJzIHdpdGggdXBzdHJlYW0ga2VybmVsDQp2ZXJzaW9ucywg
YXMgd2VsbCBhcyB0aGUgdmVuZG9yZWQsIHRoaXJkIHBhcnR5IGxpYmluaXBhcnNlciB3aXRo
IGl0cyByZXNwZWN0aXZlLA0KdXBzdHJlYW0gcmVsZWFzZS4NCg0KU3BlY2lhbCB0aGFua3Mg
Z28gb3V0IHRvIENoZW5nIFpoaWhhbywgd2hvIHJlZmFjdG9yZWQgbWtmcy51YmlmcyBhbmQg
Y29udHJpYnV0ZWQNCmFuIGZzY2sudWJpZnMgdXRpbGl0eS4gVGhpcyBpcyBhbHNvIHRoZSBt
YWluLCBiaWcgbmV3IGZlYXR1cmUgaW4gdGhpcyByZWxlYXNlLA0KcHJvbXB0aW5nIHRoZSBt
aW5vciB2ZXJzaW9uIGJ1bXAuDQoNCg0KQ2hhbmdlcyBmcm9tIDIuMi4xIHRvIDIuMy4wOg0K
DQpGZWF0dXJlczoNCiAgLSBmc2NrLnViaWZzOiBBZGQgZnNjayB1dGlsaXR5IGZvciB1Ymlm
cw0KICAtIHViaWZzLXV0aWxzOiBTdXBwb3J0IEFkZHJlc3MtU2FuaXRpemllciBkZWJ1Zw0K
ICAtIG5hbmQtdXRpbHM6IG5hbmRkdW1wOiBBZGQgc3VwcG9ydCBmb3IgdGVzdGluZyBjb250
aW51b3VzIHJlYWRzDQogIC0gbXRkLXRlc3RzOiBuYW5kYml0ZXJyczogQWRkIHN1cHBvcnQg
Zm9yIHRlc3RpbmcgY29udGludW91cyByZWFkcw0KICAtIG10ZC10ZXN0czogZmxhc2hfc3Bl
ZWQ6IEJlbmNobWFyayBjb250aW51b3VzIHJlYWRzDQoNCkZpeGVzOg0KICAtIFZhcmlvdXMg
aW50ZWdlciBoYW5kbGluZyBlcnJvcnMgKHBvdGVudGlhbCBvdmVyZmxvd3MsIGRpdmlkZSBi
eSB6ZXJvKQ0KICAtIG1rZnMuamZmczI6IGZpeCBzZWdmYXVsdCB3aGVuIHBhcnNpbmcgZGV2
IHRhYmxlDQogIC0gbmFuZC11dGlsczogbmFuZGR1bXA6IEV4cGxpY2l0ZWx5IHVzZSB0aGUg
cGFnZSBzaXplIHdoZW4gcmVsZXZhbnQNCiAgLSBtaXNjLXV0aWxzOiBhZGQgbWlzc2luZyBl
cnJvciBoYW5kbGluZyBmb3IgJ2JhbScgYWxsb2NhdGlvbiBpbiBmdGxfY2hlY2suYw0KICAt
IG10ZGluZm86IHR5cGUgbWlzLW1hdGNoIGluIHByaW50ZiBmb3JtYXQgc3RyaW5nDQogIC0g
bmFuZGR1bXA6IGNvbnN0IGNhc3Qgd2FybmluZw0KICAtIGZsYXNoY3A6IHVuaW5pdGlhbGl6
ZWQgdmFyaWFibGUNCiAgLSBqZmZzMnJlYWRlcjogcG90ZW50aWFsIG51bGwgcG9pbnRlciBk
ZXJlZmVyZW5jZQ0KICAtIHRlc3RzOiBjaGVja2ZzOiBBZGQgcHJldmlvdXMgcHJvdG90eXBl
IGZvciBkb19wd3JfZG4oKQ0KDQpDaGFuZ2VzOg0KICAtIG1rZnMudWJpZnM6IHJlLXN5bmMg
d2l0aCB0aGUga2VybmVsIGNvZGUNCiAgLSBta2ZzLnViaWZzOiBtb3ZlIG1vc3Qgb2YgdGhl
IGNvZGUgaW50byBhIGxpYnViaWZzIGxpYnJhcnkNCiAgLSBJbXBvcnQgYSBtb3JlIHJlY2Vu
dCB2ZXJzaW9uIG9mIGxpYmluaXBhcnNlcg0KICAtIG10ZC10ZXN0czogZmxhc2hfc3BlZWQ6
IGNsZWFudXAvcmVmYWN0b3INCg0KDQpSYXcgc2hvcnQgbG9nIHNpbmNlIHRoZSAyLjIuMSBy
ZWxlYXNlOg0KDQpBbnRvbiBNb3J5YWtvdiAoNyk6DQogICAgICAgdWJpLXV0aWxzOiB1Ymly
c3ZvbDogRml4IGludGVnZXIgb3ZlcmZsb3cgaW4gdWJpcnN2b2wuYw0KICAgICAgIG1pc2Mt
dXRpbHM6IGZsYXNoX2VyYXNlOiBGSVggaW50ZWdlciBvdmVyZmxvdyBpbiBmbGFzaF9lcmFz
ZS5jDQogICAgICAgbmFuZC11dGlsczogRml4IGludGVnZXIgb3ZlcmZsb3cgaW4gbmFuZGZs
aXBiaXRzLmMNCiAgICAgICB1YmktdXRpbHM6IEZpeCBpbnRlZ2VyIG92ZXJmbG93IGluIG10
ZGluZm8uYw0KICAgICAgIG1pc2MtdXRpbHM6IGFkZCBtaXNzaW5nIGVycm9yIGhhbmRsaW5n
IGZvciAnYmFtJyBhbGxvY2F0aW9uIGluIGZ0bF9jaGVjay5jDQogICAgICAgamZmc1gtdXRp
bHM6IGZpeCBpbnRlZ2VyIG92ZXJmbG93IGluIGpmZnMyZHVtcC5jDQogICAgICAgdWJpLXV0
aWxzOiBGSVggRElWSVNJT04gQlkgWkVSTyBpbiB1YmluaXplLmMNCg0KRGF2aWQgT2Jlcmhv
bGxlbnplciAoNCk6DQogICAgICAgSW1wb3J0IGEgbW9yZSByZWNlbnQgdmVyc2lvbiBvZiBs
aWJpbmlwYXJzZXINCiAgICAgICBVcGRhdGUgQ0hBTkdFTE9HLm1kDQogICAgICAgVXBkYXRl
IENIQU5HRUxPRy5tZA0KICAgICAgIFJlbGVhc2UgbXRkLXV0aWxzLTIuMy4wDQoNCkh1YW5n
IFhpYW9qaWEgKDEpOg0KICAgICAgIGZzY2sudWJpZnM6IENoZWNrIGFuZCBjcmVhdGUgdGhl
IGxvc3QrZm91bmQNCg0KTWlxdWVsIFJheW5hbCAoMTApOg0KICAgICAgIG5hbmQtdXRpbHM6
IG5hbmRkdW1wOiBVc2UgYSBzcGVjaWZpYyB2YXJpYWJsZSBmb3IgdGhlIGJ1ZmZlciBzaXpl
DQogICAgICAgbmFuZC11dGlsczogbmFuZGR1bXA6IEV4cGxpY2l0ZWx5IHVzZSB0aGUgcGFn
ZSBzaXplIHdoZW4gcmVsZXZhbnQNCiAgICAgICBuYW5kLXV0aWxzOiBuYW5kZHVtcDogQWRk
IHN1cHBvcnQgZm9yIHRlc3RpbmcgY29udGludW91cyByZWFkcw0KICAgICAgIG10ZC10ZXN0
czogbmFuZGJpdGVycnM6IFN0b3JlIHRoZSBjaHVua3Mgc2l6ZSBpbiBhbiBpbnRlcm1lZGlh
dGUgdmFyaWFibGUNCiAgICAgICBtdGQtdGVzdHM6IG5hbmRiaXRlcnJzOiBBZGQgc3VwcG9y
dCBmb3IgdGVzdGluZyBjb250aW51b3VzIHJlYWRzDQogICAgICAgbXRkLXRlc3RzOiBmbGFz
aF9zcGVlZDogRHJvcCBhbiBhcHBhcmVudGx5IHVzZWxlc3MgYmxvY2sNCiAgICAgICBtdGQt
dGVzdHM6IGZsYXNoX3NwZWVkOiBDbGFyaWZ5IHRoZSBudW1iZXIgb2YgcGFnZXMgaW4gZWFj
aCBzZXQgd2hpbGUgbWVhc3VyaW5nDQogICAgICAgbXRkLXRlc3RzOiBmbGFzaF9zcGVlZDog
R2VuZXJhbGl6ZSByZWFkX2VyYXNlYmxvY2tfYnlfMnBhZ2VzKCkNCiAgICAgICBtdGQtdGVz
dHM6IGZsYXNoX3NwZWVkOiBEcm9wIHJlYWRfZXJhc2VibG9ja19ieV9wYWdlKCkNCiAgICAg
ICBtdGQtdGVzdHM6IGZsYXNoX3NwZWVkOiBCZW5jaG1hcmsgY29udGludW91cyByZWFkcw0K
DQpSb3NlbiBQZW5ldiAoMSk6DQogICAgICAgbWtmcy5qZmZzMjogZml4IHNlZ2ZhdWx0IHdo
ZW4gcGFyc2luZyBkZXYgdGFibGUNCg0KWGlhbmcgWWFuZyAoMSk6DQogICAgICAgZnNjay51
YmlmczogQ2hlY2sgYW5kIGNvcnJlY3QgZmlsZXMnIGluZm9ybWF0aW9uDQoNClpoaWhhbyBD
aGVuZyAoMTA3KToNCiAgICAgICB1Ymlmcy11dGlsczogU3BsaXQgY29tbW9uIHNvdXJjZSBm
aWxlcyBmcm9tIG1rZnMudWJpZnMNCiAgICAgICB1Ymlmcy11dGlsczogRGVjb3VwbGUgbWtm
cy51Ymlmcy5oIG91dCBvZiBvdGhlciBtb2R1bGVzDQogICAgICAgdWJpZnMtdXRpbHM6IERl
ZmluZSBQUk9HUkFNX05BTUUgYXMgdmFyaWFibGUNCiAgICAgICB1Ymlmcy11dGlsczogQ2xl
YW4gdXAgZXJyb3IgbWVzc2FnZSBwcmludGluZyBmdW5jdGlvbnMNCiAgICAgICB1Ymlmcy11
dGlsczogTW92ZSAnZGVidWdfbGV2ZWwnIGludG8gdWJpZnNfaW5mbyBzdHJ1Y3R1cmUNCiAg
ICAgICB1Ymlmcy11dGlsczogQWRkICdkZXZfbmFtZScgaW50byAndWJpZnNfaW5mbycgc3Ry
dWN0dXJlDQogICAgICAgdWJpZnMtdXRpbHM6IEFkZCAnZGV2X2ZkJyBhbmQgJ2xpYnViaScg
aW50byAndWJpZnNfaW5mbycgc3RydWN0dXJlDQogICAgICAgdWJpZnMtdXRpbHM6IEV4dHJh
Y3QgVUJJIG9wZW5pbmcvY2xvc2luZy92b2x1bWVfY2hlY2tfZW1wdHkgZnVuY3Rpb25zIGlu
dG8gYSBuZXcgc291cmNlIGZpbGUNCiAgICAgICB1Ymlmcy11dGlsczogSW1wb3J0IFVCSUZT
IGxpYnMgZnJvbSBsaW51eCBrZXJuZWwNCiAgICAgICB1Ymlmcy11dGlsczogQWRkIGNvbXBp
bGVyIGF0dHJpYnV0ZXMgaW1wbGVtZW50YXRpb25zDQogICAgICAgdWJpZnMtdXRpbHM6IEFk
ZCBsaW51eCB0eXBlIGRlZmluaXRpb25zDQogICAgICAgdWJpZnMtdXRpbHM6IEFkZCBsaW51
eCBrZXJuZWwgZXJyb3IgY29udmVyc2lvbiBkZWZpbml0aW9ucw0KICAgICAgIHViaWZzLXV0
aWxzOiBBZGQgbGludXgga2VybmVsIG1lbW9yeSBhbGxvY2F0aW9uIGltcGxlbWVudGF0aW9u
cw0KICAgICAgIHViaWZzLXV0aWxzOiBBZGQgYXRvbWljIGltcGxlbWVudGF0aW9ucw0KICAg
ICAgIHViaWZzLXV0aWxzOiBBZGQgYml0IG9wZXJhdGlvbnMgaW1wbGVtZW50YXRpb25zDQog
ICAgICAgdWJpZnMtdXRpbHM6IEFkZCBzcGlubG9jayBpbXBsZW1lbnRhdGlvbnMNCiAgICAg
ICB1Ymlmcy11dGlsczogQWRkIG11dGV4bG9jayBpbXBsZW1lbnRhdGlvbnMNCiAgICAgICB1
Ymlmcy11dGlsczogQWRkIHJ3c2VtIGltcGxlbWVudGF0aW9ucw0KICAgICAgIHViaWZzLXV0
aWxzOiBBZGQgc29ydGluZyBpbXBsZW1lbnRhdGlvbnMNCiAgICAgICB1Ymlmcy11dGlsczog
QWRkIGltcGxlbWVudGF0aW9ucyBmb3IgbGludXgga2VybmVsIHByaW50aW5nIGZ1bmN0aW9u
cw0KICAgICAgIHViaWZzLXV0aWxzOiBBZGQgbGludXggaGV4ZHVtcCBpbXBsZW1lbnRhdGlv
bnMgbGliDQogICAgICAgbGlidWJpOiBBZGQgbmV3IGludGVyZmFjZSB1YmlfbGViX21hcCgp
DQogICAgICAgdWJpZnMtdXRpbHM6IEFkZCBjb21tb24gZGVmaW5pdGlvbnMgaW4gbGludXgg
a2VybmVsDQogICAgICAgdWJpZnMtdXRpbHM6IEFkZCBkZXNjcmlwdGlvbnMgZm9yIG5ldyBs
aWIgZmlsZXMgaW4gY29tbW9uL1JFQURNRQ0KICAgICAgIHViaWZzLXV0aWxzOiBBZGFwdCB1
YmlmcyBoZWFkZXIgZmlsZSBpbiBsaWJ1Ymlmcw0KICAgICAgIHViaWZzLXV0aWxzOiBBZGFw
dCBzdXBlci5jIGluIGxpYnViaWZzDQogICAgICAgdWJpZnMtdXRpbHM6IEFkYXB0IGlvLmMg
aW4gbGlidWJpZnMNCiAgICAgICB1Ymlmcy11dGlsczogQWRhcHQgbHB0IHN1YnN5c3RlbSBp
biBsaWJ1Ymlmcw0KICAgICAgIHViaWZzLXV0aWxzOiBBZGFwdCB0bmMgc3Vic3lzdGVtIGlu
IGxpYnViaWZzDQogICAgICAgdWJpZnMtdXRpbHM6IEFkYXB0IGxvZy5jIGluIGxpYnViaWZz
DQogICAgICAgdWJpZnMtdXRpbHM6IEFkYXB0IHJlY292ZXJ5IHN1YnN5c3RlbSBpbiBsaWJ1
Ymlmcw0KICAgICAgIHViaWZzLXV0aWxzOiBBZGFwdCBzYi5jIGluIGxpYnViaWZzDQogICAg
ICAgdWJpZnMtdXRpbHM6IEFkYXB0IGF1dGguYyBpbiBsaWJ1Ymlmcw0KICAgICAgIHViaWZz
LXV0aWxzOiBBZGFwdCBkaXIuYyBpbiBsaWJ1Ymlmcw0KICAgICAgIHViaWZzLXV0aWxzOiBB
ZGFwdCBqb3VybmFsLmMgaW4gbGlidWJpZnMNCiAgICAgICB1Ymlmcy11dGlsczogQWRhcHQg
YnVkZ2V0LmMgaW4gbGlidWJpZnMNCiAgICAgICB1Ymlmcy11dGlsczogQWRhcHQgY29tbWl0
LmMgaW4gbGlidWJpZnMNCiAgICAgICB1Ymlmcy11dGlsczogQWRhcHQgZGVidWcgc3Vic3lz
dGVtIGluIGxpYnViaWZzDQogICAgICAgdWJpZnMtdXRpbHM6IEFkYXB0IGtleS5oIGluIGxp
YnViaWZzDQogICAgICAgdWJpZnMtdXRpbHM6IEFkYXB0IG1hc3Rlci5jIGluIGxpYnViaWZz
DQogICAgICAgdWJpZnMtdXRpbHM6IEFkYXB0IG1pc2MuaCBpbiBsaWJ1Ymlmcw0KICAgICAg
IHViaWZzLXV0aWxzOiBBZGFwdCBvcnBoYW4uYyBpbiBsaWJ1Ymlmcw0KICAgICAgIHViaWZz
LXV0aWxzOiBBZGFwdCBnYyBzdWJzeXN0ZW0gaW4gbGlidWJpZnMNCiAgICAgICB1Ymlmcy11
dGlsczogTW92ZSB1Ymlmcy1tZWRpYS5oIGluIGxpYnViaWZzDQogICAgICAgdWJpZnMtdXRp
bHM6IEFkZCBkZXNjcmlwdGlvbnMgZm9yIG5ldyBsaWIgZmlsZXMgaW4gbGlidWJpZnMvUkVB
RE1FDQogICAgICAgdWJpZnMtdXRpbHM6IFJlcGxhY2UgdWJpZnMgcmVsYXRlZCBzb3VyY2Ug
Y29kZSB3aXRoIGxpbnV4IGtlcm5lbCBpbXBsZW1lbnRhdGlvbg0KICAgICAgIHViaWZzLXV0
aWxzOiBvcGVuX3ViaTogU2V0IGVycm5vIGlmIHRoZSB0YXJnZXQgaXMgbm90IGNoYXIgZGV2
aWNlDQogICAgICAgZnNjay51YmlmczogQWRkIGZzY2sgc3VwcG9ydA0KICAgICAgIGZzY2su
dWJpZnM6IEFkZCBpbmNvbnNpc3RlbnQgcHJvYmxlbSBoYW5kbGluZyBhc2tpbmcgZnVuY3Rp
b24NCiAgICAgICBmc2NrLnViaWZzOiBEaXN0aW5ndWlzaCByZWFzb25zIHdoZW4gY2VydGFp
biBmYWlsdXJlcyBoYXBwZW4NCiAgICAgICBmc2NrLnViaWZzOiBMb2FkIGZpbGVzeXN0ZW0g
aW5mb3JtYXRpb24gZnJvbSBVQkkgdm9sdW1lDQogICAgICAgZnNjay51YmlmczogQWRkIG5v
ZGUgcGFyc2luZyBmdW5jdGlvbnMNCiAgICAgICBmc2NrLnViaWZzOiBBZGQgZmlsZSBvcmdh
bml6YXRpb24gcmVhbGl6YXRpb24NCiAgICAgICBmc2NrLnViaWZzOiBBZGQgcmVidWlsZGlu
ZyBmaWxlc3lzdGVtIHN1cHBvcnQNCiAgICAgICBmc2NrLnViaWZzOiByZWJ1aWxkX2ZzOiBS
ZW1vdmUgZGVsZXRlZCBub2RlcyBmcm9tIHZhbGlkIG5vZGUgdHJlZQ0KICAgICAgIGZzY2su
dWJpZnM6IHJlYnVpbGRfZnM6IEFkZCB2YWxpZCBub2RlcyBpbnRvIGZpbGUNCiAgICAgICBm
c2NrLnViaWZzOiByZWJ1aWxkX2ZzOiBGaWx0ZXIgaW52YWxpZCBmaWxlcw0KICAgICAgIGZz
Y2sudWJpZnM6IHJlYnVpbGRfZnM6IEV4dHJhY3QgcmVhY2hhYmxlIGRpcmVjdG9yeSBlbnRy
aWVzIHRyZWUNCiAgICAgICBmc2NrLnViaWZzOiByZWJ1aWxkX2ZzOiBDaGVjayBhbmQgY29y
cmVjdCBmaWxlcycgaW5mb3JtYXRpb24NCiAgICAgICBmc2NrLnViaWZzOiByZWJ1aWxkX2Zz
OiBSZWNvcmQgdXNlZCBMRUJzDQogICAgICAgZnNjay51YmlmczogcmVidWlsZF9mczogUmUt
d3JpdGUgZGF0YQ0KICAgICAgIGZzY2sudWJpZnM6IHJlYnVpbGRfZnM6IENyZWF0ZSBuZXcg
cm9vdCBkaXIgaWYgdGhlcmUgYXJlIG5vIHNjYW5uZWQgZmlsZXMNCiAgICAgICBmc2NrLnVi
aWZzOiByZWJ1aWxkX2ZzOiBCdWlsZCBUTkMNCiAgICAgICBmc2NrLnViaWZzOiByZWJ1aWxk
X2ZzOiBCdWlsZCBMUFQNCiAgICAgICBmc2NrLnViaWZzOiByZWJ1aWxkX2ZzOiBDbGVhbiB1
cCBsb2cgYW5kIG9ycGhhbiBhcmVhDQogICAgICAgZnNjay51YmlmczogcmVidWlsZF9mczog
V3JpdGUgbWFzdGVyIG5vZGUNCiAgICAgICBmc2NrLnViaWZzOiBSZWFkIG1hc3RlciBub2Rl
ICYgaW5pdCBscHQNCiAgICAgICBmc2NrLnViaWZzOiBSZXBsYXkgam91cm5hbA0KICAgICAg
IGZzY2sudWJpZnM6IEhhbmRsZSBvcnBoYW4gbm9kZXMNCiAgICAgICBmc2NrLnViaWZzOiBD
b25zb2xpZGF0ZSBsb2cNCiAgICAgICBmc2NrLnViaWZzOiBSZWNvdmVyIGlzaXplDQogICAg
ICAgZnNjay51YmlmczogTW92ZSBjb21tb24gZnVuY3Rpb25zIGFuZCBkYXRhIHN0cnVjdHVy
ZXMgaW50byBmc2NrLnViaWZzLmMNCiAgICAgICBmc2NrLnViaWZzOiBUcmF2ZXJzZSBUTkMg
YW5kIGNvbnN0cnVjdCBmaWxlcw0KICAgICAgIGZzY2sudWJpZnM6IEVuc3VyZSB0aGF0IFRO
QyBMRUIgY2FuIGJlIHNjYW5uZWQgc3VjY2Vzc2Z1bA0KICAgICAgIGZzY2sudWJpZnM6IFVw
ZGF0ZSBmaWxlcycgc2l6ZSBmb3IgY2hlY2sgbW9kZQ0KICAgICAgIGZzY2sudWJpZnM6IENo
ZWNrIGFuZCBoYW5kbGUgaW52YWxpZCBmaWxlcw0KICAgICAgIGZzY2sudWJpZnM6IENoZWNr
IGFuZCBoYW5kbGUgdW5yZWFjaGFibGUgZmlsZXMNCiAgICAgICBmc2NrLnViaWZzOiBDaGVj
ayB3aGV0aGVyIHRoZSBUTkMgaXMgZW1wdHkNCiAgICAgICBmc2NrLnViaWZzOiBNb3ZlIGNv
bW1vbiBmdW5jdGlvbnMgYW5kIGRhdGEgc3RydWN0dXJlcyBpbnRvIGNoZWNrX3NwYWNlLmMN
CiAgICAgICBmc2NrLnViaWZzOiBjaGVjayBhbmQgY29ycmVjdCB0aGUgc3BhY2Ugc3RhdGlz
dGljcw0KICAgICAgIGZzY2sudWJpZnM6IENvbW1pdCBwcm9ibGVtIGZpeGluZyBtb2RpZmlj
YXRpb25zIHRvIGRpc2sNCiAgICAgICBmc2NrLnViaWZzOiBDaGVjayBhbmQgY29ycmVjdCB0
aGUgaW5kZXggc2l6ZQ0KICAgICAgIHViaWZzLXV0aWxzOiBsaWJ1YmlmczogU3VwcG9ydCBz
b21lIGZpbGUgb3BlcmF0aW9ucw0KICAgICAgIGZzY2sudWJpZnM6IENoZWNrIGFuZCBjcmVh
dGUgdGhlIHJvb3QgZGlyDQogICAgICAgZnNjay51YmlmczogSGFuZGxlIGRpc2Nvbm5lY3Rl
ZCBmaWxlcw0KICAgICAgIGZzY2sudWJpZnM6IERvIGZpbmFsIGNvbW1pdHRpbmcNCiAgICAg
ICBmc2NrLnViaWZzOiBBZGQgUkVBRE1FIHRvIGRlc2NyaWJlIGZzY2sNCiAgICAgICB0ZXN0
czogQWRkIGNvbW1vbiBsaWJzIGZvciB0ZXN0aW5nIGZzY2sudWJpZnMvbWtmcy51Ymlmcw0K
ICAgICAgIHRlc3RzOiB1Ymlmc190b29sczogZnNja190ZXN0czogQWRkIGF1dGhlbnRpY2F0
aW9uIHJlZnVzaW5nIHRlc3QNCiAgICAgICB0ZXN0czogdWJpZnNfdG9vbHM6IGZzY2tfdGVz
dHM6IEFkZCBjeWNsZSBtb3VudCtmc2NrIHRlc3QNCiAgICAgICB0ZXN0czogdWJpZnNfdG9v
bHM6IGZzY2tfdGVzdHM6IEFkZCBwb3dlcmN1dCtmc2NrK21vdW50IHRlc3QNCiAgICAgICB0
ZXN0czogdWJpZnNfdG9vbHM6IGZzY2tfdGVzdHM6IEFkZCBjb3JydXB0K2ZzY2srZmF1bHRf
aW5qZWN0IHRlc3QNCiAgICAgICB0ZXN0czogdWJpZnNfdG9vbHM6IGZzY2tfdGVzdHM6IEFk
ZCBjeWNsZV9wb3dlcmN1dCtmc2NrIHRlc3QNCiAgICAgICB0ZXN0czogdWJpZnNfdG9vbHM6
IGZzY2tfdGVzdHM6IEFkZCByYW5kb21fY29ycnVwdCtmc2NrIHRlc3QNCiAgICAgICB0ZXN0
czogdWJpZnNfdG9vbHM6IGZzY2tfdGVzdHM6IEFkZCBjb3JydXB0ZWQgaW1hZ2VzDQogICAg
ICAgdGVzdHM6IHViaWZzX3Rvb2xzOiBmc2NrX3Rlc3RzOiBBZGQgYmFkIGltYWdlcyBmaXhp
bmcgdGVzdA0KICAgICAgIHRlc3RzOiB1Ymlmc190b29sczogbWtmc190ZXN0czogQWRkIGZz
IGNvbnRlbnQgY2hlY2sgdGVzdA0KICAgICAgIHRlc3RzOiB1Ymlmc190b29sczogQWRkIHJ1
bl9hbGwgc2NyaXB0DQogICAgICAgdGVzdHM6IHViaWZzX3Rvb2xzOiBBZGQgUkVBRE1FDQog
ICAgICAgdWJpZnMtdXRpbHM6IFN1cHBvcnQgQWRkcmVzcy1TYW5pdGl6aWVyIGRlYnVnDQog
ICAgICAgdWJpLXV0aWxzOiBtdGRpbmZvOiBGaXggdHlwZSB0cnVuY2F0aW9uIGNvbXBpbGlu
ZyB3YXJuaW5nIGZvciAnc3RhcnQnIHZhcmlhYmxlDQogICAgICAgbmFuZC11dGlsczogbmFu
ZGR1bXA6IEZpeCB1bmV4cGVjdGVkIHR5cGUgY29tcGlsaW5nIHdhcm5pbmcgZm9yIGFyZ3Vt
ZW50ICdkdW1wZmlsZScNCiAgICAgICBtaXNjLXV0aWxzOiBmbGFzaGNwOiBGaXggdW5pbml0
aWFsaXplZCB2YXJpYWJsZSDigJh3cmxhc3RfYnVm4oCZIGNvbXBpbGluZyB3YXJuaW5nDQog
ICAgICAgamZmc1gtdXRpbHM6IGpmZnMycmVhZGVyOiBGaXggcG90ZW50aWFsIG51bGwgcG9p
bnRlciBkZXJlZmVyZW5jZSBjb21waWxpbmcgd2FybmluZyBmb3IgJ3BhdGgnDQogICAgICAg
dGVzdHM6IGNoZWNrZnM6IEFkZCBwcmV2aW91cyBwcm90b3R5cGUgZm9yIGRvX3B3cl9kbigp
DQogICAgICAgdWJpZnMtdXRpbHM6IGNvbW1vbjogQWRkIGRlc2NyaXRwaW9ucyBmb3IgbGlu
dXgga2VybmVsIHJlc291cmNlIGZpbGVzDQogICAgICAgdWJpZnMtdXRpbHM6IGxpYnViaWZz
OiBVcGRhdGUgc291cmNlIGZpbGVzIGZyb20gbGludXgga2VybmVsIDYuMTMtcmM3DQoNCg0K
UmVnYXJkcywNCg0KRGF2aWQNCg==
--------------xOiKIRTskYVX9fchPe4UnPwU
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

--------------xOiKIRTskYVX9fchPe4UnPwU--

--------------58jzVTGOPdaewPOcTbVSj8yH--

--------------h4vScc9Vkza90305df50MuT0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEEwY/cjyeWErqzVubvOXcPHQaAtEFAmewu2EFAwAAAAAACgkQvOXcPHQaAtGh
DggAwi/fYrMKeZeBYbjHqzrYCG4uM3NAsFBalouE6VNQLeuhhtr0Pl9xpySwOb7tnn7rNdi1gl3q
jLbLjeCUII83WCOdpOtczmKr2eWDM5VtUr6nxhkYQxlXCnCPZLSV37mdUUeklp+Qoc2OeFVV7Eg4
sbEuNA68/11kAN/QSMhW3xAJpoS/IdFSoQGMdW0oRS1MfknDuBOPjhgpUn2DD3B7pm133yPQKsiV
I0jv/H5HXPudXdPvr4NZ84WYDHXPOpt+ql4+rjGbT7PRWUrwfN9j1OHPfmyyUHeHrHHtYe4N51q5
TY3OhJjDx6UG9gqLGivHFxtw/0DSB9VFNUBNI5BMLw==
=bOSn
-----END PGP SIGNATURE-----

--------------h4vScc9Vkza90305df50MuT0--


--===============4020015404324974391==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4020015404324974391==--

