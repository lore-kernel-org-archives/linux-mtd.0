Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QBgGl-0007ud-Ou
	for linux-mtd@lists.infradead.org; Mon, 18 Apr 2011 04:41:04 +0000
Received: by ewy3 with SMTP id 3so1434374ewy.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 17 Apr 2011 21:41:02 -0700 (PDT)
Subject: Re: bug found in the core MTD driver code in 2.6.34 r97
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Turner <admin@islandsoftware.co.uk>
In-Reply-To: <165001cbfac4$c10056b0$0400a8c0@hack>
References: <165001cbfac4$c10056b0$0400a8c0@hack>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 18 Apr 2011 07:38:08 +0300
Message-ID: <1303101488.2815.2.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-04-14 at 17:55 +0100, Mike Turner wrote:
> Hi folks,
> 
> On the second and subsequent boots into my Gumstix NAND-resident ubifs RFS 
> (Gumstix "minimal build" aimed at fast booting from NAND), it seems that 
> udevadm - executing from the script /etc/init.d/udev - encounters a driver 
> crash when drivers/mtd/ubi/gluebi.c:gluebi_read() passes the value 
> 0xFFFFFFF0 as a "struct ubi_volume_desc *" argument to  ubi_read() and 
> thence ubi_leb_read().

OK, I see the issue now.

> Is this bug unique to my build, perhaps caused by an 
> incomplete/wrong/missing patch, or is it the case in other builds?

Not this is just a bug. Your version of the kernel is old and the
upstream has changed, but I see there are problems with the error path
in upstream as well.

> 
> I fixed it by making blktrans_open() behave exactly the same w.r.t. the 
> return from get_mtd_device() as do all the other callers to that function. 
> I presume that would be the correct approach?

Yeah, you may just fix up your kernel. You might as well try the
upstream kernel, fix it and submit a patch.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
