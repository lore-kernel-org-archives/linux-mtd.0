Received: from [78.46.68.141] (helo=eristoteles.iwoars.net)
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SJlB6-0005Qw-Lj
 for linux-mtd@lists.infradead.org; Mon, 16 Apr 2012 12:37:09 +0000
Date: Mon, 16 Apr 2012 14:37:06 +0200 (CEST)
From: Joel Reardon <joel@clambassador.com>
To: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: mtdchar kernel oops
In-Reply-To: <20120415215355.GS6589@ZenIV.linux.org.uk>
Message-ID: <alpine.DEB.2.00.1204161329200.21808@eristoteles.iwoars.net>
References: <alpine.DEB.2.00.1204151350450.13924@eristoteles.iwoars.net>
 <20120415153220.GR6589@ZenIV.linux.org.uk>
 <alpine.DEB.2.00.1204151951560.16000@eristoteles.iwoars.net>
 <20120415215355.GS6589@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The troubled asm pair corresponds to this line:
this_cpu_add(mnt->mnt_pcp->mnt_count, n) in  the inline mnt_add_count().
So I suppose that perhaps either mnt is bad, or mnt_pcp is bad.

I'm using nandsim to simulate the mtd device. Steps are simple, load the
modules:
nand_ecc nand nand_ids mtd  mtd_blkdevs mtdblock mtdchar
nandsim first_id_byte=0x20 second_id_byte=0xa5 third_id_byte=0x00 fourth_id_byte=0x15 parts=0xa40 rptwear=1000

then `ubiformat /dev/mtd0` does the oops.

>
> Could you add printk into mtdchar_open(), dumping mnt and count values
> right after simple_pin_fs() call?
>

It oopses before it returns from the simple_pin_fs call, so that won't be
possible...

Cheers,
Joel
