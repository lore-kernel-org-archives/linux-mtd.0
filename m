Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17nOFM-0007Ug-00
	for <linux-mtd@lists.infradead.org>; Fri, 06 Sep 2002 19:54:24 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3D78F4A1.4060304@redswitch.com> 
References: <3D78F4A1.4060304@redswitch.com>  <3D77C812.3080108@redswitch.com> <1031314138.28700.167.camel@spawn> <3D78E270.6020203@redswitch.com> <20020906174829.GA3885@wohnheim.fh-wedel.de> 
To: "Xiaogeng (Shawn) Jin" <xjin@redswitch.com>
Cc: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>,
    Kenneth Johansson <kenneth.johansson@etx.ericsson.se>,
    Mtd <linux-mtd@lists.infradead.org>
Subject: Re: writing to jffs2 is so slow? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 06 Sep 2002 19:54:15 +0100
Message-ID: <29521.1031338455@redhat.com>
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

xjin@redswitch.com said:
> > Try eraseall from the utils.
> > With that, jffs2 just writes the erase markers to flash, 12 bytes per
> > erase block.

No, JFFS2 cannot trust that 'empty' blocks really have been properly 
erased, and must erase them again, writing a 'cleanmarker' node to them 
when the erase is complete.

> Well, that's just what I did. Then making a first directory takes 2
> minutes. 

JFFS2 is busy erasing every block on the file system. You have to wait 
until it's done before you can write.

Hacking the 'eraseall' program so it writes a 'cleanmarker' node to the 
beginning of every block erased is left as an exercise for the reader.

Other possibilities include a mount time option to tell JFFS2 that it 
should trust the flash and not re-erase the blocks, and/or changing the 
jffs2_write_super()/jffs2_erase_pending_blocks() to only erase a few blocks 
at a time, so you only have to wait for a few blocks to be erased, not the 
whole flash.


--
dwmw2
