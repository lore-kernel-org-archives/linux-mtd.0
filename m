Received: from mail-out.m-online.net ([212.18.0.9])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1J9q3k-00070Z-6K
	for linux-mtd@lists.infradead.org; Tue, 01 Jan 2008 22:58:15 +0000
To: Adrian Bunk <bunk@kernel.org>
From: Wolfgang Denk <wd@denx.de>
Subject: Re: [2.6 patch] remove broken MTD drivers
Mime-version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 8bit
In-reply-to: Your message of "Tue, 01 Jan 2008 15:48:39 +0200."
	<20080101134839.GN2360@does.not.exist>
Date: Tue, 01 Jan 2008 23:58:04 +0100
Sender: wd@denx.de
Message-Id: <20080101225804.F13AA24889@gemini.denx.de>
Cc: linux-mtd@lists.infradead.org,
	Thomas Gleixner <tglx@cruncher.tec.linutronix.de>,
	dwmw2@infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In message <20080101134839.GN2360@does.not.exist> you wrote:
> This patch removes two MTD drivers that have been marked as
> BROKEN 19 months ago due to requiring nonexisting header files.
...
>  drivers/mtd/nand/Kconfig          |   12 
>  drivers/mtd/nand/Makefile         |    2 
>  drivers/mtd/nand/ppchameleonevb.c |  439 ------------------------------

It would have been nice if you had put the autors of the files on Cc:

Regarding the PPChameleon NAND support: I discussed this issue with
tglx on 23 June 2006. Thomas promised to fix the driver if I send him
the missing file and eventually needed patches.

I did so on Fri, 23 Jun 2006 23:23:42 +0200.

Thomas, can you please have a look at this?

If you don't have time / resources please let me know so we can submit
the stuff here on the list...

Thanks.

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
"More software projects have gone awry for lack of calendar time than
for all other causes combined."
                         - Fred Brooks, Jr., _The Mythical Man Month_
