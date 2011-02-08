Received: from aa012-1msr.fastwebnet.it ([62.101.93.132])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PmsvW-0005TD-Jr
	for linux-mtd@lists.infradead.org; Tue, 08 Feb 2011 19:08:40 +0000
From: Fabio Giovagnini <fabio.giovagnini@aurion-tech.com>
To: linux-mtd@lists.infradead.org
Subject: Re: Sorry guys, but why it not allowed erasesize less than 8KiB?
Date: Tue, 8 Feb 2011 20:08:33 +0100
References: <201102081937.41482.fabio.giovagnini@aurion-tech.com>
	<AANLkTi=4SztR-A8TzaFfgVo5-3mxACMZCOvOo4twnwd9@mail.gmail.com>
In-Reply-To: <AANLkTi=4SztR-A8TzaFfgVo5-3mxACMZCOvOo4twnwd9@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <201102082008.33594.fabio.giovagnini@aurion-tech.com>
Cc: Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sorry Mike,
I was meaning mkfs.jffs2 does not allow to specify less than 8KiB as 
--eraseblock option

$ /home/fgiovagnini/sh7203/sh7203-uclinux-4.4-206/mtd-utils/mtd-
utils/mkfs.jffs2 --big-endian --pagesize=1024 --eraseblock=4096 --pad=2097152 
--root=/home/fgiovagnini/sh7203/sh7203-uclinux-4.4-206/build/sh7203-
images/root_fs --output=/home/fgiovagnini/sh7203/sh7203-
uclinux-4.4-206/build/sh7203-images/sh7203-filesystem.bin
Erase size 0x1000 too small. Increasing to 8KiB minimum

$

Thnaks a lot




On Tuesday 08 February 2011 19:46:07 Mike Frysinger wrote:
> ask your flash vendor
> -mike
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

-- 
Ing. Fabio Giovagnini

Aurion s.r.l.
P.I e C.F.
00885711200
skype: aurion.giovagnini
Tel. +39.051.594.78.24
Fax. +39.051.082.14.49
Cell. +39.335.83.50.919
www.aurion-tech.com
