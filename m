Received: from moutng.kundenserver.de ([212.227.126.186])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1J0fOC-0006dr-Q5
	for linux-mtd@lists.infradead.org; Fri, 07 Dec 2007 15:45:28 +0000
From: Stefan Roese <sr@denx.de>
To: linux-mtd@lists.infradead.org
Subject: Re: AMCC NAND controller driver in 2.6.17
Date: Fri, 7 Dec 2007 16:45:15 +0100
References: <3adeeb410712070704g7c09e4aeyb81724f15f93b4af@mail.gmail.com>
In-Reply-To: <3adeeb410712070704g7c09e4aeyb81724f15f93b4af@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200712071645.15697.sr@denx.de>
Cc: Ramesh <sramesh23@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 07 December 2007, Ramesh wrote:
> I am using the AMCC PPC 440-EPX board and linux 2.6.17 kernel. The
> driver for the built-in NAND controller seems to be the file
> sequoia_nand.c. Has anyone seen this working?

No, I don't remember such a driver. Or at least I can't remember seeing it.

> I am not sure it 
> programs the EBC registers correctly. Is there a working version of a
> driver for the NAND controller? I see ndfc.c in 2.6.19 kernel but I
> can't switch kernels yet. Any help is appreciated.

The ndfc is what you want. If you can't use a recent kernel version, then you 
have to backport this driver to your kernel version.

Best regards,
Stefan

=====================================================================
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office@denx.de
=====================================================================
