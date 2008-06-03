Date: Tue, 3 Jun 2008 17:57:35 +0100 (BST)
From: Alexey Korolev <akorolev@infradead.org>
To: =?ISO-8859-15?Q?J=F6rn_Engel?= <joern@logfs.org>
Subject: Re: [RFC/PATCH 2/3] NAND multiple plane feature
In-Reply-To: <20080601174841.GH13094@logfs.org>
Message-ID: <alpine.LFD.1.10.0806031754030.32134@pentafluge.infradead.org>
References: <alpine.LFD.1.10.0805281342150.23606@pentafluge.infradead.org>
	<20080601174841.GH13094@logfs.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: dwmw2@infradead.org, tglx@linutronix.de, linux-mtd@lists.infradead.org,
	vasiliy.leonenko@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> Before actually reading the datasheets (just now) I had hoped that
> manufacturers would provide us several independent read/write/erase
> units per chip and allow software to deal with each plane as if it was a
> seperate chip.  _That_ would have been really useful.  And for NOR
> flashes, Intel has already shown how to do it.
>
> But hoping for manufacturers to get it right rarely works - it certainly
> didn't work in this case.  As it seems, we can either program two planes
> in a weird lock-step process or ignore the feature.  And the lock-step
> variant isn't useful for much more than doubling/quadrupling the
> erasesize and writesize.  With all the disadvantages that brings. :(
> 
I don't think that situation with NAND would change. This feature is
standardized (see ONFI). We live in imperfect world where everything has
its drawbacks. I think there should be a lot of people who need to
increase write performance and pay increased size for that and many
people for whom erase and write sizes are critical and they could pay
performance in order to save erase/write size. 

It would be nice to let people choose. Adding support of this
feature will make it possible. I believe that current implementation
might be improved more. So I posted the patch. 

We did some performance testing for this feature: we did not find a test
case where JFFS2 on NAND with dual-plane has lower performance than
JFFS2 on NAND without dual-plane features. (note: subpage read feature
was enabled for both cases)

> Speaking about the disadvantages, if the dual plane feature is
> enabled/disabled across reboots and erase size or write size changes,
> we're in for a lot of fun from the filesystem size.  F.e. JFFS2 will
> experience data loss when erase size isn't stable.
> 
What is the use-case for that? Who will need to manage low level feature
across reboots. I can't remember/image anything similar for the case of
cell phones. 

Thanks,
Alexey

-------
But there, everything has its drawbacks, as the man said when his
mother-in-law died, and they came down upon him for the funeral
expenses. 
Jerome K. Jerome
