Return-Path: <SRS0=HPMf=PA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2061EC433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Oct 2021 19:00:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5042610CC
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Oct 2021 19:00:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A5042610CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=narfation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=12WUP/tHJ3Nt25izK8l84V76nxesWWopRukLFy+DAcU=; b=CVUnXx3nqQnW1z+VWk7XoI5k/n
	HzgGw6ABXIX6szdj1I5I2ioRjQesQJbCRpsJmE9jvvTacItCaaIxyWDBpv8nDg9sQZdYhnnjsVEwp
	DJ3nXNF1W8IhTeCac+vNzBDLPOKwGuf17pYF4sg15jiFoskk0Qq+7hRTA2rPZeIhBiegiudUxmXVn
	R+SBv748a3b6u0qFkMBZ+lp3eq9GvNgc1mF2iTo1ucU6QqhDGcfEhG/SVMvV2k3vuf2PkedmBfgbl
	1QtS9q+1L7nB4i6kdrnLgUd03E79bPaByFtIZTf/3wWnof3nGQtoWLcn6BrbMK8P8c4Za9/R0U+0P
	HunHC39Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maN0K-00Dod1-6u; Tue, 12 Oct 2021 19:00:00 +0000
Received: from dvalin.narfation.org ([213.160.73.56])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maN04-00DobG-GG
 for linux-mtd@lists.infradead.org; Tue, 12 Oct 2021 18:59:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1634065180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=auzct+JBnaE77SphBzk5VRKwxJ9bO7VVvpIpQ0hJFP0=;
 b=BmJhgjsy5qFOjJrDKOV46STVvCU5J6aPoxBh1f92e0SPnC0r2dCCvTbkbgtMwFTLhPerWr
 fM4sksq1R55NWV9VNfdb4UVvNf4Td51zWyJS0H8iul6GHfpGgtKT8xypdFYRMIIEwcA+yf
 +J/yrBgxukmX00kHU863/1VONkxjhnc=
From: Sven Eckelmann <sven@narfation.org>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: openwrt-devel@lists.openwrt.org, Ansuel Smith <ansuelsmth@gmail.com>,
 Michael Walle <michael@walle.cc>, Adrian Schmutzler <dev@schmutzler.it>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-mtd@lists.infradead.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-kernel@vger.kernel.org
Subject: Re: nvmem: Defining cells on mtd created by mtdparts
Date: Tue, 12 Oct 2021 20:59:29 +0200
Message-ID: <51067395.yQmhhqxHrA@sven-l14>
X-PRIORITY: 2 (High)
Priority: urgent
In-Reply-To: <20211012182444.qrn3lzp7vukklwlx@ti.com>
References: <18728084.NGlc0Rocea@sven-desktop>
 <14722734.oMan5NXi5u@sven-desktop> <20211012182444.qrn3lzp7vukklwlx@ti.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_115944_903550_87576EE9 
X-CRM114-Status: GOOD (  21.64  )
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
Content-Type: multipart/mixed; boundary="===============0106660953833584282=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============0106660953833584282==
Content-Type: multipart/signed; boundary="nextPart1661808.Y5TqsuFBtk"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart1661808.Y5TqsuFBtk
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: openwrt-devel@lists.openwrt.org, Ansuel Smith <ansuelsmth@gmail.com>, Michael Walle <michael@walle.cc>, Adrian Schmutzler <dev@schmutzler.it>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-mtd@lists.infradead.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-kernel@vger.kernel.org
Subject: Re: nvmem: Defining cells on mtd created by mtdparts
Date: Tue, 12 Oct 2021 20:59:29 +0200
Message-ID: <51067395.yQmhhqxHrA@sven-l14>
X-PRIORITY: 2 (High)
Priority: urgent
In-Reply-To: <20211012182444.qrn3lzp7vukklwlx@ti.com>
References: <18728084.NGlc0Rocea@sven-desktop> <14722734.oMan5NXi5u@sven-desktop> <20211012182444.qrn3lzp7vukklwlx@ti.com>

On Tuesday, 12 October 2021 20:24:46 CEST Pratyush Yadav wrote:
[...]
> I have been wanting to fix this problem for a while but just never got 
> around to it. I was thinking about either extending the mtdparts syntax 
> to maybe add nvmem cell information in there or adding a separate 
> cmdline argument that complements mtdparts with nvmem cell info. Dunno 
> if either of these would work well though...

At least for the devices I have in mind, this doesn't seem to be a good 
solution. The devices are shipped since years and the bootloader isn't updated 
with firmware updates. So changing to a different mtdparts might sometimes not 
be easily possible.

But this might help in situations which don't have this limitation.

> > Ansuel Smith just proposed in OpenWrt [1] a workaround. It basically adds a 
> > minimal fixed-partitions parser to the mtd cmdlinepart parser (responsible for 
> > the mtdparts=) that tries to find the matching (size + offset) fixed-partition 
> > from the devicetree. The code in mtd_device_parse_register
> > (add_mtd_partitions -> add_mtd_device -> mtd_nvmem_add) will then 
> > automatically take care of the rest.
> 
> I don't quite see how this helps. You say that some devices don't have a 
> device tree at all so how would you even match the fixed partition? And 
> this of course doesn't solve the problem where you might want nvmem 
> cells with a partition layout that is different from the one in device 
> tree.

I personally had a different thing in mind. The situation for OpenWrt's ath79 
target (and Linux's ath79) is that they use DTs and some of these devices are 
still using some information which are not part of the device tree. But the
DT partitions for the nvmem-cells MUST match the ones in mtdparts

But you are right, this will definitely not solve situations when there is no 
DT used. And didn't say that I needed a solution for this - I was (hopefully) 
always referring to devices which use mtdparts (which can also be used with 
devices which are using DTs)

Kind regards,
	Sven
--nextPart1661808.Y5TqsuFBtk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAmFl2xEACgkQXYcKB8Em
e0aeQhAAlidibVtr6PhWaQR7ik0lCLwH1o8L08cAvsDHZX80hZZ83nuoyRyMda3g
0QA0f+bdhayXa48v5yb7dVT08Mpv81nsZ5oMWsyx6S5UrcYAgPHilDFBGldqyY7J
7pN3hy2dFChNSaK/X7OIhQ0VbMwErcM0ImyBPa/M8PAdaSDtpXNO/DH4QxgMw2DY
9qzmnOk8y8VjnlInBB92gIVET3tqCTCKLUECkLsAR0wwMEdhXG9AyfCplQw4Ci8y
NPbwjW4kE1WJwu7pz8adoe8B3we0XkRU4+HFvcoIuQCFAxIrjOT+5yZpWTVgg2cH
UtnmSoA7U6NIk7AtAPjVt8Dt++dHlI670bvQlqrphnZ+k4U26vb4TSFnWepGomBv
wMuQEztMrEtjr3wPRYjXPVCUSsT4cXOTzb/QFILYpSLETus5WX4HnATGneCXsFnw
pRkUnGXGsIL9b3bgQdhhWwYmKt2BFMPrX3Kb53chN4mI+rvvi5GNnX0vQAGXhRkk
lVpBNFUr2ele0IfxKYnr8UTU6igwMKFYeLM/mNQm8bh7T02lz2LjbSZsum8EOIqG
doFAcZj6eyF7HqfYi9ZS7u1c5IM/WuRVmzNmUMqQzX0fcBXXNI2BZwNFQm1MNj1S
R6MIy0zAnJJB2KegY9DVqOB/6+SSCQszBGvLFQMoap6HHbZPCIo=
=K/DJ
-----END PGP SIGNATURE-----

--nextPart1661808.Y5TqsuFBtk--





--===============0106660953833584282==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0106660953833584282==--




