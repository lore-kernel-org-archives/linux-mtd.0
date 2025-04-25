Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D85C369C2
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Apr 2025 08:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fyinp7ryysRSK3PKj5tLs9Z6iHZrD/4SUSdYdAfN4Js=; b=X/fFaczb+8glBX
	v2vfD2V9y6t1mdavdlq8a4AdBP5x/i7QZM7x1MOAUBMmySouJfC4Efa7xjuYObEPhliqyKcA7vwF3
	NVa4/CflAkp6yOtNdYs1gzDKuVhbTdBNp1ekXCxdG/EDhZnHulBSRBill+E1wi60U1ceRb3waPKie
	t+JfuOWincfcDC6BbjswkKPfYx1j6Ml3PgCDnHmUjH9fIHmOZhsnaeBGDuOGx6zkIxwR/fYny9DKY
	zJROt2NggGju1ZD/VveawHvSsQeavNPCviWte7HUfSM4nGr052ECIvNMBZZUUfXly54LYiZwAAeXp
	eE6KH2VkoO0pOG1xvB6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8EWH-0000000GLeB-0pes;
	Fri, 25 Apr 2025 08:34:49 +0000
Received: from ewsoutbound.kpnmail.nl ([195.121.94.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8EWD-0000000GLdA-2gvb
	for linux-mtd@lists.infradead.org;
	Fri, 25 Apr 2025 08:34:48 +0000
X-KPN-MessageId: 38cf2ff0-21b0-11f0-bc2a-005056ab378f
Received: from smtp.kpnmail.nl (unknown [10.31.155.40])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 38cf2ff0-21b0-11f0-bc2a-005056ab378f;
	Fri, 25 Apr 2025 10:35:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:from:to:subject:mime-version:date:message-id;
	bh=8/yvxp3z86rFOheLRFHFBHKY1EtIc/D5T7iQnuCrnGI=;
	b=t27exWrhxfrd/PunXsL+ZON/teXOUj69jJjeYPGfTZDsKbU2UhY6QxA5jZzSC2UfHti+CtC2R3YA1
	 2IsXKPGHqZyDmXCGVG1ocuiCaZbdz/PbJO+RwQmHPFtqnuQ379ia7IoJ56FXvxR5uyp2HBSvGXU/w1
	 Z9p2CK+pULqCDhKP67uLZYhiaC3ymBvqV6fhQnTdg/GgMTgy6FvqbFqWiDPwTcQdqha3eAeMvwKqNV
	 DS29lnDXjD4Qlvsq3awtRnnspWtKmCgoyMZW57lFwVfG6J+bJgoYIoDt5Ndg4YcB2cWAJUJqAqQOPS
	 /PK7PcEKKutczhZAsCdqyck4dGTG43w==
X-KPN-MID: 33|RIBl8qxlgmujX1FKwnzX9VyDT0ZAKCskxgm1P0W9jXQ8nZR5BAM8OCvJo8UWjik
 QYKCL9im91mYQLHEnPxtOf00QLEo2aniGRp+aXvEOCRo=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|kGQgDhys4HLyRALAx1+V9H0952u3JpG31JHo29NpY2zKbQx4XFVTCuo4pjiOlhB
 VdHI+mBwEKxtWXkx1o1G1Nw==
X-Originating-IP: 80.60.128.215
Received: from [192.168.1.10] (80-60-128-215.fixed.kpn.net [80.60.128.215])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id 0336f9f5-21b0-11f0-855b-005056ab7584;
	Fri, 25 Apr 2025 10:34:36 +0200 (CEST)
Message-ID: <a00591dd-0698-4cd1-9715-446f973b877b@xs4all.nl>
Date: Fri, 25 Apr 2025 10:33:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/13] media: media/test_drivers: Replace open-coded
 parity calculation with parity_odd()
To: Kuan-Wei Chiu <visitorckw@gmail.com>, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 jk@ozlabs.org, joel@jms.id.au, eajames@linux.ibm.com,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dmitry.torokhov@gmail.com,
 mchehab@kernel.org, awalls@md.metrocast.net, hverkuil@xs4all.nl,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 louis.peens@corigine.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, parthiban.veerasooran@microchip.com,
 arend.vanspriel@broadcom.com, johannes@sipsolutions.net,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, yury.norov@gmail.com,
 akpm@linux-foundation.org, jdelvare@suse.com, linux@roeck-us.net,
 alexandre.belloni@bootlin.com, pgaj@cadence.com
Cc: hpa@zytor.com, alistair@popple.id.au, linux@rasmusvillemoes.dk,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kuba@kernel.org, linux-kernel@vger.kernel.org,
 linux-fsi@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mtd@lists.infradead.org, oss-drivers@corigine.com,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-serial@vger.kernel.org, bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
 Frank.Li@nxp.com, linux-hwmon@vger.kernel.org,
 linux-i3c@lists.infradead.org, david.laight.linux@gmail.com,
 andrew.cooper3@citrix.com, Yu-Chun Lin <eleanor15x@gmail.com>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <20250409154356.423512-3-visitorckw@gmail.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20250409154356.423512-3-visitorckw@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_013446_091033_ED9F301B 
X-CRM114-Status: GOOD (  13.59  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 09/04/2025 17:43, Kuan-Wei Chiu wrote:
> Refactor parity calculations to use the standard parity_odd() helper.
> This change eliminates redundant implementations.
> 
> Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>

Reviewed-by: Hans Verkuil <hverkuil@xs4all.nl>

Regards,

	Hans

> ---
>  drivers/media/test-drivers/vivid/vivid-vbi-gen.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/test-drivers/vivid/vivid-vbi-gen.c b/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
> index 70a4024d461e..5e1b7b1742e4 100644
> --- a/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
> +++ b/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
> @@ -5,6 +5,7 @@
>   * Copyright 2014 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
>   */
>  
> +#include <linux/bitops.h>
>  #include <linux/errno.h>
>  #include <linux/kernel.h>
>  #include <linux/ktime.h>
> @@ -165,12 +166,7 @@ static const u8 vivid_cc_sequence2[30] = {
>  
>  static u8 calc_parity(u8 val)
>  {
> -	unsigned i;
> -	unsigned tot = 0;
> -
> -	for (i = 0; i < 7; i++)
> -		tot += (val & (1 << i)) ? 1 : 0;
> -	return val | ((tot & 1) ? 0 : 0x80);
> +	return val | (parity_odd(val) ? 0 : 0x80);
>  }
>  
>  static void vivid_vbi_gen_set_time_of_day(u8 *packet)


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
