Received: from anchor-post-32.mail.demon.net ([194.217.242.90])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AvwBH-0007RH-F6
	for linux-mtd@lists.infradead.org; Wed, 25 Feb 2004 10:22:19 +0000
From: "" <simon@baydel.com>
To: dwmw2@infradead.org
Date: Wed, 25 Feb 2004 09:49:55 -0000
MIME-Version: 1.0
Message-ID: <403C6FC3.1941.DDC08@localhost>
In-reply-to: <1077645958.7826.599.camel@hades.cambridge.redhat.com>
References: <6A03D4BC2018@baydel.com>
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body
cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 Corruption.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 24 Feb 2004 at 18:05, David Woodhouse wrote:

> On Tue, 2004-02-24 at 17:05 +0000, Simon Haynes wrote:
> > Would you recommend changing the printk for the "Empty Flash"
> > messages to a different level and using the ramdisk as a permanent
> > solution ?
> 
> Changing the printk level for the 'Empty Flash' messages does seem
> appropriate -- or preferably finding a way to eliminate the ones which

Yesteday I managed to reproduce the problem using /dev/ram. The first message I 
noticed was

jffs2_get_inode_nodes(): Data CRC failed on node at 0x00050748: Read
0x0b5da171, calculated 0xb1b1dbb

This happened some time after the kernel mounted root. On following reboots this 
message was not displayed but I did get one

jffs2_scan_dirent_node(): Node CRC failed on node at 0x0046a7f0 
read 0xffffffff calculated 0xdec8161b

message. 

As I do mount read only on shutdown I assume this is corruption ?

Cheers

Simon.




__________________________

Simon Haynes - Baydel 
Phone : 44 (0) 1372 378811
Email : simon@baydel.com
__________________________
