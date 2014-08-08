Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFn0q-0003AE-V6
 for linux-mtd@lists.infradead.org; Fri, 08 Aug 2014 16:27:29 +0000
Received: by mail-pa0-f54.google.com with SMTP id fa1so7525640pad.41
 for <linux-mtd@lists.infradead.org>; Fri, 08 Aug 2014 09:27:07 -0700 (PDT)
Date: Fri, 8 Aug 2014 09:27:04 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Daniel Bowen <dbowen@logitech.com>
Subject: Re: Question about ubiformat
Message-ID: <20140808162704.GR3711@ld-irv-0074>
References: <1a5301cfb29c$9a4ec6d0$ceec5470$@com>
 <20140808061936.GA3246@norris-Latitude-E6410>
 <1b4901cfb31a$ee57b240$cb0716c0$@com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b4901cfb31a$ee57b240$cb0716c0$@com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 08, 2014 at 09:10:44AM -0600, Daniel Bowen wrote:
> Great, thanks for the response!  So, if the mtd partition were say 500 erase
> blocks large, and the image was 300 erase blocks large, would "ubiformat
> /dev/mtd4 -f /mnt/source/ubi.img" 
> 1. only touch the first 300 blocks of the partition, and leave the other 200
> unmodified?  Or 
> 2. would it write the image into the first 300 blocks, and erase the
> remaining 200 blocks?

It erases every block, writes the image to the first 300, and programs
EC headers to the last 200.

The source for ubiformat is actually pretty simple and easy to read.
Check it out yourself!

  http://git.infradead.org/mtd-utils.git

Brian
