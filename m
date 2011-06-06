Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTYi0-0003FJ-HC
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 12:15:05 +0000
Received: by fxm14 with SMTP id 14so3480065fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 05:15:02 -0700 (PDT)
Subject: Re: nandwrite with raw oob data
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Peter Wippich <pewi@gw-instruments.de>
In-Reply-To: <alpine.LSU.2.00.1106051821580.26001@redbean.intranet.gw-instruments.de>
References: <alpine.LSU.2.00.1106051821580.26001@redbean.intranet.gw-instruments.de>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 06 Jun 2011 15:10:46 +0300
Message-ID: <1307362246.3112.45.camel@localhost>
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

On Sun, 2011-06-05 at 18:40 +0200, Peter Wippich wrote:
> Dear all,
> 
> I run into the same problem as outlined here before:
> http://lists.infradead.org/pipermail/linux-mtd/2011-March/034516.html
> 
> Going a little bit deeper it looks to me that writing any nand flash data 
> with raw (precomputed ECC) OOB data is not possible at all with a recent 
> Kernel and nandwrite version.
> 
> What happens here is that nandwrite will set MTD_MODE_RAW when noecc is 
> specified. Doing so will force the kernel driver to write OOB data only on 
> a normal write. Obviously this will fail when someone is trying to write 
> normal data to flash in MODE_RAW.
> 
> Question: is this realy the intended behaviour ???
> 
> It may be easy to fix this on kernel level, but may be there is some good 
> reason I don't know to do it as it is. And I don't want to break things.
> 
> Any comments welcome.

I think that is just broken stuff which is rarely used. Please, send a
set of fixes, but please, try to:

1. Fix both nandwrite and the kernel.
2. Test that non-raw functionality is not broken.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
