Received: from smtp4-g21.free.fr ([212.27.42.4])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QJRGr-00037o-SP
	for linux-mtd@lists.infradead.org; Mon, 09 May 2011 14:17:15 +0000
From: Florian Fainelli <ffainelli@freebox.fr>
To: linux-mtd@lists.infradead.org,
 dedekind1@gmail.com
Subject: Re: [RFC] MTD: export more NAND-related informations to syfs
Date: Mon, 9 May 2011 16:21:38 +0200
References: <201105061728.20948.ffainelli@freebox.fr>
	<1304707173.7222.96.camel@localhost>
In-Reply-To: <1304707173.7222.96.camel@localhost>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <201105091621.38720.ffainelli@freebox.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Artem,

On Friday 06 May 2011 20:39:33 Artem Bityutskiy wrote:
> On Fri, 2011-05-06 at 17:28 +0200, Florian Fainelli wrote:
> > +       /* NAND related attributes */
> > +       const char *nand_type;
> > +       const char *nand_manufacturer;
> 
> Why other flashes cannot have type and manufacturer ?

You are right, I will add this for NOR and SPI Flashes. My RFC was more about 
whether it is granted to add new members to struct mtd_info to get 
informations 

Alternatively, would not it be better to have something like this:

/sys/class/mtd/...
   nand0/
       manufacturer
       type
       onfi/
          version
          jedec_id
          ...
    nor0/
       cfi/
          manufacturer
          id

This would allow us not to abuse the sysfs directory of a MTD partition to 
contain chip specific informations.
--
Florian
       
