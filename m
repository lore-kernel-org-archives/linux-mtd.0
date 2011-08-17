Received: from mail-iy0-f171.google.com ([209.85.210.171])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QtbWC-0000aC-Ad
	for linux-mtd@lists.infradead.org; Wed, 17 Aug 2011 08:30:33 +0000
Received: by iyf13 with SMTP id 13so1504713iyf.16
	for <linux-mtd@lists.infradead.org>;
	Wed, 17 Aug 2011 01:30:28 -0700 (PDT)
Subject: Re: [PATCH 1/3] mtd_debug: report ecc layout
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Wed, 17 Aug 2011 11:32:10 +0300
In-Reply-To: <CAN8TOE-H9f9=DtamWPHTLbCJQBnGpeOJDtcXo18nkdC-d8WB7A@mail.gmail.com>
References: <cover.1312922073.git.bengardiner@nanometrics.ca>
	<e51a260aa56112648b5413c66d4036e489ae09f7.1312922073.git.bengardiner@nanometrics.ca>
	<CAN8TOE-H9f9=DtamWPHTLbCJQBnGpeOJDtcXo18nkdC-d8WB7A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1313569934.20534.3.camel@sauron>
Mime-Version: 1.0
Cc: Ben Gardiner <bengardiner@nanometrics.ca>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-08-10 at 10:07 -0700, Brian Norris wrote:
> On Tue, Aug 9, 2011 at 1:57 PM, Ben Gardiner <bengardiner@nanometrics.ca> wrote:
> > Add the ECC size and OOB available to that list. The other entries in the
> > ecclayout struct are arrays and are not as meaningful as eccsize and oobavail.
> > ---
> > I noticed that the struct nand_ecclayout_user and its corresponding ioctl
> > has been marked deprecated; however, since this is a 'debug' utility and at
> > least one person found it useful I thought it would be a good idea to propose
> > these changes anyways.
> 
> While I agree with your rationale for ignoring the deprecation (it's
> OK for a debug utility), users of this feature should be warned that
> struct nand_ecclayout_user will not report all information if there
> are more ECC entries than "MTD_MAX_ECCPOS_ENTRIES" (i.e., 64). It will
> simply truncate ECC at 64. This may be a problem for large page flash
> with large ECC regions. It's a similar story for "oobavail" as well.
> 
> And before the question is asked, I'm not sure how to implement my
> suggestion that "users of this feature should be warned". Perhaps just
> a comment in the code?

I guess we can do the following:

1. make sure mtd-utils does not use the depricated ioctl
2. release such mtd-utils
3. change the kernel and add a warning printk there
4. wait some time and kill the ioctl from the kernel.

-- 
Best Regards,
Artem Bityutskiy
