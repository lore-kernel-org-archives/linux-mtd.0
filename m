Received: from mail-fx0-f222.google.com ([209.85.220.222])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NTkWI-0005tC-5m
	for linux-mtd@lists.infradead.org; Sat, 09 Jan 2010 23:15:02 +0000
Received: by fxm22 with SMTP id 22so22921115fxm.2
	for <linux-mtd@lists.infradead.org>;
	Sat, 09 Jan 2010 15:14:57 -0800 (PST)
Subject: Re: UBI - exclude bootloader blocks from wear levelling
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Lauren Del Giudice <lauren@wyplay.com>
In-Reply-To: <4B2FA658.6010407@wyplay.com>
References: <4B2FA658.6010407@wyplay.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 10 Jan 2010 01:14:55 +0200
Message-Id: <1263078895.7315.110.camel@localhost.localdomain>
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

On Mon, 2009-12-21 at 17:46 +0100, Lauren Del Giudice wrote:
> I'm new to UBI... I understood that static wear levelling is applied
> accross the whole device (a NAND device in my case); If so, how can
> I exclude blocks reserved for the bootloader from wear levelling?

So you basically want:

1. reserve the first N PEBs for the boot-loader, kernel, whatever. You
do not want UBI to touch these N ones.
2. The rest M PEBs you want to feed UBI.

(PEB = physical erase-block)

UBI works on top of MTD devices, or MTD partitions. So all you need is
to properly partition your NAND. Make sure your MTD partition which you
feed to UBI covers only those M PEBs.

E.g., you may have /dev/mtd0 which is "mapped" to the 1st N PEBs,
and /dev/mtd1 which is mapped to the rest. And then you attach /dev/mtd1
to UBI. UBI will touch only /dev/mtd1. People do this.

Simply speaking, UBI works on top of the MTD device you gave it. You are
free to partition your NAND chip as you wish.

P.S.: you may even have 2 NAND chips, create a striping layer on top of
them, expose them as one single "striped" MTD device, and feed that one
to UBI.

HTH.

But yes, you should take into account the points Wolfgang provided.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
