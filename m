Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UbnrQ-00076v-7B
 for linux-mtd@lists.infradead.org; Mon, 13 May 2013 08:11:56 +0000
Message-ID: <1368432848.5360.32.camel@sauron.fi.intel.com>
Subject: Re: [PATCH [mtd-utils] 3/3] mkfs.ubifs: allow reformatting of devices
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
Date: Mon, 13 May 2013 11:14:08 +0300
In-Reply-To: <201305101126.01644.vapier@gentoo.org>
References: <1368030446-343-1-git-send-email-vapier@gentoo.org>
 <1368030446-343-3-git-send-email-vapier@gentoo.org>
 <alpine.DEB.2.00.1305100902410.22700@lnxricardw.se.axis.com>
 <201305101126.01644.vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ricard Wanderlof <ricard.wanderlof@axis.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2013-05-10 at 11:26 -0400, Mike Frysinger wrote:
> On Friday 10 May 2013 03:07:53 Ricard Wanderlof wrote:
> > On Wed, 8 May 2013, Mike Frysinger wrote:
> > > Sometimes I want to re-initialize an existing ubifs, but the tool
> > > currently bails out if the volume is already formatted.  Prompt the
> > > user instead so they can decide.
> > > 
> > >     {"max-leb-cnt",        1, NULL, 'c'},
> > >     {"output",             1, NULL, 'o'},
> > >     {"devtable",           1, NULL, 'D'},
> > > +   {"yes",                0, NULL, 'y'},
> > >     {"help",               0, NULL, 'h'},
> > >     {"verbose",            0, NULL, 'v'},
> > >     {"version",            0, NULL, 'V'},
> > > 
> > > @@ -191,6 +193,7 @@ static const char *helptext =
> > > "-U, --squash-uids        squash owners making all files owned by root\n"
> > > "-l, --log-lebs=COUNT     count of erase blocks for the log (used only
> > > for\n" "                         debugging)\n"
> > > +"-y, --yes                assume the answer is \"yes\" for all
> > > questions\n" ...
> > 
> > Wouldn't it be better to have a specific option for this specific case,
> > rather than a general yes-to-everything option?
> 
> this is the standard that the various mtd tools (including a bunch of UBI 
> ones) follow
> 
> > The latter makes sense
> > with programs such as fsck where the only prompt basically is 'I found a
> > fault, shall I fix it?', but in this is case it can be difficult to
> > predict the outcome should the option start to cover more potential
> > questions in the future.
> 
> if you want to compare to standard tools, then the check would be dropped 
> entirely.  when i run `mke2fs /dev/sda1`, it doesn't prompt me.

I admit I was not careful enough with the options. Feel free to change
the tools in the more direction of being more consistent with mainstream
filesystems' tools. 

-- 
Best Regards,
Artem Bityutskiy
