Received: from sis.com.tw ([203.67.208.2] helo=maillog.sis.com.tw)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14zpMh-0008O3-00
	for <linux-mtd@lists.infradead.org>; Wed, 16 May 2001 01:40:36 +0100
Message-ID: <3B01CAFE.5397FA91@sis.com.tw>
Date: Wed, 16 May 2001 08:34:06 +0800
From: Ollie Lho <ollie@sis.com.tw>
MIME-Version: 1.0
To: Felix Radensky <felix@allot.com>
CC: Linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: DOC problems on PowerPC
References: <3AFFE80B.DCE1B139@allot.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

Felix Radensky wrote:
> 
> Hi, all
> 
> I was able to solve the DOC problems on PowerPC I've reported yesterday.
> 
> All I had to do is to run "eraseall /dev/mtd0", then run "nftl_format
> /dev/mtd0"
> and  then create partitions with fdisk.
> 
> Can someone please explain me the difference between eraseall and
> nftl_format.
> HOWTO says nothing about it.
> 

For flash devices either NOR type or NAND type. You can only turn
each bits for 1 state to 0 by a "write" command. If you want to
turn a bit from 0 to 1, you have to erase the device. Each device
has its onw minimal erase size i.e. if you want to erase onely 1 byte
in a erase region, you have to erase the whole erase region.

The nftl_format is used somewht like "low-level" format for old
HDs. 

Ollie
