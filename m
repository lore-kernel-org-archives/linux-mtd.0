Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P5glI-00013X-NC
	for linux-mtd@lists.infradead.org; Tue, 12 Oct 2010 15:27:34 +0000
Received: by bwz7 with SMTP id 7so1660089bwz.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 12 Oct 2010 08:27:31 -0700 (PDT)
Subject: Re: [RFC] do_mounts: Allow mtd names for non-flash block filesystems
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Karl Beldan <karl.beldan@gmail.com>
In-Reply-To: <AANLkTikghhYSDY=EamGvPpWfc_FqBrBw7Ua6jnO8Xx+q@mail.gmail.com>
References: <1286398974-12114-1-git-send-email-karl.beldan@gmail.com>
	<1286825063.1742.13.camel@brekeke>
	<AANLkTi=A6djk8hOgLOg045f5XiiwkOYS2QtzOUwiT+Bo@mail.gmail.com>
	<1286893627.2164.65.camel@localhost>
	<AANLkTikghhYSDY=EamGvPpWfc_FqBrBw7Ua6jnO8Xx+q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 12 Oct 2010 18:27:28 +0300
Message-ID: <1286897248.1742.28.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-10-12 at 17:11 +0200, Karl Beldan wrote:
> On Tue, Oct 12, 2010 at 4:27 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > On Tue, 2010-10-12 at 15:16 +0200, Karl Beldan wrote:
> >> On Mon, Oct 11, 2010 at 9:24 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> >> > On Wed, 2010-10-06 at 23:02 +0200, Karl Beldan wrote:
> >> >> Hi,
> >> >>
> >> >> I have been using this tweak for some time now, and I am getting tired of
> >> >> having to resort to it so often.
> >> >> It allows to pass such cmdline root as:
> >> >>  "root=mtdb:ubivolx rootfstype=squashfs"
> >> >> I am pretty sure many people use squashfs/cramfs filesystems on top of nand,
> >> >> for example, and I thought that this might initiate discussion.
> >> >>
> >> >> --
> >> >> Karl
> >> >>
> >> >> Signed-off-by: Karl Beldan <karl.beldan@gmail.com>
> >> >> ---
> >> >>  init/do_mounts.c |   15 +++++++++++++--
> >> >>  1 files changed, 13 insertions(+), 2 deletions(-)
> >> >
> >> > Dunno...
> >> >
> >> > First of all, if you have to do this, let it be mtdblock, not mtdb - no
> >> > need to breed aliases.
> >> >
> >> > But how about teaching squashfs to understand mtdX and mtd:name syntax
> >> > instead?
> >> >
> >>
> >> Hi Artem,
> >>
> >> I would not do that, squashfs and co just ask for a block device, putting mtdx
> >> syntax awareness in each of them just does not seem a good fit to me.
> >
> > Right. But the same arguments applies to do_mounts.c which you hack:
> To a far lesser extent, moreover do_mounts has similar hacks in that
> regard, plus doing
> this into squashfs you would have to do it everywhere else (e.g cramfs).
> I just cannot agree, sorry.

No, they are not similar. They are for devices of different type, not
for _block_ devices. So those are about adding base support for MTD and
UBI devices.

In your case this is about block devices, which are already supported.
What you do is you say - mtd block devices are very special, they should
have own hack. Why not scsii block devices or any other types?

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
