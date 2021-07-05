Return-Path: <SRS0=N0H7=L5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F36AEC07E99
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Jul 2021 11:13:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDD6B613AB
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Jul 2021 11:13:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDD6B613AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X0gU0FvrUHoWNhLYbs0Cqj0g1amiTpyLUvDmQVE2Ats=; b=Qr0YFMvi2isVbH
	uLuAhJ+jIDGWcil3GLSrvlavMaJrL9Syy3zwZGaOZu2M18Bdok1UF79WpnWsev2GlOlmH4X4L+i0F
	2dWEd7PI72RlsZI9Sb3vmLaSVgpMjFagASGErt6t2XLiD2CqiiVzRmB+8zA/WprbuaDTwrI35wYpa
	YCTUXZp5ALe5WPOZxT+qQ7G9SahF9h/3O8tubH8V87gCBP7+qknvdEA8XWrNlrTk7VxoXuNSzfbB+
	XYO834sbfN8GmUaMk5GAZuA6YPEDN330wULVQTyeTRrChay86RSmXoNgpQ4qAZXTP5c+1G0isHeEL
	Tg8rlh9wlyBGiIec42HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0MWd-008hxv-Qv; Mon, 05 Jul 2021 11:12:31 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0MWa-008hx0-VI
 for linux-mtd@lists.infradead.org; Mon, 05 Jul 2021 11:12:30 +0000
Received: by mail-il1-x134.google.com with SMTP id b5so16967181ilc.12
 for <linux-mtd@lists.infradead.org>; Mon, 05 Jul 2021 04:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+dv75rlbPVBfFjqh4lUmGK/pPMUrVG40ThuLak4p7RA=;
 b=jNhzzzts0/tzN9Bwm3ZnUbkebpnsnAd06nSNpwtJ7zxv5qEdRjXTbjD5gtGqUw8IK0
 5V0AO96EqbDfREWV17hpam2jo9SOtZQxLWtNk84HLSI6C1MtmnPB677aO2CTBzHgvcp5
 fk9PDGyhJtj2yOjevtg0Oa2xdUFsFG7+BLXlAOYTExjit3f6D9jxBGqO+hTU2eOT7Nfe
 YTaA2Y2ZLSmL00nfM69qbV0XnIkBFvNIxLbpqRYGrJpnhLHUFiqzGoYT3CNC2ZK1UdHQ
 Zh7XyPksVrURhTxtZ5hgM27ufMnihlkUSW3H23Pa+0ROC8aCS6YMXrFjRRQGHNJNktHS
 VSeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+dv75rlbPVBfFjqh4lUmGK/pPMUrVG40ThuLak4p7RA=;
 b=Ef7FrvP2Wl3nIsvHHAGvopKzEiut11y4tDhVABkHCM2QucJCsA3s7/M/CNxS4Zvt/N
 Kkcbx5emDESEO+ciYF7b1JQlCA6TfgyOYgtHJN9M6D2bvAVg/ZiOSmCFEN607YOOfETO
 DuF+LTWS1vZ5iwQRR2yoPmVBNz5uwzVO8/PyIAckq9QW2pCn/p07BphUWyuuPKl9e22S
 94JacBCw0ZspJABi1tiW8+RoAay7ZI3T96Z2aU2tHExIJ+WAcsDafAX23RxxQHq0CvpT
 QbZsyrKIaJ2PQAr3i/Yf0kxuYGjZdtDV+LnYaHdQ34cKcw50cxRfwyzOPDbey+6yYOij
 pPIQ==
X-Gm-Message-State: AOAM533jWfNlNQDEz+bicItcpzflLumAVl9l82nP9lg9aeWjKUVw1Bsq
 O90py8Ii//zENYr4UinboqwfpzjCqhA6nJBNT5U=
X-Google-Smtp-Source: ABdhPJyCStzgHS88DaQu7dOgnWHDy3CLaamEwVqYmbjuHIyQnvQlMrQ/y/6S9yTIX34o0MQBIYhAQQ1VCgdynA7NMNM=
X-Received: by 2002:a92:ad03:: with SMTP id w3mr9657346ilh.225.1625483548218; 
 Mon, 05 Jul 2021 04:12:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210702144110.250481-1-tudor.ambarus@microchip.com>
 <20210702144110.250481-5-tudor.ambarus@microchip.com>
 <25fd3d28-6320-98fe-b0e4-8caa16c3d357@microchip.com>
 <CAEyMn7ZjBPOcfJ7i3b01Oi-VxrVrK=m0UwfOYeD6sU9t0gAM2A@mail.gmail.com>
 <7038f037de3e224016d269324517400d@walle.cc>
In-Reply-To: <7038f037de3e224016d269324517400d@walle.cc>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon, 5 Jul 2021 13:12:17 +0200
Message-ID: <CAEyMn7bEOza70HeaPnR3wMCr2ZPavOx0A8t_-WZ3_ae_cVekwA@mail.gmail.com>
Subject: Re: [PATCH 4/7] mtd: spi-nor: macronix: Handle ID collision b/w
 MX25L12805D and MX25L12835F
To: Michael Walle <michael@walle.cc>
Cc: Tudor.Ambarus@microchip.com, vigneshr@ti.com, p.yadav@ti.com, 
 figgyc@figgyc.uk, mail@david-bauer.net, linux@rasmusvillemoes.dk, 
 esben@geanix.com, knaerzche@gmail.com, code@reto-schneider.ch, 
 zhengxunli@mxic.com.tw, jaimeliao@mxic.com.tw, macromorgan@hotmail.com, 
 sr@denx.de, miquel.raynal@bootlin.com, richard@nod.at, 
 linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210705_041229_069155_B8392FB8 
X-CRM114-Status: GOOD (  11.29  )
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

Hi Michael,

Am Mo., 5. Juli 2021 um 12:59 Uhr schrieb Michael Walle <michael@walle.cc>:
>
> Hi,
>
> Am 2021-07-05 12:45, schrieb Heiko Thiery:
> > # cat
> > /sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0
> > .0/spi-nor/sfdp | xxd -p
> > 53464450000101ff00000109300000ffc2000104600000ffffffffffffff
> > ffffffffffffffffffffffffffffffffffffe520f1ffffffff0744eb086b
> > 083b04bbfeffffffffff00ffffff44eb0c200f5210d800ffffffffffffff
> > ffffffffffff003600279df9c06485cbffffffffffff
>
> Ok, I like this output esp, because you can reverse it with
> "xxd -r -p". Maybe we should also request an md5sum just to
> be sure we have the same binary.
>
> so the requested commands would be something like:
>
> # xxd -p /path/to/sfdp
> # md5sum /path/to/sfdp
> # cat /path/to/jedec_id
> # cat /path/to/partname
> # cat /path/to/manufacturer

this will be the output for your suggestion:

# P=/sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0.0/spi-nor
&&  xxd -p $P/sfdp && md5sum $P/sfdp && cat $P/jedec_id && cat
$P/partname && cat $P/manufacturer
53464450000101ff00000109300000ffc2000104600000ffffffffffffff
ffffffffffffffffffffffffffffffffffffe520f1ffffffff0744eb086b
083b04bbfeffffffffff00ffffff44eb0c200f5210d800ffffffffffffff
ffffffffffff003600279df9c06485cbffffffffffff
f7a09ec0b60c9a0acd01bf2759f0d1f4
/sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0.0/spi-nor/sfdp
c22018
mx25l12805d
macronix

-- 
Heiko

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
