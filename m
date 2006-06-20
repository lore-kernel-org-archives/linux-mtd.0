Received: from mail.sanpeople.com ([196.41.13.122] helo=za-gw.sanpeople.com)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FsaZ0-0002rF-7D
	for linux-mtd@lists.infradead.org; Tue, 20 Jun 2006 03:22:27 -0400
Subject: Re: [PATCH] AT91RM9200 NAND support
From: Andrew Victor <andrew@sanpeople.com>
To: tglx@linutronix.de
In-Reply-To: <1150787336.6780.102.camel@localhost.localdomain>
References: <1150786454.15581.289.camel@fuzzie.sanpeople.com>
	<1150787336.6780.102.camel@localhost.localdomain>
Content-Type: text/plain
Message-Id: <1150787823.15614.297.camel@fuzzie.sanpeople.com>
Mime-Version: 1.0
Date: 20 Jun 2006 09:17:04 +0200
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi Thomas,

> As I pointed out in my previous mail, the driver needs to be updated to
> work with the latest changes in the nand driver.

I didn't see that message - haven't been following the MTD mailing list
lately.


> > +/*
> > + * Hardware specific access to control-lines
> > + */
> > +static void at91_nand_hwcontrol(struct mtd_info *mtd, int cmd)
> 
> This function needs to be adjusted.

Some hints of how it should be adjusted would be useful.
(I don't actually have NAND hardware to test it with).


> If you error out after a sucessful nand_scan() - i.e. chip was detected
> - you have to call nand_release(). nand_scan() allocates memory which
> gets freed inside nand_release()

OK, will add calls to nand_release().



Regards,
  Andrew Victor
