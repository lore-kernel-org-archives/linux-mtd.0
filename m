Received: from pd9e416cf.dip.t-dialin.net ([217.228.22.207] helo=thomas.tec.autronix.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16aIDd-0008Tr-00
	for <linux-mtd@lists.infradead.org>; Mon, 11 Feb 2002 15:18:13 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Thomas Gleixner <gleixner@autronix.de>
Reply-To: gleixner@autronix.de
To: linux-mtd@lists.infradead.org
Subject: Re: NAND flash and JFFS(2)
Date: Mon, 11 Feb 2002 16:32:01 +0100
Cc: <jffs-dev@axis.com>
MIME-Version: 1.0
Message-Id: <02021116320106.00764@thomas>
Content-Transfer-Encoding: 8bit
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

On Monday, 11. February 2002 14:53, David Woodhouse wrote:
> Where's the ECC when we're using the SmartMedia format on them?

The layout for SmartMedia DOS for 256 byte pagesize:

Even page:
Byte 0-3	reserved area
Byte 4		data status flag
Byte 5		block status flag (bad block marker)
Byte 6-7	block adress 1

Odd page:
Byte 0-2 	ECC Area-2 (odd page)
Byte 3-4	Block Address 2
Byte 5-7	ECC Area-1 (even page)

The layout for SmartMedia DOS for 512 byte pagesize:
Byte 0-3	Reserved Area
Byte 4		Data Status Flag
Byte 5		block status flag (bad block marker)
Byte 6-7	Block Address-1
Byte 8-10 	ECC Area-2 (byte 256-511)
Byte 11-12	Block Address 2
Byte 13-15	ECC Area-1 (byte 0-255)

They build a virtual blocksize of 512 byte on the small devices. I thought
about doing the same, but IMHO it's not a good idea.

> Either way, you mustn't ever erase a block which is marked bad, right?

The datasheet says it's not allowed to do this, due to the fact, that you
loose bad block information and maybe you can't write the bad block info
again. So you would run always into this bad block after restart.

Sorry, as you see above, i had some trouble to count. The bad block status on
SmartMedia is not at Byte 6 it's at Byte 5. We want to keep it there, so we
have to split the ECC data on 512 byte devices.
SmartMedia and raw NAND 512 byte pagesize
Byte 0-3	ECC part 1
Byte 4		page data valid flag
Byte 5		bad block status
Byte 6-7 	ECC part 2
Byte 8-15	cleanmarker

SmartMedia and raw NAND 256 Byte pagesize
Byte 0-2	ECC
Byte 3-4	cleanmarker
Byte 5		bad block status
Byte 6		page data valid flag
Byte 7		spare

Please let me know, if we can fix this layout. Then i would implement and
test it.

> Cool. Does this leave some files on the fs and make lots of GC happen, and
> check the contents of all files on restart? Vipin's tests did this quite
> well, IIRC.

I have some files untouched on the fs. I check them with diff after reboot.
There was no failure.

> Now I suppose we need to look at using write_super and sb->s_dirt the way
> that God intended, for flushing pending writes in the wbuf rather than
> just triggering erases.

What do you mean exactly and what about the cleanup, when we fail during
flush_wbuf ?

Thomas
__________________________________________________
Thomas Gleixner, autronix automation GmbH
auf dem berg 3, d-88690 uhldingen-muehlhofen
fon: +49 7556 919891 , fax: +49 7556 919886
mail: gleixner@autronix.de, http://www.autronix.de  
