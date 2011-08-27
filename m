MIME-Version: 1.0
In-Reply-To: <201108261715.54073.marek.vasut@gmail.com>
References: <1314171204-25458-1-git-send-email-b32955@freescale.com>
	<1314272091.18988.53.camel@sauron>
	<201108261715.54073.marek.vasut@gmail.com>
Date: Fri, 26 Aug 2011 21:03:46 -0400
Message-ID: <CAMiH66Fq7zAEffX0k1bQ57X5_gX2pRqkcE3YirvRgZvnDcjW2w@mail.gmail.com>
Subject: Re: [PATCH v10 0/3] add the GPMI controller driver for IMX23/IMX28
From: Huang Shijie <shijie8@gmail.com>
To: Marek Vasut <marek.vasut@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: dedekind1@gmail.com, koen.beel.barco@gmail.com, w.sang@pengutronix.de,
	Huang Shijie <b32955@freescale.com>,
	linux-mtd@lists.infradead.org, s.hauer@pengutronix.de,
	linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Marek:

On Fri, Aug 26, 2011 at 11:15 AM, Marek Vasut <marek.vasut@gmail.com> wrote=
:
> On Thursday, August 25, 2011 01:34:46 PM Artem Bityutskiy wrote:
>> On Wed, 2011-08-24 at 15:33 +0800, Huang Shijie wrote:
>> > The patch set is based on Artem's tree:
>> > =C2=A0 =C2=A0 http://git.infradead.org/users/dedekind/l2-mtd-2.6.git
>> >
>> > The general-purpose media interface(GPMI) controller is a flexible
>> > interface to up to several NAND flashs.
>> >
>> > The Bose Ray-Choudhury Hocquenghem(BCH) module is a hardware ECC
>> > accelerator.
>> >
>> > With the help of BCH, the GPMI controller can choose to do the hardwar=
e
>> > ECC or not.
>> >
>> > This driver is a _pure_ MTD NAND controller driver now.
>>
>> I've pushed these patches to my l2-mtd-2.6.git tree. I assume they are
>> independent of the other patches of yours: "[PATCH v8 0/4] add the
>> GPMI-NAND support for imx23/imx28".
>>
>> I did not really review the driver carefully, but the code looks neat at
>> the first glance. My tree is in linux-next, so you should see your
>> driver there.
>>
>> Also, if someone gives it more review, and you send a new version, I can
>> always pick it up.
>
> Yea, add my Acked-by's to that version ;-)
Thanks for your comments. :)

I will send out the new version next week.

Best Regards
Huang Shijie

>
> Cheers
>>
>> Thanks.
>
