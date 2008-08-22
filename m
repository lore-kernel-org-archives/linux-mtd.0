Received: from nf-out-0910.google.com ([64.233.182.189])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KWSFT-0001mf-74
	for linux-mtd@lists.infradead.org; Fri, 22 Aug 2008 08:43:59 +0000
Received: by nf-out-0910.google.com with SMTP id d21so266549nfb.22
	for <linux-mtd@lists.infradead.org>;
	Fri, 22 Aug 2008 01:43:57 -0700 (PDT)
Message-ID: <ac9c93b10808220143o27a769c6lbb37faaa68f6318d@mail.gmail.com>
Date: Fri, 22 Aug 2008 10:43:57 +0200
From: "Frans Meulenbroeks" <fransmeulenbroeks@gmail.com>
To: dedekind@infradead.org
Subject: Re: [PATCH] [MTD] [NAND] nand_ecc.c: adding support for 512 byte ecc
In-Reply-To: <1219385223.18027.105.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <19F8576C6E063C45BE387C64729E739403CD517C16@dbde02.ent.ti.com>
	<19F8576C6E063C45BE387C64729E739403CD517C1A@dbde02.ent.ti.com>
	<ac9c93b10808211139t69d3ce6euaac35368f1514931@mail.gmail.com>
	<19F8576C6E063C45BE387C64729E739403CD517C1B@dbde02.ent.ti.com>
	<1219385223.18027.105.camel@sauron>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Singh,
	Vimal" <vimalsingh@ti.com>, Woodhouse <dwmw2@infradead.org>,
	David@mgw-mx06.nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

@Vimal: I'll try to look at your patch this weekend (no time this evening)
Let me know if you want to handle the remarks from Artem (and come
with a new patch) or if you want me to handle them (there are maybe
one or two other small changes I want to make.

@David (dwmw2)
Please let me know what the preferred way to integrate this. I can
either provide a patch on top of Vimal' patch if needed, or I can add
my changes to it and submit a patch containing the work of both of us,
or I can send my changes as review comment to Vimal and let him make
the patch. What is the preferred way? (and I highly prefer a solution
where Vimal gets credit for his changes)

Frans.
