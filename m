Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PHE4B-0002hL-GM
	for linux-mtd@lists.infradead.org; Sat, 13 Nov 2010 11:14:47 +0000
Received: by bwz5 with SMTP id 5so3951801bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 13 Nov 2010 03:14:42 -0800 (PST)
Subject: Re: [PATCH UPDATED 1/5] mtd: fix bdev exclusive open bugs in
	block2mtd::add_device()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Tejun Heo <tj@kernel.org>
In-Reply-To: <4CDE6FAA.9030605@kernel.org>
References: <1288628129-12811-1-git-send-email-tj@kernel.org>
	<1288628129-12811-2-git-send-email-tj@kernel.org>
	<4CDE6FAA.9030605@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 13 Nov 2010 13:14:25 +0200
Message-ID: <1289646865.2218.27.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: jack@suse.cz, leochen@broadcom.com, neilb@suse.de,
	heiko.carstens@de.ibm.com, dm-devel@redhat.com,
	adilger.kernel@dilger.ca, konishi.ryusuke@lab.ntt.co.jp,
	shaggy@linux.vnet.ibm.com, drbd-dev@lists.linbit.com,
	joel.becker@oracle.com, hch@infradead.org, aelder@sgi.com,
	mfasheh@suse.com, joern@logfs.org,
	reiserfs-devel@vger.kernel.org, viro@zeniv.linux.org.uk,
	swhiteho@redhat.com, chris.mason@oracle.com, axboe@kernel.dk,
	tytso@mit.edu, petero2@telia.com, linux-kernel@vger.kernel.org,
	schwidefsky@de.ibm.com, linux-mtd@lists.infradead.org,
	akpm@linux-foundation.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2010-11-13 at 11:59 +0100, Tejun Heo wrote:
> There are two bdev exclusive open bugs.
> 
> * open_bdev_exclusive() must not be called with NULL holder.  Use dev
>   as the holder.
> 
> * open_by_devnum() doesn't open the bdev exclusively but
>   block2mtd_free_device() always assumes it.  Explicitly claim the
>   bdev.
> 
> The latter is rather clumsy but will be simplified with future
> blkdev_get/put() cleanups.
> 
> - Updated to use local variable @mode to cache FMODE_* masks as
>   suggested by Artem Bityutskiy.

Do you want this patch to go in via Jens' tree with the rest of the
series, or as an independent patch via the mtd tree?

Anyway,

Acked-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
