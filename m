Received: from [213.97.115.166] (helo=drkitkat.Hispafuentes.com ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15Rtlp-0006TO-00
	for <linux-mtd@lists.infradead.org>; Wed, 01 Aug 2001 12:02:33 +0100
Message-ID: <3B67E336.B7925626@hispafuentes.com>
Date: Wed, 01 Aug 2001 13:08:38 +0200
From: Juan Ramon Jimenez Garcia <juan@hispafuentes.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org, olea@hispafuentes.com
Subject: Problems compiling kernel 2.2.17
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

          Hi all

              We are trying to compile kernel 2.2.17 with the mtd patch,
and we have some problems.  While make bzdisk or bzImage we get a link
error:

            drivers/mtd/mtdlink.o: In function `init_mtd':
            drivers/mtd/mtdlink.o(.text.init+0x3c): undefined reference
to   `init_mtd_devices'

That have been solved modifying  GNUmakefile  like someone (Jan Rovins)
told here
           ifeq ($(VERSION),2)
              ifeq ($(PATCHLEVEL),0) <<<changed this to:>>>  ifeq
($(PATCHLEVEL),2)
                     obj-y += initcalls.o
              endif
          endif

but now we got another link error with an undefined reference to
'init_nftl'
How can we solved this?
Do you think we must to configure something special to get the kernel
image?

Thanks for your time!
J

                                ///
                               (@ @)
 ------------------------oOO----(_)----OOo-------------------------

 - Mejor no hacer nada que hacer cualquier cosa. - Francis Picabia -

 ------------------------------------------------------------------

 ¤º°°º¤ø,¸¸,ø¤º°°º¤ø,¸¸,ø¤º°`°º¤ø,¸

    Juan Ramon Jimenez Garcia
    Hispafuentes
    Tfno 91 4575330
    juan@hispafuentes.com

 ¤º°°º¤ø,¸¸,ø¤º°°º¤ø,¸¸,ø¤º°`°º¤ø,¸
