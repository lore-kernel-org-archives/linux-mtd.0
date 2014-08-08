Received: from na3sys009aog116.obsmtp.com ([74.125.149.240])
 by bombadil.infradead.org with smtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFlpr-0007Na-1D
 for linux-mtd@lists.infradead.org; Fri, 08 Aug 2014 15:12:03 +0000
Received: by mail-pa0-f54.google.com with SMTP id fa1so7505561pad.27
 for <linux-mtd@lists.infradead.org>; Fri, 08 Aug 2014 08:10:47 -0700 (PDT)
From: "Daniel Bowen" <dbowen@logitech.com>
To: "'Brian Norris'" <computersforpeace@gmail.com>
References: <1a5301cfb29c$9a4ec6d0$ceec5470$@com>
 <20140808061936.GA3246@norris-Latitude-E6410>
In-Reply-To: <20140808061936.GA3246@norris-Latitude-E6410>
Subject: RE: Question about ubiformat
Date: Fri, 8 Aug 2014 09:10:44 -0600
Message-ID: <1b4901cfb31a$ee57b240$cb0716c0$@com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-language: en-us
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Great, thanks for the response!  So, if the mtd partition were say 500 erase
blocks large, and the image was 300 erase blocks large, would "ubiformat
/dev/mtd4 -f /mnt/source/ubi.img" 
1. only touch the first 300 blocks of the partition, and leave the other 200
unmodified?  Or 
2. would it write the image into the first 300 blocks, and erase the
remaining 200 blocks?

Thanks!
-Daniel

-----Original Message-----
From: Brian Norris [mailto:computersforpeace@gmail.com] 
Sent: Friday, August 08, 2014 12:20 AM
To: Daniel Bowen
Cc: linux-mtd@lists.infradead.org
Subject: Re: Question about ubiformat

Hi Daniel,

On Thu, Aug 07, 2014 at 06:06:27PM -0600, Daniel Bowen wrote:
> Let's say that I've prepared an image using mkfs.ubifs and ubinize.  Is
> there any advantage, disadvantage or difference to doing ubiformat twice -
> once without specifying an image file, then running it a second time with
an
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
