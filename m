Received: from imladris.demon.co.uk ([193.237.130.41])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Mk2y-0002C7-QV
	for <linux-mtd@lists.infradead.org>; Mon, 02 Jun 2003 08:48:01 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Vikram Mehta <vm6580@hotmail.com>
In-Reply-To: <Law14-OE31sjvyJYwDs0002dc52@hotmail.com>
References: <Law14-OE31sjvyJYwDs0002dc52@hotmail.com>
Message-Id: <1054540117.22361.1.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Mon, 02 Jun 2003 08:48:37 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: mtd <linux-mtd@lists.infradead.org>
cc: uclinux-dev@uclinux.org
Subject: Re: mtd-utils/Makefile question
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2003-06-02 at 18:54, Vikram Mehta wrote:
> hi folks ,
> I am a newbie. One question
> 
> in mtd-utils/Makefile, y do we need BUILD_CC as gcc. Y not the target gcc
> like m68k-elf-gcc.

I don't know where your Makefile came from. The Makefile in the 'util'
directory of MTD CVS has no 'BUILD_CC' variable.

-- 
dwmw2
