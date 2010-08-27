MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <4C7757B1.9060403@snapgear.com>
References: <cover.1280924671.git.qy03fugy@stud.informatik.uni-erlangen.de>
	<4C5F9715.1030806@snapgear.com> <86tyn4ximi.fsf@peer.zerties.org>
	<861v9ptzex.fsf@peer.zerties.org>
	<AANLkTimiLhhTW=XRD4hSdsKxnNdKaMSDLUgOeVR=SCJf@mail.gmail.com>
	<4C7757B1.9060403@snapgear.com>
Date: Fri, 27 Aug 2010 09:14:32 +0200
Message-ID: <AANLkTimeUV9rS_b8YP9bgfBE+CvrjK+D7z0JGML3j8-H@mail.gmail.com>
Subject: Re: [PATCH 0/9] Removing dead code
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Greg Ungerer <gerg@snapgear.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-m68k@vger.kernel.org, Roman Zippel <zippel@linux-m68k.org>,
	John Stultz <johnstul@us.ibm.com>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	linux-kernel@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>,
	Alexander Kurz <linux@kbdbabel.org>,
	linux-mtd@lists.infradead.org, Michael Roth <mroth@nessie.de>,
	Greg Ungerer <gerg@uclinux.org>, Christoph Hellwig <hch@lst.de>,
	Finn Thain <fthain@telegraphics.com.au>, Tony Lindgren <tony@atomide.com>,
	vamos-dev@i4.informatik.uni-erlangen.de,
	Lennart Sorensen <lsorense@csclub.uwaterloo.ca>,
	Russell King <rmk+kernel@arm.linux.org.uk>,
	Anatolij Gustschin <agust@denx.de>,
	Sam Creasey <sammy@sammy.net>, linux-pcmcia@lists.infradead.org,
	Mike Frysinger <vapier@gentoo.org>,
	Sean MacLennan <smaclennan@pikatech.com>, Joe Perches <joe@perches.com>,
	Maxim Kuvyrkov <maxim@codesourcery.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Christian Dietrich <qy03fugy@stud.informatik.uni-erlangen.de>,
	Jiri Kosina <jkosina@suse.cz>, Greg Kroah-Hartman <gregkh@suse.de>,
	Wolfram Sang <w.sang@pengutronix.de>, Ralf Baechle <ralf@linux-mips.org>,
	Martin Schwidefsky <schwidefsky@de.ibm.com>,
	Manuel Lauss <manuel.lauss@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 27, 2010 at 08:14, Greg Ungerer <gerg@snapgear.com> wrote:
> Geert Uytterhoeven wrote:
>>
>> On Mon, Aug 23, 2010 at 12:07, Christian Dietrich
>> <qy03fugy@stud.informatik.uni-erlangen.de> wrote:
>>>
>>> Christian Dietrich <qy03fugy@stud.informatik.uni-erlangen.de> writes:
>>>>>
>>>>> I don't have any problems with any of these from a
>>>>> m68knommu point of view. I can merge them via the
>>>>> m68knommu git tree if you want?
>>>>
>>>> If there aren't any complaints from the m68k people i'm fine with
>>>> that.
>>>
>>> Hm, last message was two weeks ago, so perhaps the m68k people (with
>>> mmu) have no complaints with these patches and they can be included in
>>> the m68knommu tree?
>>
>> Sorry, I've been a bit too busy with other things...
>>
>> =C2=A0- arch/m68k: Removing dead GG2 config option
>> =C2=A0 =C2=A0Fine for me
>> =C2=A0- arch/m68k{,nommu}: Removing dead SMP config option
>> =C2=A0 =C2=A0Are there any SMP m68k systems coming?
>> =C2=A0 =C2=A0If yes, we may want to keep it. From the other hand, probab=
ly many
>> other places
>> =C2=A0 =C2=A0need adjustment for SMP too, so the few checks for CONFIG_S=
MP may give
>> a
>> =C2=A0 =C2=A0false feeling of readiness for SMP.
>> =C2=A0- arch/m68knommu: Removing dead M68KFPU_EMU config option
>> =C2=A0 =C2=A0With the imminent(?) merge of mmu and nommu, perhaps we wan=
t to keep
>> it?
>
> I think what is in there is so old and decrepit that it is more
> of a hindrance than a help :-) =C2=A0When we merge we should just be
> using what is currently in the m68k part of the source. So I am
> happy to remove the m68knommu FPU code right now.

OK, fine for me!

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
