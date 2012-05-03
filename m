Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SPzeV-0002uy-2X
 for linux-mtd@lists.infradead.org; Thu, 03 May 2012 17:17:15 +0000
Message-ID: <4FA2BD85.1050102@newsguy.com>
Date: Thu, 03 May 2012 10:16:53 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v4 01/10] mtd: nand: add 'oob_required' argument to NAND
 {read, write}_page interfaces
References: <1335978904-8005-1-git-send-email-computersforpeace@gmail.com>
 <1335978904-8005-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1335978904-8005-2-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <dedekind1@gmail.com>, Lei Wen <leiwen@marvell.com>,
 Kevin Cernekee <cernekee@gmail.com>, Bastian Hecht <hechtb@googlemail.com>,
 Wolfram Sang <w.sang@pengutronix.de>,
 Matthieu CASTET <matthieu.castet@parrot.com>,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Jiandong Zheng <jdzheng@broadcom.com>, Florian Fainelli <ffainelli@freebox.fr>,
 Scott Wood <scottwood@freescale.com>, Jamie Iles <jamie@jamieiles.com>,
 Thomas Gleixner <tglx@linutronix.de>, Li Yang <leoli@freescale.com>,
 David Woodhouse <dwmw2@infradead.org>, Axel Lin <axel.lin@gmail.com>,
 Prabhakar Kushwaha <prabhakar@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

I wonder why the new argument type is int instead of bool.  Sorry if this was
already discussed... I didn't follow the earlier discussions very closely.

Still, it seems inconsistent.  When calling the functions, you sometimes pass
the bool form...


> -	status = docg4_read_page(mtd, nand, buf, DOCG4_FACTORY_BBT_PAGE);
> +	status = docg4_read_page(mtd, nand, buf, false, DOCG4_FACTORY_BBT_PAGE);


and sometimes the int form...


> -	chip->ecc.read_page_raw(mtd, chip, buf, page);
> +	chip->ecc.read_page_raw(mtd, chip, buf, 1, page);


I think inconsistency can be confusing.

Aside from that, you can add my Acked-by for the docg4 driver if you like.

Thanks,
Mike
