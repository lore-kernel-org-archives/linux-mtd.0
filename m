Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QHDyv-000737-Qb
	for linux-mtd@lists.infradead.org; Tue, 03 May 2011 11:41:34 +0000
Received: by eyh6 with SMTP id 6so2277312eyh.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 03 May 2011 04:41:31 -0700 (PDT)
Subject: Re: Programming ubinized images
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Matthew L. Creech" <mlcreech@gmail.com>
In-Reply-To: <BANLkTimaW4hu6QrPEyMcCVWDzHd+5hVo+A@mail.gmail.com>
References: <BANLkTi=CNSd8JrWPL-o-WHe-kS-L7pFNqg@mail.gmail.com>
	<1303804811.2778.37.camel@localhost>
	<BANLkTimaW4hu6QrPEyMcCVWDzHd+5hVo+A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 03 May 2011 14:37:44 +0300
Message-ID: <1304422664.2737.102.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: bengardiner@nanometrics.ca, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-05-03 at 02:43 -0400, Matthew L. Creech wrote:
> On Tue, Apr 26, 2011 at 4:00 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> >
> > We could teach the UBIFS tools and the kernel to deal with these things.
> > It is possible to do with a special flag in the UBIFS superblock which
> > would say - this FS has been just flashed, do not use space in
> > half-filled eraseblocks! Then probably we could go through these
> > half-filled eraseblocks and fix them up, and then remove that flag.
> >
> 
> Hi Artem, could you take a look at this patch when you get a chance?
> 
> My method for finding & cleaning the in-use LEBs is hacky: I just loop
> through all the LEBs in the FS, look up each one in the LPT, and
> "recover" anything not flagged as empty.  I *think* that should result
> in LEBs that have trailing empty space (SCANNED_EMPTY_SPACE) being
> re-mapped to a new PEB (via fix_unclean_leb()), which would clean up
> the empty pages.  So far I haven't gotten that condition to trigger
> with a real UBIFS image, so I'm not sure if it works correctly yet.
> 
> I may be way off on the wrong track though, so I just wanted to see if
> you think this seems like a reasonable way of doing it.  Thanks!

Hi, very very quick comment. First of all, it should be a flag in the
superblock. Can you make a separate patch which just introduces this
flag there?

But yes, something like you've done: once LPT is initialized, you should
look at the flag and if it is set, indeed do something like you have
done - walk all lebs, get lprops decription, and then you see if there
is any free space. If there is not - do not touch it. If there is free
space, then fixup it.

The recovery function will work, but it dos much more than needed, and
it prints various messages which we do not want. Make a separate
function for fix-up in sb.c. It is easy - you simply read c->leb_size -
lp->free, and then you use ubi_leb_change() and change the contents of
the LEB in-place atomically.

And after the fix-up you need to clean the flag in the SB.

Just make a nice series of patches :-)


-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
