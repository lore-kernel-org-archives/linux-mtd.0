Received: from pd9eb9c7b.dip.t-dialin.net ([217.235.156.123] helo=thomas.tec.autronix.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 179Lyi-0002rX-00
	for <linux-mtd@lists.infradead.org>; Sun, 19 May 2002 09:23:45 +0100
Message-Id: <200001121137.e0CBbMR01569@thomas.tec.autronix.de>
Content-Type: text/plain;
  charset="iso-8859-1"
From: Thomas Gleixner <gleixner@autronix.de>
Reply-To: gleixner@autronix.de
To: Yong-iL Joh <tolkien@mizi.com>, Studying MTD <studying_mtd@yahoo.com>
Subject: Re: FAT for NAND Flash
Date: Wed, 12 Jan 2000 12:37:21 +0100
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
References: <20020516144608.86328.qmail@web21509.mail.yahoo.com> <hbvg9m9gs5.fsf@tolkien.mizi.com>
In-Reply-To: <hbvg9m9gs5.fsf@tolkien.mizi.com>
MIME-Version: 1.0
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

On Saturday, 18. May 2002 07:16, Yong-iL Joh wrote:
> Studying MTD <studying_mtd@yahoo.com> writes:
> > If i want to use FAT with NAND then i have to use :-
> >
> > A. FAT: filesystem driver
> > B. Translation: Translation layer
> > C. MTD: Memory Technology Devices driver
> > D. NAND: generic NAND driver
> > E. Hardware specific driver
> >
> > So i have to add only Translation layer, rest layers
> > will remain same.
> >
> > Am i right ? If not, please correct me.
> >
> > How can i write traslation layer , any reference.
>
> IMHO, you're right.
> we have implemented this way for SMC(SmartMedia Card). :)
>
> but, we can't use current MTD's nand.c because of different usage of OOB.
> we called SMCTL as "B. Translation".

The usage of OOB data in nand.c is configurable. So you could use it for 
SmartMedia-FAT too.

-- 
Thomas
___________________________________
autronix automation GmbH
http://www.autronix.de gleixner@autronix.de
