Received: from a.ns.innominate.com ([212.21.76.70] helo=innominate.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17zbod-0003B1-00
	for <linux-mtd@lists.infradead.org>; Thu, 10 Oct 2002 12:49:19 +0100
Received: from tkeitel by tkeitel001.bln.gelonet.local with local (Exim 3.35 #1 (Debian))
	id 17zbhL-0002ai-00
	for <linux-mtd@lists.infradead.org>; Thu, 10 Oct 2002 13:41:47 +0200
Date: Thu, 10 Oct 2002 13:41:47 +0200
From: Tino Keitel <tino.keitel@innominate.com>
To: linux-mtd@lists.infradead.org
Subject: Re: help! compile error
Message-ID: <20021010114147.GB9941@tkeitel001.bln.gelonet.local>
References: <009701c27036$ee169f00$9000010a@paulwong>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <009701c27036$ee169f00$9000010a@paulwong>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Thu, Oct 10, 2002 at 16:27:54 +0800, Paul Wong wrote:
> hi all,
>  I use linux-2.4.17 kernel with the newest mtd code (get from cvs and run
> patchin.sh). Also I follow the NAND doc. to enable the MTD and NAND flash.
> When I compile it , there are error to show:->
> 
> ********************************
> 
> drivers/mtd/mtdlink.o(.text.lock+0x4d8):undefined reference to 'local
> symbols in discarded section .text.exit'
> mak[1]: *** [kallsyms] Error 1
> make: *** [vmlinux] Error 2
> 
> *********************************
> 
> what wrong???

IIRC this is a binutils<->kernel issue that has nothing to do with the
mtd source.

-- 
tino.keitel@innominate.com
dipl.-inf.                        Innominate Security Technologies AG
software engineer                                   networking people
tel: +49.30.6392-3308                      http://www.innominate.com/
