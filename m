Return-Path: <SRS0=s9Jc=V2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1103C7618B
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jul 2019 17:06:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 868E5206E0
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jul 2019 17:06:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="snVGIHsI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="tGIbEOve"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 868E5206E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:To:
	Subject:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6X0ijKO51VEHigtcYjNhoh0upUhtc5Bezgyvu+lOrzE=; b=snVGIHsIA0Q6lNDQEutMrbxbw
	qIzAv/4sDUxPfp6fGAPVyAXcH0fEaMmGNV2i7XMlpSzi56KAmtd63xc1jXMLcOkcOtiNE4jsa7SiS
	aVtaBdL83hJyMx+qmIKswnK2p6AbOHQboK+YJyx6yfao+hlG2BanDwPHWmZvPYZSbW8UU6wujmveb
	/wW91jCbEB9d4bge7Ree5G2duy0rTPI1QWw76bBoosTxrTdzeunQjVcNbnz8RPSg0x8sqGTaEbJQb
	4T4EuuaFWtX1613wk5SLm6tUkNTRaoAjJ+IjEYln0w6QHmOQfneKV8R96rVPo4Tsz7dqRL739YZWP
	KqGBjvXIA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hs963-0002Ba-0b; Mon, 29 Jul 2019 17:06:03 +0000
Received: from outils.crapouillou.net ([89.234.176.41] helo=crapouillou.net)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hs960-0002A4-39
 for linux-mtd@lists.infradead.org; Mon, 29 Jul 2019 17:06:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1564419948; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6ct5sfA9aKEmr8hMlVPpfoX1PCyM/MxIecN3pTsFsbo=;
 b=tGIbEOveRSTKHoZcpg/izsWRXZB3sJbHvlT52bDMqqruC35KNldtJ6Z1UumMknOBTmqxkS
 L0QxFFWQrtfalRctJpTe/AFwPD5hYLu/miXPRxLnpxQZvMuW30gWEtzMHrKJVpyhyW4MrF
 oruZx2tu/qGuw0Xp6xod1DxlnpMTbLU=
Date: Mon, 29 Jul 2019 13:05:21 -0400
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 00/11] JZ4740 SoC cleanup
To: Richard Weinberger <richard.weinberger@gmail.com>
Message-Id: <1564419921.1759.1@crapouillou.net>
In-Reply-To: <CAFLxGvyi0+0E3M12A7cRoHfEKd8-7Yr8EMG9J=2XcjCxPWY5pA@mail.gmail.com>
References: <20190725220215.460-1-paul@crapouillou.net>
 <CAFLxGvyi0+0E3M12A7cRoHfEKd8-7Yr8EMG9J=2XcjCxPWY5pA@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190729_100600_321681_554B151B 
X-CRM114-Status: UNSURE (   7.40  )
X-CRM114-Notice: Please train this message.
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-fbdev@vger.kernel.org,
 James Hogan <jhogan@kernel.org>, alsa-devel <alsa-devel@alsa-project.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>, linux-mips@vger.kernel.org,
 od@zcrc.me, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lee Jones <lee.jones@linaro.org>,
 Artur Rojek <contact@artur-rojek.eu>, Richard Weinberger <richard@nod.at>,
 linux-pm@vger.kernel.org, Paul Burton <paul.burton@mips.com>,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Mark Brown <broonie@kernel.org>, linux-hwmon@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Ralf Baechle <ralf@linux-mips.org>,
 LKML <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 dmaengine@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Richard,


Le lun. 29 juil. 2019 =E0 7:23, Richard Weinberger =

<richard.weinberger@gmail.com> a =E9crit :
> On Fri, Jul 26, 2019 at 12:02 AM Paul Cercueil <paul@crapouillou.net> =

> wrote:
>> =

>>  Hi,
>> =

>>  This patchset converts the Qi LB60 MIPS board to devicetree and =

>> makes it
>>  use all the shiny new drivers that have been developed or updated
>>  recently.
>> =

>>  All the crappy old drivers and custom code can be dropped since they
>>  have been replaced by better alternatives.
>> =

>>  Some of these alternatives are not yet in 5.3-rc1 but have already =

>> been
>>  accepted by their respective maintainer for inclusion in 5.4-rc1.
>> =

>>  To upstream this patchset, I think that as soon as MIPS maintainers
>>  agree to take patches 01-03/11 and 11/11, the other patches can go
>>  through their respective maintainer's tree.
> =

> Was this series tested with the Ben Nanonote device?
> I have one of these and from time to time I upgrade the kernel on it.

Yes! Artur (Cc'd) tested it.

You can test it yourself, after merging this patchset with:
https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/slave-dma.git =

branch next,
git://git.freedesktop.org/git/drm-misc branch drm-misc-next.

These will be in 5.4-rc1.

Cheers,
-Paul



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
