Received: from yw-out-1718.google.com ([74.125.46.152])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MD1Tt-00021B-1I
	for linux-mtd@lists.infradead.org; Sat, 06 Jun 2009 19:23:12 +0000
Received: by yw-out-1718.google.com with SMTP id 9so1316133ywk.72
	for <linux-mtd@lists.infradead.org>;
	Sat, 06 Jun 2009 12:22:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1244291275.3751.1749.camel@macbook.infradead.org>
References: <8bd0f97a0905061941s6055c6dfrf467a6b2b837c8f8@mail.gmail.com>
	<1244224312.3751.187.camel@macbook.infradead.org>
	<8bd0f97a0906051642i6a270831peddba0f49e22b75@mail.gmail.com>
	<1244291275.3751.1749.camel@macbook.infradead.org>
Date: Sat, 6 Jun 2009 15:22:58 -0400
Message-ID: <8bd0f97a0906061222odbd6935x392cd4f72153f013@mail.gmail.com>
Subject: Re: physmap and pointless shutdown() function ?
From: Mike Frysinger <vapier.adi@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Lennert Buytenhek <buytenh@wantstofly.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Jun 6, 2009 at 08:27, David Woodhouse wrote:
> On Fri, 2009-06-05 at 19:42 -0400, Mike Frysinger wrote:
>> On Fri, Jun 5, 2009 at 13:51, David Woodhouse wrote:
>> > On Wed, 2009-05-06 at 22:41 -0400, Mike Frysinger wrote:
>> >> waaaay back when power management support was added to the physmap.c
>> >> driver, it added the standard suspend/resume functions. =C2=A0no prob=
lem
>> >> there. =C2=A0but it also added a shutdown function which causes the f=
lash
>> >> to suspend/resume when rebooting:
>> >> static void physmap_flash_shutdown(struct platform_device *dev)
>> >> {
>> >> =C2=A0 =C2=A0 struct physmap_flash_info *info =3D platform_get_drvdat=
a(dev);
>> >> =C2=A0 =C2=A0 int i;
>> >> =C2=A0 =C2=A0 for (i =3D 0; i < MAX_RESOURCES && info->mtd[i]; i++)
>> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (info->mtd[i]->suspend && info->mtd[i]=
->resume)
>> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (info->mtd[i]->suspend(i=
nfo->mtd[i]) =3D=3D 0)
>> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info->mtd[i]-=
>resume(info->mtd[i]);
>> >> }
>> >>
>> >> i cant see any point in doing this. =C2=A0it isnt like the flash has
>> >> buffers that need flushing, and if they did, using suspend/resume as =
a
>> >> hack for flushing sounds pretty broken to me.
>> >>
>> >> seems to me the function should just be dropped completely.
>> >
>> > Wasn't that just to put it into read mode in case the bootloader is
>> > running from the same chip?
>>
>> the flash isnt put into read mode though. =C2=A0if i add printk's to the
>> shutdown function like so:
>> then during reboot i see:
>> physmap_flash_shutdown: 0: before: aded5006
>> physmap_flash_shutdown: 0: after: 800080
>> the first value is the correct value
>
> That's odd, and would seem to indicate that the attempt to ensure the
> flash is in read mode isn't _working_. But I still think that was the
> _intent_ of this code. It was just coincidence that it was in read mode
> before the call; we needed to make 100% sure.

looking through the nest of function pointers, this seems to be a bug
in the intel cfi command set then ?  that is what implements the
suspend/resume functions ...

i know this flash is using a command set version that was only added
somewhat recently (1.5 iirc) ...

>> > Reboot doesn't work very well if all you
>> > have is flash status bits at your reset vector,
>>
>> your assumption is faulty in that the reset vector is the base of the
>> flash. =C2=A0i.e. the physmap base is 0x20000000 as is the reset vector.
>
> The reset vector may or may not be in the physmap flash. If it's not, of
> course, then the shutdown state doesn't matter. If it _is_, then the
> shutdown state _might_ matter (depending on the hardware reset
> arrangements).
>
> It doesn't matter whether it's at the base of the flash, at the end of
> the flash, or in the middle -- does it?

i didnt think it did, but your comment about flash status bits at
reset vector seemed to imply that it did

> The point remains -- I don't think we can remove the shutdown() function
> -- I think it needs to be fixed to leave the flash in read mode.

i'm fine with that intent if it worked ;)
-mike
