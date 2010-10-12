Received: from mail-px0-f177.google.com ([209.85.212.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P5h8e-00032e-Nz
	for linux-mtd@lists.infradead.org; Tue, 12 Oct 2010 15:51:41 +0000
Received: by pxi12 with SMTP id 12so1250013pxi.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 12 Oct 2010 08:51:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1286897248.1742.28.camel@brekeke>
References: <1286398974-12114-1-git-send-email-karl.beldan@gmail.com>
	<1286825063.1742.13.camel@brekeke>
	<AANLkTi=A6djk8hOgLOg045f5XiiwkOYS2QtzOUwiT+Bo@mail.gmail.com>
	<1286893627.2164.65.camel@localhost>
	<AANLkTikghhYSDY=EamGvPpWfc_FqBrBw7Ua6jnO8Xx+q@mail.gmail.com>
	<1286897248.1742.28.camel@brekeke>
Date: Tue, 12 Oct 2010 17:51:38 +0200
Message-ID: <AANLkTimoFbf9Y9q4u32uFi8wvORsS6RFjY2P4MRmRNFZ@mail.gmail.com>
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

On Tue, Oct 12, 2010 at 5:27 PM, Artem Bityutskiy <dedekind1@gmail.com> wro=
te:
> On Tue, 2010-10-12 at 17:11 +0200, Karl Beldan wrote:
>> On Tue, Oct 12, 2010 at 4:27 PM, Artem Bityutskiy <dedekind1@gmail.com> =
wrote:
>> > On Tue, 2010-10-12 at 15:16 +0200, Karl Beldan wrote:
>> >> On Mon, Oct 11, 2010 at 9:24 PM, Artem Bityutskiy <dedekind1@gmail.co=
m> wrote:
>> >> > On Wed, 2010-10-06 at 23:02 +0200, Karl Beldan wrote:
>> >> >> Hi,
>> >> >>
>> >> >> I have been using this tweak for some time now, and I am getting t=
ired of
>> >> >> having to resort to it so often.
>> >> >> It allows to pass such cmdline root as:
>> >> >> =C2=A0"root=3Dmtdb:ubivolx rootfstype=3Dsquashfs"
>> >> >> I am pretty sure many people use squashfs/cramfs filesystems on to=
p of nand,
>> >> >> for example, and I thought that this might initiate discussion.
>> >> >>
>> >> >> --
>> >> >> Karl
>> >> >>
>> >> >> Signed-off-by: Karl Beldan <karl.beldan@gmail.com>
>> >> >> ---
>> >> >> =C2=A0init/do_mounts.c | =C2=A0 15 +++++++++++++--
>> >> >> =C2=A01 files changed, 13 insertions(+), 2 deletions(-)
>> >> >
>> >> > Dunno...
>> >> >
>> >> > First of all, if you have to do this, let it be mtdblock, not mtdb =
- no
>> >> > need to breed aliases.
>> >> >
>> >> > But how about teaching squashfs to understand mtdX and mtd:name syn=
tax
>> >> > instead?
>> >> >
>> >>
>> >> Hi Artem,
>> >>
>> >> I would not do that, squashfs and co just ask for a block device, put=
ting mtdx
>> >> syntax awareness in each of them just does not seem a good fit to me.
>> >
>> > Right. But the same arguments applies to do_mounts.c which you hack:
>> To a far lesser extent, moreover do_mounts has similar hacks in that
>> regard, plus doing
>> this into squashfs you would have to do it everywhere else (e.g cramfs).
>> I just cannot agree, sorry.
>
> No, they are not similar. They are for devices of different type, not
> for _block_ devices. So those are about adding base support for MTD and
> UBI devices.
>
Well, I don't disagree with this one.

> In your case this is about block devices, which are already supported.
> What you do is you say - mtd block devices are very special, they should
> have own hack. Why not scsii block devices or any other types?
>
I am just throwing light on _a_ blatant example of the need of such
name handling.
My pointing you towards https://patchwork.kernel.org/patch/145681/,
which discusses uuids,
is explicit enough to show the pb this tweak addresses goes beyond mtd
block devices.
Said otherwise, pointing to the above patchwork patch was like 'please
don't go ''you are
assuming mtd block devices are very special'', see I checked other
people had similar issues
with different devices'.
Please, assume my pointing to the above patchwork is very
intentionnal, so that you do not
assume an 'a priori' misunderstanding nor mistake what is being discussed.


--=20
Karl
