Received: from mail-gx0-f177.google.com ([209.85.161.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P5gVl-0007mZ-4d
	for linux-mtd@lists.infradead.org; Tue, 12 Oct 2010 15:11:30 +0000
Received: by gxk7 with SMTP id 7so437323gxk.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 12 Oct 2010 08:11:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1286893627.2164.65.camel@localhost>
References: <1286398974-12114-1-git-send-email-karl.beldan@gmail.com>
	<1286825063.1742.13.camel@brekeke>
	<AANLkTi=A6djk8hOgLOg045f5XiiwkOYS2QtzOUwiT+Bo@mail.gmail.com>
	<1286893627.2164.65.camel@localhost>
Date: Tue, 12 Oct 2010 17:11:27 +0200
Message-ID: <AANLkTikghhYSDY=EamGvPpWfc_FqBrBw7Ua6jnO8Xx+q@mail.gmail.com>
Subject: Re: [RFC] do_mounts: Allow mtd names for non-flash block filesystems
From: Karl Beldan <karl.beldan@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 12, 2010 at 4:27 PM, Artem Bityutskiy <dedekind1@gmail.com> wro=
te:
> On Tue, 2010-10-12 at 15:16 +0200, Karl Beldan wrote:
>> On Mon, Oct 11, 2010 at 9:24 PM, Artem Bityutskiy <dedekind1@gmail.com> =
wrote:
>> > On Wed, 2010-10-06 at 23:02 +0200, Karl Beldan wrote:
>> >> Hi,
>> >>
>> >> I have been using this tweak for some time now, and I am getting tire=
d of
>> >> having to resort to it so often.
>> >> It allows to pass such cmdline root as:
>> >> =C2=A0"root=3Dmtdb:ubivolx rootfstype=3Dsquashfs"
>> >> I am pretty sure many people use squashfs/cramfs filesystems on top o=
f nand,
>> >> for example, and I thought that this might initiate discussion.
>> >>
>> >> --
>> >> Karl
>> >>
>> >> Signed-off-by: Karl Beldan <karl.beldan@gmail.com>
>> >> ---
>> >> =C2=A0init/do_mounts.c | =C2=A0 15 +++++++++++++--
>> >> =C2=A01 files changed, 13 insertions(+), 2 deletions(-)
>> >
>> > Dunno...
>> >
>> > First of all, if you have to do this, let it be mtdblock, not mtdb - n=
o
>> > need to breed aliases.
>> >
>> > But how about teaching squashfs to understand mtdX and mtd:name syntax
>> > instead?
>> >
>>
>> Hi Artem,
>>
>> I would not do that, squashfs and co just ask for a block device, puttin=
g mtdx
>> syntax awareness in each of them just does not seem a good fit to me.
>
> Right. But the same arguments applies to do_mounts.c which you hack:
To a far lesser extent, moreover do_mounts has similar hacks in that
regard, plus doing
this into squashfs you would have to do it everywhere else (e.g cramfs).
I just cannot agree, sorry.

> mtdblock is just a block device, putting awareness of specific types of
> block devices is not a good thing to do.
>
That was my point when you suggested hacking into squashfs to add mtd
names awareness.

> May be this is why I'm not too happy about your patch?
>
Neither am I, hence the way I tackled the matter.
This tweak, as I introduced it, is here to get better feedback.

>> BTW 'for-2.6.37' got https://patchwork.kernel.org/patch/145681/.
>
> Yeah, it is better to have a generic approach which can be applied to
> all block devices. Make UUID of your mtdblock to be equivalent to the
> name of the underlying mtd device and you are done: use
> PARTUUID=3D<mtd_device_name>. Right?
>
I put that link to bring back the discussion around something I would
more stick to
 as I anticipated the taste of the reply.

Maybe we'll come easierly to a way of handling this matter with 'next-'s.
Though the mtd subsystem is probably one that would benefit from such
a name scheme,
the solution is on its way to come from another subsystem.

Thanks,

--=20
Karl
