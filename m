Received: from pd9eb9f79.dip.t-dialin.net ([217.235.159.121] helo=thomas.tec.autronix.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16cPVm-0001YQ-00
	for <linux-mtd@lists.infradead.org>; Sun, 17 Feb 2002 11:29:43 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Thomas Gleixner <gleixner@autronix.de>
Reply-To: gleixner@autronix.de
To: David Woodhouse <dwmw2@infradead.org>, gleixner@autronix.de
Subject: Re: JFFS2 & NAND
Date: Sun, 17 Feb 2002 12:44:02 +0100
Cc: linux-mtd@lists.infradead.org, jffs-dev@axis.com
References: <02021418433508.29375@thomas> <1035.1013707668@redhat.com> <7814.1013939475@redhat.com>
In-Reply-To: <7814.1013939475@redhat.com>
MIME-Version: 1.0
Message-Id: <02021712440204.08654@thomas>
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

On Sunday, 17. February 2002 10:51, David Woodhouse wrote:
> gleixner@autronix.de said:
> > I implemented a new structure into nand_chip structure, which
> > describes the  usage of the oob area. You can read and modify this
> > structure from the  filesystem driver via two functions, which i have
> > implemented into the mtd  structure. (get_oobcfg, set_oobcfg).
>
> I'm slightly concerned that this may be overkill. The JFFS2 code has to
> recognise certain types of hardware and arrange its own data in the spare
> area accordingly. Does it really need to make that information available,
> or just do its own thing? Is the existing mtd->{oobblock,oobsize,ecctype}
> really not sufficient?
No. Both the chip layer e.g. NAND, DOC, or something else and every 
filesystem layer has to know about the arrangement of the oob data. Maybe we 
could reduce the information to a filesystem type and define the oob-layout 
as constants in a .h file. That would be less overhead but gives the 
flexibility for both chip and filesystem driver to use free oob layouts.
It would be not a big hack to rearrange it that way.

> OK, let's work on getting your current changes merged, then we can deal
> with the wbuf_flush failure handling. Can you send me a patch against the
> current CVS tree -- I don't think I've changed anything on the
> jffs2-nand-branch recently (since the 5th of February in fact).
Comes along, if we have fixed above question.
 
Thomas
__________________________________________________
Thomas Gleixner, autronix automation GmbH
auf dem berg 3, d-88690 uhldingen-muehlhofen
fon: +49 7556 919891 , fax: +49 7556 919886
mail: gleixner@autronix.de, http://www.autronix.de  
