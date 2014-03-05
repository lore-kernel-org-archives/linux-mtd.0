Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WL9Wt-0004LV-Ht
 for linux-mtd@lists.infradead.org; Wed, 05 Mar 2014 10:58:28 +0000
Message-ID: <1394017054.6302.46.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v7 1/3] ubi: Introduce read-only block devices on top of
 UBI volumes
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date: Wed, 05 Mar 2014 12:57:34 +0200
In-Reply-To: <1393245564-23947-2-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1393245564-23947-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1393245564-23947-2-git-send-email-ezequiel.garcia@free-electrons.com>
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

On Mon, 2014-02-24 at 09:39 -0300, Ezequiel Garcia wrote:
> +/* Attach a block device to an UBI volume */
> +#define UBI_IOCVOLATTBLK _IO(UBI_VOL_IOC_MAGIC, 7)

Ezequiel,

please, change this before it goes upstream and instead, make the ioctls
accept a 'struct ubi_blkcreate_req' object pointer.

/**
 * blah
 * @padding1:  reserved for future, not used, has to be zeroed
 */
struct ubi_blkcreate_req {
	__s8 padding1[128];
} __packed;

This will make sure we have a possibility to extend this ioctl in the
future with something like volume creation flags etc. Otherwise, if we
need to add a flag, we'll have to introduce a new ioctl.

Thanks!

-- 
Best Regards,
Artem Bityutskiy
