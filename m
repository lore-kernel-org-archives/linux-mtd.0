Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P5frd-0004Jn-5J
	for linux-mtd@lists.infradead.org; Tue, 12 Oct 2010 14:30:01 +0000
Received: by ewy7 with SMTP id 7so946471ewy.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 12 Oct 2010 07:29:58 -0700 (PDT)
Subject: Re: [RFC] do_mounts: Allow mtd names for non-flash block filesystems
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Karl Beldan <karl.beldan@gmail.com>
In-Reply-To: <AANLkTi=A6djk8hOgLOg045f5XiiwkOYS2QtzOUwiT+Bo@mail.gmail.com>
References: <1286398974-12114-1-git-send-email-karl.beldan@gmail.com>
	<1286825063.1742.13.camel@brekeke>
	<AANLkTi=A6djk8hOgLOg045f5XiiwkOYS2QtzOUwiT+Bo@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 12 Oct 2010 17:27:07 +0300
Message-ID: <1286893627.2164.65.camel@localhost>
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

On Tue, 2010-10-12 at 15:16 +0200, Karl Beldan wrote:
> On Mon, Oct 11, 2010 at 9:24 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > On Wed, 2010-10-06 at 23:02 +0200, Karl Beldan wrote:
> >> Hi,
> >>
> >> I have been using this tweak for some time now, and I am getting tired of
> >> having to resort to it so often.
> >> It allows to pass such cmdline root as:
> >>  "root=mtdb:ubivolx rootfstype=squashfs"
> >> I am pretty sure many people use squashfs/cramfs filesystems on top of nand,
> >> for example, and I thought that this might initiate discussion.
> >>
> >> --
> >> Karl
> >>
> >> Signed-off-by: Karl Beldan <karl.beldan@gmail.com>
> >> ---
> >>  init/do_mounts.c |   15 +++++++++++++--
> >>  1 files changed, 13 insertions(+), 2 deletions(-)
> >
> > Dunno...
> >
> > First of all, if you have to do this, let it be mtdblock, not mtdb - no
> > need to breed aliases.
> >
> > But how about teaching squashfs to understand mtdX and mtd:name syntax
> > instead?
> >
> 
> Hi Artem,
> 
> I would not do that, squashfs and co just ask for a block device, putting mtdx
> syntax awareness in each of them just does not seem a good fit to me.

Right. But the same arguments applies to do_mounts.c which you hack:
mtdblock is just a block device, putting awareness of specific types of
block devices is not a good thing to do.

May be this is why I'm not too happy about your patch?

> BTW 'for-2.6.37' got https://patchwork.kernel.org/patch/145681/.

Yeah, it is better to have a generic approach which can be applied to
all block devices. Make UUID of your mtdblock to be equivalent to the
name of the underlying mtd device and you are done: use
PARTUUID=<mtd_device_name>. Right?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
