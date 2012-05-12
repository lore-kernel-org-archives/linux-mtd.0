Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1STHCH-0000oK-Qq
 for linux-mtd@lists.infradead.org; Sat, 12 May 2012 18:37:42 +0000
Message-ID: <4FAEADF1.50308@newsguy.com>
Date: Sat, 12 May 2012 11:37:37 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: Regarding latest EUCLEAN/bitflip_threshold patchset
References: <20120509132613.40db5533@pixies.home.jungo.com>
 <1336737075.2625.52.camel@sauron.fi.intel.com>
In-Reply-To: <1336737075.2625.52.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On 05/11/2012 04:51 AM, Artem Bityutskiy wrote:
> On Wed, 2012-05-09 at 13:26 +0300, Shmulik Ladkani wrote:
>> Hi Mike,
>>
>> I noticed 'nand_do_read_oob' explicitly tests 'mtd->ecc_stats.corrected'
>> and returns EUCLEAN - as it was not ported to use the new
>> 'bitflip_threshold'.
> 
> Good point. Mike did you miss this function?


No, I deliberately left it as-is.  Maybe a litle lazy or sloppy on my part, but
ignoring it is of no consequence (see below).

Shmulik, your posts still don't get to my inbox.  Still wondering why.  Anyway,
pasting from the archive...


> From nand_base.c:
>
> 	if (mtd->ecc_stats.failed - stats.failed)
> 		return -EBADMSG;
>
> 	return  mtd->ecc_stats.corrected - stats.corrected ? -EUCLEAN : 0;
>
> - May drivers increment mtd->ecc_stats.{corrected,failed} during their
>   ecc.read_oob() call?


Currently no nand drivers increment stats.corrected for oob-only reads.  Since
nand_do_read_oob() does not read page data, stats never increment and -EUCLEAN
is never returned.  To avoid complicating the issue, I ignored the case of
reading oob-only.


> - If so, can we (should we?) report EUCLEAN according to the
>   bitflip_threshold in this case?


I guess it depends on how widespread is the desire or capability of performing
ecc on oob-only reads.  The new diskonchip devices (docg3, docg4) are capable of
performing ecc on oob-only data.  These can do one bit corrections over 15 (of
the 16 total) oob bytes using the hamming algorithm (though neither driver
supports it currently).  But since in this case only one bitflip can be
corrected, it will always be below bitflip_threshold.  Then there's the question
of how do you interpret uncorrectible bitflips vis-a-vis eraseblock health when
using a weaker ecc algorithm for oob-only.

These questions are currently all theoretical.  I think the threshold test
should be removed, and replaced with 'return 0', at least for now.

Thanks,
Mike
