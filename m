Received: from mail3.cadvision.com ([207.228.64.48])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15f1HP-0004y7-00
	for <linux-mtd@lists.infradead.org>; Thu, 06 Sep 2001 16:41:23 +0100
Received: from grosmorne.wirelessnetworksinc.com (h-207-228-117-70.gen.cadvision.com [207.228.117.70])
	by mail3.cadvision.com (8.9.3/8.9.3/CWT/DCE) with SMTP id JAA29618
	for <linux-mtd@lists.infradead.org>; Thu, 6 Sep 2001 09:47:24 -0600
From: Herman Oosthuysen <herman@wirelessnetworksinc.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: DiskOnChip write performance
Date: Thu, 6 Sep 2001 09:45:34 -0600
Content-Type: text/plain
References: <Pine.LNX.4.33.0109061600490.9437-100000@hex.linuxgrrls.org>
In-Reply-To: <Pine.LNX.4.33.0109061600490.9437-100000@hex.linuxgrrls.org>
MIME-Version: 1.0
Message-Id: <01090609533800.00800@grosmorne.wirelessnetworksinc.com>
Content-Transfer-Encoding: 8bit
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

Hmm, now that wasn't very helpful was it?

Bear in mind that salesmen like to quote the fastest numbers they can get,
which for this type of system would be writing to a freshly formatted, empty
disk.  This speed would be very different from the sustained rate writing to a
disk that needs some recovery/erase functions to be performed.

The erase time of flash chips vary wildly from chip to chip, even in the same
batch of chips.  Some chips may erase in 3 seconds, others in 15 seconds.   The
write time to the chip will likewise vary, but is many orders of magnitude
faster than the erase cycle, so that is not really a factor.  There is nothing
you can do about it, except to ensure that your DOC is clean before you start
writing a whole lot of data to it.

You may be able to speed the system up a little by optimizing the code, but the
improvement will be insignificant compared to the erase cycle time.

Cheers,

Herman
http://www.AerospaceSoftware.com


On Thu, 06 Sep 2001, kira brown wrote:
> On Thu, 6 Sep 2001, Holger Friedrich wrote:
> 
> > achieve this. Unfortunately the fastest speed I could obtain was about
> > 70 kBytes/sec which seems pretty poor to me. When I asked the M-Systems
> > support the answers were not really helpfull so far.
> 
> The M-Systems drivers are not the topic of this mailing list.
> 
> Neither, for that matter, are the M-systems BIOS extensions, or the
> patched LILO they supply.
> 
> The topic of this list is the Linux MTD layer.  The Linux MTD layer is
> *not* written by M-Systems, it is not supplied by them, and their support
> staff do not know anything about it.  THe Linux MTD layer does *not* use
> the M-systems BIOS extender, the M-systems binary-only linux kernel
> driver, or any M-systems code of any other kind.  The M-Systems firmware
> has precisely zero to do with this list, the Linux MTD system, or the
> JFFS.
> 
> Is that understood?  pradeep, this means *you*.
> 
> (Sorry David, I had to say it.)
> 
> kira.
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
-- 
Herman Oosthuysen
E-mail: Herman@WirelessNetworksInc.com
Phone: 403+569-5687, Fax: 403+235-3965
