Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B44E8C433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Oct 2022 15:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:From:To:MIME-Version:Date:Message-ID:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=51Xz1yv0eOAAy+Doj4ZOMSFl+XgWnYakgro+7gvKpQQ=; b=uEW
	2kWYFje+6qwi0b80Wqrftld21JT4mLiNNSqRus05Iq3P1lN42Q3MjCQHjtjKh0+e3WeboY30CsBw9
	WanDPvalzE7Y/SMCDVW7sLmgbANMxbls4mZgopVLrsXiWYiou/Vg0svA8fMPmkYrORmpPAA9BswLq
	QokN9HA9Fh+OL4l/rmMef0K0dB8ix+O39mNKgKpyUwhTgwpM/z0R9gUIUcGtAMEeAQWo7riE2mmH1
	yCAHsTlxuW8dtHHmQ1vhghZx0ECgp7zIJefCMQGHmjeBGJfPV/fk3sbofFrVHh+nSdNjb976z9DYV
	cOK6wmkKNUr3BsxAiX70/vJi7+oS1Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogpUW-009WUB-9e; Fri, 07 Oct 2022 15:42:24 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogpUS-009WPe-Nc
	for linux-mtd@lists.infradead.org; Fri, 07 Oct 2022 15:42:22 +0000
Received: by mail-wr1-x42c.google.com with SMTP id bv10so4301874wrb.4
        for <linux-mtd@lists.infradead.org>; Fri, 07 Oct 2022 08:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google;
        h=autocrypt:subject:from:to:content-language:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jgPMp1XZGVRvuwaj2o/QqjcL4sRPe4kW8C+obV1FMUo=;
        b=iTcjK1H2kqZfSz30z6dYKwXXn6NPaXgBPp/INh5MuDAob/gqEI2G6JmRixybtqJF4p
         W0AOvrlMhcJD80wfFK+JwgKkwNDSC1OHqhH7sgCmObk0/Qo/s++nLcfiRLtWGn6exrOm
         vMJgvhu/Lcm+rdmHoRz7YadE+CM+A1ECcqZneSiOnwS1bOz9dkTROmPMTNPyAWOIlURO
         N/UUNwokiw5gwh17wMiOatWeHR5OFyz6rK48gt89kNkGGAzOcUZ7CBISVVOAlygN+0X4
         5j1H0NOPo/XysvzPqa8i9VRcLjv98yFeENo70ERHwiSZUQJZ+V9qIVq3Q2PcZVIaUi52
         gZfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=autocrypt:subject:from:to:content-language:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jgPMp1XZGVRvuwaj2o/QqjcL4sRPe4kW8C+obV1FMUo=;
        b=7C3jS8d//s0Hn45wQpUIbLxLIIviuuCNZke9XTU/OCda2cLfBC3oHHBaZfLHf7mWy6
         IorOZL083Li96LFUGPOv5pVVwZ4KORAZjrh9ETJwmY3AURvUVQIIvjdkKifZ28uIOyGj
         0aXC6W8+cW/PLUxTY0Gtx/JarljBrw4RXkxCDgbiDewJksPllNMlQjccsh+KJd9r7CJE
         hntn+rTIr19EZu4voak6WA3Fp7xjW2Bh64cDkx08C926WAMzo7M7nDqT9jKYqnK7SsJn
         fFd/3mWmA+FSRwY+agdlk3hc8dbiIYvxNVFjrce3ijnTkq4AKMR7FLVAmAQGNLOtiGSM
         wfHw==
X-Gm-Message-State: ACrzQf0x2r3LPjmGiUII+bzYvu9lvZx5LNnpX4/Y33BQ5junrqK318/0
	1ka8hBUvKQYeTz783HWhs5WeGizf3ySvt67S
X-Google-Smtp-Source: AMsMyM5lApazIC8LuMlas1ykHnj9UTi4M0VzWXzSIawhpghNQ/pRyywV86pjdb2p7DWwBQOQx/tvCw==
X-Received: by 2002:a5d:4f12:0:b0:22e:3920:a09c with SMTP id c18-20020a5d4f12000000b0022e3920a09cmr3554629wru.95.1665157336164;
        Fri, 07 Oct 2022 08:42:16 -0700 (PDT)
Received: from [192.168.178.86] (clnet-p04-043.ikbnet.co.at. [83.175.81.43])
        by smtp.gmail.com with ESMTPSA id z5-20020a056000110500b0022b11a27e39sm2282840wrw.1.2022.10.07.08.42.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Oct 2022 08:42:15 -0700 (PDT)
Message-ID: <c0992bbb-9487-9a51-ea9f-39cf074b61ec@sigma-star.at>
Date: Fri, 7 Oct 2022 17:42:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: MTD Mailing List <linux-mtd@lists.infradead.org>,
 Buildroot Mailing List <buildroot@busybox.net>,
 "Josh Boyer (Fedora)" <jwboyer@gmail.com>,
 "Riku Voipio (Debian)" <riku.voipio@linaro.org>,
 "Pascal Bleser (SUSE)" <pascal.bleser@opensuse.org>,
 "Levente Polyak (Arch)" <anthraxx@archlinux.org>,
 "Robbat (Gentoo)" <robbat2@gentoo.org>, embedded@gentoo.org,
 "Oliver Schinagl (Alpine)" <oliver@schinagl.nl>,
 "Pascal Bellard (SliTaz)" <pascal.bellard@slitaz.org>,
 =?UTF-8?Q?Llu=c3=ads_Batlle_i_Rossell_=28NixOS=29?= <shaba@altlinux.org>,
 "Sergey Bolshakov (ALT Linux)" <sbolshakov@altlinux.org>,
 "Orphaned (Void Linux)" <orphan@voidlinux.org>,
 Richard Weinberger <richard@nod.at>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [ANNOUNCE] mtd-utils-2.1.5 is released
Autocrypt: addr=david.oberhollenzer@sigma-star.at; keydata=
 xsBNBFZyf0YBCADHyKhABhxthCC9n48pvsuk5p3IEdYXMs8Apenh1N/Z4cViAz/d/nSCZ+FG
 FX/PSubEzq8AilZLejchAltaORCvA1Y6FgTlpcdJ6gHDfStDbJL/vk5N8aL7YNF7VfjTRntB
 tKbhKcrG05nbdNjIioAm04pt9rx5mV5KMbf22/FdZpOSSsC6/N7b/cFH9+fx8kwi4pNFuJwr
 BkWRuQ7rEtCoSpd22t+Vh9qA7kymW9gWY405258jnN65jBO7ElqU2CCuGRPg6uryAHV3RVCB
 9j9AE3HLacQReFtt5ylyydSQbaK4K9asnd7U2/C11vIuuciXCppX4bPap/pMnGpzw0UNABEB
 AAHNN0RhdmlkIE9iZXJob2xsZW56ZXIgPGRhdmlkLm9iZXJob2xsZW56ZXJAc2lnbWEtc3Rh
 ci5hdD7CwHcEEwEIACEFAlZyf0YCGwMFCwkIBwIGFQgJCgsCBBYCAwECHgECF4AACgkQvOXc
 PHQaAtFuEAgArXOhaoaVvCMVCa5N25Q/+Q6K1wrVpPmkH89yhQqCmfM6f+2VM5MGFDPfaSJ3
 5fBDH0iwBQwlXIb7NSXWtzdXX9rMvJkJqv45TgeKtJApf/sRhmcN+clrwzP8oZQbxkP1YWzo
 Vwo4lOb3Kv7aY9yeCjqNbdJJ57NpvYOUrzrCpGkrDPBBQOvKF3wbq3oU/o3dT23NDeQ20jXg
 quJf/PCw6WCzRxqg58wH02MdMDQe8vByzVig2bM2e7DErtt+hPK/Dmdsqgns+Z+SrQcOvRa3
 GMAHAuHB0u2LhYO6NyaNCgzdgutorilYcq7FEKr8XqwOnfVmZdCW3qGKmLbn6qMEdM7ATQRW
 cn9GAQgAvugF8cFjv2Zs4BBb44SnxGawBySC1bMRas/MjA9EMHUAx/StcecQmxnl6BzEyGpr
 +TRnXIzcb5xI8SxitBDU5MLvwsHgNvpYp9fscd4kWP7oMir9ta3Q8SvT4OLbO4FZBGaURzGP
 ak8JmjMMtOoOBh4meOjz6GrJe9UIGxT94aB01w7YohfBANzK8xyk4ykKC5Op4XgaaMKOEQUa
 h7wajcojYSlvgOiXqEisMHlRDAW6sXL2sEM7TIpvYhy9txMLllpkYb0Pu1BvUpY/unsybWKA
 FyiTmeiY+nEveUvqX6Ef7BWdClBeCk2UaRvtcoLd22VxMlKTniHQcNMOXlRRawARAQABwsBf
 BBgBCAAJBQJWcn9GAhsMAAoJELzl3Dx0GgLRPtcH/jD6rn2+VIKgrHdt3ao3Abpu2fqYfwbI
 yPAtpXOddDptVq+0A/2arXT1Y8+jNSZpbAg8K+bLaEAcSUEjviKMpfI7ppTUBuGKrpgc5xsi
 UpKkJCb7oB1ZraIBNBPtPPVUhbwLie4uW/LVt+8rBKz3W9KEDOsT0ZCG/pW8Ld+EpDR9l0fm
 qoVHaw8PhLAtez+B7HS7Hv7iJPDtX85kFYpud8kIPENXVn9EjZudyMWgZb2LhYlcavNcszgR
 7In6ift5SNySojCOfAV0iKZb8QUXWktLleY8kQ8jltOsSRTuO4PDfzvtCQDixUw4tQ7WLwDT
 qyUpot0oG03vtSG4LIRCdxI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221007_084221_114535_601349D1 
X-CRM114-Status: UNSURE (   9.36  )
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
Content-Type: multipart/mixed; boundary="===============8833651441901067369=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============8833651441901067369==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------37diEkXaXVOBw170bhQ5TRVV"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------37diEkXaXVOBw170bhQ5TRVV
Content-Type: multipart/mixed; boundary="------------IBgwrKRXNj9gcrBpgKf0Q4Rx";
 protected-headers="v1"
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: MTD Mailing List <linux-mtd@lists.infradead.org>,
 Buildroot Mailing List <buildroot@busybox.net>,
 "Josh Boyer (Fedora)" <jwboyer@gmail.com>,
 "Riku Voipio (Debian)" <riku.voipio@linaro.org>,
 "Pascal Bleser (SUSE)" <pascal.bleser@opensuse.org>,
 "Levente Polyak (Arch)" <anthraxx@archlinux.org>,
 "Robbat (Gentoo)" <robbat2@gentoo.org>, embedded@gentoo.org,
 "Oliver Schinagl (Alpine)" <oliver@schinagl.nl>,
 "Pascal Bellard (SliTaz)" <pascal.bellard@slitaz.org>,
 =?UTF-8?Q?Llu=c3=ads_Batlle_i_Rossell_=28NixOS=29?= <shaba@altlinux.org>,
 "Sergey Bolshakov (ALT Linux)" <sbolshakov@altlinux.org>,
 "Orphaned (Void Linux)" <orphan@voidlinux.org>,
 Richard Weinberger <richard@nod.at>
Message-ID: <c0992bbb-9487-9a51-ea9f-39cf074b61ec@sigma-star.at>
Subject: [ANNOUNCE] mtd-utils-2.1.5 is released

--------------IBgwrKRXNj9gcrBpgKf0Q4Rx
Content-Type: multipart/mixed; boundary="------------bCkpAgEFycUS1a2gdlgHD1SW"

--------------bCkpAgEFycUS1a2gdlgHD1SW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCm10ZC11dGlscy0yLjEuNSBpcyByZWxlYXNlZC4NCg0KVGFyYmFsbDogICAgICAg
ICAgICAgICBmdHA6Ly9mdHAuaW5mcmFkZWFkLm9yZy9wdWIvbXRkLXV0aWxzL210ZC11dGls
cy0yLjEuNS50YXIuYnoyDQpUYXJiYWxsIGdwZyBzaWduYXR1cmU6IGZ0cDovL2Z0cC5pbmZy
YWRlYWQub3JnL3B1Yi9tdGQtdXRpbHMvbXRkLXV0aWxzLTIuMS41LnRhci5iejIuYXNjDQpT
aWduZWQgZ2l0IHRhZzogICAgICAgIGdpdDovL2dpdC5pbmZyYWRlYWQub3JnL210ZC11dGls
cy5naXQgdjIuMS41DQoNCg0KQWx0ZXJuYXRpdmVseSBhbHNvIG1pcnJvcmVkIGhlcmU6DQoN
ClRhcmJhbGw6ICAgICAgICAgICAgICAgaHR0cHM6Ly9pbmZyYXJvb3QuYXQvcHViL210ZC9t
dGQtdXRpbHMtMi4xLjUudGFyLmJ6Mg0KVGFyYmFsbCBncGcgc2lnbmF0dXJlOiBodHRwczov
L2luZnJhcm9vdC5hdC9wdWIvbXRkL210ZC11dGlscy0yLjEuNS50YXIuYnoyLmFzYw0KU2ln
bmVkIGdpdCB0YWc6ICAgICAgICBodHRwczovL2dpdC5pbmZyYXJvb3QuYXQvbXRkLXV0aWxz
LmdpdCB2Mi4xLjUNCg0KDQpUaGlzIGlzIGEgc21hbGxlciwgcGF0Y2ggbGV2ZWwgcmVsZWFz
ZSB0aGF0IGNvbnNpc3RzIG9mIGEgaGFuZCBmdWxsIG9mIGZpeGVzDQp0aGF0IGhhdmUgYWNj
dW11bGF0ZWQgc2luY2UgdGhlIGxhc3QgcmVsZWFzZSBpbiBKYW51YXJ5Lg0KDQoNClJhdyBz
aG9ydCBsb2cgc2luY2UgdGhlIDIuMS40IHJlbGVhc2U6DQoNCkFsZXggSGVucmllICgxKToN
CiAgICAgICBta2ZzLmpmZnMyOiBmaXggc3BlbGxpbmcgb2YgLS1jb21wcmVzc2lvbi1tb2Rl
IHBhcmFtZXRlciBpbiBoZWxwIHRleHQNCg0KQW5kcmV3IE1lbGxvciAoMSk6DQogICAgICAg
dWJpbmZvOiBGaXggLS12b2xfaWQgcmV0dXJuIGNvZGUgZm9yIGFic2VudCB2b2x1bWUgaWQN
Cg0KQ2hyaXN0b3BoZSBLZXJlbGxvICgxKToNCiAgICAgICBuYW5kZmxpcGJpdHM6IGZpeCBj
b3JydXB0ZWQgb29iDQoNCkRhdmlkIE9iZXJob2xsZW56ZXIgKDEpOg0KICAgICAgIFJlbGVh
c2UgbXRkLXV0aWxzLTIuMS41DQoNCkVucmljbyBKb3JucyAoMSk6DQogICAgICAgbGlibXRk
OiBkbyBub3QgaWdub3JlIG5vbi16ZXJvIGVyYXNlYmxvY2sgc2l6ZSB3aGVuIE1URF9OT19F
UkFTRSBpcyBzZXQNCg0KRnJlZGVyaWMgR2VybWFpbiAoMik6DQogICAgICAgLmdpdGlnbm9y
ZTogYWRkIG5ldyB1YmlzY2FuIHV0aWxpdHkNCiAgICAgICBGaXggd2FybmluZyBhYm91dCB1
bmFsaWduZWQgcG9pbnRlciBpbiBqZmZzMnJlYWRlcg0KDQpLaGVtIFJhaiAoMSk6DQogICAg
ICAgdGVzdHM6IFJlbW92ZSB1bnVzZWQgbGludXgvZnMuaCBoZWFkZXIgZnJvbSBpbmNsdWRl
cw0KDQpNaWNoYWVsIFdhbGxlICgxKToNCiAgICAgICBtdGQtdXRpbHM6IGZsYXNoX290cF9k
dW1wIG1ha2Ugb2Zmc2V0IG9wdGlvbmFsDQoNCk1pa2UgRnJ5c2luZ2VyICgxKToNCiAgICAg
ICBmaXggdGVzdCBiYXNoaXNtDQoNClJhZmHFgiBNacWCZWNraSAoMSk6DQogICAgICAgbmFu
ZHdyaXRlOiB3YXJuIGFib3V0IHdyaXRpbmcgMHhmZiBibG9ja3MNCg0KU2FzY2hhIEhhdWVy
ICgxKToNCiAgICAgICBtdGQtdXRpbHM6IG5hbmRkdW1wOiBmaXggd3JpdGluZyBiaWcgaW1h
Z2VzIG9uIDMyYml0IG1hY2hpbmVzDQoNCmxpYW9odWEgKDEpOg0KICAgICAgIG5vci11dGls
czogZml4IG1lbW9yeSBsZWFrDQoNCg0KUmVnYXJkcywNCg0KRGF2aWQNCg==
--------------bCkpAgEFycUS1a2gdlgHD1SW
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

--------------bCkpAgEFycUS1a2gdlgHD1SW--

--------------IBgwrKRXNj9gcrBpgKf0Q4Rx--

--------------37diEkXaXVOBw170bhQ5TRVV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEEwY/cjyeWErqzVubvOXcPHQaAtEFAmNASNYFAwAAAAAACgkQvOXcPHQaAtH9
lQf/RSjNPp0EToGG687frq+/047MFb5m1pYssy8YRtmUhj3OggR3f+3NNy55mx4f84R3djAlLXZF
q+tzzoAXvgZJZrw9s6p0I2fQdeCzD2puq9eq2fBanvJWyKvvu3Y942oCsvxouXSCGhi+0STpgJ9v
7laTn/qgmM0/v+uw94y69+n7ryCEAbvd/RoDIYvuENAtIuzLDFoejwgdB5/dhN7w+OXAdWcFSmT7
0wi8AiwFTUabyKZ+ni7TLd8RH88EFVP/nw1vjBMAVimrT/d8ukq/WL/eQ9mF3RmYhOlp1t07fyql
Ld6UPwgeLscQK8L2m26UaONJfYSieLwwDoW+7zpHYA==
=LxFl
-----END PGP SIGNATURE-----

--------------37diEkXaXVOBw170bhQ5TRVV--


--===============8833651441901067369==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8833651441901067369==--

