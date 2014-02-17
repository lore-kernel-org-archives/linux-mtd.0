Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WFLJH-0000KJ-2Z
 for linux-mtd@lists.infradead.org; Mon, 17 Feb 2014 10:20:23 +0000
Message-ID: <1392632392.12215.125.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v6 0/3] ubi: Add block interface
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date: Mon, 17 Feb 2014 12:19:52 +0200
In-Reply-To: <1392581041-8099-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1392581041-8099-1-git-send-email-ezequiel.garcia@free-electrons.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Mike Frysinger <vapier@gentoo.org>,
 Richard Weinberger <richard.weinberger@gmail.com>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 linux-mtd@lists.infradead.org,
 Piergiorgio Beruto <piergiorgio.beruto@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks!

On Sun, 2014-02-16 at 17:03 -0300, Ezequiel Garcia wrote:
> The main target of this patch is supporting lighter, read-only
> filesystem,
> by putting a squashfs on top of ubiblock. And since squashfs already
> provides
> a file cache (which is even configurable), a first uncached
> implementation
> it's good enough for now.

Doesn't Linux provide a fake inode for _every_ block device, and uses
page-cache to cache pages?

There is even entire special-purpose file-system for managing these fake
block device inodes, see fs/block_dev.c

static struct file_system_type bd_type = {
        .name           = "bdev",
        .mount          = bd_mount,
        .kill_sb        = kill_anon_super,
};

I am really not sure which other cache do we need. The only thing coming
to my mind is about emulating a HW disk cache in software. But I would
not go that far without a really good reason.

If what I say is correct, I guess we can just drop the "cache" subject
completely now.

-- 
Best Regards,
Artem Bityutskiy
