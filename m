Received: from imladris.demon.co.uk ([193.237.130.41] ident=exim)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18e0PM-0007Ya-00
	for <linux-mtd@lists.infradead.org>; Wed, 29 Jan 2003 22:10:12 +0000
Date: Wed, 29 Jan 2003 22:41:07 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: Raphael Hertzog <eng@eipm.ch>
cc: Henrik Nordstrom <hno@marasystems.com>,  <linux-mtd@lists.infradead.org>
In-Reply-To: <1043858542.554.144.camel@localhost>
Message-ID: <Pine.LNX.4.44.0301292238560.4791-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Subject: Re: NFTL not recognizing disk on chip in some cases
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On 29 Jan 2003, Raphael Hertzog wrote:

> Am Mit, 2003-01-29 um 15.48 schrieb Henrik Nordstrom:
> > From what I recall you must not have the NFTL driver loaded while
> > running nftl_format.. if the NTFL driver is loaded then I think bad
> > things may happen such as those you describe.
> 
> Unless the bad things are irreversible this should not be the case.
> AFAIR I always took care to remove the module before formating.
> 
> And it doesn't explain why I have the problem when I copy a set of files
> and why I doesn't have it with another set of files. Even stranger when
> I first copy the good set of files, then umount, remount, remove the
> good set of files and copy the problematic set of files then it's ok.

Does one of your files have 'ANAND' at the start of it (or at an offset of 
n*512 bytes withing the file? :)

That may get seen as an 'extra' NFTL media header sector; we should do 
more sanity checks and refrain from looking inside an already-detected 
NFTL partition.

> But if I copy the problematic set of files directly during the first
> mount after the partitioning/formating then I have the problem exposed
> in my previous mail.

Because in the first case the 'ANAND' went somewhere other than the first 
page of an erase block, so wasn't seen as an 'extra' media header? Taking 
raw dumps of the flash would confirm this.

-- 
dwmw2
