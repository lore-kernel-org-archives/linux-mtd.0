Received: from mail-gy0-f177.google.com ([209.85.160.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QvisI-0001QG-1b
	for linux-mtd@lists.infradead.org; Tue, 23 Aug 2011 04:46:07 +0000
Received: by gyh20 with SMTP id 20so5054166gyh.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Aug 2011 21:46:03 -0700 (PDT)
Subject: Re: [RFC 1/5] mtd: support MTD_MODE_RAW for writing OOB
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Tue, 23 Aug 2011 07:47:49 +0300
In-Reply-To: <CAN8TOE8Ze5kZO9NnX5NsCArTWEX+JbTZf7=3SgO=PpzhjiGG9w@mail.gmail.com>
References: <1313625029-19546-1-git-send-email-computersforpeace@gmail.com>
	<1313625029-19546-2-git-send-email-computersforpeace@gmail.com>
	<1314002153.2644.69.camel@sauron>
	<CAN8TOE8Ze5kZO9NnX5NsCArTWEX+JbTZf7=3SgO=PpzhjiGG9w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1314074876.2645.7.camel@sauron>
Mime-Version: 1.0
Cc: Mike Frysinger <vapier.adi@gmail.com>, Kevin Cernekee <cernekee@gmail.com>,
	b35362@freescale.com, Jim Quinlan <jim2101024@gmail.com>,
	linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	Matthew Creech <mlcreech@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-08-22 at 13:08 -0700, Brian Norris wrote:
> I forgot to CC a contributor on this (and the complementary patch for
> "read OOB")
> 
> Cc: Jim Quinlan <jim2101024@gmail.com>
> 
> On Mon, Aug 22, 2011 at 1:35 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > On Wed, 2011-08-17 at 16:50 -0700, Brian Norris wrote:
> >> This fixes issues with `nandwrite -n' and the MEMWRITEOOB[64] ioctls.
> >
> > I guess this patch deserves to be non-RFC? Should it be pushed to
> > l2-mtd-2.6.git? Should it even have "Cc: stable@kernel.org [kernel
> > version +] ?
> 
> I'm not actually sure where this stands (RFC vs. patch) since I really
> wanted some outside opinion on the methods used here. I have a feeling
> that some of this is only working on my hardware. For instance,
> somehow (I'm really not sure how!) `nandwrite -n -o' is working in
> nandsim without my fix. Perhaps this is due to a different set of
> nand_ecc_ctrl functions (soft ECC vs. HW ECC).

May be one of the reasons is that nandsim just _copies_ data to the
internal RAM buffer, instead of doing binary "&", so you can re-write in
some cases, but not sure.

> With this patch applied, however, I get some strange kernel oopses
> with nandsim. I've identified at least one issue, I think, but I
> haven't completely resolved this discrepancy between nandsim and my
> driver. See sample commands:
> 
> # insmod nandsim.ko
> # nandwrite /dev/mtdX <data.bin> -n -o
> 
> So for this "fix" (and its coming updates), I would appreciate some
> outside testing on other systems, especially before we send this to
> stable or even before including it upstream at all.
> 
> And any comments on the current status of noecc and MTD_OOB_RAW from
> others would be highly valuable to me; a bit of system information and
> a "working" or "not working since commit [XXX]" would be a start. In
> the meantime, I'm trying to get a hold of a wider variety of test
> systems for myself for these kind of issues...

Yes, would be great to have more people to test. I always encourage
people to look at patches _before_ they get in and break their systems,
not afterwards. But even if nobody cares, we can merge your stuff after
you gave it some more testing - absence of caring people should not stop
the progress in MTD :-) 

-- 
Best Regards,
Artem Bityutskiy
