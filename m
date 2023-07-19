Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4158DC001B0
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 13:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ooxlayT59gwEN0z8Ka7EDzv4KcCRlLNjK53IiscCwvI=; b=hkE6T1IR9dvzhL
	nPj5uuVOULbfT4/RI71y9r4bxhHwhrApbYk07VZa5fY9zvwWz5HQly2lWlmirgT3jqownXA0l/J7X
	ZowshiVTG8jFYt6dMFh/5XYNp5BAMI6PotiaL9rd4uTRD8EkqrfSasZL0gbpGjevZdMZtYzpMfYZm
	a/2pKm5muY1Vr8la5ukcQ/TyTrVYZwTXF1ZqbSJkcaK+Rr3AGpPFsqiJYok2uhyGaEKvqYtpN9HrP
	bMt0sRCRP9ftjXUDSlQc401woeohCpDrD29cCZheuz03GGxhYG47ks9mMj5K4rvda4VWV+lppjOBk
	khBJ5BUVJL8XSrWbk02A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM725-007X30-0Z;
	Wed, 19 Jul 2023 13:15:57 +0000
Received: from unicorn.mansr.com ([2001:8b0:ca0d:1::2])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM722-007X0M-0f
	for linux-mtd@lists.infradead.org;
	Wed, 19 Jul 2023 13:15:55 +0000
Received: from raven.mansr.com (raven.mansr.com [IPv6:2001:8b0:ca0d:1::3])
	by unicorn.mansr.com (Postfix) with ESMTPS id 9594315360;
	Wed, 19 Jul 2023 14:15:48 +0100 (BST)
Received: by raven.mansr.com (Postfix, from userid 51770)
	id 86BD1219B41; Wed, 19 Jul 2023 14:15:48 +0100 (BST)
From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush
 Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Julien Su <juliensu@mxic.com.tw>, Jaime
 Liao <jaimeliao@mxic.com.tw>, Alvin Zhou <alvinzhou@mxic.com.tw>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, JaimeLiao
 <jaimeliao.tw@gmail.com>, Alexander Shiyan <eagle.alexander923@gmail.com>,
 Domenico Punzo <dpunzo@micron.com>, Bean Huo <beanhuo@micron.com>
Subject: Re: [PATCH v2 3/3] mtd: rawnand: Support for sequential cache reads
References: <20230112093637.987838-1-miquel.raynal@bootlin.com>
	<20230112093637.987838-4-miquel.raynal@bootlin.com>
	<yw1xfs6j4k6q.fsf@mansr.com> <20230716174917.3a9ca7a7@xps-13>
	<yw1x7cqzzr4d.fsf@mansr.com> <20230717091900.52ed815a@xps-13>
	<yw1x351mznr0.fsf@mansr.com> <20230717183645.32ef90b0@xps-13>
	<yw1xy1jdxqot.fsf@mansr.com> <20230719102153.2ef93cfe@xps-13>
	<yw1xttu0xnf2.fsf@mansr.com> <20230719134445.08476f5c@xps-13>
Date: Wed, 19 Jul 2023 14:15:48 +0100
In-Reply-To: <20230719134445.08476f5c@xps-13> (Miquel Raynal's message of
	"Wed, 19 Jul 2023 13:44:45 +0200")
Message-ID: <yw1xpm4oxcsb.fsf@mansr.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_061554_385085_4946AB0F 
X-CRM114-Status: GOOD (  33.79  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Miquel Raynal <miquel.raynal@bootlin.com> writes:

> Hi M=E5ns,
>
> mans@mansr.com wrote on Wed, 19 Jul 2023 10:26:09 +0100:
>
>> Miquel Raynal <miquel.raynal@bootlin.com> writes:
>> =

>> > Hi M=E5ns,
>> >
>> > mans@mansr.com wrote on Tue, 18 Jul 2023 15:03:14 +0100:
>> >  =

>> >> Miquel Raynal <miquel.raynal@bootlin.com> writes:
>> >>   =

>> >> > Hi M=E5ns,
>> >> >
>> >> > mans@mansr.com wrote on Mon, 17 Jul 2023 14:11:31 +0100:
>> >> >    =

>> >> >> Miquel Raynal <miquel.raynal@bootlin.com> writes:
>> >> >>     =

>> >> >> > So, I should have done that earlier but, could you please slow t=
he
>> >> >> > whole operation down, just to see if there is something wrong wi=
th the
>> >> >> > timings or if we should look in another direction.
>> >> >> >
>> >> >> > Maybe you could add a boolean to flag if the last CMD was a
>> >> >> > READCACHESEQ, READCACHESTART or READCACHEEND, and if the flag is
>> >> >> > true, please get the jiffies before and after each waitrdy and
>> >> >> > delay_ns. Finally, please print the expected delay and the actua=
l one
>> >> >> > and compare to see if something was too fast compared to what we
>> >> >> > expected.      =

>> >> >> =

>> >> >> Between which points exactly should the delay be measured?  Also, =
there
>> >> >> is no command called READCACHESTART.  Did you mean READSTART or
>> >> >> something else?    =

>> >> >
>> >> > Yeah, whatever command is specific to sequential cache reads:
>> >> > https://elixir.bootlin.com/linux/latest/source/drivers/mtd/nand/raw=
/nand_base.c#L1218
>> >> > https://elixir.bootlin.com/linux/latest/source/drivers/mtd/nand/raw=
/nand_base.c#L1228    =

>> >> =

>> >> I'm still not sure what exactly you want to me measure.  The waitrdy =
and
>> >> ndelay combined, each separately, or something else?
>> >>   =

>> >
>> > I would like to know, how much time we spend waiting in both cases.  =

>> =

>> Which "both" cases?
>
> ndelay and more importantly, waitrdy:

[...]

>> > Is there something wrong with the "wait ready"? As we cannot observe
>> > the timings with a scope, because we are using a "soft" controller
>> > implementation somehow, we can easily measure how much time we spend
>> > in each operation by measuring the time before and after.
>> >
>> > These information are only useful when we are doing operations related
>> > to sequential reads.  =

>> =

>> I have hooked up some spare GPIOs to a scope, which should be more
>> accurate (nanosecond) than software timestamps.  All I need to know is
>> what to measure and what to look for in those measurements.
>
> Great. The only issue with the scope is the fact that we might actually
> look at something that is not a faulty sequential read op.

How exactly do I know which ones are faulty?

> Unless you hack into the core to perform these in a loop (with a
> brutal "while (1)"). But I don't think we require big precision here,
> at least as a first step, looking at software timestamps like hinted
> above is enough so we can easily identify the different delays and
> compare them with nand_timings.c.
>
> Please use whatever method is easier for you.

Which values should be compared?

Sorry if I'm being obtuse, I don't normally have to deal with these
things.

-- =

M=E5ns Rullg=E5rd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
