Received: from kynes.gatewest.net ([198.163.227.7])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16ZYwq-0004GY-00
	for <linux-mtd@lists.infradead.org>; Sat, 09 Feb 2002 14:57:52 +0000
Message-ID: <002501c1b17b$80b65010$87657bc8@athlon>
From: "Derek Ross" <dross@iders.ca>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
References: <Pine.LNX.4.44.0202091129030.2394-100000@lapdancer.baythorne.internal>
Subject: Re: Is realtime logging possible?
Date: Sat, 9 Feb 2002 09:07:34 -0600
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

> > We'll be logging about 6 bytes once a second into
> > flash.  The maximum blocking duration for a write
> > should be 0.1 second or less.
>
> You probably don't want to use a filesystem for this - just log to the raw 
> flash, using the mtd chardevice and issuing MEMERASE calls manually when 
> necessary. 

Yes, our logging structure will basically be some circular
buffers, so it will be easy to do that at the lower level.

However, we would still like to use the filesystem
capabilities of the flash during non-"realtime" modes,
like during configuration or initialization.

Is it possible for a filesystem to coexist with 
low-level reading, writing and erasing?  Maybe by
specifying in advance which sectors are forbidden
to the filesystem.

Or is it "never the twain shall meet"?

Derek.
