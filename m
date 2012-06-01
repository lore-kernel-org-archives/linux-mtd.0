Received: from eu1sys200aog116.obsmtp.com ([207.126.144.141])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SaNEh-0006yO-DG
 for linux-mtd@lists.infradead.org; Fri, 01 Jun 2012 08:29:32 +0000
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 91BD4EF
 for <linux-mtd@lists.infradead.org>; Fri,  1 Jun 2012 08:29:15 +0000 (GMT)
Received: from mail7.sgp.st.com (mail7.sgp.st.com [164.129.223.81])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 241AB2597
 for <linux-mtd@lists.infradead.org>; Fri,  1 Jun 2012 08:29:15 +0000 (GMT)
Message-ID: <4FC87D62.6020402@st.com>
Date: Fri, 01 Jun 2012 09:29:22 +0100
From: Angus CLARK <angus.clark@st.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: mtd nand erase and bad block
References: <4FC76039.6020701@sirius-es.it> <4FC771EC.4090500@intel.com>
 <4FC78012.5010704@sirius-es.it> <4FC8601C.5070708@intel.com>
 <Pine.LNX.4.64.1206010837100.4247@lnxricardw.se.axis.com>
In-Reply-To: <Pine.LNX.4.64.1206010837100.4247@lnxricardw.se.axis.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have to do this regularly for testing new NAND drivers.  After getting fed up
with doing temporary hacks all the time, I ended up adding a
'nand_erasebadblock' entry to debugfs, which overrides the check in
nand_erase_nand():
...
	if (!nand_erasebadblock &&
	    nand_block_checkbad(mtd, ((loff_t) page) <<
				chip->page_shift, 0, allowbbt)) {
...

The sequence in userspace would then be something like:

	target% echo 1 > /sys/kernel/debug/nand_erasebadblock
	target% flash_erase -N /dev/mtd6 0x00200000 1
	target% echo 0 > /sys/kernel/debug/nand_erasebadblock

You need to be careful to only erase marked bad blocks that you know are
actually good, or else you risk loosing the factory-programmed bad block markers.

This method is also useful for erasing the BBTs, which will then force the
driver to re-scan for OOB markers on the next boot.  Again care needs to be
taken, as you may loose information about blocks that have gone bad through
wear.  (The recent patch "mtd: nand: write BBM to OOB even with flash-based BBT"
partly overcomes this issue.)

Typically, debugfs is only enabled in development environments, and even then it
requires explicit user action, so this method of enabling erasing bad blocks is
safe enough for our needs.

Happy to do a patch if others are interested...

Cheers,

Angus

On 06/01/2012 07:37 AM, Ricard Wanderlof wrote:
> 
> On Fri, 1 Jun 2012, Adrian Hunter wrote:
> 
>>> What's the way for recheck bad blocks and refresh the BBT from userspace
>>> application?
>>
>> I always just temporarily hack the kernel driver to allow the erase of
>> the
>> bad block in question.
> 
> I agree. Having that capability available at all times would be scary.
> 
> /Ricard
