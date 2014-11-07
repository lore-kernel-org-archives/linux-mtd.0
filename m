Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xmhvr-0007NG-Hx
 for linux-mtd@lists.infradead.org; Fri, 07 Nov 2014 11:42:23 +0000
Message-ID: <1415360519.958.324.camel@sauron.fi.intel.com>
Subject: Re: Improve UBIFS nospc_retries
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: hujianyang <hujianyang@huawei.com>
Date: Fri, 07 Nov 2014 13:41:59 +0200
In-Reply-To: <545C9E75.4050709@huawei.com>
References: <545C9E75.4050709@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: lijinyue@huawei.com, linux-mtd <linux-mtd@lists.infradead.org>,
 yuchangchun1@huawei.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2014-11-07 at 18:27 +0800, hujianyang wrote:
> Hi Artem,
> 
> I'm puzzling with *nospc_retries* in make_reservation() nowadays.
> My colleagues in testing department use a less than 20M flash
> and run lots of processes on it. These processes will read, write,
> delete from flash and the flash is always in a nearly-full state.
> The board only has one core.

If it switches to R/O mode, this means that we did not reserve enough
space for the operation. Probably we need to reserve more LEBs for
deletions.

> So, the *nospc_retries* in make_reservation(), line 341 in journal.c
> will easily reach 2 as we set and turn the filesystem to RO mode.
> 
> I know we can't perform an infinite loop here. Can we improve it?
> Not only just turn current *2* to some larger number but also add
> some useful mechanism to avoid filesystem turning to RO mode.

Did you try to increase it, does it help?

We did not stress-test it for small flash size, because we assumed that
JFFS2 would take care of those.

And yes, there may be issues in the "little space left" handling. We
tested that, but no too extensively. The I/O becomes extremely slow when
there is little space, so we preferred to make sure the FS does not get
too full at all by reserving more space for 'root' (UBIFS feature, which
makes sure that 'root' can always write even if users consumed all the
space).

You could also experiment by reserving more LEBs for deletions, and see
if it helps. Just increase 'UBIFS_MIN_MAIN_LEBS' in ubifs.h and run your
test.
