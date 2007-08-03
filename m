Received: from smtp35.poczta.interia.pl ([80.48.65.35]
	helo=smtp4.poczta.interia.pl)
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IGsM7-0006Z0-AF
	for linux-mtd@lists.infradead.org; Fri, 03 Aug 2007 09:17:58 +0100
Message-ID: <46B2E49E.6080103@interia.pl>
Date: Fri, 03 Aug 2007 10:17:34 +0200
From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
MIME-Version: 1.0
To: Satyam Sharma <satyam@infradead.org>
Subject: Re: [PATCH] mtd: Makefile fix (was Re: [PATCH] mtdsuper: licensce
	= GPL)
References: <46B0D1F7.9090805@interia.pl>
	<alpine.LFD.0.999.0708020318070.8258@enigma.security.iitk.ac.in>
	<46B18551.2020809@interia.pl>
	<alpine.LFD.0.999.0708021309430.8258@enigma.security.iitk.ac.in>
	<46B1FFFB.6040209@interia.pl>
	<alpine.LFD.0.999.0708030811330.23798@enigma.security.iitk.ac.in>
In-Reply-To: <alpine.LFD.0.999.0708030811330.23798@enigma.security.iitk.ac.in>
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> [PATCH] mtd: Makefile fix
> 
> We want drivers/mtd/{mtdcore, mtdsuper, mtdpart}.c to be built and linked
> into the same mtd.ko module. Fix the Makefile to ensure this, and remove
> duplicate MODULE_ declarations in mtdpart.c, as mtdcore.c already has them.
> 
> Signed-off-by: Satyam Sharma <satyam@infradead.org>

Ok. I have mtd.ko now.

Thank You
Rafa³


----------------------------------------------------------------------
Wszystko czego potrzebujesz latem: kremy do opalania, 
stroje kapielowe, maly romans 

>>>http://link.interia.pl/f1b15
