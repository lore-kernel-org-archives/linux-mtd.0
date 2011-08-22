Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QvanA-0004qS-LH
	for linux-mtd@lists.infradead.org; Mon, 22 Aug 2011 20:08:17 +0000
Received: by wwf10 with SMTP id 10so4015149wwf.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Aug 2011 13:08:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1314002153.2644.69.camel@sauron>
References: <1313625029-19546-1-git-send-email-computersforpeace@gmail.com>
	<1313625029-19546-2-git-send-email-computersforpeace@gmail.com>
	<1314002153.2644.69.camel@sauron>
Date: Mon, 22 Aug 2011 13:08:09 -0700
Message-ID: <CAN8TOE8Ze5kZO9NnX5NsCArTWEX+JbTZf7=3SgO=PpzhjiGG9w@mail.gmail.com>
Subject: Re: [RFC 1/5] mtd: support MTD_MODE_RAW for writing OOB
From: Brian Norris <computersforpeace@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Mike Frysinger <vapier.adi@gmail.com>, Kevin Cernekee <cernekee@gmail.com>,
	b35362@freescale.com, Jim Quinlan <jim2101024@gmail.com>,
	linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	Matthew Creech <mlcreech@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I forgot to CC a contributor on this (and the complementary patch for
"read OOB")

Cc: Jim Quinlan <jim2101024@gmail.com>

On Mon, Aug 22, 2011 at 1:35 AM, Artem Bityutskiy <dedekind1@gmail.com> wro=
te:
> On Wed, 2011-08-17 at 16:50 -0700, Brian Norris wrote:
>> This fixes issues with `nandwrite -n' and the MEMWRITEOOB[64] ioctls.
>
> I guess this patch deserves to be non-RFC? Should it be pushed to
> l2-mtd-2.6.git? Should it even have "Cc: stable@kernel.org [kernel
> version +] ?

I'm not actually sure where this stands (RFC vs. patch) since I really
wanted some outside opinion on the methods used here. I have a feeling
that some of this is only working on my hardware. For instance,
somehow (I'm really not sure how!) `nandwrite -n -o' is working in
nandsim without my fix. Perhaps this is due to a different set of
nand_ecc_ctrl functions (soft ECC vs. HW ECC).

With this patch applied, however, I get some strange kernel oopses
with nandsim. I've identified at least one issue, I think, but I
haven't completely resolved this discrepancy between nandsim and my
driver. See sample commands:

# insmod nandsim.ko
# nandwrite /dev/mtdX <data.bin> -n -o

So for this "fix" (and its coming updates), I would appreciate some
outside testing on other systems, especially before we send this to
stable or even before including it upstream at all.

And any comments on the current status of noecc and MTD_OOB_RAW from
others would be highly valuable to me; a bit of system information and
a "working" or "not working since commit [XXX]" would be a start. In
the meantime, I'm trying to get a hold of a wider variety of test
systems for myself for these kind of issues...

>> - =A0 =A0 ops.mode =3D MTD_OOB_PLACE;
>> + =A0 =A0 ops.mode =3D (mfi->mode =3D=3D MTD_MODE_RAW) ? MTD_OOB_RAW : M=
TD_OOB_PLACE;
>
> Would be really great to document things while you are in it - e.g.,
> putting a little note in include/linux/mtd/mtd.h that MTD_OOB_PLACE is
> the default mode. And of course documenting the modes in this file a bit
> more would be also great. I encourage you to store the wisdom you gain
> in the comments :-)

I'll see what I can do. Probably a task for after the dust settles on
some of the changes I'm working on.

Brian
