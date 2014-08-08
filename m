Received: from mail-pd0-x230.google.com ([2607:f8b0:400e:c02::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFdX5-0000il-R9
 for linux-mtd@lists.infradead.org; Fri, 08 Aug 2014 06:20:08 +0000
Received: by mail-pd0-f176.google.com with SMTP id y10so6481583pdj.21
 for <linux-mtd@lists.infradead.org>; Thu, 07 Aug 2014 23:19:46 -0700 (PDT)
Date: Thu, 7 Aug 2014 23:19:36 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Daniel Bowen <dbowen@logitech.com>
Subject: Re: Question about ubiformat
Message-ID: <20140808061936.GA3246@norris-Latitude-E6410>
References: <1a5301cfb29c$9a4ec6d0$ceec5470$@com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a5301cfb29c$9a4ec6d0$ceec5470$@com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Daniel,

On Thu, Aug 07, 2014 at 06:06:27PM -0600, Daniel Bowen wrote:
> Let's say that I've prepared an image using mkfs.ubifs and ubinize.  Is
> there any advantage, disadvantage or difference to doing ubiformat twice -
> once without specifying an image file, then running it a second time with an
> image file?  In other words, is there a difference between these two
> sequences:
> 
> ubiformat /dev/mtd4
> ubiformat /dev/mtd4 -f /mnt/source/ubi.img
> 
> and
> 
> ubiformat /dev/mtd4 -f /mnt/source/ubi.img

ubiformat always saves erase counters, so running it twice should not be
extra-destructive. The primary effect is that you will put the whole
device through an extra erase cycle unnecessarily (slightly reducing the
flash's lifetime), because ubiformat.c's format() function loops through
all eraseblocks and erases them.

But I think either sequence should have the same functional result.

Brian
