Return-Path: <SRS0=uNk0=Y4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47CEBCA9EB5
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Nov 2019 19:24:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CC112084D
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Nov 2019 19:24:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u2M7ls9U";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk header.b="DaH6+BIf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CC112084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=axnlreFp+Mi2cwduztIqGprFhqzrTp4NRmDaPQfoYnQ=; b=u2M7ls9Uj+NkQfKYFRqdOLy5w
	ysguePkkUI5a0+dmt/0SvHuVbMm11Mli3WyPBeoP4KpYdqJ/IOTi+S4ki5wPDlQs9MM4klxEZoA7R
	mpc0oLhSbQy8nDT+LzMmeO/L+qn4z/i4C/x+s2LIKUUrFMNEcpk0KCd4TPDLFx+UwRsoKIwNqExVU
	SnSX/DxZWMpEVSfwcCFaUirsCi96Dl4RGZBaNNdARGAwjQrxZ0BnWzrxNO+SGioBSeqRW4DXEFLik
	N4IaFk3Q3fP1oRxVtjRN9EdNflH61MxsP0J8V36hA5oW6/k1LcrgbnLFO+oi7UFPVNu+2FK0HtSJm
	naikgCOkg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iRhxb-00079j-9j; Mon, 04 Nov 2019 19:24:19 +0000
Received: from heliosphere.sirena.org.uk ([172.104.155.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iRhxX-00079O-PW
 for linux-mtd@lists.infradead.org; Mon, 04 Nov 2019 19:24:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=14g9oyYQ5ejwP+HUIBS3ppdCvtef/yyJ/Ou2n23wvc8=; b=DaH6+BIfshQ0a09JXhFX+7+Ve
 ocWCl5jQjr0NcdEy7TAyfTb4PkflhPzkycnSRVOxppcwKPJgCThtZXdwIC+3UW5otE5O93Wbp9uo+
 RFJ4CMQU7IT9Tqv/kQCjkrtpLI2UgDhQhr51Zq28U63aFosnxyo8xS13oNy1rZLN2mdes=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iRhxR-00030B-2u; Mon, 04 Nov 2019 19:24:09 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 6231A274301E; Mon,  4 Nov 2019 19:24:06 +0000 (GMT)
Date: Mon, 4 Nov 2019 19:24:06 +0000
From: Mark Brown <broonie@kernel.org>
To: John Garry <john.garry@huawei.com>
Subject: Re: [PATCH 2/3] spi: Add HiSilicon v3xx SPI NOR flash controller
 driver
Message-ID: <20191104192406.GH5238@sirena.co.uk>
References: <1572886297-45400-1-git-send-email-john.garry@huawei.com>
 <1572886297-45400-3-git-send-email-john.garry@huawei.com>
MIME-Version: 1.0
In-Reply-To: <1572886297-45400-3-git-send-email-john.garry@huawei.com>
X-Cookie: This page intentionally left blank.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191104_112415_828055_A69A9B69 
X-CRM114-Status: GOOD (  14.50  )
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
Cc: tudor.ambarus@microchip.com, linux-kernel@vger.kernel.org,
 linuxarm@huawei.com, linux-spi@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, xuejiancheng@hisilicon.com,
 fengsheng5@huawei.com
Content-Type: multipart/mixed; boundary="===============4610967821680542756=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============4610967821680542756==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Rn7IEEq3VEzCw+ji"
Content-Disposition: inline


--Rn7IEEq3VEzCw+ji
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 05, 2019 at 12:51:36AM +0800, John Garry wrote:

> Only ACPI firmware is supported.

There's no ACPI dependency though?  If the driver only works with ACPI
I'd expect to see one with an || COMPILE_TEST like the architecture
dependency.

> @@ -0,0 +1,287 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * HiSilicon SPI NOR V3XX Flash Controller Driver for hi16xx chipsets
> + *

Please make the entire comment a C++ one for neatness.

> + * Copyright (c) 2019 HiSilicon Technologies Co., Ltd.
> + * Author: John Garry <john.garry@huawei.com>
> + */
> +//#define DEBUG 1

Please remove this.

> +#define GLOBAL_CFG (0x100)
> +
> +#define BUS_CFG1 (0x200)
> +#define BUS_CFG2 (0x204)
> +#define BUS_FLASH_SIZE (0x210)
> +
> +#define VERSION (0x1f8)

These could use some namespacing, especially the last one - it seems
quite likely there'll be some collisions at some point.

> +#define HISI_SFC_V3XX_WAIT_TIMEOUT_US		1000000
> +#define HISI_SFC_V3XX_WAIT_POLL_INTERVAL_US	10

Plus if we've got these long prefixes here it'd be good to be
consistent.

> +	if (IS_ALIGNED((uintptr_t)to, 4)) {
> +		int words = len / 4;
> +
> +		__ioread32_copy(to, host->regbase + CMD_DATABUF(0), words);
> +
> +		len -= words * 4;
> +		if (len) {
> +			u32 val;
> +
> +			val = __raw_readl(host->regbase + CMD_DATABUF(words));
> +
> +			to += words * 4;
> +			for (i = 0; i < len; i++, val >>= 8, to++)
> +				*to = (u8)val;
> +		}
> +	} else {
> +		for (i = 0; i < DIV_ROUND_UP(len, 4); i++) {
> +			u32 val = __raw_readl(host->regbase + CMD_DATABUF(i));
> +			int j;

The more usual pattern for these would be to do some unaligned accesses
for the start/end of the buffer to get to alignment and then transfer
the rest as aligned data.

--Rn7IEEq3VEzCw+ji
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3AetUACgkQJNaLcl1U
h9AUDggAhbUOC9Q2ExVskNhuRVMVMw5Xq0UlE6+60CYcvZfy1w/TQvgxMcP5764e
+EhXHAQ8BZ+JleaTtcuIoAg7OyBF1OOTQLEsSJ5AE5UOidvK1ft1Pud5D5rIXgYK
kUxszOb2BCfW/rZMaLiKB2ydw1o1TsUEH76COG9+J8rVnLoLC/BwcMat7DVFtnPW
orgevaNjPRUzmWOb7HuSziDLA+okmX+nLF+buquH1LR585JXMbTJd+1cgDk0aJFx
bojmWsK0E1Ra52pwKO7qFdJS9mIzFN6GOVUqT47XhZm3BVmUkTHiugVun+AKT7el
YpZbCCyYdb2H27r96NdBA3Ns3o/fJg==
=PHLm
-----END PGP SIGNATURE-----

--Rn7IEEq3VEzCw+ji--


--===============4610967821680542756==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4610967821680542756==--

