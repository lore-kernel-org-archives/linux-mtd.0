Received: from [80.190.106.10] (helo=taytron.net)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1ApnH0-0006W0-8k
	for linux-mtd@lists.infradead.org; Sun, 08 Feb 2004 11:38:50 +0000
From: Florian Schirmer <jolt@tuxbox.org>
To: David Woodhouse <dwmw2@infradead.org>
Date: Sun, 8 Feb 2004 12:38:44 +0100
References: <007301c3ebea$29f96270$9602010a@jingle>
	<1076236627.12587.212.camel@imladris.demon.co.uk>
In-Reply-To: <1076236627.12587.212.camel@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <200402081238.45099.jolt@tuxbox.org>
cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 corruption
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> > i'm having a strange problem with a JFFS2 filesystem: I always get
> > messages about incorrect CRC values while mounting the filesystem. What i
> > did:
>
> Please set CONFIG_JFFS2_FS_DEBUG=1, then reproduce this with full
> logging -- you'll need to do it over a serial console to make sure you
> catch everything.

Thanks for your suggestion. I'm a little bit further finding this problem. It 
turns out to be a cmdset2 issue and not a jffs2 problem. I'm still digging 
what is going on.

What i've got so far is: jffs2_read_flash returns bogous data. In the case of 
a bad crc the last odd byte is wrong. Looks like a byte access instead of a 
word access. (Buswidth of the flash: 2)  If you look at this:

<7>Node at 000bfbd4 (0) is a data node
<7>version 269, highest_version now 274
<4>crc'ing unpointed
<4>Node data dump (66 bytes)
<4>0x0000: 0x78 (0x78)
<4>0x0001: 0x5E (0x5E)
<4>0x0002: 0x72 (0x72)
<4>0x0003: 0x72 (0x72)
<4>0x0004: 0x1A (0x1A)
<4>0x0005: 0x05 (0x05)
<4>0x0006: 0xA3 (0xA3)
<4>0x0007: 0x21 (0x21)
<4>0x0008: 0x30 (0x30)
<4>0x0009: 0x1A (0x1A)
<4>0x000A: 0x02 (0x02)
<4>0x000B: 0xC3 (0xC3)
<4>0x000C: 0x31 (0x31)
<4>0x000D: 0x04 (0x04)
<4>0x000E: 0x00 (0x00)
<4>0x000F: 0x02 (0x02)
<4>0x0010: 0x68 (0x68)
<4>0x0011: 0xD4 (0xD4)
<4>0x0012: 0x4F (0x4F)
<4>0x0013: 0xA3 (0xA3)
<4>0x0014: 0x21 (0x21)
<4>0x0015: 0x30 (0x30)
<4>0x0016: 0x1A (0x1A)
<4>0x0017: 0x02 (0x02)
<4>0x0018: 0xC3 (0xC3)
<4>0x0019: 0x23 (0x23)
<4>0x001A: 0x04 (0x04)
<4>0x001B: 0x00 (0x00)
<4>0x001C: 0x02 (0x02)
<4>0x001D: 0x68 (0x68)
<4>0x001E: 0xD4 (0xD4)
<4>0x001F: 0x17 (0x17)
<4>0x0020: 0xA3 (0xA3)
<4>0x0021: 0x21 (0x21)
<4>0x0022: 0x30 (0x30)
<4>0x0023: 0x1A (0x1A)
<4>0x0024: 0x02 (0x02)
<4>0x0025: 0x43 (0x43)
<4>0x0026: 0x36 (0x36)
<4>0x0027: 0x04 (0x04)
<4>0x0028: 0x00 (0x00)
<4>0x0029: 0x02 (0x02)
<4>0x002A: 0x68 (0x68)
<4>0x002B: 0xD4 (0xD4)
<4>0x002C: 0xE1 (0xE1)
<4>0x002D: 0xA3 (0xA3)
<4>0x002E: 0x21 (0x21)
<4>0x002F: 0x30 (0x30)
<4>0x0030: 0x1A (0x1A)
<4>0x0031: 0x02 (0x02)
<4>0x0032: 0x43 (0x43)
<4>0x0033: 0x29 (0x29)
<4>0x0034: 0x04 (0x04)
<4>0x0035: 0x00 (0x00)
<4>0x0036: 0x02 (0x02)
<4>0x0037: 0x68 (0x68)
<4>0x0038: 0x84 (0x84)
<4>0x0039: 0xB8 (0xB8)
<4>0x003A: 0x15 (0x15)
<4>0x003B: 0x20 (0x20)
<4>0x003C: 0xC0 (0xC0)
<4>0x003D: 0x00 (0x00)
<4>0x003E: 0x0F (0x0F)
<4>0x003F: 0x3C (0x3C)
<4>0x0040: 0x20 (0x20)
<4>0x0041: 0x20 (0x3D)
<5>jffs2_get_inode_nodes(): Data CRC failed on node at 0x000bfbd4: Read 
0xc073b413, calculated 0xa375d8ca
<7>Obsoleting previously unchecked node at 0x000bfbd4 of len 88: Dirtying

you will see that the last byte (offset 0x41) mirrors byte at offset 0x40. So 
i suspect a bug in the cmdset2 driver here. The third value is the value 
received by directly accessing the flash using the memory address and is 
always correct. If the node data size is odd then the 2nd byte from behind is 
affected:

<4>0x002F: 0x0F (0x0F)
<4>0x0030: 0x3C (0x3C)
<4>0x0031: 0x3C (0x20)
<4>0x0032: 0x3D (0x3D)

Am still collecting patterns to determine wether it is really a bug in the mtd 
core or just a cache issue or whatever.

BTW: Is %zd a leagal printk formatting tag? Doesn't seem to work for me. I can 
commit a fix (removing the z) for that if you want.

Regards,
   Florian
