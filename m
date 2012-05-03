Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SQ03k-0003jb-AA
 for linux-mtd@lists.infradead.org; Thu, 03 May 2012 17:43:22 +0000
Received: by lbbgg6 with SMTP id gg6so1784732lbb.36
 for <linux-mtd@lists.infradead.org>; Thu, 03 May 2012 10:43:17 -0700 (PDT)
Date: Thu, 3 May 2012 20:43:07 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Subject: Re: [PATCH v4 01/10] mtd: nand: add 'oob_required' argument to NAND
 {read, write}_page interfaces
Message-ID: <20120503204307.6d93115d@halley>
In-Reply-To: <4FA2BD85.1050102@newsguy.com>
References: <1335978904-8005-1-git-send-email-computersforpeace@gmail.com>
 <1335978904-8005-2-git-send-email-computersforpeace@gmail.com>
 <4FA2BD85.1050102@newsguy.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Li Yang <leoli@freescale.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Lei Wen <leiwen@marvell.com>, Kevin Cernekee <cernekee@gmail.com>,
 Wolfram Sang <w.sang@pengutronix.de>,
 Matthieu CASTET <matthieu.castet@parrot.com>,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 Bastian Hecht <hechtb@googlemail.com>, Jiandong Zheng <jdzheng@broadcom.com>,
 Florian Fainelli <ffainelli@freebox.fr>, Scott Wood <scottwood@freescale.com>,
 Jamie Iles <jamie@jamieiles.com>, Thomas Gleixner <tglx@linutronix.de>,
 Brian Norris <computersforpeace@gmail.com>,
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

Hi Mike,

On Thu, 03 May 2012 10:16:53 -0700 Mike Dunn <mikedunn@newsguy.com> wrote:
> I wonder why the new argument type is int instead of bool.  Sorry if this was
> already discussed... I didn't follow the earlier discussions very closely.

Well, Brian's initial post correctly had a 'bool' parameter in the
suggested interface.

I pointed out that within MTD code, 'int' is very widely used to
indicate boolean types, so I suggested changing to 'int' for consistency
with all other MTD interfaces.

> Still, it seems inconsistent.  When calling the functions, you sometimes pass
> the bool form...
> 
> > -	status = docg4_read_page(mtd, nand, buf, DOCG4_FACTORY_BBT_PAGE);
> > +	status = docg4_read_page(mtd, nand, buf, false, DOCG4_FACTORY_BBT_PAGE);
> 
> and sometimes the int form...
> 
> > -	chip->ecc.read_page_raw(mtd, chip, buf, page);
> > +	chip->ecc.read_page_raw(mtd, chip, buf, 1, page);

I guess the 'true/false' arguments are leftovers from Brian's previous
posts...

I noted these while reviewing, and personally don't mind them, but I
guess '0/1' are more appropriate.

Regards,
Shmulik
