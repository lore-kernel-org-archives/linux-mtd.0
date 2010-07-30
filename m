Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OeiUv-0003xa-FO
	for linux-mtd@lists.infradead.org; Fri, 30 Jul 2010 05:51:10 +0000
Received: by eyd10 with SMTP id 10so569022eyd.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 29 Jul 2010 22:51:07 -0700 (PDT)
Subject: Re: changelog or bug database
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Khaled El Mously <kelmously@gmail.com>
In-Reply-To: <20100729204412.GB19054@kal-ix-axentra.axentra.com>
References: <20100729204412.GB19054@kal-ix-axentra.axentra.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 30 Jul 2010 08:51:03 +0300
Message-Id: <1280469064.2838.2.camel@localhost.localdomain>
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

On Thu, 2010-07-29 at 16:44 -0400, Khaled El Mously wrote:
> Hello.
> 
> I have a Marvell 88F6281 board that I'm using with a vendor-supplied kernel (actually, it's 2.6.31.8 + LSP 5.0.3).
> 
> I seem to be having some wear-leveling related issues. These problems don't happen when I use a 2.6.22.18 + LSP 4.2.7, which tells me that the hardware is fine.
> 
> I am interested in finding a bugzilla (or bugzilla-like) DB for any/all of MTD/UBI/UBIFS, or perhaps a changelog between the different kernel versions. I can't seem to find that.
> 
> I apologize if the answer is in plain sight somewhere.

Funny question :-) If you invest money and men-hours into creating and
maintaining such a database, we'd have one. But we do not have it :-)

git log will provide you the list of all changes. 

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
