Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OLzed-0006cq-P0
	for linux-mtd@lists.infradead.org; Tue, 08 Jun 2010 14:19:48 +0000
Subject: Re: UBIFS failed to recover master node
From: Artem Bityutskiy <dedekind1@gmail.com>
To: twebb <taliaferro62@gmail.com>
In-Reply-To: <AANLkTin31PwUfXVHGV89VGrWG89RbIcY1L1I_VEO7mSk@mail.gmail.com>
References: <AANLkTimPxrQzSS_n6CofW8ePwCKuE7sbENJZXUl1Yszl@mail.gmail.com>
	<1274763914.2106.1.camel@localhost>
	<AANLkTin31PwUfXVHGV89VGrWG89RbIcY1L1I_VEO7mSk@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 08 Jun 2010 17:17:28 +0300
Message-ID: <1276006648.5677.20.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Lei Wen <leiwen@marvell.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-06-08 at 09:44 -0400, twebb wrote:
> I've attached a log file that captures the problem I'm seeing.

twebb, you did not enable debugging messages. But it looks like they are
not actually needed. 

>   The
> log includes failures on 2 of 4 UBIFS volumes that are part of a
> single MTD device (and shows the other 2 volumes being
> mounted/umounted without error).
> 
> It appears from the log that the problem is associated with "corrupt
> empty space" which can be seen in the log at lines 28, 313, 347, and
> 359.  Could this be HW ECC failing to correct bit errors on reads?
> Any suggestions on what this problem would be helpful.

Yes, HW fails to correct bit errors. Why these errors are there - this
it the question. May be MLC-related. You need to debug this. Or send me
your board, I can try to take a look

Did you enable UBI extra self checks?


Best Regards,
Artem Bityutskiy (Артём Битюцкий)
