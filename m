Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OFJIn-0003xW-DS
	for linux-mtd@lists.infradead.org; Fri, 21 May 2010 03:53:38 +0000
Received: by fxm15 with SMTP id 15so509332fxm.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 20 May 2010 20:53:34 -0700 (PDT)
Subject: Re: 2GB file size limit?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: David Lambert <dave@lambsys.com>
In-Reply-To: <4BEE1582.40706@lambsys.com>
References: <4BEE1582.40706@lambsys.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 21 May 2010 06:53:30 +0300
Message-Id: <1274414010.8881.26.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-05-14 at 22:31 -0500, David Lambert wrote:
> Is there any way to increase the file size limit on UBIFS beyond 
> 2Gbytes?

We never tested this, but should not be. AFAIR, UBIFS theoretical
limitation should be something like 16TB, but I tried tested the maximum
file size.

>  I have tried enabling the kernel ‘Support for large block 
> devices and files’ under ‘Enable the block layer’, but the 2G limit 
> persists.

UBIFS has nothing to do with block devices. This is a very specialized
FS for bare flashes:

http://www.linux-mtd.infradead.org/doc/ubifs.html#L_rednote

So that option has no effect for UBIFS.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
