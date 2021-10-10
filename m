Return-Path: <SRS0=3QOd=O6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62D76C433EF
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Oct 2021 12:55:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F249461076
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Oct 2021 12:55:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F249461076
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=narfation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=ObM3l7QSp51iIWR/LcwfJa7vTSkzAEgXXa8EfDTRiX0=; b=kUw
	0a3qe6zRTa+BbwbFxSZ+VAvlxD0KnpvO1C7/k32WjynajpGhiwtWZY7ZSwML5CSNkpYUdJDAZybgf
	q7VG1lEGRnGJ29YNAHzZqGYs/XzQ2GEOMOhhEcwKi/6r8kRBFTO6DNwgeDG7oeXuViY1QkGk47HN5
	/oNO/j9U2LIxlkvM0PJzTbGHZhTYPvS6/x45pcVlyluT2YCZhuAZ32K/LX5z5ZwF3B7Qtd101500k
	ovR6oZLivywfWJsq7YRv0bpnuYHfMvlVGvOusJOVY2FurJu938obJEUAoWUYuyJ3AJdz2lXF5cKSB
	v4EiXjxrfRDZqx3yug/iJZWNzYvip/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZYKm-006oZk-G9; Sun, 10 Oct 2021 12:53:44 +0000
Received: from dvalin.narfation.org ([2a00:17d8:100::8b1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZYKi-006oYm-NH
 for linux-mtd@lists.infradead.org; Sun, 10 Oct 2021 12:53:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1633870416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=Ka3hAH/lUJKKNybA9c7wCc0FnlCDlR+9uRO+Z6eg+H0=;
 b=VJ9K1VA9KuQdCdlA57rb7o13icD7R9BYqtPzIMFahl8qbO3p82UeHkA6j5IQVX1fLpk3KQ
 gIk3bTUxxJa5R311DVAmeA4Sz2dB/RvFu3nQXsi4pBwiTFRIGPTJUuSoD+wBITrPSarjxC
 P/WhbRk2+SQSsLrhGjVLLEHXwmQUd4I=
From: Sven Eckelmann <sven@narfation.org>
To: Ansuel Smith <ansuelsmth@gmail.com>
Cc: Michael Walle <michael@walle.cc>, openwrt-devel@lists.openwrt.org,
 Adrian Schmutzler <dev@schmutzler.it>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-mtd@lists.infradead.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-kernel@vger.kernel.org
Subject: nvmem: Defining cells on mtd created by mtdparts
Date: Sun, 10 Oct 2021 14:53:13 +0200
Message-ID: <18728084.NGlc0Rocea@sven-desktop>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211010_055341_125777_2746D3ED 
X-CRM114-Status: GOOD (  15.68  )
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
Content-Type: multipart/mixed; boundary="===============2801599517776121359=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============2801599517776121359==
Content-Type: multipart/signed; boundary="nextPart18532926.MoXNmc8o6T"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart18532926.MoXNmc8o6T
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: Ansuel Smith <ansuelsmth@gmail.com>
Cc: Michael Walle <michael@walle.cc>, openwrt-devel@lists.openwrt.org, Adrian Schmutzler <dev@schmutzler.it>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-mtd@lists.infradead.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-kernel@vger.kernel.org
Subject: nvmem: Defining cells on mtd created by mtdparts
Date: Sun, 10 Oct 2021 14:53:13 +0200
Message-ID: <18728084.NGlc0Rocea@sven-desktop>

Hi,

OpenWrt switched [1] their MAC address (from flash) retrieval code from their 
mtd-mac-address based solution [2] to nvmem-cells. The mtd-mac-address based 
solution had the benefit that it could find the correct partition by using 
get_mtd_device_nm - which was label based. So a lookup for a partition which 
was defined via mtdparts was absolutely no problem. This doesn't seem to be
the case for nvmem - at least not how it is integrated at the moment in
OpenWrt.

This means that the performed switch broke the vendor defined MAC addresses 
when the u-boot must dynamically define the partitions via mtdpart - and where 
fixed-partitions are not possible in the DT. The bootloaders used by the ath79 
usually have no devicetree support and cannot modify the device tree (beside 
the problem to get the sources for these bootloaders). These devices will now 
only have random mac addresses.

Since there are most likely more devices out there which use mtdparts, I would 
guess that there might already be a strategy out there which can be used to 
define the nvmem-provider for mtdparts defined partitions. At least I saw that 
Bartosz Golaszewski added all the mtd devices automatically as nvmem provider 
in c4dfa25ab307 ("mtd: add support for reading MTD devices via the nvmem 
API"). So there might also be something for nvmem-cells to find the correct 
mtd instead of relying on the fixed-partitions registration + of_node (which 
doesn't exist because it comes from mtdparts and not devicetree).

Right now nvmem_cell_get (actually __nvmem_device_get) in 
nvmem_get_mac_address just return -517 (EPROBE_DEFER). So the nvmem_device is 
not yet registered - which absolutely makes sense when mtdparts is used. 
of_nvmem_find will just not be able to find the of_node for this partition
via bus_find_device_by_of_node because there is no such of_node for mtdparts 
partitions.

Kind regards,
	Sven

[1] https://github.com/openwrt/openwrt/pull/4041
[2] https://github.com/openwrt/openwrt/commit/5ae2e786395c7f9db0167ebe875be5df9502d8d8
--nextPart18532926.MoXNmc8o6T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAmFi4jkACgkQXYcKB8Em
e0Z6cQ/9Fa1wW43nD+xINdgZDbDetWKSlF+in9Sfq3+UKxNp/+isQ+XcukgSTqEN
1grXIVh2NO/yBdJqhmkktWE5j9jnJjN4659vm9wXO/WIHnA6MJBKZ4xM7pI5VXmv
AL1r8veMng4nZahSRSMojMUPjA/oGpNT/oPUwsMakr5Bx6f6TUVaAG6Fc0cr4s51
4Kd5HbUarJcCNMsLy7liIvSLHRnZGjhXhgl7S/sOrJsRzlP6VCPPOU3J/8e7fbIo
NgQO+Q4WD61cNjh6GbUcII/QyMjJTTklAej58FsdUVZtzUntLz9ynXyTZAnTqZDn
luUiaYC2Q/roJgtTN4iFZ3eY43tw4tvlaIyfkJK4I0qkcj7PPmXkZ9IXTKAfrZHs
YL+DU6lUCqG9MhuNP9CmRU6Pd9+YXKPcdlXy7snGq9O2WSezC0TS3TfN2vmpVSwe
41aF7qYpHgRgfup4Zoy7+V5wvjV6MiVgfHcZg8McyQEmp616pFu/yjO3dlfuiLLx
eqf6wxrFDZ51y0EMxtszJX5kKbCDLKLRwxbWVzG3GUS9cL1EJmK9dLrXiE7jPGSz
Nh/oKETVVOkviPlvb0SdnLgNIgRvEgho6x7ofGM+Gxl/BSAOZr+/C4jV6nF4UZ+c
gGwJjcKjowsA0PxxrHD8alsn7eSJrPkS9+kckfSMtbi5ZreTdGs=
=jilJ
-----END PGP SIGNATURE-----

--nextPart18532926.MoXNmc8o6T--





--===============2801599517776121359==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2801599517776121359==--




