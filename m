Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UtYtK-0001wF-Lx
 for linux-mtd@lists.infradead.org; Mon, 01 Jul 2013 07:51:19 +0000
Message-ID: <1372665309.22014.40.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBIFS: add tolerance to use variable writesize
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dirk Behme <dirk.behme@gmail.com>
Date: Mon, 01 Jul 2013 10:55:09 +0300
In-Reply-To: <1368634865-4186-1-git-send-email-dirk.behme@gmail.com>
References: <1368634865-4186-1-git-send-email-dirk.behme@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: dirk.behme@de.bosch.com, linux-mtd@lists.infradead.org,
 Achim Dahlhoff <Achim.Dahlhoff@de.bosch.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2013-05-15 at 18:21 +0200, Dirk Behme wrote:
> From: Achim Dahlhoff <Achim.Dahlhoff@de.bosch.com>
> 
> UBIfs adapts it‘s structures according to the minimum writeSize reported
> by the MTD device. For NOR flash devices, this is normally 1. For NOR
> devices with internal hardware-ECC it might be more, such as the S-Die
> flash chips of Micron which can use an internal ECC if the chip is
> accessed in 32 byte chunks.
> 
> The UBIfs mount process checks and compares the writeSize set in the
> image and the writeSize reported from the /dev/mtd . UBIfs will fail
> to mount if the values differ. It should, though, not be a problem to
> mount an image which was created with a writeSize larger than that of
> the MTD, if it is larger by an integer factor.
> 
> This commit changes the check in a way so it will allow the image
> writeSize to be larger than that of the MTD by an integer factor.
> It will allow to create images and deploy them on different devices
> using different writeSizes. writeSize found using values of 1, 8 and 32.
> 
> Signed-off-by: Achim Dahlhoff <Achim.Dahlhoff@de.bosch.com>

Hi Dirk,

first of all, sorry for long delay.

In UBIFS we have 2 flash parameters which are relevant to this
discussion:

1. min_io_size - minimum size of the I/O buffer, comes from
mtd->writesize
2. max_write_size - optimzl size of the I/O buffer, comes from
mtd->writebufsize

Take a look at io.c.

So it looks like what you actually want to do is to make sure you have
the right max_write_size, in which case UBIFS will do most of its writes
in max_wirte_size units. E.g., make it to be 32.

This can be done by teaching your flash driver to export correct
'mtd->writebufsize'. My guess is that you do not do this, and it
defaults to 'mtd->writesize'.

-- 
Best Regards,
Artem Bityutskiy
