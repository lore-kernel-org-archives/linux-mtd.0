Received: from mail-gy0-f177.google.com ([209.85.160.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S8g5v-0005OI-L1
 for linux-mtd@lists.infradead.org; Fri, 16 Mar 2012 22:58:00 +0000
Received: by ghbf11 with SMTP id f11so5363348ghb.36
 for <linux-mtd@lists.infradead.org>; Fri, 16 Mar 2012 15:57:57 -0700 (PDT)
Message-ID: <4F63C571.4000400@gmail.com>
Date: Fri, 16 Mar 2012 18:57:53 -0400
From: Peter Barada <peter.barada@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 0/3] MTD: Change meaning of -EUCLEAN return code on reads
References: <1331832353-15569-1-git-send-email-mikedunn@newsguy.com>
 <20120316111939.GA10362@parrot.com> <4F636964.3030904@newsguy.com>
 <20120316235424.60a62ed0@halley>
In-Reply-To: <20120316235424.60a62ed0@halley>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/16/2012 05:54 PM, Shmulik Ladkani wrote:
>
> So question is, would you consider 4 bit errors in the first ECC portion
> to be "a dangerously high number of bit errors" as what's reported to
> the MTD users?
> If so, then yes, the cleaning decision should be according to the ecc
> step level, not at the page reading level.
If you had a ECC method that could correct N bits over the entire page 
and the ECC showed N-1 bits needed correcting then it should be obvious 
that the page is in danger of becoming uncorrectable.  This should be 
the same as if there are multiple ECC steps per page and a single step 
shoes N-1 bits that need correcting.  I think the indication from MTD 
should be the worst case found in all the ECC steps...

The bigger issue is how to discern whether the degredation is due to 
read-disturb (which can be recovered by erasing/reprogramming the block) 
or the page physically wearing out (in which case it needs to be 
retired).  For first generation SLC parts with large geometries this was 
relatively straightforward where the block didn't show *any* any 
bitflips up until it got close to its wear limit.  With smaller geometry 
SLC (and definitely with MLC) things are not straightfoward.

In discussions with at least one NAND manufacturer, they indicated that 
the "proper" method is to track reads per block (somehow across power 
cycles) and when the number of reads per block (after an erasure of the 
block) hits a limit then refresh the block, *and* disregard statistical 
counting of bit flips - the read patterns across pages/blocks can affect 
the number of bitflips seen - apparently it has to do with how the 
physical geometry of the cells are laid out (due to the address lines 
that are energized that exist nearby, but no details for the part in 
question were provided).

Unfortunately there's no current method (that I know of) in MTD to keep 
a non-volatile count of reads of pages within a block between erases 
that can be used to handle the read-disturb case.  If such existed (and 
kept track of erase counts) then it should be possible to handle both 
cases.  Then a NAND manufacturer's rating of "at temperature range M, N 
year retention, you can get X UBER if limt reads to Y thousands of 
reads/block, and Z thousands of erasures" would be tractable...

-- 
Peter Barada
peter.barada@gmil.com
