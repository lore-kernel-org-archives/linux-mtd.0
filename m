Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08861CD11C2
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2024 09:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s9i6uO97cTCH7N5oJs38KJj5dZlYlzlSQCjjuHnfwDo=; b=4lYTLgEgd//G5Y
	1BVhxb1885k5lHuT42OAP537W7pG0PTqmHQgRPNCY9zK8J3lYO59kU2NhftsqUnvoY81fRpnZMY94
	Ko/Va7eCnYXXgcH+JEoAFX7RWzSZQ2FYxSr0A8WijgxjO18LhNCeURK7E5abxM9CYuW2+hJjnq0vu
	cqE5HjyxFKyzu7uYwJ8gO7zu7cr1hGC1Yg7W9efu92i4U2pj1Doo6Hw4l9gdDl0fEiWq05c0MBpzn
	5K6LmLmbzcAW6+D+fzSB/HDDRVtE3TSTuBfRdHGDfo6Rd03IfNEVNqsSLhCMI5zDiRTpfCXbIJLFx
	iJrXtLkgj6pyN4rquM9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsfUE-000000065Vb-3uiJ;
	Fri, 05 Apr 2024 09:03:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsfUD-000000065UG-1jmJ
	for linux-mtd@bombadil.infradead.org;
	Fri, 05 Apr 2024 09:03:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=CfCrImPVfmasb+F60N8ul7gwP1ihbKd1RFWZG/QLcfQ=; b=nzkbb4Nyg0IzZh40IPB3DkuHdr
	Z+AWUAAkquy/CsZLIA+Fym45RqeF7DXeHjHfiez6vYl+VuWPJetRcWy0+LeYbtn2raqHEOXdWn+AQ
	H1xxjoStXUgTJDvU2BtoYDXnm40T3ByF76SmHjPB3GPTRi0pJQs9Ci5m9i99/rx90pFnrVOJIAiGz
	hG8y/GDjIbLDxkZjnyUsxKFaCDw6yJ6SdpXXjp+iFEnY5dzOqylQNCH+nQ2wU4TZfXMSJJqKLs86q
	c96t5I5A//LO0xZ8IQAZk9hGVxeC9e9pnUVp9touq6Mmt47/3eIQDs87PgFP++Zafe93eEcKqIWb1
	4TGn02oQ==;
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsfU5-00000005W0D-2pTv
	for linux-mtd@lists.infradead.org;
	Fri, 05 Apr 2024 09:03:46 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 46F34100022;
	Fri,  5 Apr 2024 12:03:28 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 46F34100022
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1712307808;
	bh=CfCrImPVfmasb+F60N8ul7gwP1ihbKd1RFWZG/QLcfQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=Ys7lT6yR7KzhOGZNrPGRI6tv3RSuYsEWhBSEA4iZi2kZPhYSPuF/iE6NjVtgrBgU9
	 q8HtUxFLN4QiqDnj7IFJH7+xGeORMLsjYV0LX9IP/ybiCrIgHpuh/oF1aZpiGu6u3H
	 IsBUzM1A3V2EmA64bevUJe6xtIPwQL993iO3qKc1OZrCKTspXPBhXfaG2ZUNeHX51i
	 AwNlUdPk1BpYirRXsUiS7L4TVUUbp6Lt2BkA4QRppDD319LoWAdSuRCOAzZ/XUYTdp
	 K7BKeJCR4452YBqAyxvPBnrB67tf9BSR9u0GAKTDtnikxWxy+eylO+dawgXiChGnvl
	 um9yhUxwhP7jA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri,  5 Apr 2024 12:03:28 +0300 (MSK)
Received: from localhost (100.64.160.123) by p-i-exch-sc-m02.sberdevices.ru
 (172.16.192.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 5 Apr
 2024 12:03:27 +0300
Date: Fri, 5 Apr 2024 12:03:27 +0300
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: <quic_sridsn@quicinc.com>, <quic_mdalam@quicinc.com>, <ezra@easyb.ch>,
	<gch981213@gmail.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<sashal@kernel.org>, <vigneshr@ti.com>, <kernel@salutedevices.com>,
	<rockosov@gmail.com>, <linux-kernel@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>, Ezra Buehler
	<ezra.buehler@husqvarnagroup.com>, <stable@vger.kernel.org>, Martin Kurbanov
	<mmkurbanov@salutedevices.com>
Subject: Re: [PATCH v1] mtd: spinand: Add support for 5-byte IDs
Message-ID: <20240405090327.vowrj6aqjmmighs4@CAB-WSD-L081021>
References: <20240404121532.14755-1-ddrokosov@salutedevices.com>
 <2024040509-faceless-passerby-10ad@gregkh>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2024040509-faceless-passerby-10ad@gregkh>
User-Agent: NeoMutt/20220415
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 184597 [Apr 05 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 15 0.3.15 adb41f89e2951eb37b279104a7abb8e79494a5e7, {Tracking_uf_ne_domains}, {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1;100.64.160.123:7.1.2;lore.kernel.org:7.1.1;127.0.0.199:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/04/05 06:54:00
X-KSMG-LinksScanning: Clean, bases: 2024/04/05 06:53:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/04/05 05:49:00 #24662499
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_100342_292422_8DCE9C98 
X-CRM114-Status: GOOD (  26.08  )
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

On Fri, Apr 05, 2024 at 08:37:48AM +0200, Greg KH wrote:
> On Thu, Apr 04, 2024 at 03:15:21PM +0300, Dmitry Rokosov wrote:
> > From: Ezra Buehler <ezra.buehler@husqvarnagroup.com>
> > 
> > [ Upstream commit 34a956739d295de6010cdaafeed698ccbba87ea4 ]
> 
> This commit is already in the following releases:
> 	6.6.24 6.7.12 6.8.3 6.9-rc1
> 
> > E.g. ESMT chips will return an identification code with a length of 5
> > bytes. In order to prevent ambiguity, flash chips would actually need to
> > return IDs that are up to 17 or more bytes long due to JEDEC's
> > continuation scheme. I understand that if a manufacturer ID is located
> > in bank N of JEDEC's database (there are currently 16 banks), N - 1
> > continuation codes (7Fh) need to be added to the identification code
> > (comprising of manufacturer ID and device ID). However, most flash chip
> > manufacturers don't seem to implement this (correctly).
> > 
> > Cc: <stable@vger.kernel.org> # 6.6.23
> > Cc: <stable@vger.kernel.org> # 6.7.11
> > Cc: <stable@vger.kernel.org> # 6.8.2
> > Signed-off-by: Ezra Buehler <ezra.buehler@husqvarnagroup.com>
> > Reviewed-by: Martin Kurbanov <mmkurbanov@salutedevices.com>
> > Tested-by: Martin Kurbanov <mmkurbanov@salutedevices.com>
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > Link: https://lore.kernel.org/linux-mtd/20240125200108.24374-2-ezra@easyb.ch
> > Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
> > ---
> > 
> > In the patch series [1] only one patch was marked with Fixes tag, that's
> > why the secon patch was not applied to 6.6.y, 6.7.y and 6.8y. It breaks
> > ESMT detection flow with logs:
> > 
> > [    0.770730] spi-nand spi0.0: unknown raw ID c8017f7f
> > [    0.772688] spi-nand: probe of spi0.0 failed with error -524
> > 
> > Please cherry-pick the second patch from the series to 6.6.y, 6.7.y and
> > 6.8.y.
> 
> What commit id is "the second patch" here?  The one referenced above?
> If so, again, this is already in a released kernel, so I'm confused as
> to what to do here.

Ah, I apologize for not checking versions 6.8.3 and 6.7.12. My test
environment was running on versions 6.8.2 and 6.7.11. Therefore, the
mistake was on my part. Please disregard the cherry-pick for those
versions, and thank you for quick reply!

-- 
Thank you,
Dmitry

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
