Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SxDgz-0005dY-PX
 for linux-mtd@lists.infradead.org; Fri, 03 Aug 2012 08:57:10 +0000
Date: Fri, 3 Aug 2012 10:56:58 +0200
From: Richard Weinberger <richard@nod.at>
To: artem.bityutskiy@linux.intel.com
Subject: Re: UBI fastmap updates
Message-ID: <20120803105658.502559a1@spider.haslach.nod.at>
In-Reply-To: <1343983637.1730.28.camel@sauron.fi.intel.com>
References: <1341836323-43916-1-git-send-email-richard@nod.at>
 <1343983637.1730.28.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: nyoushchenko@mvista.com, linux-kernel@vger.kernel.org,
 adrian.hunter@intel.com, Heinz.Egger@linutronix.de,
 thomas.wucher@linutronix.de, linux-mtd@lists.infradead.org,
 shmulik.ladkani@gmail.com, tglx@linutronix.de, Marius.Mazarel@ugal.ro,
 tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Fri, 03 Aug 2012 11:47:17 +0300
schrieb Artem Bityutskiy <artem.bityutskiy@linux.intel.com>:

> On Mon, 2012-07-09 at 14:18 +0200, Richard Weinberger wrote:
> > This is the next round of UBI fastmap updates.
> > It fixes all issues pointed out by Shmulik. :-)
> > 
> > If you want to test fastmap you can use my git repo:
> > git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubi2.git ubi2/v17
> 
> Richard,
> 
> I've added 'stress-test.sh' script to the UBI tests. This script runs
> UBI tests on nandsim of different geometry. I plan to extend it
> further: add mtdram tests, test with bit-flips emulation enabled, may
> be something else.
> 
> We need to make sure all the tests pass and fastmap does not introduce
> regressions.
> 
> Feel free to send patches. I am going to extend the test today, so
> 'git pull' from time to time.
> 
> The tests will run very long time, so for debugging you can always
> comment out unneeded things.
> 
> ATM, I have only nandsim tests with different geometry: 64MiB to 1GiB
> total size, 2KiB and 512 byte pages, 16-256KiB eraseblocks.
> 
> Currently I am running this to unpatched UBI to check if they really
> pass.
> 
> I tried to run it on the patched UBI and hit this issue:
> 
> ======================================================================
> 16MiB nandsim with 16KiB PEB, 512KiB NAND pages, fastmap enabled
> Loaded NAND simulator (16MiB, 16KiB eraseblock, 512 bytes NAND page)
> Running mkvol_basic /dev/ubi0
> Running mkvol_bad /dev/ubi0
> Running mkvol_paral /dev/ubi0
> Running rsvol /dev/ubi0
> Running io_basic /dev/ubi0
> [io_basic] test_basic():70: function write() failed with error 28 (No
> space left on device)
> [io_basic] test_basic():70: written = 15808000, ret = -1
> Error: io_basic failed
> FAILURE
> ======================================================================
> 
> On non-patched UBI it works. I think it is exactly what I was talking
> about yesterday - fastmap grows unexpectedly because you do not
> reserve the space.

Yeah, this must be the case.
I'm wondering why the test passes with the default nandsim settings?
I have also tested with other flash sizes and did lots of tests on
real hardware.

Thanks,
//richard
