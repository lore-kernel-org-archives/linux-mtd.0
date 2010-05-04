Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O9J1y-00045K-1k
	for linux-mtd@lists.infradead.org; Tue, 04 May 2010 14:23:27 +0000
Subject: Re: UBIFS and MLC NAND Flash
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Pedro I. Sanchez" <psanchez@fosstel.com>
In-Reply-To: <4BDEE226.80205@fosstel.com>
References: <4BA7A183.7040206@fosstel.com>
	<1270714961.6754.107.camel@localhost>
	<i2odbdb2ea61004191457s58e5b816i1efdf694a1e2a24@mail.gmail.com>
	<4BCCECC7.8000006@fosstel.com>  <4BDEE226.80205@fosstel.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 04 May 2010 17:17:07 +0300
Message-ID: <1272982627.3702.15.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: twebb <taliaferro62@gmail.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-05-03 at 10:48 -0400, Pedro I. Sanchez wrote:
> Pedro I. Sanchez wrote:
> > twebb wrote:
> >>>> 2. I have several boards with MLC NAND flash running the Linux kernel
> >>>> 2.6.29 and UBIFS. I am seeing a fairly large rate of file "corruption"
> >>>> errors, files that all of a sudden become unreadable. Curiously enough,
> >>>> they have been read-only files in all cases, program executables and
> >>>> shared libraries.
> >>> Hmm. Do you do unclean power cuts?
> >>>
> >>>> Would upgrading to a more recent kernel, or back porting the latest
> >>>> UBIFS code, help? Shall I expect better support for MLC NAND flash in
> >>>> the latest UBIFS code?
> >>> You did not specify whether you pulled the ubifs-v2.6.29.git tree. If
> >>> you did this, then your UBI/UBIFS should be the same as in the latest
> >>> kernels. Please, do this, although this will probably not solve your
> >>> corruption problems, but you'll have other bug-fixes we have made since
> >>> 2.6.29 times.
> >>>
> >>>
> >>
> >> Pedro,
> >> I'm seeing very similar issues with MLC+UBIFS, though not only with
> >> read-only files.  Have you made any progress in your investigation or
> >> while trying Artem's suggestions?  I'm about to start digging into
> >> this and would be interested to hear about any issues you may have
> >> come across.  Do you have any opinion on whether this "corruption" is
> >> related to the information posted on the linux-mtd site at...
> >> http://www.linux-mtd.infradead.org/faq/ubifs.html#L_ubifs_mlc ?
> >>
> >> A few notes:
> >> - I do occasionally have power cuts, but my understanding was that
> >> UBI/UBIFS was very tolerant of that condition.
> >> - I use CONFIG_MTD_UBI_WL_THRESHOLD=256
> >> - I'm using linux-2.6.29
> >>
> >> Thanks,
> >> twebb
> > 
> > I haven't had the opportunity to use 2.6.29 with the ubifs backport yet. 
> > However, I run my devices over an extended operational test and couldn't 
> > reproduce the errors. In this test I avoided any power cuts on purpose 
> > because I wanted to verify that the boards' software was not at fault 
> > during normal conditions.
> > 
> > I still see the errors in the deployed boards and these ones are subject 
> > to random power cuts. After analyzing the logs I conclude that there is 
> > a strong correlation between the power cuts and the corruption errors. 
> > The typical scenario is a board running fine for two months without 
> > interruption, then a power cut, and then upon reboot a myriad of UBIFS 
> > error messages show up (see sample following my signature)
> > 
> > I'm almost convinced now that power cuts are the culprit. I will be 
> > conducting test in the next few days to fully verify this. I'll post my 
> > results.
> > 
> > Thanks,
> > 
> My tests are done. I arrived to the following conclusions:
> 
> 1. All errors, zero-size files and random corruption, are related to 
> power outages.

Well, on SLC we did huge amount of power-cut tests and were always able
to mount the FS. Zero-files and zeroes in files are possible, and this
is described here:

http://www.linux-mtd.infradead.org/faq/ubifs.html#L_empty_file
http://www.linux-mtd.infradead.org/faq/ubifs.html#L_end_hole

Not sure what you mean by random corruption, but this is probably
something which should not happen. But a better description would be
interesting.

Anyway, if you have problems, they are probably MLC-specific, and of
course it would be nice if someone with the real HW would investigate
and fix them...

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
