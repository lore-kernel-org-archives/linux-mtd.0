Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P5zJt-0003MO-BT
	for linux-mtd@lists.infradead.org; Wed, 13 Oct 2010 11:16:29 +0000
Received: by iwn36 with SMTP id 36so1002775iwn.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 13 Oct 2010 04:16:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87zkui2xdf.fsf@macbook.be.48ers.dk>
References: <1286398974-12114-1-git-send-email-karl.beldan@gmail.com>
	<1286825063.1742.13.camel@brekeke>
	<AANLkTi=A6djk8hOgLOg045f5XiiwkOYS2QtzOUwiT+Bo@mail.gmail.com>
	<87zkui2xdf.fsf@macbook.be.48ers.dk>
Date: Wed, 13 Oct 2010 13:16:26 +0200
Message-ID: <AANLkTim7eYVNtraU7uv5czh+JP3mKStgd4K_2aXHCfAo@mail.gmail.com>
Subject: Re: [RFC] do_mounts: Allow mtd names for non-flash block filesystems
From: Karl Beldan <karl.beldan@gmail.com>
To: Peter Korsgaard <jacmet@sunsite.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 13, 2010 at 12:35 PM, Peter Korsgaard <jacmet@sunsite.dk> wrote=
:
>>>>>> "Karl" =3D=3D Karl Beldan <karl.beldan@gmail.com> writes:
>
> Hi,
>
> =C2=A0>> But how about teaching squashfs to understand mtdX and mtd:name =
syntax
> =C2=A0>> instead?
>
> =C2=A0Karl> I would not do that, squashfs and co just ask for a block dev=
ice,
> =C2=A0Karl> putting mtdx syntax awareness in each of them just does not s=
eem
> =C2=A0Karl> a good fit to me.
>
> FYI, patches for direct mtd access in squashfs (E.G. for systems not
> needing the block layer at all) were posted a while ago:
>
> http://thread.gmane.org/gmane.linux.kernel/962226/focus=3D968074
>

Hi,

This is interesting work, I saw some time ago that a french company,
Free Electrons, was offering an internship on this very subject.
If squashfs would undergo such changes it could use something like
get_sb_mtd() as jffs2 does and do_mount would require no change to
understand mtd:name, yet the naming scheme would remain not-generic
and the mtd naming scheme would remain in mtd/mtdsuper.



--=20
Karl
