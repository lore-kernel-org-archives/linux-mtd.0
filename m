Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B3CC43458
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Jul 2026 06:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=74zXhYEg6gZC1dt7eSYedw/mOZ3xgLWTquwAqLRTjg4=; b=wJoIHZQPYuO+LHnCbPtach9pYs
	SsKTPp0Xe3AzMPM9Bf/scPGw0Wvypr+RFHHTX5wCnGfaZOdbNcc4GKgbE/y91oEuPi/UITptbH2I3
	4pfidXanrB7FjUoKMWttXPs4Ln0HUkKZdJ0mwgpkgg60G227vQvmekHRS5+UImoVZgLAvS+8QowBt
	BmKd9C6jGoM6IL1/+kJkQrWDHxBnfq/CDE+K0+pFelGPVt+RBR+nqxvFWMwgExcNJyAol4jCboGwB
	Gh8K9GeikWXehmmgdD7u1xOLQvAXt6WokJEMreG1r8JZoJ48hbq4zSckeg6QaoJpWsUvGoPwE7uT+
	1YWh/apA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfB9t-00000003fW7-1bkR;
	Thu, 02 Jul 2026 06:44:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfB9s-00000003fW1-1rt8
	for linux-mtd@lists.infradead.org;
	Thu, 02 Jul 2026 06:44:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id D1E9A437F0;
	Thu,  2 Jul 2026 06:44:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 284BC1F000E9;
	Thu,  2 Jul 2026 06:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782974663;
	bh=mwsmqT/AXBfpTe26vQoiTiZAbFqjYNZcCxpXpSYlf3w=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=SGK3+0O32kZ9ZCbjfcsdg//0d8zmtKCISwu9Ycav+VS92nWSKfxIY68cwLNReXtjY
	 VmyyIkOzAwAWxxVv4aGnfltNm9j8p9eQ32AoznjWl6dBZL+snrs3mcY+TY2OF33mpg
	 f1tL1KcllNDkxXdQCihyCvKkcxBgjuT+ismE3g+2f1l0w8edzVBrlr8Iwkn513RZV8
	 tglYNo4YvHQfQDr6rvUulYp/CPQGEuq+LeLuAqpvgpsPidK2gpXdQOMG/6hs4Jc83k
	 lxpQ+FEFhBpFqsHXdWhMRR4I4MwJrrwOl+0gY8Wlpco6Wh5XmrllNub4VetZMSfb+a
	 7xzcT1Sz7Nwww==
Mime-Version: 1.0
Date: Thu, 02 Jul 2026 08:44:19 +0200
Message-Id: <DJNVRMSG4C6K.34EGBE463IOCZ@kernel.org>
Subject: Re: [PATCH 6.6.y] mtd: spi-nor: macronix: Add post_sfdp fixups for
 Quad Input Page Program
Cc: <stable@vger.kernel.org>, <tudor.ambarus@linaro.org>,
 <pratyush@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <alvinzhou@mxic.com.tw>, "Cheng Ming Lin" <chengminglin@mxic.com.tw>
From: "Michael Walle" <mwalle@kernel.org>
To: "Cheng Ming Lin" <linchengming884@gmail.com>, "Sasha Levin"
 <sashal@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260701023619.2730136-1-linchengming884@gmail.com>
 <stable-reply-mtd-macronix-66-20260701193800@kernel.org>
 <CAAyq3SY48RRSO1nN-uRH7HVnXbnvQ1_K823Lc_hRsCyVuf9L3g@mail.gmail.com>
In-Reply-To: <CAAyq3SY48RRSO1nN-uRH7HVnXbnvQ1_K823Lc_hRsCyVuf9L3g@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============4579034325586443271=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============4579034325586443271==
Content-Type: multipart/signed;
 boundary=33f04db25c885812dee295812b696d3d5602097a9471dc1e72bcb39acfac;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--33f04db25c885812dee295812b696d3d5602097a9471dc1e72bcb39acfac
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Jul 2, 2026 at 4:13 AM CEST, Cheng Ming Lin wrote:
> Hi Sasha,
>
> Sasha Levin <sashal@kernel.org> =E6=96=BC 2026=E5=B9=B47=E6=9C=882=E6=97=
=A5=E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=888:38=E5=AF=AB=E9=81=93=EF=BC=9A
>>
>> I can't take this series for 6.6.y: patch 2 adds flash_info entries
>> with a NULL .name, and 6.6's spi_nor_match_name() has no NULL guard
>> (only added upstream in ac5bfa968b60), so the legacy probe-by-name
>> path can oops at boot.
>
> Thank you for pointing this out and catching the potential issue.
>
> I have verified this, and you are absolutely right. The issue stems from
> the strcmp(name, manufacturers[i]->parts[j].name) evaluation within the
> legacy probe path. Since 6.6.y lacks the null guard, passing a NULL .name
> will result in a null pointer dereference in strcmp() and cause a kernel
> oops during boot.
>
> I will add the .name to the new flash entries and submit a v2 series.

No, please backport the needed patches. The reason is that the name
shouldn't become something an application relies on (it is also
exposed via sysfs).

For all people not too involved: we are dropping the name for new
flash additions, because it is almost always wrong, due to flash id
reuse among almost all flash vendors.

-michael

>
>>
>> Please send a v2 that either names the new entries or backports
>> ac5bfa968b60 first.
>>
>> The 6.12.y series is queued, thanks.
>>
>> --
>> Thanks,
>> Sasha
>
> Thanks,
> Cheng Ming Lin


--33f04db25c885812dee295812b696d3d5602097a9471dc1e72bcb39acfac
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCakYIwxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gYTwGAqnInxCnEvyOPze83NecTmhd2K5gukKMt
P2Rqcev3TLZuX23WqfTXkSAtEmMXedFWAX9IKEqmtjTceQZNqFZaLiYAEzyM7zTQ
bgg9J2omXxaFR8jg0wt9/QfDdiUhVII4gUM=
=15ZK
-----END PGP SIGNATURE-----

--33f04db25c885812dee295812b696d3d5602097a9471dc1e72bcb39acfac--


--===============4579034325586443271==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4579034325586443271==--

