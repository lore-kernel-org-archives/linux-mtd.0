Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17nNDb-0007Me-00
	for <linux-mtd@lists.infradead.org>; Fri, 06 Sep 2002 18:48:31 +0100
Date: Fri, 6 Sep 2002 19:48:29 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Xiaogeng (Shawn) Jin" <xjin@redswitch.com>
Cc: Kenneth Johansson <kenneth.johansson@etx.ericsson.se>,
   Mtd <linux-mtd@lists.infradead.org>
Subject: Re: writing to jffs2 is so slow?
Message-ID: <20020906174829.GA3885@wohnheim.fh-wedel.de>
References: <3D77C812.3080108@redswitch.com> <1031314138.28700.167.camel@spawn> <3D78E270.6020203@redswitch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3D78E270.6020203@redswitch.com>
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

On Fri, 6 September 2002 10:14:24 -0700, Xiaogeng (Shawn) Jin wrote:
> >Maybe it's possible to do a format command that creates a disk that is
> >empty and prevents the jffs2 code to reformat every block.
> 
> A format command? What command formats MTD devices (my flash is NOR)? 
> Thanks.

Try eraseall from the utils.
With that, jffs2 just writes the erase markers to flash, 12 bytes per
erase block.

Jörn

-- 
Beware of bugs in the above code; I have only proved it correct, but
not tried it.
-- Donald Knuth
