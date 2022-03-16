Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 004C2C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Mar 2022 19:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dseDSH44JQcp5S7KjEdItHXIXetmo6tquHE79o1dBcc=; b=qRnZ42+9euH5nb
	/am1qgI1mGcL9mv0k/gd+aoMy6oVUREmxxAJeDkwIrvid7894bOWrtMKOpG1ITodicDW5sMX6EVsn
	0hiTgYdhRzYuWrtwSKumIfpKY+ROa41Lr3ghPXLhKlj5Xqpbq2EqT8CBfn/0mpWQv1BJADCgK4BEU
	fageB3hMCa3AyUi3/Jo0+ef8+JzYLWQw7f0eGU4/GIBDma4VLywcvjirv0lJvIlF8L930psUg0TFm
	DDCD2MKq0htUOCAbtDpSfIX3xLV2dcMdZe+bhZjSk9bDj4XGxedIr5PuQN3E3NHyYiWWrSb1LqcJ0
	bKdpqvjf8g1gYiQw4wow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUYzp-00EA06-IR; Wed, 16 Mar 2022 19:07:45 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUYzm-00E9zk-0Z
 for linux-mtd@lists.infradead.org; Wed, 16 Mar 2022 19:07:43 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22GJ7aGd092762;
 Wed, 16 Mar 2022 14:07:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1647457656;
 bh=N5ylJZ1K6pH9Ewh0ti3NqYFgD8V839oLAeuagKadsz0=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=tOLYc0HrapKS2LqxUYFvFPZxuhZMSXLeiTl4X04fbvFvU+PYH0+yuhlFcZH+bImF6
 yU1IjkFy4/rqTLmdohg8lxxk2k4P0LFqfDWr21mGoFH9d3p/WbTEKBK+pRiH1dtyB7
 urPpUSLuldowfha+2A3EUeJqzJeOdZ97ggWCniOE=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22GJ7ak6050129
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 16 Mar 2022 14:07:36 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 16
 Mar 2022 14:07:36 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 16 Mar 2022 14:07:36 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22GJ7Y5o027198;
 Wed, 16 Mar 2022 14:07:35 -0500
Date: Thu, 17 Mar 2022 00:37:34 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <Tudor.Ambarus@microchip.com>
CC: <michael@walle.cc>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <heiko.thiery@gmail.com>
Subject: Re: [PATCH v1] mtd: spi-nor: unset quad_enable if SFDP doesn't
 specify it
Message-ID: <20220316190734.ft2fnesptnyk2cdg@ti.com>
References: <20220304185137.3376011-1-michael@walle.cc>
 <7f339d0c-5ca9-261c-a545-d4ebf3bda140@microchip.com>
 <92cde38c-d398-44f4-26f8-ef4919f5944e@microchip.com>
 <7f947928e7189f98eb950828990b3920@walle.cc>
 <91393780-1521-09b7-8dea-14c65e18b37e@microchip.com>
 <0cf8dbbf4ad005abd3db825fb257dedd@walle.cc>
 <33464af7-b445-6229-a02d-703a5ce6b5ef@microchip.com>
 <77c2c64f362b08cbbdab517bbaa49101@walle.cc>
 <683b7df7-cd34-c87b-9918-fd63d09df2f3@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <683b7df7-cd34-c87b-9918-fd63d09df2f3@microchip.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_120742_195149_5DC9BF64 
X-CRM114-Status: GOOD (  52.53  )
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

On 15/03/22 07:47AM, Tudor.Ambarus@microchip.com wrote:
> On 3/15/22 09:24, Michael Walle wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know =
the content is safe
> > =

> > Am 2022-03-15 06:55, schrieb Tudor.Ambarus@microchip.com:
> >> On 3/14/22 22:42, Michael Walle wrote:
> >>> EXTERNAL EMAIL: Do not click links or open attachments unless you know
> >>> the content is safe
> >>>
> >>> Am 2022-03-09 05:49, schrieb Tudor.Ambarus@microchip.com:
> >>>> On 3/7/22 20:56, Michael Walle wrote:
> >>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you
> >>>>> know
> >>>>> the content is safe
> >>>>>
> >>>>> Am 2022-03-07 10:23, schrieb Tudor.Ambarus@microchip.com:
> >>>>>> On 3/7/22 09:12, Tudor.Ambarus@microchip.com wrote:
> >>>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you
> >>>>>>> know
> >>>>>>> the content is safe
> >>>>>>>
> >>>>>>> On 3/4/22 20:51, Michael Walle wrote:
> >>>>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you
> >>>>>>>> know the content is safe
> >>>>>>>>
> >>>>>>>> While the first version of JESD216 specify the opcode for 4 bit
> >>>>>>>> I/O
> >>>>>>>> accesses, it lacks information on how to actually enable this
> >>>>>>>> mode.
> >>>>>>>>
> >>>>>>>> For now, the one set in spi_nor_init_default_params() will be
> >>>>>>>> used.
> >>>>>>>> But this one is likely wrong for some flashes, in particular the
> >>>>>>>> Macronix MX25L12835F. Thus we need to clear the enable method
> >>>>>>>> when
> >>>>>>>> parsing the SFDP. Flashes with such an SFDP revision will have to
> >>>>>>>> use
> >>>>>>>> a
> >>>>>>>> flash (and SFDP revision) specific fixup.
> >>>>>>>>
> >>>>>>>> This might break quad I/O for some flashes which relied on the
> >>>>>>>> spi_nor_sr2_bit1_quad_enable() that was formerly set. If your
> >>>>>>>> bisect
> >>>>>>>> turns up this commit, you'll probably have to set the proper
> >>>>>>>> quad_enable method in a post_bfpt() fixup for your flash.
> >>>>>>>>
> >>>>>>>
> >>>>>>> Right, I meant adding a paragraph such as the one from above.
> >>>>>>>
> >>>>>>>> Signed-off-by: Michael Walle <michael@walle.cc>
> >>>>>>>> Tested-by: Heiko Thiery <heiko.thiery@gmail.com>
> >>>>>>>> ---
> >>>>>>>> changes since RFC:
> >>>>>>>> =A0- reworded commit message
> >>>>>>>> =A0- added comment about post_bfpt hook
> >>>>>>>>
> >>>>>>>> Tudor, I'm not sure what you meant with
> >>>>>>>> =A0 Maybe you can update the commit message and explain why would
> >>>>>>>> some
> >>>>>>>> =A0 flashes fail to enable quad mode, similar to what I did.
> >>>>>>>>
> >>>>>>>> It doesn't work because the wrong method is chosen? ;)
> >>>>>>>>
> >>>>>>>> =A0drivers/mtd/spi-nor/sfdp.c | 11 ++++++++++-
> >>>>>>>> =A01 file changed, 10 insertions(+), 1 deletion(-)
> >>>>>>>>
> >>>>>>>> diff --git a/drivers/mtd/spi-nor/sfdp.c
> >>>>>>>> b/drivers/mtd/spi-nor/sfdp.c
> >>>>>>>> index a5211543d30d..6bba9b601846 100644
> >>>>>>>> --- a/drivers/mtd/spi-nor/sfdp.c
> >>>>>>>> +++ b/drivers/mtd/spi-nor/sfdp.c
> >>>>>>>> @@ -549,6 +549,16 @@ static int spi_nor_parse_bfpt(struct spi_nor
> >>>>>>>> *nor,
> >>>>>>>> =A0=A0=A0=A0=A0=A0=A0 map->uniform_erase_type =3D map->uniform_r=
egion.offset &
> >>>>>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 SNOR_ERASE_TYPE_MASK;
> >>>>>>>>
> >>>>>>>> +=A0=A0=A0=A0=A0=A0 /*
> >>>>>>>> +=A0=A0=A0=A0=A0=A0=A0 * The first JESD216 revision doesn't spec=
ify a method to
> >>>>>>>> enable
> >>>>>>>> +=A0=A0=A0=A0=A0=A0=A0 * quad mode. spi_nor_init_default_params(=
) will set a
> >>>>>>>> legacy
> >>>>>>>> +=A0=A0=A0=A0=A0=A0=A0 * default method to enable quad mode. We =
have to disable
> >>>>>>>> it
> >>>>>>>> +=A0=A0=A0=A0=A0=A0=A0 * again.
> >>>>>>>> +=A0=A0=A0=A0=A0=A0=A0 * Flashes with this JESD216 revision need=
 to set the
> >>>>>>>> quad_enable
> >>>>>>>> +=A0=A0=A0=A0=A0=A0=A0 * method in their post_bfpt() fixup if th=
ey want to use
> >>>>>>>> quad
> >>>>>>>> I/O.
> >>>>>>>> +=A0=A0=A0=A0=A0=A0=A0 */
> >>>>>>>
> >>>>>>> Great. Looks good to me. I'll change the subject to "mtd: spi-nor:
> >>>>>>> sfdp:"
> >>>>>>> when applying.
> >>>>>>
> >>>>>> As we talked on the meeting, we can instead move the default quad
> >>>>>> mode
> >>>>>> init
> >>>>>> to the deprecated way of initializing the params, or/and to where
> >>>>>> SKIP_SFDP
> >>>>>> is used. This way you'll no longer need to clear it here.
> >>>>>
> >>>>> Mh, I just had a look and I'm not sure it will work there,
> >>>>> because in the deprecated way, the SFDP is still parsed and
> >>>>> thus we might still have the wrong enable method for flashes
> >>>>> which don't have PARSE_SFDP set.
> >>>>
> >>>> Moving the default quad_enable method to
> >>>> spi_nor_no_sfdp_init_params(),
> >>>> thus also for spi_nor_init_params_deprecated() because it calls
> >>>> spi_nor_no_sfdp_init_params(), will not change the behavior for the
> >>>> deprecated way of initializing the params, isn't it?
> >>>
> >>> What do you mean? The behavior is not changed and the bug is not
> >>> fixed for the flashes which use the deprecated way. It will get
> >>> overwritten by the spi_nor_parse_sfdp call in
> >>> spi_nor_sfdp_init_params_deprecated().
> >>
> >> right, it will not change the logic for the deprecated way of
> >> initializing
> >> the params.
> >>
> >>>
> >>>> A more reason
> >>>> to use PARSE_SFDP/SKIP_SFDP, we'll get rid of the deprecated params
> >>>> init at some point.
> >>>>
> >>>> No new fixes for spi_nor_init_params_deprecated().
> >>>
> >>> Hm, so we deliberately won't fix known bugs there? I'm not sure
> >>> I'd agree here. Esp. because it is hard to debug and might even
> >>> depend on non-volatile state of the flash.
> >>>
> >>
> >> even more a reason to switch to the recommended way of initializing
> >> the flash. We'll get rid of the deprecated code anyway, no?
> > =

> > I get your point. But I disagree with you on that point :) Features?
> > sure we can say this shouldn't go to any deprectated code flow and
> > might poke users to post a patch. But bug fixes? I don't think
> > we should hold these back.
> =

> Why to fix something that never worked in a deprecated code path? It's
> equivalent to adding new support, no?

I have not followed this discussion very closely but this argument makes =

sense to me. If something never worked in the deprecated path then we =

have don't have to fix it.

> =

> > Correct me if I'm wrong, but we can get rid of the deprecated way
> > only if all the flashes are converted to PARSE_SFDP or SKIP_SFDP,
> > right? And I don't see this happening anytime soon.
> =

> Right. I vote to don't queue any new patches for deprecated code paths,
> new support or fixes. But I'm not completely against it, I don't see
> the point, that's all. Let's sync with Pratyush and Vignesh too.

I agree with no new features for deprecated path. But I think we should =

still take in bug fixes.

-- =

Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
