Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Ma2gr-0002e1-6c
	for linux-mtd@lists.infradead.org; Sun, 09 Aug 2009 07:19:41 +0000
Subject: Re: [PATCH V5 1/2] Nand driver for Nomadik 8815 SoC (on NHK8815 board)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Alessandro Rubini <rubini-list@gnudd.com>
In-Reply-To: <20090809070331.GA26631@mail.gnudd.com>
References: <4A7E7026.3020806@gmail.com> <cover.1248434635.git.rubini@unipv.it>
	<ce9ab5790907240510y752885b9m2debac82bbdd7401@mail.gmail.com>
	<20090724123750.GA25563@mail.gnudd.com>
	<ce9ab5790907262328w24946e69wbb2c7977a93aa982@mail.gmail.com>
	<ce9ab5790907270146q6c113aa0qdfee50dea2cf9f2b@mail.gmail.com>
	<20090809070331.GA26631@mail.gnudd.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 09 Aug 2009 10:17:46 +0300
Message-Id: <1249802266.9157.61.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux@arm.linux.org.uk, vimal.newwork@gmail.com,
	andrea.gallo@stericsson.com, STEricsson_nomadik_linux@list.st.com,
	linux-mtd@lists.infradead.org, dwmw2@infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2009-08-09 at 09:03 +0200, Alessandro Rubini wrote:
> >> http://patchwork.ozlabs.org/patch/13697/
> > 
> > It is in l2-mtd-2.6.git now.
> 
> Great!

Well, this only means that the MTD maintainer will take it later
into the mtd-2.6.git, and merge upstream during the next merge
window.

> Now, what are the steps to have Nomadik Nand and OneNand merged?

I guess you could send stand-alone patches, and I can put them to
my tree as well, and let dwmw2 pick them later.

> Are they going to appear in a tree (which one? I think rmk, since it's
> the only one with Nomadik files in), or should I resubmit to mtd after
> base arch is merged from rmk?

It is up to dwmw2 and rmk, they are the corresponding maintainers.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
