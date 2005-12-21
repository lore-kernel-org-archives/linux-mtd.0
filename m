Received: from 66.239.25.20.ptr.us.xo.net ([66.239.25.20] helo=zoot.lnxi.com)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1Eosy6-0006UI-H2
	for linux-mtd@lists.infradead.org; Tue, 20 Dec 2005 20:40:42 -0500
To: Dave Peterson <dsp@llnl.gov>
References: <200512201642.05224.dsp@llnl.gov>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: Tue, 20 Dec 2005 18:40:13 -0700
In-Reply-To: <200512201642.05224.dsp@llnl.gov> (Dave Peterson's message of
	"Tue, 20 Dec 2005 16:42:05 -0800")
Message-ID: <m3vexjqlc2.fsf@maxwell.lnxi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-mtd@lists.infradead.org
Subject: Re: ichxrom driver question
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dave Peterson <dsp@llnl.gov> writes:

> I attempted to flash the BIOS on a machine with an Intel 82801CA
> (ICH3-S) I/O Controller Hub as follows:
>
>     # modprobe ichxrom
>     # modprobe mtdchar
>     # mtd_unlock /dev/mtd0
>     # mtd_eraseall /dev/mtd0
>     Erased 512 Kibyte @ 0 -- 100% complete.
>     # dd if=bios_image of=/dev/mtd0
>     1024+0 records in
>     1024+0 records out
>     # dd if=/dev/mtd0 of=result
>     1024+0 records in
>     1024+0 records out
>     # mtd_lock /dev/mtd0 0 -1
>
> After doing the above, I examind the file 'result' and all it
> contains is a bunch of zero bytes.  Thus the BIOS flashing operation
> appears to have failed (I confirmed this by attempting to reboot, and
> sure enough, the BIOS appears to have been wiped out).

Hmm. Immediately after the erase operation you should see all f's.

The only thing I can think of that might trigger what you are seeing
is a cached flash chip.

> I did this using the version of the ichxrom driver from the 2.6.9
> kernel.  Looking briefly at this code in comparison to a more recent
> version of the code from the 2.6.14.4 kernel, it looks like
> substantial changes have been made.

I honestly don't recall.  I don't have a good handle on when
changes were made versus when they were merged.

> So my question is, are there known problems with the version of the
> ichxrom driver in the 2.6.9 kernel, and if so, have the problems
> been fixed in later kernels?

The biggest practical changes was to allow it to work with other than
intel flash parts.  That required removing some hacks.  But I don't
know of any cases where things half worked.

> Also, are there any known issues with
> the ICH3-S that may explain the behavior I observe?  When replying,
> please cc dsp@llnl.gov.

The ICH3-S is more of a conduit.  The usual questions are:

Is there motherboard specific magic that denies writes?
What is the actual flash chip you are flashing.

Except for the possibility of bad cache I can't think of anything
that would cause the wrong data to be written.  Are you certain
you have a good flash image?

Eric
