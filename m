Received: from mail.linuxfoundation.org ([140.211.169.12])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YDgDE-0003az-F2
 for linux-mtd@lists.infradead.org; Tue, 20 Jan 2015 21:19:49 +0000
Date: Wed, 21 Jan 2015 05:19:03 +0800
From: Greg KH <gregkh@linuxfoundation.org>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] staging: mt29f_spinand: Fix typo in Kconfig
Message-ID: <20150120211903.GA13903@kroah.com>
References: <1421318844-18203-1-git-send-email-standby24x7@gmail.com>
 <20150120203443.GO9759@ld-irv-0074>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150120203443.GO9759@ld-irv-0074>
Cc: Masanari Iida <standby24x7@gmail.com>, devel@driverdev.osuosl.org,
 linux-mtd@lists.infradead.org, kamlakant.patel@broadcom.com,
 manonuevo@micron.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 20, 2015 at 12:34:43PM -0800, Brian Norris wrote:
> On Thu, Jan 15, 2015 at 07:47:24PM +0900, Masanari Iida wrote:
> > This patch fix a spelling typo in Kconfig.
> > 
> > Signed-off-by: Masanari Iida <standby24x7@gmail.com>
> 
> Acked-by: Brian Norris <computersforpeace@gmail.com>
> 
> Greg, do you take these patches, or should they go through me?

I can take them directly, and add your ack.  No need for you to do
anything else here, thanks.

> FWIW, we have high hopes to kill and replace this driver soon, as there
> have been some better spi-nand patches floating around linux-mtd.

Wonderful, let me know when you want me to delete these, I like deleting
code :)

thanks,

greg k-h
