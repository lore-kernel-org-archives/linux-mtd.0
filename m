Received: from nwcst339.netaddress.usa.net ([204.68.23.84])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15SSY0-00007t-00
	for <linux-mtd@lists.infradead.org>; Fri, 03 Aug 2001 01:10:36 +0100
Message-ID: <20010803001624.5377.qmail@nwcst339.netaddress.usa.net>
Date: 2 Aug 2001 17:16:24 PDT
From: Eric <ebrower@usa.net>
To: linux-mtd@lists.infradead.org
Subject: [Q] Where are probed maps kfree'd?
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
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

The usual course of events seems to be:

  mapping driver sets-up a struct map_info
  mapping driver calls chip-family-specific probe routine
  probe routine kmallocs a struct mtd_info are returns it
  =

  mapping driver decides to unload
  mapping driver calls (amongst other things) map_destroy
  chip-family-specific destroy routine kfrees internal private data
  mapping driver exits

I've been looking at more than a few examples, and I don't
see when (if ever) the struct mtd_info passed back from the
probe routine is kfree'd.  It is NOT done in the destroy =

routine and I can't see it being done in the mtdcore exit
function either.  Am I missing it, or is everyone leaking
mtd_info structs on unload?  =


E
