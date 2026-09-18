Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E773C982D7
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2026 09:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:From:Cc:Subject:To:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J+V4Id8yUU1pbiKYAI0GTDNQH/6QpyzNzz02/gsaB78=; b=C/zRkbxRmR7PFvztXY208ezILT
	Po0keGQ76fGM1dKBjuhfB2hHCpeZmdfhihraz2hpY9CWaGk5/yVAN0m1Rz8v2LJQKXKAXeF2RbGjB
	YG5Uolz8ld4zwMMzBpEdwyJOB4RAkha2nHH1qXwcdeO8T0P9zGMFBYsZXiNzt71iJ5wKF0neR76ZK
	eOS5tajbHerjk5J0kSBr6jAvB58QHUKoChBOSSOo3uQKH88tAYkDgqeqxq2k3TQd8FGgLX5dt8wYG
	IyPSmOXovbUJW0PvseCvWbKIjpyfYliNvs8342j6gU9wtIfbux0kPhhYndhji7J16VIbBfZpgTris
	aF3qHYSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Ur2-0000000DwPN-2MSC;
	Fri, 18 Sep 2026 09:26:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Ur0-0000000DwP6-25Vr
	for linux-mtd@lists.infradead.org;
	Fri, 18 Sep 2026 09:25:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id DCDB941767;
	Fri, 18 Sep 2026 09:25:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 4A28D1F00893;
	Fri, 18 Sep 2026 09:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789723557;
	bh=YA3D7d7673ng+vCGSnDfbJ9kCQKY2wZxGLeBmg2P7TY=;
	h=Date:To:Subject:Cc:From:References:In-Reply-To;
	b=ccn64BYka7ATtK7+UUgxRAm1d59KpdPr5/XTRK7AHbFMfS2A3BF2W7DM8ganhNgBz
	 U2Y4MPt5ucLzNhwAKDgIrEoxVOqG8Lhbe8iXjlzynnOJ3xS5S3NdcLv4ltAGn4iIhv
	 qUutjqIIsZtp2c4ookfoaXpO6IUuzOvjhPngD2JdixRAv9HcGIcJlPHV0g7AYx9MsM
	 PP3nafCC+m+aP8alJFs8DPFl5Kex94xm/AGRdz5Gpdr0zqRmx5/CjeN2RcV5d5Plae
	 TAOIah3xIxX7Iqh/lyW79syanUaxLe1bnWiAGjgI7GyXRpvgZfVeeSmlXC31h6KJoO
	 EAI2j3DaNoUTw==
Mime-Version: 1.0
Date: Fri, 18 Sep 2026 11:25:54 +0200
Message-Id: <DLIC1UB6I4TK.20EG74BVIVUGC@kernel.org>
To: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Subject: Re: [PATCH v2 2/2] mtd: spi-nor: issi: Add support for is25wx01g
Cc: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Pratyush Yadav" <pratyush@kernel.org>, "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260914-mtd-spi-nor-new-issi-chip-v2-0-3cd4d7e434b2@analog.com> <20260914-mtd-spi-nor-new-issi-chip-v2-2-3cd4d7e434b2@analog.com> <DLF3H41RCZJF.37WOY30CYJ4AY@kernel.org> <aqgRsP3cxzcLok5C@nsa> <DLGK0FH8L7PM.1JRX5777NZQQF@kernel.org> <aqpTO-5LTLtRXaY4@nsa>
In-Reply-To: <aqpTO-5LTLtRXaY4@nsa>
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
Content-Type: multipart/mixed; boundary="===============0530782426459040872=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============0530782426459040872==
Content-Type: multipart/signed;
 boundary=070b8133b41b52338b365b906ef7a26c768052edd877178f524788085723;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--070b8133b41b52338b365b906ef7a26c768052edd877178f524788085723
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Sep 16, 2026 at 10:44 AM CEST, Nuno S=C3=A1 wrote:
> On Wed, Sep 16, 2026 at 09:14:52AM +0200, Michael Walle wrote:
>> On Mon Sep 14, 2026 at 5:31 PM CEST, Nuno S=C3=A1 wrote:
>> > On Mon, Sep 14, 2026 at 04:04:40PM +0200, Michael Walle wrote:
>> >> On Mon Sep 14, 2026 at 3:42 PM CEST, Nuno S=C3=A1 wrote:
>> >> > (*): I should note that the command actually failed with -EIO but i=
t
>> >> > actually unlocked the chip! And the reason is because the flash as =
the same
>> >> > FSR register than the micron-st flash. So WEL is set to 1 but can o=
nly
>> >> > be cleared when clearing the FSR register.
>> >>=20
>> >> Why doesn't this affect only the locking operation? WEL polling is
>> >> used also during write and erase.
>>=20
>> Sorry I meant WIP.
>>=20
>> > Not sure if I fully understand. But AFAICT, the reason why erase and
>> > write is silent is because the default spi_nor_sr_ready() only looks a=
t
>> > SR_WIP [1]:
>>=20
>> So usually, the WEL is cleared automatically by whatever needs the
>> WEL in the first place, i.e. program or erase, write (status)
>> register. That should also be the case for this flash.
>>=20
>> Now for this flash (as well as the st/micron ones), there is one
>> peculiarity. Whenever there is an error bit set in the FSR, the WEL
>> cannot be cleared by a write disable command. Which we shouldn't
>> need anyway because it should be cleared automatically if nothing
>> goes wrong.
>>=20
>> Also the write status register won't set the error bits if i read
>> the datasheet correctly and it will always disable the WEL, see
>> Table 29 ("WRITE REGISTER Operations") in the MT35XU512ABA datasheet
>> and Table 8,8 ("WRITE REGISTER Operstaions") in the IS25WX01G
>> datasheet.
>>=20
>> > OTOH, on the unlock path we do spi_nor_write_sr1_and_sr2_and_check() a=
nd
>> > give no special handling to WEL so I imagine that we try to set it as =
0
>> > but read it as 1 (given that it clears only with FSR) and hence I got
>> > the -EIO in [2].
>>=20
>> We do a RMW, so my guess is that it's the other way around. We read
>> it as 1, but then after writing the SR, it's 0 (see above). That
>> actually assumes, that if the WEL and any error bit in the FSR is
>> set, a write status register will clear the WEL anyways. Could you
>> debug that so we are sure, this is what actually happens?
>
> Sure I'll do some debugging on the unlock path. The DS seems a bit
> unclear. It also states (for the WRITE DISABLE)
>
> "...In case of a protection error, WRITE DISABLE will not
> clear the bit. Instead, a CLEAR FLAG STATUS REGISTER command must be issu=
ed to
> clear both flags.
> "

Not sure, this contradicts each other. As I read it:

 - Write (status) register will always clear a WEL, the only open
   question is, does it also clear it if the protection bit in the
   FSR is set
 - Write disable won't clear the WEL if the protection bit in the
   FSR is set.

> But the truth is that the second unlock I did came without an error.

Which might indicate that a write status will clear the WEL anyway.
But then it might also be interesting to see if the PROT bit in FSR
is still set. IOW, if a new write enable is sent, a write disable
might fail even if there was no actual error.

>
>>=20
>> But the question is who is setting the error bit in the first place.
>> And I guess it's the testing sequence for the locking when you try
>> to write to a locked range. So you could also actually test the
>> locking/unlocking without writing any data to the flash just to see
>> if that is the case.
>
> Pretty sure the above is the case! If you look at other tests after
>
> "Once we trust the debugfs output we can use it to test various
> situations. Check top locking/unlocking (end of the device):"
>
> Everything worked nicely given we were just doing lock/unlock. The DS is
> also clear about this (table 8.11):
>
> "...When a command is applied to a protected sector, the command is not e=
xecuted,
> the write enable latch bit remains set to 1, and flag status register bit=
s 1 and 4 are set.=20
> If the operation
> "

Ok.

> I also did tested with basically the same code as in micron-st and then
> ERASE and PROGRAM commands just return -EIO.

But the unlocking does not return EIO anymore when it's executed
successfully?

>> >> > AFAICT, we should do something similar as micron so the writing to =
an
>> >> > actual protected region fails rather than being silently discarded =
with
>> >> > that status bit set. The question would be how to do it? The code i=
s
>> >> > pretty much identical to [1]. The masks, the opcoded... So should w=
e
>> >> > somehow handle this in the core (by having some common helper) that
>> >> > could be set in .late_init() under a common MFR_FSR flag? Or just k=
eep
>> >> > both implementations separate for now?
>> >>=20
>> >> I'd like to keep that out of the core.c, but also like to avoid any
>> >> code duplication esp. because there is already handling for the
>> >> intel spi controller in there. So maybe move it it into a new
>> >> common.c.
>> >
>> > Also don't like the dup tbh. Could that be a follow up or should it be
>> > v3. From the top of my head I could think on a mfr_common.c kind of th=
ing.
>> > Don't thing this FSR register is standard?
>>=20
>> Not really.
>>=20
>> But (at least) parts of the datasheets are actually copied verbatim
>> between micron and issi, I wonder if we shouldn't just put the ISSI
>> part in micron-st.c. (Yes vendor will be wrong, but I plan on
>> deprecating that sysfs property anyway).
>
> Also works for me. Say the word and I can send v3 with this in
> micron-st.c.

Yes. But also please verify the our guesses about the root cause of
this and what's the actual behavior of the write disable.

-michael

--070b8133b41b52338b365b906ef7a26c768052edd877178f524788085723
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaq0DohIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/iaGwF+MoU+b1VgCkmAmyRW3et6lz82JxdRGJbb
yjHLv71zW39zdHJYK3DSD23Cb294mrC3AX4u1bKHXzit2qgzCBjzfQ9wuiNijGgY
KKpg9YblJlmVkTyPYbTQDZRILzaj6ygYCMc=
=FEeo
-----END PGP SIGNATURE-----

--070b8133b41b52338b365b906ef7a26c768052edd877178f524788085723--


--===============0530782426459040872==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0530782426459040872==--

