Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SUif6-0008Gk-A9
 for linux-mtd@lists.infradead.org; Wed, 16 May 2012 18:09:25 +0000
Message-ID: <4FB3ED51.60706@newsguy.com>
Date: Wed, 16 May 2012 11:09:21 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: Regarding latest EUCLEAN/bitflip_threshold patchset
References: <20120509132613.40db5533@pixies.home.jungo.com>
 <1336737075.2625.52.camel@sauron.fi.intel.com> <4FAEADF1.50308@newsguy.com>
 <20120512231350.347c16e9@halley>
 <CAN8TOE8yodhNvGF0ZafL7Jh3jb7B4KarWqk3iLUrrf4P2KTrrA@mail.gmail.com>
In-Reply-To: <CAN8TOE8yodhNvGF0ZafL7Jh3jb7B4KarWqk3iLUrrf4P2KTrrA@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/15/2012 11:49 PM, Brian Norris wrote:
> 
> My out-of-tree driver increments ecc_stats.corrected.
> 


I should have said "currently no in-tree driver incremenst stats" :)


> Hmm, well 041e4575 was designed without much of a window into how
> others really needed it, as I didn't know of others who had the same
> features. My hardware has its own threshold features that can be used
> to mask bitflips; it has ECC that covers OOB at the same time as the
> page data; when reading OOB only, it actually reads the page data as
> well, in order to perform ECC properly. So when I report bitflips from
> read_oob, I'm reporting the bitflips for the entire page+OOB sector.
> But due to my hardware-based threshold, this only is reported for a
> high number of bitflips.


Ha!  This complicates the issue even more, since reading the whole page *will*
give you useful information on block wear.

Based on my (admittedly liimited) knowledge, my impression is that we should
just not bother with EUCLEAN for oob-only reads.  Reading the whole page for
oob-only ops is a special case, and using a separate ECC scheme intended for
oob-only does not provide useful bitflip data.


> 
> So, I'm not sure how to properly reconcile the new threshold code, the
> nand_do_read_oob() EUCLEAN and EBADMSG, and various schemes for
> OOB-only ECC (or the common case of no ECC for OOB-only). I'll try to
> give this some more thought and get back to you. But please comment if
> my feedback so far stirs any ideas with you guys. Perhaps 041e4575 was
> not as clean as I thought in the first place.


It's hard to be clean in a messy environment :)

Thanks Brian,
Mike
