Received: from ptb-relay02.plus.net ([212.159.14.213])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CfK6G-0005oG-Fn
	for linux-mtd@lists.infradead.org; Fri, 17 Dec 2004 10:33:04 -0500
From: "Gareth Bult (Encryptec)" <Gareth@Encryptec.net>
To: Josh Boyer <jdub@us.ibm.com>
In-Reply-To: <1103288058.3018.4.camel@weaponx.rchland.ibm.com>
References: <1103152743.15913.33.camel@squizzey.bult.co.uk>
	<41C0D3AC.3050801@us.ibm.com>
	<1103158974.15929.37.camel@squizzey.bult.co.uk>
	<1103201631.25765.7.camel@weaponx.rchland.ibm.com>
	<1103232128.15927.70.camel@squizzey.bult.co.uk>
	<41C1FDFF.3020308@us.ibm.com>
	<1103233669.15929.81.camel@squizzey.bult.co.uk>
	<1103288058.3018.4.camel@weaponx.rchland.ibm.com>
Content-Type: text/plain
Date: Fri, 17 Dec 2004 15:33:31 +0000
Message-Id: <1103297611.15917.184.camel@squizzey.bult.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 mount time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Fri, 2004-12-17 at 06:54 -0600, Josh Boyer wrote:

> Hm, ok.  An alternative to using the system buffer would be to make
> JFFS[23] use a write buffer for those devices.  

Forgive my ignorance .. but what's the difference between using a write
buffer and using the system buffer ?

>From my pov, the system buffer is there, already 100% reliable and
somewhat larger than any [potential] write buffer ???

(Given the system buffer uses the underlying block devices read / write
routines and the block device emulator will typically sit on a block
device such as a hard drive or USB flash key .. [?])

> It's already done on
> NAND which has some special handling.  The support for ECC'd NOR
> probably matches more closely what you'd want to do.  Take a look at
> wbuf.c.

Mmm, after looking at wbuf.c I'm none the wiser as to what it does or
how it relates ..

> Well, if it's better than the original we can always take yours and
> replace what's there.  Send it on, performance gains are always
> welcome.  I'm sure there are others interested in what you've done that
> will review the code.

I think once I get this FL release out the way I'll have a a more
in-depth look at JFFS*. It seems to be written almost exclusively for
MTD devices .. which is great .. for MTD devices .. but for block
devices and flash (USB for example) presented through a standard
interface (SCSI for example) it seems there is scope for a much
"thinner" filesystem generic devices with a subset of JFFS's feature
set.

Gareth.
