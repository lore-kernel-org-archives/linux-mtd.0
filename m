Received: from plane.gmane.org ([80.91.229.3])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SDHbG-00044Q-Lv
 for linux-mtd@lists.infradead.org; Thu, 29 Mar 2012 15:49:23 +0000
Received: from list by plane.gmane.org with local (Exim 4.69)
 (envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1SDHb3-000069-3G
 for linux-mtd@lists.infradead.org; Thu, 29 Mar 2012 17:49:09 +0200
Received: from 212.177.102.37 ([212.177.102.37])
 by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
 id 1AlnuQ-0007hv-00
 for <linux-mtd@lists.infradead.org>; Thu, 29 Mar 2012 17:49:09 +0200
Received: from matteo.mattei by 212.177.102.37 with local (Gmexim 0.1 (Debian))
 id 1AlnuQ-0007hv-00
 for <linux-mtd@lists.infradead.org>; Thu, 29 Mar 2012 17:49:09 +0200
To: linux-mtd@lists.infradead.org
From: Matteo Mattei <matteo.mattei@gmail.com>
Subject: Re: UBI/UBIFS issue: corrupt empty space => switched to read-only mode
Date: Thu, 29 Mar 2012 15:48:56 +0000 (UTC)
Message-ID: <loom.20120329T173823-262@post.gmane.org>
References: <CAHea38St440q-T+FawSic=brdv-dHb7H7yXh0Unq028Op75zuQ@mail.gmail.com>
 <1332239983.11468.14.camel@sauron.fi.intel.com>
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

Artem Bityutskiy <dedekind1 <at> gmail.com> writes:

> 
> On Fri, 2012-03-16 at 17:14 +0100, Matteo Mattei wrote:
> > Hi guys,
> > 
> > I am working hard on UBIFS to make it works on 2.6.32 and OMAP3530.
> > 
> > I already posted some requests to TI forum but I have no answers up to now:
> > http://e2e.ti.com/support/embedded/linux/f/354/t/171839.aspx#627875
> 
> Well, this error was reported several times. AFAIR, there are 2 possible
> causes for this.
> 
> 1. Your driver does not protect the empty space. Normally the driver
> corrects bit-flips using ECC, but some systems do not do this for empty
> space, i.e., for the flash regions which have been erased but have never
> been written. UBIFS expects to see all 0xFFs there, and if it doesn't,
> it reports about corrupt empty space.
> 
> You can fix this by fixing the driver, at least this is what people seem
> to do. If this is impossible to fix, you can teach UBIFS to tolerate
> bit-flips in the empty space.
> 
> 2. More difficult issue which no one still dares to start fixing is the
> unstable bits issue. I do not have time to work on this, so I offer
> everyone assistance, but no on so far started working on this, AFAIK.
> Here is the description of the issue:
> 
> http://www.linux-mtd.infradead.org/doc/ubifs.html#L_unstable_bits
> 
> HTH.
> 

Hi Aartem,
I have some updates (also a BCH fix) as reported here:
http://e2e.ti.com/support/embedded/linux/f/354/t/171839.aspx

Anyway the read-only mounting persists.
I have errors also at run time (without power cuts) simply performing very 
frequent and stressful reading/writing operations (using dd and md5sum with 8 
parallel processes).

At this point I am wondering:
1- Is possibile that the "unstable bits" issue happens also during run-time 
simply reading and writing?
2- How can I do to tolerate bit-flips in the empty space?

This is the output of dmesg during heavy reading/writing operations (as 
described above):

UBIFS error (pid 2289): ubifs_scanned_corruption: corruption at LEB 6182:126342
00000000: fffffffd ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff 
ffffffff  ................................
00000020: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff 
ffffffff  ................................
00000040: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff 
ffffffff  ................................
00000060: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff 
ffffffff  ................................
00000080: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff 
ffffffff  ................................
000000a0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff 
ffffffff  ................................
000000c0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff 
ffffffff  ................................
000000e0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff 
ffffffff  ................................
00000100: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff 
ffffffff  ................................
00000120: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff 
ffffffff  ................................
00000140: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff 
ffffffff  ................................
00000160: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff 
ffffffff  ................................
00000180: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff 
ffffffff  ................................
000001a0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff 
ffffffff  ................................
000001c0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff 
ffffffff  ................................
000001e0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff 
ffffffff  ................................
00000200: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff 
ffffffff  ................................
00000220: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff 
ffffffff  ................................
00000240: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff 
ffffffff  ................................
00000260: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff 
ff ff ff                    ..........................
UBIFS error (pid 2289): ubifs_scan: LEB 6182 scanning failed
UBIFS warning (pid 2289): ubifs_ro_mode: switched to read-only mode, error -117
UBIFS error (pid 2289): make_reservation: cannot reserve 4144 bytes in jhead 2, 
error -117
UBIFS error (pid 2289): do_writepage: cannot write page 1392 of inode 17869, 
error -117


As you can see we read fffffffd instead of ffffffff.

Thanks for your time.

Matteo
