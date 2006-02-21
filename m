Received: from cloudburst.actrix.co.nz ([203.96.16.181])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FBLxn-0004Wz-LK
	for linux-mtd@lists.infradead.org; Mon, 20 Feb 2006 20:05:16 -0500
From: Charles Manning <manningc2@actrix.gen.nz>
To: tglx@linutronix.de
Date: Tue, 21 Feb 2006 14:08:05 +1300
References: <43EB96DC.3030900@eptar.com>
	<200602211140.30069.manningc2@actrix.gen.nz>
	<1140477524.2480.827.camel@localhost.localdomain>
In-Reply-To: <1140477524.2480.827.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200602211408.05208.manningc2@actrix.gen.nz>
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, yaffs@stoneboat.aleph1.co.uk
Subject: Re: [Yaffs] bit error rates --> YAFFS for devices with no OOB
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 21 February 2006 12:18, Thomas Gleixner wrote:

>
> > Perhaps opening up YAFFS to those people would be valuable. Would you
> > like to see YAFFS run on your non-oob board?
>
> At least for a test.

OK, I'll start investigating an OOB-less YAFFS and give that a priority 
depending on the amount of interest. Hint to everyone: If this sounds 
interesting, respond (on or off list), especially if you'd like to be 
involved in some way.

I think a final solution that exploits OOB if it is available but will work if 
OOB is not available would be best. That way:
1) People could use YAFFS on a wider variety of flash types (inc OneNAND etc) 
without using OOB.
2) If you have OOB, and drivers set up to use it, and wish to use it, then you 
will likely get some performance gains due to page alignment etc.

-- CHarles
