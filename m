Received: from blood.actrix.co.nz ([203.96.16.160])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19GQks-0001Yq-S6
	for <linux-mtd@lists.infradead.org>; Thu, 15 May 2003 22:59:15 +0100
From: Charles Manning <manningc2@actrix.gen.nz>
To: tglx@linutronix.de, Earl Manning <emanning@austin.rr.com>,
	linux-mtd@lists.infradead.org
Date: Fri, 16 May 2003 10:01:22 +1200
References: <20030515101003.471557de.emanning@austin.rr.com>
	<200305151848.10479.tglx@linutronix.de>
In-Reply-To: <200305151848.10479.tglx@linutronix.de>
MIME-Version: 1.0
Message-Id: <20030515215930.7E21D4099@blood.actrix.co.nz>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Subject: Re: Generating a NAND Image
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 16 May 2003 04:48, Thomas Gleixner wrote:
> On Thursday 15 May 2003 17:10, Earl Manning wrote:
> > Is there a way to get a complete image off of a NAND part?  I have a
> > partition describing the complete chip, but I need the OOB data inline
> > with the rest of the data.  We need to send the data off to have it
> > pre-burned in the flash chips.
>
> mtd/util/nanddump.c
> The only missing thing there is the userspace supllied ECC function. See
> nandwrite.c for an example. If you don't have it, you will read without ECC
> and you will get tons of kernel warnings.

The one problem with doing it this way is that you end up with the bad blocks 
in your image file too. THis will be a problem when you go to manufacturing 
because the manufacturing writer needs to skip over bad blocks it detects as 
it writes. Your image will then not fit any more and you'd be marking good 
blocks bad.

Rather, IMHO, - if you're using YAFFS-  suck the structure off the NAND onto 
a host (eg. NFS copy the directory structure to the host) and use 
mkyaffsimage. Send them the myyaffsimage output file.  I guess there's a 
JFFSx process to do the same thing.

Alternatively (useful to both YAFFS and JFFS2)  hack nanddump.c to not write 
bad blocks to the dump file. This will definitely work for YAFFS, but I'm not 
100% sure it will work for JFFS2.

... and submit a patch :-).

-- CHarles
