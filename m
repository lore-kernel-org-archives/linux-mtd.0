Received: from pd9eb897f.dip.t-dialin.net ([217.235.137.127] helo=thomas.tec.autronix.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16cWsb-000201-00
	for <linux-mtd@lists.infradead.org>; Sun, 17 Feb 2002 19:21:45 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Thomas Gleixner <gleixner@autronix.de>
Reply-To: gleixner@autronix.de
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS2 & NAND
Date: Sun, 17 Feb 2002 20:36:07 +0100
Cc: linux-mtd@lists.infradead.org, jffs-dev@axis.com
References: <02021712440204.08654@thomas> <7814.1013939475@redhat.com> <21587.1013966739@redhat.com>
In-Reply-To: <21587.1013966739@redhat.com>
MIME-Version: 1.0
Message-Id: <02021720360705.08654@thomas>
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

On Sunday, 17. February 2002 18:25, David Woodhouse wrote:
> gleixner@autronix.de said:
> > Maybe we  could reduce the information to a filesystem type and define
> > the oob-layout  as constants in a .h file. That would be less overhead
> > but gives the  flexibility for both chip and filesystem driver to use
> > free oob layouts. It would be not a big hack to rearrange it that way.
>
> I think that might be best. After all, there are only a limited number of
> such arrangements.
>
> I'd actually like to overhaul all the oob and ecc stuff in the mtd_info
> structure - I don't like any of it very much. If we can make do with the
> existing API for a while longer, then we can give some serious thought to
> its replacement.
I looked for the usage of eectype in MTD. There's only nand.c, which writes a 
value to this field. We could use a OR-value for the oob-configuration and 
use this field for our oob-layout selection.
 
Thomas
__________________________________________________
Thomas Gleixner, autronix automation GmbH
auf dem berg 3, d-88690 uhldingen-muehlhofen
fon: +49 7556 919891 , fax: +49 7556 919886
mail: gleixner@autronix.de, http://www.autronix.de  
