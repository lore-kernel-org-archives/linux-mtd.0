Received: from josephine.discordia.ch ([193.246.253.137])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17MYvL-0007Yy-00
	for <linux-mtd@lists.infradead.org>; Mon, 24 Jun 2002 19:50:51 +0100
Date: Mon, 24 Jun 2002 20:50:49 +0200
From: Peter Keel <seegras@discordia.ch>
To: Ilguiz Latypov <ilatypov@superbt.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: GRUB on DoC Millennium/2000 - Instructions
Message-ID: <20020624185049.GA6519@discordia.ch>
References: <20020624154007.GA4825@discordia.ch> <Pine.LNX.4.44.0206241234100.9174-100000@server.superbt.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0206241234100.9174-100000@server.superbt.com>
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

* on the Mon, Jun 24, 2002 at 12:40:51PM -0400, Ilguiz Latypov wrote:
> The --enable-diskonchip-biosnetboot cat not sometime prevent BIOS from
> invoking the network boot code directly.  I observed this with an
> Advantech PCA 6753 board.

I only use --enable-diskonchip-2000. No netboot. 

> On Mon, 24 Jun 2002, Peter Keel wrote:
> 
> > I'm hoping. It was reiserfs, but now it'll be ext3.. I hope grub 
> > has no problems reading ext3 since its the same as ext2 anyway...
> > in principle.. ;)

I changed it to ext2. No avail. It just won't find anything on that
disk; all it says is "unknown filesystem type 0x83" when i set 
"root (hd0,0)", so I assume grub can read my partition table. Which
looks like this:

Disk /dev/hdc: 524 cylinders, 64 heads, 63 sectors/track
Units = sectors of 512 bytes, counting from 0

   Device Boot    Start       End  #sectors  Id  System
/dev/hdc1   *        63   2032127   2032065  83  Linux
/dev/hdc2       2032128   2112767     80640  82  Linux swap


Anyway. I was looking for those blocks:

debugfs:  stat vmlinuz-2.4.18 
Inode: 31810   Type: regular    Mode:  0644   Flags: 0x0   Generation: 4021347668
User:     0   Group:     0   Size: 1142751
File ACL: 0    Directory ACL: 0
Links: 1   Blockcount: 2240
Fragment:  Address: 0    Number: 0    Size: 0
ctime: 0x3d16ffac -- Mon Jun 24 13:17:00 2002
atime: 0x3d175b67 -- Mon Jun 24 19:48:23 2002
mtime: 0x3d154d99 -- Sun Jun 23 06:24:57 2002
BLOCKS:
(0-11):66038-66049, (IND):66050, (12-278):66051-66317
TOTAL: 280

But that doesn't seem to work either. 

"kernel (hd0,0)66038+280" does just nothing, namely
"Invalid or unsupported executable format" -- you always get that
when referencing to some bogus structure on the disk. Does grub
use other blocks than those? 

slowly I'm beginning to think I should subscribe to some 
grub-mailinglist. 

thank you anyway. 

Peter
-- 
Those who give up essential liberties for temporary safety deserve 
neither liberty nor safety. -- Benjamin Franklin
