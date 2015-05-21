Received: from mail-oi0-x236.google.com ([2607:f8b0:4003:c06::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YvM1F-00031b-3w
 for linux-mtd@lists.infradead.org; Thu, 21 May 2015 08:39:58 +0000
Received: by oihd6 with SMTP id d6so12232347oih.2
 for <linux-mtd@lists.infradead.org>; Thu, 21 May 2015 01:39:35 -0700 (PDT)
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <CACna6rweJuyqZ-sVe-DT7yaX4pPLXt8H++BdsZ7+EyzSzoeRoQ@mail.gmail.com>
References: <20150515195541.GL11598@ld-irv-0074>
 <20150518104501.GD3551@leverpostej>
 <20150518183442.GR11598@ld-irv-0074>
 <CAMuHMdUCj2AXk_0mAgRfAStrveHPi=Rp2g-b177zO_ode8NaCw@mail.gmail.com>
 <20150519013415.GV11598@ld-irv-0074>
 <CACna6rzpxoXEJbeRyxaR0wiPpWc_MmgvnqoW-dSw4fF-=EMM_g@mail.gmail.com>
 <20150520213546.GN11598@ld-irv-0074>
 <CACna6rxq5zOR=7LT2vdbioWp3nD0eBeELJ_d9pPk7VwTWhmStg@mail.gmail.com>
 <20150521072515.GC11112@norris-Latitude-E6410>
 <CACna6rz6O2XRt0OBmf9stLvM1xh4v4aKTD=MR2EbCKFPV1SOpA@mail.gmail.com>
 <20150521081526.GG11112@norris-Latitude-E6410>
 <CACna6rweJuyqZ-sVe-DT7yaX4pPLXt8H++BdsZ7+EyzSzoeRoQ@mail.gmail.com>
Date: Thu, 21 May 2015 10:39:34 +0200
Message-ID: <CAMuHMdVr37hUxCJL+9WGX7BZtMpAaDyXrAb=i=xovUn6AyxfxA@mail.gmail.com>
Subject: Re: [PATCH] Documentation: dt: mtd: replace "nor-jedec" binding with
 "jedec, spi-nor"
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Marek Vasut <marex@denx.de>, Stephen Warren <swarren@wwwdotorg.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Rafal, Brian,

On Thu, May 21, 2015 at 10:25 AM, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com=
> wrote:
> On 21 May 2015 at 10:15, Brian Norris <computersforpeace@gmail.com> wrote=
:
>> On Thu, May 21, 2015 at 10:01:05AM +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
>>> On 21 May 2015 at 09:25, Brian Norris <computersforpeace@gmail.com> wro=
te:
>>> >> > For platform devices, you might as well just use the name of the d=
river,
>>> >> > which is 'm25p80'. Isn't that how most platform devices are matche=
d with
>>> >> > drivers?
>>> >>
>>> >> Yes and I think it's ugly because it keeps causing the warning about
>>> >> read flash model not matching specified one (m25p80).
>>> >
>>> > Sure, I agree.
>>> >
>>> >> Are you
>>> >> seriously not going to allow platform stuff *clearly* request flash
>>> >> model detection (JEDEC RDID OP)? Just because they don't use DT?
>>> >
>>> > No, this isn't about "allowing" anything. It's just that my primary
>>> > concern was to get the DT binding straightened out properly. Linus'
>>> > current tree now has the proper binding, but the m25p80.c code doesn'=
t
>>> > quite bind properly. It will work if "jedec,spi-nor" is the first
>>> > entry in the compatible property (and so it becomes the 'modalias', b=
ut
>>> > not second, third, etc. So my patch fixes that properly.
>>> >
>>> > Now, the secondary concern is that you want platform devices to speci=
fy
>>> > something generic, and that doesn't yield a "found X, expected Y"
>>> > message. I'm perfectly fine with fixing that too, if you have a patch
>>> > for it. What do you propose?
>>>
>>> Maybe I wasn't clear enough. I was going to start using struct
>>> flash_platform_data with
>>> .type =3D "spi-nor",
>>> but your proposed patch removes support for such name.
>>
>> Ah, OK. So that's the part I was overlooking.
>>
>>> While I like matching DT *clearly* against the whole "jedec,spi-nor"
>>> string (really, I'm all for it), I'm confused what I should use for
>>> platform stuff now. I don't have any proposal as my initial plan was
>>> exactly to use this "spi-nor".
>>> I guess I don't want to re-add support for "spi-nor" (as you just
>>> proposed to remove it),
>>
>> I wasn't really trying to remove "spi-nor", that was mostly a side
>> effect.
>
> OK, I think we understand each other now :)
>
>>> so I think I have to bounce the question: what
>>> alternative do you propose?
>>
>> I think your comments suggest that I shouldn't be removing "spi-nor"
>> from m25p_ids[] nor from this block:
>>
>>         if (data && data->type)
>>                 flash_name =3D data->type;
>>         else if (!strcmp(spi->modalias, "spi-nor"))
>>                 flash_name =3D NULL; /* auto-detect */
>>         else
>>                 flash_name =3D spi->modalias;
>>
>> So it stays in both m25p_ids[] and .of_match_table.
>>
>> I suppose that can work. It then allows people to do weird stuff like:
>>
>>         compatible =3D "idontknowwhatimdoing,spi-nor";
>>
>> in their device tree. But other than that, there's not much downside I d=
on't
>> think.
>
> It sounds like a reasonable solution. I guess there isn't a perfect
> one. Even if we decide to go for sth like "jedec-spi-nor", there
> always will be a chance of someone using
> compatible =3D "idontknowwhatimdoing,jedec-spi-nor";
> So if you rework your patch to leave "spi-nor" support in m25p_ids and
> conditions block, it should be OK.

Typically platform devices just use the driver's name. Hence IMHO there's
no need to add a shiny new spi-nor device name.

So what's wrong with using "m25p80", and treating that as auto-detect iff
!spi->dev.of_node?
Non-autodetect platform_devices use flash_platform_data.type anyway,
and thus fall under the first "if" clause above, don't they?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
