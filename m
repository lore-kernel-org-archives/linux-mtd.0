Received: from 212.68.198.130.brutele.be ([212.68.198.130] helo=mail.boat.be)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17zyzQ-0005nc-00
	for <linux-mtd@lists.infradead.org>; Fri, 11 Oct 2002 13:34:00 +0100
Subject: Re: DoC trouble on wafer PC
From: Robert Sprockeels <robert.sprockeels@boat.be>
To: Mark Meade <mark@lakeshoremicro.com>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <20021011121330.SMCL11063.rwcrmhc52.attbi.com@there>
References: <1034333338.2619.81.camel@roadie.boat.be>
	<20021011121330.SMCL11063.rwcrmhc52.attbi.com@there>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 11 Oct 2002 14:33:59 +0200
Message-Id: <1034339639.2401.99.camel@roadie.boat.be>
Mime-Version: 1.0
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

On Fri, 2002-10-11 at 14:12, Mark Meade wrote:
> The /dev/nftla entries in Bering rc3 are not correct.  Try changing them to 
> 93, x:
> 
> brw-rw----    1 root     root      93,   0  Jan 24  2002 nftla
> brw-rw----    1 root     root      93,   1  Jan 24  2002 nftla1
> brw-rw----    1 root     root      93,   2  Jan 24  2002 nftla2
> brw-rw----    1 root     root      93,   3  Jan 24  2002 nftla3

Thanks, Mark that did it! I could have searched a long time.

sfdisk now reports
/dev/nftla1  *  0+  997  998-  15967  4  DOS 16-bit FAT <32M


Thanks for your help!

What would you recommed as filesystem on a DoC? LEAF uses msdos FAT...

Robert
