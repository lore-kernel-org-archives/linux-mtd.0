Return-Path: <SRS0=p36e=VS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02B84C76196
	for <linux-mtd@archiver.kernel.org>; Sun, 21 Jul 2019 21:33:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDBF820838
	for <linux-mtd@archiver.kernel.org>; Sun, 21 Jul 2019 21:33:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jRdQ2uzq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDBF820838
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sigma-star.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Date:Message-ID:Subject:From:To:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=ZtDn4hjNn5uhzOZlzuUUSUQozOtsVNRC7K/n4Q1C2TQ=; b=jRd
	Q2uzqMKc0hwaHL5VOQmy1JKQPJ9/eek3YvbebeihLiba8EseXfRDn1iBuIZBVn55vlEVHg5JaiLD/
	6BEiiekYGd5qpdap7VeT5s81VhyWKYLUHN4LQpdblBPIuW4OAb5fyq7xmEnCWi6Hiqgtas9sNDzzF
	+wjMBfxesc711VTBZlvC1g1O+Hkf6KCCyCXAKYqJJjYxGiQnp1ckK5xxSV610mdmPmjY9B5kEEbYe
	XcF0Hfe/QTdW7XhEjaemQMQ+bnfUMuZx+HMTiNPI+J0ACNaoB/wnrNqc5cSl+lVHsE3OWBLk0erPM
	OqkDQzbSHC3lV7z4z/WPOxkBj7dxmyA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hpJSO-000386-Ev; Sun, 21 Jul 2019 21:33:24 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hpJSK-00036K-Us
 for linux-mtd@lists.infradead.org; Sun, 21 Jul 2019 21:33:23 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id D19AC181821E0;
 Sun, 21 Jul 2019 23:33:16 +0200 (CEST)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id LOmddOu5qB3W; Sun, 21 Jul 2019 23:33:15 +0200 (CEST)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id rebDbIMb-7gv; Sun, 21 Jul 2019 23:33:15 +0200 (CEST)
To: MTD Mailing List <linux-mtd@lists.infradead.org>,
 Buildroot Mailing List <buildroot@busybox.net>,
 "Josh Boyer (Fedora)" <jwboyer@gmail.com>,
 "Riku Voipio (Debian)" <riku.voipio@linaro.org>,
 "Pascal Bleser (SUSE)" <pascal.bleser@opensuse.org>,
 "Timothy Redaelli (Arch)" <timothy.redaelli@gmail.com>,
 Richard Weinberger <richard@nod.at>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [ANNOUNCE] mtd-utils-2.1.1 is released
Openpgp: preference=signencrypt
Autocrypt: addr=david.oberhollenzer@sigma-star.at; prefer-encrypt=mutual;
 keydata=
 mQENBFZyf0YBCADHyKhABhxthCC9n48pvsuk5p3IEdYXMs8Apenh1N/Z4cViAz/d/nSCZ+FG
 FX/PSubEzq8AilZLejchAltaORCvA1Y6FgTlpcdJ6gHDfStDbJL/vk5N8aL7YNF7VfjTRntB
 tKbhKcrG05nbdNjIioAm04pt9rx5mV5KMbf22/FdZpOSSsC6/N7b/cFH9+fx8kwi4pNFuJwr
 BkWRuQ7rEtCoSpd22t+Vh9qA7kymW9gWY405258jnN65jBO7ElqU2CCuGRPg6uryAHV3RVCB
 9j9AE3HLacQReFtt5ylyydSQbaK4K9asnd7U2/C11vIuuciXCppX4bPap/pMnGpzw0UNABEB
 AAG0N0RhdmlkIE9iZXJob2xsZW56ZXIgPGRhdmlkLm9iZXJob2xsZW56ZXJAc2lnbWEtc3Rh
 ci5hdD6JATcEEwEIACEFAlZyf0YCGwMFCwkIBwIGFQgJCgsCBBYCAwECHgECF4AACgkQvOXc
 PHQaAtFuEAgArXOhaoaVvCMVCa5N25Q/+Q6K1wrVpPmkH89yhQqCmfM6f+2VM5MGFDPfaSJ3
 5fBDH0iwBQwlXIb7NSXWtzdXX9rMvJkJqv45TgeKtJApf/sRhmcN+clrwzP8oZQbxkP1YWzo
 Vwo4lOb3Kv7aY9yeCjqNbdJJ57NpvYOUrzrCpGkrDPBBQOvKF3wbq3oU/o3dT23NDeQ20jXg
 quJf/PCw6WCzRxqg58wH02MdMDQe8vByzVig2bM2e7DErtt+hPK/Dmdsqgns+Z+SrQcOvRa3
 GMAHAuHB0u2LhYO6NyaNCgzdgutorilYcq7FEKr8XqwOnfVmZdCW3qGKmLbn6qMEdLkBDQRW
 cn9GAQgAvugF8cFjv2Zs4BBb44SnxGawBySC1bMRas/MjA9EMHUAx/StcecQmxnl6BzEyGpr
 +TRnXIzcb5xI8SxitBDU5MLvwsHgNvpYp9fscd4kWP7oMir9ta3Q8SvT4OLbO4FZBGaURzGP
 ak8JmjMMtOoOBh4meOjz6GrJe9UIGxT94aB01w7YohfBANzK8xyk4ykKC5Op4XgaaMKOEQUa
 h7wajcojYSlvgOiXqEisMHlRDAW6sXL2sEM7TIpvYhy9txMLllpkYb0Pu1BvUpY/unsybWKA
 FyiTmeiY+nEveUvqX6Ef7BWdClBeCk2UaRvtcoLd22VxMlKTniHQcNMOXlRRawARAQABiQEf
 BBgBCAAJBQJWcn9GAhsMAAoJELzl3Dx0GgLRPtcH/jD6rn2+VIKgrHdt3ao3Abpu2fqYfwbI
 yPAtpXOddDptVq+0A/2arXT1Y8+jNSZpbAg8K+bLaEAcSUEjviKMpfI7ppTUBuGKrpgc5xsi
 UpKkJCb7oB1ZraIBNBPtPPVUhbwLie4uW/LVt+8rBKz3W9KEDOsT0ZCG/pW8Ld+EpDR9l0fm
 qoVHaw8PhLAtez+B7HS7Hv7iJPDtX85kFYpud8kIPENXVn9EjZudyMWgZb2LhYlcavNcszgR
 7In6ift5SNySojCOfAV0iKZb8QUXWktLleY8kQ8jltOsSRTuO4PDfzvtCQDixUw4tQ7WLwDT
 qyUpot0oG03vtSG4LIRCdxI=
Organization: sigma star gmbh
Message-ID: <805d5408-af93-43e4-6615-1ee0c7ca9dc3@sigma-star.at>
Date: Sun, 21 Jul 2019 23:32:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190721_143321_292234_2E2CA3DE 
X-CRM114-Status: GOOD (  10.88  )
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
Content-Type: multipart/mixed; boundary="===============3799271094288701069=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============3799271094288701069==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="GPLYMxkHIfrvb9FNRVlkZFhlgGHmhw0hH"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--GPLYMxkHIfrvb9FNRVlkZFhlgGHmhw0hH
Content-Type: multipart/mixed; boundary="Cmxz8VivN6C5p0hm8YmtSOJ7cnAYhhDSD";
 protected-headers="v1"
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: MTD Mailing List <linux-mtd@lists.infradead.org>,
 Buildroot Mailing List <buildroot@busybox.net>,
 "Josh Boyer (Fedora)" <jwboyer@gmail.com>,
 "Riku Voipio (Debian)" <riku.voipio@linaro.org>,
 "Pascal Bleser (SUSE)" <pascal.bleser@opensuse.org>,
 "Timothy Redaelli (Arch)" <timothy.redaelli@gmail.com>,
 Richard Weinberger <richard@nod.at>
Message-ID: <805d5408-af93-43e4-6615-1ee0c7ca9dc3@sigma-star.at>
Subject: [ANNOUNCE] mtd-utils-2.1.1 is released

--Cmxz8VivN6C5p0hm8YmtSOJ7cnAYhhDSD
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

mtd-utils-2.1.1 is released.

Tarball:               ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-2.=
1.1.tar.bz2
Tarball gpg signature: ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-2.=
1.1.tar.bz2.asc
Signed git tag:        git://git.infradead.org/mtd-utils.git v2.1.1


This release contains primarily bug fixes following the 2.1.0 release tha=
t
introduced a number of new features. Most importantly, one of the fixes
contained address a problem building mkfs.ubifs with file encryption disa=
bled,
hence the push for an earlier release despite only a small number of comm=
its
since 2.1.0.

On the side of features, optional support for zstd compression has been a=
dded
to mkfs.ubifs now that it is supported in UBIFS on the kernel side.

With a newer gcc version, the build is now spewing warnings again. So cur=
rently
work is on the way to address this (and also issues reported by static
analysis), so the next release will probably be another patch level incre=
ment
again, most likely before the end of the year.


Changes from 2.1.0 to 2.1.1:

Features:
 - mkfs.ubifs: Add ZSTD compression

Fixes:
 - ubiformat: Dont ignore sequence number CLI option
 - mkfs.ubifs: fix build without openssl
 - mkfs.ubifs: fix regression when trying to store device special files
 - mkfs.ubifs: fix description of favor_lzo
 - unittests/test_lib: Include proper header for _IOC_SIZE
 - unittests/libmtd_test: Include fcntl header
 - unittests: Define the use of _GNU_SOURCE
 - ubinize: Exit with non-zero exit code on error.
 - mtd-tests: nandbiterrs: Fix issue that just insert error at bit 7
 - ubi-tests: ubi_mkvol_request: Fully initialize 'struct ubi_mkvol_reque=
st req'
 - ubi-tests: io_read: Filter invalid offset value before 'lseek' in io_r=
ead test
 - ubi-tests: mkvol test: Checks return value 'ENOSPC' for 'ubi_mkvol'
 - ubi-tests: fm_param: Replace 'fm_auto' with 'fm_autoconvert'



Raw short log since the 2.1.0 release:

Amol Vengurlekar (1):
      ubiformat: Dont ignore sequence number CLI option

Baruch Siach (1):
      mkfs.ubifs: fix build without openssl

David Oberhollenzer (2):
      mkfs.ubifs: fix regression when trying to store device special file=
s
      mkfs.ubifs: remove ZSTD_CLEVEL_DEFAULT for backwards compatibillity=


Martin Kaiser (1):
      mkfs.ubifs: fix compilation without ZSTD

Olliver Schinagl (3):
      unittests/test_lib: Include proper header for _IOC_SIZE
      unittests/libmtd_test: Include fcntl header
      unittests: Define the use of _GNU_SOURCE

Patrick Doyle (1):
      ubinize: Exit with non-zero exit code on error.

Sebastian Andrzej Siewior (1):
      mkfs.ubifs: Add ZSTD compression

Uwe Kleine-K=C3=B6nig (1):
      mkfs.ubifs: fix description of favor_lzo

Xiaolei Li (1):
      mtd-tests: nandbiterrs: Fix issue that just insert error at bit 7

Zhihao Cheng (4):
      ubi-tests: ubi_mkvol_request: Fully initialize 'struct ubi_mkvol_re=
quest req'
      ubi-tests: io_read: Filter invalid offset value before 'lseek' in i=
o_read test
      ubi-tests: mkvol test: Checks return value 'ENOSPC' for 'ubi_mkvol'=

      ubi-tests: fm_param: Replace 'fm_auto' with 'fm_autoconvert'


Regards,

David


--Cmxz8VivN6C5p0hm8YmtSOJ7cnAYhhDSD--

--GPLYMxkHIfrvb9FNRVlkZFhlgGHmhw0hH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEEwY/cjyeWErqzVubvOXcPHQaAtEFAl002hQACgkQvOXcPHQa
AtFUIAgAnv6rHG8+/VH3eu8VRv9U4PTfN1ffmuHnAHCW5gOy7pFPkDplGROqfctG
CzdA748OJv7sgN8vSXtKB7Nlwm5LjIH8YYIj+35OCre2j2VHUeIYqN6lJOfdpo9w
Xr/7a+WCsrRv8SWTXyfUPM6mmyNWxO7ofTtrb5/QHECRGIV0fXMxSaS/Iyc9wdIR
qpsXM67lCNTzw+PenC50tYK9Koj8pdiEQN+lYInO0EVE1jeiEhG7z7oCiu971926
9d8a/nrzlSbPR6iYyveY+Qu5cvITwm/aUwLD24dOBt63h+C0Bayju1ftlQxYJf6P
T0ilVTbuxbeQrWK/veN9OdqibhhzgA==
=nQVS
-----END PGP SIGNATURE-----

--GPLYMxkHIfrvb9FNRVlkZFhlgGHmhw0hH--


--===============3799271094288701069==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3799271094288701069==--

