Received: from [81.3.11.18] (helo=mail.ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D2B7M-0001eC-PE
	for linux-mtd@lists.infradead.org; Fri, 18 Feb 2005 11:36:37 -0500
Date: Fri, 18 Feb 2005 17:36:37 +0100
From: Konstantin Kletschke <lists@ku-gbr.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20050218163636.GD5926@synertronixx3>
References: <20050218154216.GA5926@synertronixx3>
	<20050218154853.GB5926@synertronixx3>
	<1108742958.24721.295.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1108742958.24721.295.camel@tglx.tec.linutronix.de>
Subject: Re: freeze when mounting fs
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 2005-02-18 17:09 +0100 schrieb Thomas Gleixner:
> On Fri, 2005-02-18 at 16:48 +0100, Konstantin Kletschke wrote:
> 
> > CONFIG_JFFS2_FS_DEBUG=2
> 
> Please use level 1
> 
> > And when mounting functional rootfs it speaks a lot, but:
> 
> What happens when you mount the non-functional one ? Can you please

Nothing.

> provide logs via serial console. klogd does not work for logging of that
> stuff.

Even with level 3 _nothing_ happens.

> > Rootfs is at http://ludenkalle.de/mtd/52
> 
> The image is clean. There is no problem to see.
> 
> It would be interesting to have a binary image after you programmed it
> to FLASH. cat /dev/mtdX >flash.img

I will try what I can do or reproduce it later, I am sure my device
table triggered a bug or some sort of that:

I removed 3 lines mungling up some access permissions of subdirectories
under /home and now the image gets mounted.
I am fighting with svn ATM to get the actual change...

Konsti

-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
