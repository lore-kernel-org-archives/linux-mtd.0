Received: from maile.telia.com ([194.22.190.16])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17nQTg-0007qn-00
	for <linux-mtd@lists.infradead.org>; Fri, 06 Sep 2002 22:17:21 +0100
Message-ID: <002501c255eb$35c56680$0200a8c0@telia.com>
From: "Joakim Tjernlund" <Joakim.Tjernlund@lumentis.se>
To: "David Woodhouse" <dwmw2@infradead.org>,
   "Xiaogeng \(Shawn\) Jin" <xjin@redswitch.com>
Cc: "Jörn Engel" <joern@wohnheim.fh-wedel.de>,
   "Kenneth Johansson" <kenneth.johansson@etx.ericsson.se>,
   "Mtd" <linux-mtd@lists.infradead.org>
References: <3D78F4A1.4060304@redswitch.com>  <3D77C812.3080108@redswitch.com> <1031314138.28700.167.camel@spawn> <3D78E270.6020203@redswitch.com> <20020906174829.GA3885@wohnheim.fh-wedel.de>  <29521.1031338455@redhat.com>
Subject: Re: writing to jffs2 is so slow? 
Date: Fri, 6 Sep 2002 23:20:22 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

----- Original Message -----
From: "David Woodhouse" <dwmw2@infradead.org>
To: "Xiaogeng (Shawn) Jin" <xjin@redswitch.com>
Cc: "Jörn Engel" <joern@wohnheim.fh-wedel.de>; "Kenneth Johansson" <kenneth.johansson@etx.ericsson.se>; "Mtd"
<linux-mtd@lists.infradead.org>
Sent: den 6 september 2002 20:54
Subject: Re: writing to jffs2 is so slow?


>
> xjin@redswitch.com said:
> > > Try eraseall from the utils.
> > > With that, jffs2 just writes the erase markers to flash, 12 bytes per
> > > erase block.
>
> No, JFFS2 cannot trust that 'empty' blocks really have been properly
> erased, and must erase them again, writing a 'cleanmarker' node to them
> when the erase is complete.
>
> > Well, that's just what I did. Then making a first directory takes 2
> > minutes.
>
> JFFS2 is busy erasing every block on the file system. You have to wait
> until it's done before you can write.

I think that can be fixed(or at least better). Instead of eraseing all blocks first and
then write cleanmarker to those blocks, make it erase one block and write
cleanmarker erase the next block and write it's cleanmarker and so on.

That way you will free up erase blocks as they become ready and you don't have to watch
the use % in df slowly raise to 100% and the suddenly drop to the real usage.

   Jocke
