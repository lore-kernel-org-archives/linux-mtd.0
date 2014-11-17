Received: from plane.gmane.org ([80.91.229.3])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XqLDO-0003uR-Tf
 for linux-mtd@lists.infradead.org; Mon, 17 Nov 2014 12:15:31 +0000
Received: from list by plane.gmane.org with local (Exim 4.69)
 (envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1XqLCw-0006np-4a
 for linux-mtd@lists.infradead.org; Mon, 17 Nov 2014 13:15:02 +0100
Received: from telemedia-smb-146.18.183.122.airtelbroadband.in
 ([telemedia-smb-146.18.183.122.airtelbroadband.in])
 by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
 id 1AlnuQ-0007hv-00
 for <linux-mtd@lists.infradead.org>; Mon, 17 Nov 2014 13:15:02 +0100
Received: from amrk_ran by telemedia-smb-146.18.183.122.airtelbroadband.in
 with local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
 for <linux-mtd@lists.infradead.org>; Mon, 17 Nov 2014 13:15:02 +0100
To: linux-mtd@lists.infradead.org
From: Ranjith <amrk_ran@yahoo.co.in>
Subject: Re: mtdoops: helper application for readout?
Date: Mon, 17 Nov 2014 11:32:19 +0000 (UTC)
Message-ID: <loom.20141117T122614-112@post.gmane.org>
References: <2131687.FmJCQHlDMX@ws-stein>
 <CAN8TOE-eWhvVF_c48548HeA9OZ4D5Mp0xSLJBz9RsdTYwPRqOg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brian Norris <computersforpeace <at> gmail.com> writes:

> 
> On Thu, Feb 14, 2013 at 3:40 AM, Alexander Stein
> <alexander.stein <at> systec-electronic.com> wrote:
> > is there already some helper application which can shows the stored 
oops/panics with mtdoops?
> 
> After a bit of googling, it looks like there are scattered URL
> references to a no-longer-available "oopslog.c", written by the author
> of mtdoops, Richard Purdie. I CC'd him at his last-known address from
> the git logs, but he doesn't seem to have touched this in a while.
> 
> AFAIK, the output from mtdoops is just plain text data (not
> compressed), so you can just dump it straight from the /dev/mtdX
> (where X is the MTD number) with something like 'cat /dev/mtdX'. Of
> course, that will not account for when the ring buffer wraps around
> nor if there are bad blocks.
> 
> Brian
> 
> P.S. With a little more digging, I found a source tarball in the Maemo
> archives that contains oopslog.c. It's a very simple program, and I
> haven't tested it. Use at your own risk:
> 
> http://maemo.org/packages/view/sp-oops-extract/
> 
> http://repository.maemo.org/pool/maemo5.0/free/s/sp-oops-extract/sp-oops-
extract_0.0.7-1.tar.gz
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 



Hi Brain,
Have you changed anything in the mtdoops.c driver and how are running this 
application ..i have used it as in-build(static driver) module.i dint do any 
changes and i used the application with ./oops /dev/mtd4.here mtd4 id 
FLOG(nor memory).Do i need to map with any command or how.can you tell me 
the procedure for enabling the mtdoops and mapping to Nor flas and how to 
run the application.

Thanks in Advance.

Ranjith.  
> 
