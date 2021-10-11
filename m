Return-Path: <SRS0=sMU9=O7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86949C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Oct 2021 07:08:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4896360E53
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Oct 2021 07:08:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4896360E53
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=narfation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mj3Hn7qPuhWw3W3bt6q6dHKrazEy3EUojzSywXLhtbM=; b=hrflVN+tdMk2WyanAvyf2WE5Gx
	PN6l0LL6QAQorS3GzOEI90XIRfEDxT29Q0MhnDYhx/C5IDkSYQmutq2NRVEVY25C/YzmTsY/67qzU
	8IVwqsN7xeHGKQSzrL1hJoFuhd3UEH92X1drZjg1kET17eZEDVhiRYm09g4ITTgvXpcfLidPBPoqI
	T/ONsSKj9gAZLCJB0uBzoG5raM6iNM2TuX4Ss88KL//eYhs4+8TZgziHZ03LbYfy8h6z8XAWj2Qoa
	rA5D5XrOZcSl20DOK2Com2lZWDzE/6p5kzAh1xOhFMHroDNH7GQVz4iHa2pM4pURz1nbcUVyIMyGa
	WXmka2IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZpP8-0083N1-Ar; Mon, 11 Oct 2021 07:07:22 +0000
Received: from dvalin.narfation.org ([2a00:17d8:100::8b1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZpOr-0083Ha-E4
 for linux-mtd@lists.infradead.org; Mon, 11 Oct 2021 07:07:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1633936023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4A5IbiON99sAmaO5rSffIZ7vgzdOWfa8UnMZX6no8SI=;
 b=XZSyyuZJbarDtRPi2do9RZJzBnzxlFdszrY04nDqWis73okxBzpJoCfh+RA8SLDvuciTLZ
 9hsVmEICvl3JjYKdA4KeElflamaETDHsW00Be2UMnIKCK70wPJeseVi5tjogKlBOy4AFgd
 +KVsAJZtmvzYHOzpzms4Kioebl+/rpw=
From: Sven Eckelmann <sven@narfation.org>
To: openwrt-devel@lists.openwrt.org
Cc: Ansuel Smith <ansuelsmth@gmail.com>, Michael Walle <michael@walle.cc>,
 Adrian Schmutzler <dev@schmutzler.it>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-mtd@lists.infradead.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-kernel@vger.kernel.org
Subject: Re: nvmem: Defining cells on mtd created by mtdparts
Date: Mon, 11 Oct 2021 09:06:56 +0200
Message-ID: <14722734.oMan5NXi5u@sven-desktop>
In-Reply-To: <18728084.NGlc0Rocea@sven-desktop>
References: <18728084.NGlc0Rocea@sven-desktop>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_000705_673846_71AF16AC 
X-CRM114-Status: GOOD (  10.92  )
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
Content-Type: multipart/mixed; boundary="===============6822046365647018704=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============6822046365647018704==
Content-Type: multipart/signed; boundary="nextPart27234856.iIAV7Kigx3"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart27234856.iIAV7Kigx3
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: openwrt-devel@lists.openwrt.org
Cc: Ansuel Smith <ansuelsmth@gmail.com>, Michael Walle <michael@walle.cc>, Adrian Schmutzler <dev@schmutzler.it>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-mtd@lists.infradead.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-kernel@vger.kernel.org
Subject: Re: nvmem: Defining cells on mtd created by mtdparts
Date: Mon, 11 Oct 2021 09:06:56 +0200
Message-ID: <14722734.oMan5NXi5u@sven-desktop>
In-Reply-To: <18728084.NGlc0Rocea@sven-desktop>
References: <18728084.NGlc0Rocea@sven-desktop>

On Sunday, 10 October 2021 14:53:13 CEST Sven Eckelmann wrote:
[...]
> Since there are most likely more devices out there which use mtdparts, I would 
> guess that there might already be a strategy out there which can be used to 
> define the nvmem-provider for mtdparts defined partitions. At least I saw that 
> Bartosz Golaszewski added all the mtd devices automatically as nvmem provider 
> in c4dfa25ab307 ("mtd: add support for reading MTD devices via the nvmem 
> API"). So there might also be something for nvmem-cells to find the correct 
> mtd instead of relying on the fixed-partitions registration + of_node (which 
> doesn't exist because it comes from mtdparts and not devicetree).

Ansuel Smith just proposed in OpenWrt [1] a workaround. It basically adds a 
minimal fixed-partitions parser to the mtd cmdlinepart parser (responsible for 
the mtdparts=) that tries to find the matching (size + offset) fixed-partition 
from the devicetree. The code in mtd_device_parse_register
(add_mtd_partitions -> add_mtd_device -> mtd_nvmem_add) will then 
automatically take care of the rest.

Kind regards,
	Sven

[1] https://github.com/openwrt/openwrt/pull/4664#issuecomment-939567963
--nextPart27234856.iIAV7Kigx3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAmFj4pAACgkQXYcKB8Em
e0b9eBAArC/EsvvrKk2y7/99MES/Eds+2b37/9dxuvOPOxULMobk3Gu1VC1qhKv4
Z2zYdWP1rGz14r+DqYD9YhSvw1wM8WMN6hT3A2QWErF36fPngvahOLXZjoagaDVN
PQQ+G8KKV/5WtNGjiah8zMWBcXC0zzLVRkxLsZ2BwuSVXsFo0qJereWknxw7F/Qf
dw86a5Yf7JbcPaL4oJg/522oC+6O8CLwakwmyjp5ZLDDqo/z+p4DgqDM8OVphX5v
0MsYCT0YfvEJyVOZfkiUKljqIwyEgJbAtJDxIYAX6Riauz+cEmy6diArVOnNro8/
EEQuoyJq6Vu9By2E/pnsDahrk1DIkd5pi1hnR8qTMf/VTD2YC85DWg1y7qKdpf8g
pQ8HsH/5ZCgPcQJFXU50RNaxlHQq8BJVbGcO8SHKUSZY29lo17pafWwMfRKLO1fh
Qhyk8l19iwmmQ09Uho1xbNE5CBzSP1RH76/4HTEFDXPYSOCu1zDuf5FSlSQZjTop
KClni0PvXPqeDRRtkoMLO2/LIjE3S8cCsRF37zqJdN6Ko9drwk/Vsp1BEIkzBzB9
hNihrk6JeaKhQ6Ogmtcw7pIMwrI8TXgvWlYqvaEt7KPHU0HKXOXdkS+4jO1nyaZD
k4dLtPx5LW4kgHcY0JqaFLOZfTMwPiPL05cPTEp+WkyR7rJCktk=
=iCmG
-----END PGP SIGNATURE-----

--nextPart27234856.iIAV7Kigx3--





--===============6822046365647018704==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6822046365647018704==--




