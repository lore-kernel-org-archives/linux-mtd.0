Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XTyOZ-0007bi-P7
 for linux-mtd@lists.infradead.org; Tue, 16 Sep 2014 19:26:36 +0000
Received: by mail-pa0-f45.google.com with SMTP id rd3so432503pab.4
 for <linux-mtd@lists.infradead.org>; Tue, 16 Sep 2014 12:26:14 -0700 (PDT)
Date: Tue, 16 Sep 2014 12:26:10 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Rostislav Lisovy <lisovy@gmail.com>
Subject: Re: Destructive nandtest?
Message-ID: <20140916192610.GB1193@ld-irv-0074>
References: <1410884555.23903.13.camel@lp-lvrv.comap.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1410884555.23903.13.camel@lp-lvrv.comap.cz>
Cc: David Woodhouse <dwmw2@infradead.org>, Michal Vokac <michal.vokac@comap.cz>,
 linux-mtd@lists.infradead.org,
 Ezequiel =?iso-8859-1?Q?Garc=EDa?= <ezequiel@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Tue, Sep 16, 2014 at 06:22:35PM +0200, Rostislav Lisovy wrote:
> I need to test a NAND flash on my embedded device running GNU/Linux.
> I thought the nandtest utility will work just fine, however I hit some
> unpleasant behavior.
> My requirement is to perform a non-destructive test. The nandtest
> utility seems to support it with the "-k, --keep  Restore existing
> contents after test" option, however the reality is different.
> The testing scenario (performed by the nandtest) is
> * Backup the original eraseblock (EB) data
> * Generate some random data
> * Erase the EB
> * Store the random data
> * Read the stored data and compare with the generated buffer
> * Erase the EB, Write the original content
> 
> Everything seems to make sense until we ask the question "what about the
> OOB data?". Is the original OOB data saved? The answer is: No, it is
> not.
> This will somehow work in cases the OOB stores only the ECC for the
> written pages -- if we read the page (OOB contains the ECC), erase the
> EB and then write the same page back, the OOB will once again contain
> the same ECC. What if there will be some "extra data" stored in the OOB
> (I think JFFS2 does this)? This data will be lost.

Right.

BTW, this may be acceptable for UBI-based systems, where OOB is never
used for metadata. But I agree it's broken in general.

> Another sneaky misbehavior is "restoring of erased pages". If the EB is
> erased (all 0xFF), the nandtest reads the "data stored in the EB",
> performs the tests and then restores the "data" back by filling all the
> pages with 0xFF -- this will not only fill the OOB with ECC for the
> newly written "data" but will deplete the "maximum per-page-write
> limit" (which is either 1x after each erase or more if the sub-page
> write is supported by the device).

Correct. That's the one I noticed most prominently, and I believe I've
seen a few others trip over this.

> All this described behavior was discovered after long hours of analyzing
> different nanddumps.

Sorry :(

> What do you think about the issue? Is this the "normal nanddump"
> behavior or a hidden fault? Do we need a new nandtest or at least remove
> the "-k, --keep  Restore existing contents after test" option?
> I will appreciate your thoughts.

All of your analysis looks accurate to me. Personally, I never used
'nandtest' much myself, because of glaring ommissions like you've
noticed. I wouldn't mind just dropping the '--keep' option, since it's a
lot of work to try to do correctly, and in its current state, it is
completely broken and misleading.

Brian
