Date: Fri, 31 Jan 2014 18:06:37 +0100
From: Willy Tarreau <w@1wt.eu>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH 1/1] ubi: Introduce block devices for UBI volumes
Message-ID: <20140131170636.GJ31190@1wt.eu>
References: <1391027881-8354-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1391027881-8354-2-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1391027881-8354-2-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Mike Frysinger <vapier@gentoo.org>, Artem Bityutskiy <dedekind1@gmail.com>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 linux-mtd@lists.infradead.org, Tim Bird <tim.bird@am.sony.com>,
 Piergiorgio Beruto <piergiorgio.beruto@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 29, 2014 at 05:38:01PM -0300, Ezequiel Garcia wrote:
> Block device emulation on top of ubi volumes with cached read/write support.
> Both the cached access and the write support are selectable at compile time.
> 
> Given UBI takes care of wear leveling and bad block management it's possible
> to add a thin layer to enable block device access to UBI volumes.
> This allows to use a block-oriented filesystem on a flash device.
> 
> In a similar fashion to mtdblock, a 1-LEB size cache has been
> implemented. However, very memory-constrained systems can choose to
> disable the cache and save the 1-LEB byte allocation.
> 
> If write support is enabled, the flash device will be written when the cache
> is flushed. The following events trigger this:
> * block device release (detach)
> * different than cached leb is accessed
> * io-barrier is received through a REQ_FLUSH request
> 
> Despite this efforts, it's very important to remember that regular
> block-oriented filesystems have no care at all about wear leveling;
> they will access the block device randomly, only caring for performance.
> Therefore, write support should be selected only for development and
> with extreme caution.
> 
> The cache is 1-LEB bytes, vmalloced at open() and freed at release();
> in addition, each block device has a workqueue associated.
> 
> Block devices are created upon user request through new ioctls:
> UBI_IOCVOLATTBLK to attach and UBI_IOCVOLDETBLK to detach.
> Also, a new UBI module parameter is added 'ubi.block'. This parameter is
> needed in order to attach a block device on boot-up time, allowing to
> mount the rootfs on a ubiblock device.
> For instance, you could have these kernel parameters:
> 
>   ubi.mtd=5 ubi.block=0,0 root=/dev/ubiblock0_0
> 
> Or, if you compile ubi as a module:
> 
>   $ modprobe ubi mtd=/dev/mtd5 block=/dev/ubi0_0
> 
> Cc: Artem Bityutskiy <dedekind1@gmail.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: Michael Opdenacker <michael.opdenacker@free-electrons.com>
> Cc: Tim Bird <tim.bird@am.sony.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Mike Frysinger <vapier@gentoo.org>
> Cc: Piergiorgio Beruto <piergiorgio.beruto@gmail.com>
> Cc: Willy Tarreau <w@1wt.eu>
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>

Works pretty well here on 3.14-git. I've also tested write support
with success. I'm booting from a squashfs installed on top of it.
I find that the combination of squashfs + ubiblock is really good
for a rootfs. It's fast, space-efficient in terms of RAM and NAND,
and made reliable by the ubi layer.

Concerning the question about the usage of write support, I find it
useful to perform rootfs upgrades from Linux.

Feel free to add :

   Tested-By: Willy Tarreau <w@1wt.eu>

Best regards,
Willy
