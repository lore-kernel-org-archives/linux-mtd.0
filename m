MIME-Version: 1.0
In-Reply-To: <20110531224428.6636e283@taxman.wild-wind.fr.eu.org>
References: <1305637877-24436-1-git-send-email-marc.zyngier@arm.com>
	<1305637877-24436-2-git-send-email-marc.zyngier@arm.com>
	<4DE53D52.4040508@ru.mvista.com>
	<20110531224428.6636e283@taxman.wild-wind.fr.eu.org>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Tue, 31 May 2011 22:20:46 -0400
Message-ID: <BANLkTim0xrx+33BeoSbXbQcu2Ab6Oin=Wg@mail.gmail.com>
Subject: Re: [PATCH v6 1/8] MTD: Add integrator-flash feature to physmap
To: Marc Zyngier <marc.zyngier@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Sergei Shtylyov <sshtylyov@mvista.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 31, 2011 at 17:44, Marc Zyngier wrote:
> On Tue, 31 May 2011 23:11:14 +0400 Sergei Shtylyov wrote:
>> Marc Zyngier wrote:
>> > In the process of moving platforms away from integrator-flash
>> > (aka armflash), add to physmap the few features that make
>> > armflash unique:
>>
>> > - optionnal probing for the AFS partition type
>> > - init() and exit() methods, used by Integrator to control
>> > =C2=A0 write access to the various onboard programmable components
>>
>> > Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
>> > Acked-by: Catalin Marinas <catalin.marinas@arm.com>
>> > Cc: David Woodhouse <dwmw2@infradead.org>
>> [...]
>>
>> > diff --git a/include/linux/mtd/physmap.h b/include/linux/mtd/physmap.h
>> > index bcfd9f7..d37cca0 100644
>> > --- a/include/linux/mtd/physmap.h
>> > +++ b/include/linux/mtd/physmap.h
>> > @@ -22,6 +22,8 @@ struct map_info;
>> >
>> > =C2=A0struct physmap_flash_data {
>> > =C2=A0 =C2=A0 unsigned int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wi=
dth;
>> > + =C2=A0 int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 (*init)(struct platform_device *);
>> > + =C2=A0 void =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0(*exit)(struct platform_device *);
>>
>> =C2=A0 =C2=A0 How about a declaration for 'struct platform_device' befor=
ehand? This breaks
>> build on other platforms at least...
>
> Sure. Please send a patch.

uhh, what ?  you broke things, so you fix them.  i already pointed out
this breakage to you over a week ago.
-mike
