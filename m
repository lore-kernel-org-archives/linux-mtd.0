Received: from ns.execnet.net ([65.163.146.8] helo=ns1.execnet.net)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1De2KA-0007yJ-8d
	for linux-mtd@lists.infradead.org; Thu, 02 Jun 2005 22:54:19 -0400
Message-ID: <429FC658.7030206@sdgsystems.com>
Date: Thu, 02 Jun 2005 22:54:16 -0400
From: Todd Blumer <todd@sdgsystems.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Aric Blumer <aric@sdgsystems.com>
Subject: MTD PM Resume
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I found some information pertinent to this question in doing searching,
but not a definite resolution.

We're doing a Linux port (kernel 2.6.11) to the iPAQ hx4700, which uses
a stacked StrataFlash. The hx4700 has flash that lock all blocks on
reset or power down. We worked around this problem by unlocking all the
pertinent blocks in the boot loader, but for reasons I won't go into,
this doesn't work on resume.

So, we added some code to drivers/mtd/chips/cfi_cmdset_0001.c in
cfi_intelext_resume() to unlock the blocks of the flash chips on resume.
However, cfi_intelext_resume() is not be run on resume. In fact, as far
as I can tell, pm_send() is not being called in kernel/power/pm.c on
suspend or resume.

mtdcore.c uses pm_register() to register its callback function
(mtd_pm_callback()), and this API is apparently deprecated. If it's
marked deprecated, though, it should still work, so I'm wondering if
anyone knows why the suspend/resume functions for MTD devices are not
being called. Any other suggestions also appreciated.

In the mean while, we'll continue to investigate.
Thanks.
