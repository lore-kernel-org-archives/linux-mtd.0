Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19GQv1-0001fP-TV
	for <linux-mtd@lists.infradead.org>; Thu, 15 May 2003 23:09:43 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
	21 2002)) with SMTP id <0HEY00H7Y87W6G@smtp-out.bhp.t-online.de> for
	linux-mtd@lists.infradead.org; Fri, 16 May 2003 00:09:33 +0200 (MEST)
Date: Fri, 16 May 2003 01:08:42 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <20030515215930.7E21D4099@blood.actrix.co.nz>
To: manningc2@actrix.gen.nz, Earl Manning <emanning@austin.rr.com>,
 linux-mtd@lists.infradead.org
Message-id: <200305160108.42152.tglx@linutronix.de>
MIME-version: 1.0
Content-disposition: inline
References: <20030515101003.471557de.emanning@austin.rr.com>
 <200305151848.10479.tglx@linutronix.de>
 <20030515215930.7E21D4099@blood.actrix.co.nz>
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
Subject: Re: Generating a NAND Image
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 16 May 2003 00:01, Charles Manning wrote:
> The one problem with doing it this way is that you end up with the bad
> blocks in your image file too. THis will be a problem when you go to
> manufacturing because the manufacturing writer needs to skip over bad
> blocks it detects as it writes. Your image will then not fit any more and
> you'd be marking good blocks bad.
True. Did not htink about that.

> Rather, IMHO, - if you're using YAFFS-  suck the structure off the NAND
> onto a host (eg. NFS copy the directory structure to the host) and use
> mkyaffsimage. Send them the myyaffsimage output file.  I guess there's a
> JFFSx process to do the same thing.
There's no OOB generator yet, but that's a good idea for volunteers :)

> Alternatively (useful to both YAFFS and JFFS2)  hack nanddump.c to not
> write bad blocks to the dump file. This will definitely work for YAFFS, but
> I'm not 100% sure it will work for JFFS2.
Sure, why not. JFFS2 does not rely on bad blocks. :)

> ... and submit a patch :-).
:)

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
