Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73CE0C982DA
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2026 09:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:Cc:Subject:To:From:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PyWesUXEPZP8CcQcF2LS0KFh5IqDpejdvkZBy7q30Hs=; b=SGrcqBYsSSVCuym15ogMXEXyFc
	8LkTpFvrTWk1o0fhO4pMioUqBNyNcxcWzTuuWN5BFlT2t/NkwlMT4MNADT5uRJdPefMHhHh/LU2ww
	opK5h2XsthZovUXMdlMOVj6rFlrkX3SWMnAqIUbuzwDiUpJrUE8HVehWN1H8XxUz+RIeR9u2euLtX
	G1qS65Dqv5Uclq2K3N1RXrg78lYR6a+J3usnTT5D4RDWjS8waPwWHMKHOL6U4p1WI7pXEZv9PRJ8t
	lS1upT5VF8ZXzqcj/OlRv659cGb8P6U3VeBXMH/DdPbpIhrAK2hWIbNLdpTbzLNbzDMEdCT8YKqW8
	uob1zNfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Uzi-0000000DxjU-21pU;
	Fri, 18 Sep 2026 09:34:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Uzg-0000000DxjE-2ztw
	for linux-mtd@lists.infradead.org;
	Fri, 18 Sep 2026 09:34:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 390C860A59;
	Fri, 18 Sep 2026 09:34:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 675421F000FF;
	Fri, 18 Sep 2026 09:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789724094;
	bh=QPHM4C13uUGm9R4hEl1eSTnmriAUGxPz23GgFIjAtCc=;
	h=Date:From:To:Subject:Cc:References:In-Reply-To;
	b=NdgoCwwYKkR3ypH0YDmw8gy1EKRmBVG4VgG/GV/pXWOXDRoQGIarEI1mZLiMfxqP1
	 73oOjm39Pu8r5EngSjEkB+I6ZX8hDi8Y7/wLycxfxuem5tan0OnNWx36l3xCJhpwQt
	 pdYereCG6Svcnhjgdf9Eolzha5fSk96gJc/MSj8Nj6AASc+GV0fduCjFVRcvPMoudm
	 QjjF0EMHuoeUHVnNvAwOkejn1p406zXPenCgzKLtNtaYlzTCA6V+rLim5kYqAsIDvW
	 M59n0S4jjiURMgf1UG/ZFNRsZ17K2Zgw2OKBx/E0gatBTdvUSdk8y+igRwXz+yd3kE
	 C9QE6NrttOAOQ==
Mime-Version: 1.0
Date: Fri, 18 Sep 2026 11:34:51 +0200
Message-Id: <DLIC8P2V43E6.34ICV316K7HUK@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: <sashiko-reviews@lists.linux.dev>, "Itai Handler"
 <itai.handler@gmail.com>, <pratyush@kernel.org>
Subject: Re: [PATCH v3] mtd: spi-nor: take the flash lock around
 spi_nor_restore()
Cc: <linux-kernel@vger.kernel.org>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <takahiro.kuwano@infineon.com>,
 <richard@nod.at>, <stable@vger.kernel.org>, <miquel.raynal@bootlin.com>
X-Mailer: aerc 0.20.0
References: <20260915113811.2429311-1-itai.handler@gmail.com>
 <20260915115206.CCEE41F000FF@smtp.kernel.org>
In-Reply-To: <20260915115206.CCEE41F000FF@smtp.kernel.org>
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
Content-Type: multipart/mixed; boundary="===============8893594447682913981=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============8893594447682913981==
Content-Type: multipart/signed;
 boundary=375f650e369e42fd6ad726978df45da2316eabb327bc1c8e1cde82126883;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--375f650e369e42fd6ad726978df45da2316eabb327bc1c8e1cde82126883
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Sep 15, 2026 at 1:52 PM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] mtd: spi-nor: skipped flash restore on fatal signal breaks boot
> - [High] mtd: spi-nor: shutdown hang due to ongoing erase operation

Does Sashiko have some valid points here?=20

-michael

> --
>
> commit c0578fac7581b63c39bfd99ac3a6f934256685d3
> Author: Itai Handler <itai.handler@gmail.com>
>
> mtd: spi-nor: take the flash lock around spi_nor_restore()
>
> This commit changes spi_nor_shutdown() and spi_nor_remove() to acquire
> nor->lock around spi_nor_restore(). It aims to prevent operations like
> reads from overlapping with the restore, which could leave the chip in
> 3-byte addressing mode.
>
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index ccf4396cdcd04..c891197ffa5b3 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -3849,11 +3849,26 @@ static int spi_nor_probe(struct spi_mem *spimem)
>>  				   data ? data->nr_parts : 0);
>>  }
>> =20
>> +/*
>> + * Restore between operations, not during one. Removal and shutdown bot=
h run
>> + * with MTD users still attached: a busy flash silently ignores the com=
mands
>> + * spi_nor_restore() sends, and a restore landing inside a read changes=
 the
>> + * chip's address width under the transfer.
>> + */
>> +static void spi_nor_restore_locked(struct spi_nor *nor)
>> +{
>> +	if (spi_nor_prep_and_lock(nor))
>> +		return;
>
> [Severity: High]
> Does this code silently skip the flash restore if a fatal signal breaks t=
he
> lock acquisition?=20
>
> For example, if a privileged user runs rmmod while an erase or read opera=
tion
> is actively holding the RWW lock, and the rmmod process receives SIGKILL,
> spi_nor_prep_and_lock() (via wait_event_killable()) will return -ERESTART=
SYS:
>
> drivers/mtd/spi-nor/core.c:spi_nor_prep_and_lock() {
>     ...
>     if (!spi_nor_use_parallel_locking(nor))
>         mutex_lock(&nor->lock);
>     else
>         ret =3D wait_event_killable(nor->rww.wait,
>                                   spi_nor_rww_start_exclusive(nor));
>
>     return ret;
> }
>
> Bypassing the hardware teardown path here leaves the flash in 4-byte addr=
essing
> mode. This might cause the bootloader to fail to read the kernel on the n=
ext
> reboot, soft-bricking the device until a power cycle.
>
>> +
>> +	spi_nor_restore(nor);
>> +	spi_nor_unlock_and_unprep(nor);
>> +}
>> +
>
> [ ... ]
>
>> @@ -3863,7 +3878,7 @@ static void spi_nor_shutdown(struct spi_mem *spime=
m)
>>  {
>>  	struct spi_nor *nor =3D spi_mem_get_drvdata(spimem);
>> =20
>> -	spi_nor_restore(nor);
>> +	spi_nor_restore_locked(nor);
>
> [Severity: High]
> Could this hang the system indefinitely during shutdown if an erase opera=
tion
> is ongoing?
>
> Erase operations (like spi_nor_erase_multi_sectors) hold nor->lock
> continuously for their entire duration, looping over spi_nor_wait_till_re=
ady()
> with cond_resched(). A large chip erase can take several minutes.
>
> Because device_shutdown() iterates devices synchronously without a timeou=
t,
> this synchronous wait for nor->lock could hang the reboot process until t=
he
> erase finishes, forcing the user to hard-reset the machine.

Also I'm not sure, what would be the actual expected behavior here.
Cancel the erase? Wait until the erase is completed? Pratyush,
Miquel, do you have any thoughts on that?

-michael

>
>>  }
>> =20
>>  /*


--375f650e369e42fd6ad726978df45da2316eabb327bc1c8e1cde82126883
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaq0FuxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gw/QF/QsmvZhq/GNNoZGx0bFxmGzPhiNCF/Y7w
NTO8T+aTZC/rVBA8f1tL2oEj+ItKRhIDAYDNbzuEV3wIexW+YcU6CLomaBd9NXbE
ZlrX8iC8hHjxSWSH/4DENWbECuKJ03Ec4yU=
=uqCV
-----END PGP SIGNATURE-----

--375f650e369e42fd6ad726978df45da2316eabb327bc1c8e1cde82126883--


--===============8893594447682913981==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8893594447682913981==--

