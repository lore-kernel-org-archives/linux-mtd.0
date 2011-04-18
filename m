Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QBg6V-0007rJ-AI
	for linux-mtd@lists.infradead.org; Mon, 18 Apr 2011 04:30:28 +0000
Received: by ewy3 with SMTP id 3so1433063ewy.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 17 Apr 2011 21:30:25 -0700 (PDT)
Subject: Re: bug found in the core MTD driver code in 2.6.34 r97
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Turner <admin@islandsoftware.co.uk>
In-Reply-To: <165001cbfac4$c10056b0$0400a8c0@hack>
References: <165001cbfac4$c10056b0$0400a8c0@hack>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 18 Apr 2011 07:27:30 +0300
Message-ID: <1303100850.2815.0.camel@localhost>
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

Could you please send the oops log with backtrace - you can see it if
you type dmesg after the crash.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
