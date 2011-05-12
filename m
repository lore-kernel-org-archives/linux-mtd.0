Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QKSks-0000sg-KB
	for linux-mtd@lists.infradead.org; Thu, 12 May 2011 10:04:27 +0000
Received: by ewy3 with SMTP id 3so444460ewy.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 May 2011 03:04:24 -0700 (PDT)
Subject: Re: [RFC] MTD: export more NAND-related informations to syfs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Florian Fainelli <ffainelli@freebox.fr>
In-Reply-To: <201105091621.38720.ffainelli@freebox.fr>
References: <201105061728.20948.ffainelli@freebox.fr>
	<1304707173.7222.96.camel@localhost>
	<201105091621.38720.ffainelli@freebox.fr>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 12 May 2011 13:01:03 +0300
Message-ID: <1305194463.2713.79.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-05-09 at 16:21 +0200, Florian Fainelli wrote:
> Hello Artem,
> 
> On Friday 06 May 2011 20:39:33 Artem Bityutskiy wrote:
> > On Fri, 2011-05-06 at 17:28 +0200, Florian Fainelli wrote:
> > > +       /* NAND related attributes */
> > > +       const char *nand_type;
> > > +       const char *nand_manufacturer;
> > 
> > Why other flashes cannot have type and manufacturer ?
> 
> You are right, I will add this for NOR and SPI Flashes. My RFC was more about 
> whether it is granted to add new members to struct mtd_info to get 
> informations 


struct mtd_info describes an mtd device. Things, which are common for
all mtd devices should be there, I think.

> Alternatively, would not it be better to have something like this:
> 
> /sys/class/mtd/...
>    nand0/
>        manufacturer
>        type
>        onfi/
>           version
>           jedec_id
>           ...
>     nor0/
>        cfi/
>           manufacturer
>           id
> 
> This would allow us not to abuse the sysfs directory of a MTD partition to 
> contain chip specific informations.

Why do you call it "abuse" and why is it better to "abuse" the directory
common to all MTD devices comparing to the directory of the specific MTD
device? :-)

I think that everything related to mtdX has to be in the mtdX
subdirectory.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
