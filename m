Received: from pd953ab5d.dip.t-dialin.net ([217.83.171.93] helo=thomas.tec.autronix.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16cjFb-0002gz-00
	for <linux-mtd@lists.infradead.org>; Mon, 18 Feb 2002 08:34:20 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Thomas Gleixner <gleixner@autronix.de>
Reply-To: gleixner@autronix.de
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS2 & NAND
Date: Mon, 18 Feb 2002 09:48:11 +0100
Cc: linux-mtd@lists.infradead.org, jffs-dev@axis.com
References: <02021712440204.08654@thomas> <21587.1013966739@redhat.com> <02021720360705.08654@thomas>
In-Reply-To: <02021720360705.08654@thomas>
MIME-Version: 1.0
Message-Id: <02021809481101.00860@thomas>
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

> On Sunday, 17. February 2002 18:25, David Woodhouse wrote:
> > I'd actually like to overhaul all the oob and ecc stuff in the mtd_info
> > structure - I don't like any of it very much. If we can make do with the
> > existing API for a while longer, then we can give some serious thought to
> > its replacement.
Would it be ok to use a CONFIG option to tell the chip device driver which 
OOB configuration to use ?
-- 
Thomas
__________________________________________________
Thomas Gleixner, autronix automation GmbH
auf dem berg 3, d-88690 uhldingen-muehlhofen
fon: +49 7556 919891 , fax: +49 7556 919886
mail: gleixner@autronix.de, http://www.autronix.de  
