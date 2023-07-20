Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D29EB64DC
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jul 2023 11:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LDB9ccoz8C1S3XCHvoGZ+dk/mZW80rEmbfWwzPmQ5eU=; b=2vsNz/tLgKTvNr
	UjaY3rZjqvQSwRBi/4yw/Jsed9p+mItRj3SSSkaz9LWrcyDN6GwMpAiQrsFf1kdF9AajhtLsIkx+R
	44/5wk5ra/pnn/jJTJtOO0Ha6ztLb3dnZURYY5p2Wsg+gTJ1av0CXZ3hra2tXWHDXeAoD9UZkj7eX
	r+vuMftLqNIUSAKbKlemFpIeA34DYYpqMqnKvWNznaGepDHLpmYedKblhtRpcL//Y9NGnj8bLIqX5
	m4uIe+vzZiZtUQyN2igEl9qvvaNFSkarnBpdM+YHpdZO9Gr3Of41kak1wZ3T6q7juTzhDMwLLj2gG
	HLzDKkEcQNVqbdI0AlzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMS2x-00B0au-2X;
	Thu, 20 Jul 2023 11:42:15 +0000
Received: from unicorn.mansr.com ([81.2.72.234])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMS2t-00B0Zs-0q
	for linux-mtd@lists.infradead.org;
	Thu, 20 Jul 2023 11:42:13 +0000
Received: from raven.mansr.com (raven.mansr.com [81.2.72.235])
	by unicorn.mansr.com (Postfix) with ESMTPS id 9E0EC15360;
	Thu, 20 Jul 2023 12:42:03 +0100 (BST)
Received: by raven.mansr.com (Postfix, from userid 51770)
	id 57B2A219B41; Thu, 20 Jul 2023 12:42:03 +0100 (BST)
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
	<yw1xpm4oxcsb.fsf@mansr.com> <20230720082014.493dfec7@xps-13>
Date: Thu, 20 Jul 2023 12:42:03 +0100
In-Reply-To: <20230720082014.493dfec7@xps-13> (Miquel Raynal's message of
	"Thu, 20 Jul 2023 08:20:14 +0200")
Message-ID: <yw1xlefayflg.fsf@mansr.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_044211_449852_87DB457C 
X-CRM114-Status: GOOD (  42.66  )
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
> mans@mansr.com wrote on Wed, 19 Jul 2023 14:15:48 +0100:
>
>> Miquel Raynal <miquel.raynal@bootlin.com> writes:
>> =

>> > Hi M=E5ns,
>> >
>> > mans@mansr.com wrote on Wed, 19 Jul 2023 10:26:09 +0100:
>> >  =

>> >> Miquel Raynal <miquel.raynal@bootlin.com> writes:
>> >>   =

>> >> > Hi M=E5ns,
>> >> >
>> >> > mans@mansr.com wrote on Tue, 18 Jul 2023 15:03:14 +0100:
>> >> >    =

>> >> >> Miquel Raynal <miquel.raynal@bootlin.com> writes:
>> >> >>     =

>> >> >> > Hi M=E5ns,
>> >> >> >
>> >> >> > mans@mansr.com wrote on Mon, 17 Jul 2023 14:11:31 +0100:
>> >> >> >      =

>> >> >> >> Miquel Raynal <miquel.raynal@bootlin.com> writes:
>> >> >> >>       =

>> >> >> >> > So, I should have done that earlier but, could you please slo=
w the
>> >> >> >> > whole operation down, just to see if there is something wrong=
 with the
>> >> >> >> > timings or if we should look in another direction.
>> >> >> >> >
>> >> >> >> > Maybe you could add a boolean to flag if the last CMD was a
>> >> >> >> > READCACHESEQ, READCACHESTART or READCACHEEND, and if the flag=
 is
>> >> >> >> > true, please get the jiffies before and after each waitrdy and
>> >> >> >> > delay_ns. Finally, please print the expected delay and the ac=
tual one
>> >> >> >> > and compare to see if something was too fast compared to what=
 we
>> >> >> >> > expected.        =

>> >> >> >> =

>> >> >> >> Between which points exactly should the delay be measured?  Als=
o, there
>> >> >> >> is no command called READCACHESTART.  Did you mean READSTART or
>> >> >> >> something else?      =

>> >> >> >
>> >> >> > Yeah, whatever command is specific to sequential cache reads:
>> >> >> > https://elixir.bootlin.com/linux/latest/source/drivers/mtd/nand/=
raw/nand_base.c#L1218
>> >> >> > https://elixir.bootlin.com/linux/latest/source/drivers/mtd/nand/=
raw/nand_base.c#L1228      =

>> >> >> =

>> >> >> I'm still not sure what exactly you want to me measure.  The waitr=
dy and
>> >> >> ndelay combined, each separately, or something else?
>> >> >>     =

>> >> >
>> >> > I would like to know, how much time we spend waiting in both cases.=
    =

>> >> =

>> >> Which "both" cases?  =

>> >
>> > ndelay and more importantly, waitrdy:  =

>> =

>> [...]
>> =

>> >> > Is there something wrong with the "wait ready"? As we cannot observe
>> >> > the timings with a scope, because we are using a "soft" controller
>> >> > implementation somehow, we can easily measure how much time we spend
>> >> > in each operation by measuring the time before and after.
>> >> >
>> >> > These information are only useful when we are doing operations rela=
ted
>> >> > to sequential reads.    =

>> >> =

>> >> I have hooked up some spare GPIOs to a scope, which should be more
>> >> accurate (nanosecond) than software timestamps.  All I need to know is
>> >> what to measure and what to look for in those measurements.  =

>> >
>> > Great. The only issue with the scope is the fact that we might actually
>> > look at something that is not a faulty sequential read op.  =

>> =

>> How exactly do I know which ones are faulty?
>
> Right now I expect all sequential ops to be faulty. As mentioned above,
> I don't think we are interested in all the commands that are sent
> through the NAND bus, but just the READSTART/READCACHESEQ/READCACHEEND
> sequences, see these two ops there, that's what we want to capture:
>
>> >> >> > https://elixir.bootlin.com/linux/latest/source/drivers/mtd/nand/=
raw/nand_base.c#L1218
>> >> >> > https://elixir.bootlin.com/linux/latest/source/drivers/mtd/nand/=
raw/nand_base.c#L1228   =

>
> That's why a regular scope is not as easy as it sounds to use to
> capture these timings.

I have it set up so it raises one of three GPIOs at the start of
omap_nand_exec_instr() when any of those commands are issued, then a
fourth during the following waitrdy.  After the ndelay(), the pin for
the command is lowered again.  This makes it easy to measure the
duration of the waitrdy as well as any additional delay associated with
each of the commands.

The actual nand chip signals are unfortunately impossible to access.

>> > Unless you hack into the core to perform these in a loop (with a
>> > brutal "while (1)"). But I don't think we require big precision here,
>> > at least as a first step, looking at software timestamps like hinted
>> > above is enough so we can easily identify the different delays and
>> > compare them with nand_timings.c.
>> >
>> > Please use whatever method is easier for you.  =

>> =

>> Which values should be compared?
>
> The specification declares minimum and maximum times (see
> nand_timings.c). I want to see if these timings, which are requested by
> the core (links above) are correctly observed or not. The ones that are
> particularly critical because they are different than what the other
> ops use, are the ones around READSTART/READCACHESEQ/READCACHEEND.
> Anything else, you already use them, so it's quite likely that they are
> not problematic. These are new.

I don't think it's quite as simple as these commands being somehow
broken.  The system works for the most part, and these commands are
definitely being used.  The only breakage I notice is that the
MEMGETBADBLOCK ioctl wrongly reports blocks as being bad under some
unclear conditions.  There appears to be some weird interaction between
this ioctl and read() calls.  Whatever the pattern is, it is entirely
predictable in that issuing the same sequence of ioctl and read always
gives the same error pattern.  Using pread instead of read changes the
pattern.

-- =

M=E5ns Rullg=E5rd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
