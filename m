Received: from wx-out-0506.google.com ([66.249.82.225])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IS91V-0008HG-5l
	for linux-mtd@lists.infradead.org; Mon, 03 Sep 2007 06:19:16 -0400
Received: by wx-out-0506.google.com with SMTP id s7so1374242wxc
	for <linux-mtd@lists.infradead.org>;
	Mon, 03 Sep 2007 03:19:12 -0700 (PDT)
Message-ID: <46DBDDC6.9030602@googlemail.com>
Date: Mon, 03 Sep 2007 12:11:18 +0200
MIME-Version: 1.0
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [2/2] 2.6.23-rc5: known regressions with patches
References: <46DBDCF4.6040805@googlemail.com>
In-Reply-To: <46DBDCF4.6040805@googlemail.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
From: Michal Piotrowski <michal.k.k.piotrowski@gmail.com>
Cc: Ondrej Zary <linux@rainbow-software.org>,
	"David S. Miller" <davem@sunset.davemloft.net>,
	Jeff Garzik <jeff@garzik.org>, Roman Zippel <zippel@linux-m68k.org>,
	kbuild-devel@lists.sourceforge.net,
	Mark Hindley <mark@hindley.org.uk>, Ingo Molnar <mingo@elte.hu>,
	LKML <linux-kernel@vger.kernel.org>,
	Christian Casteyde <casteyde.christian@free.fr>, linux-ide@vger.kernel.org,
	Alan Stern <stern@rowland.harvard.edu>,
	linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
	Hugh Dickins <hugh@veritas.com>, Andrew Morton <akpm@linux-foundation.org>,
	Grant Wilson <grant.wilson@zen.co.uk>, Sam Ravnborg <sam@ravnborg.org>,
	David Woodhouse <dwmw2@infradead.org>, Pierre Ossman <drzeus-mmc@drzeus.cx>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

Here is a list of some known regressions in 2.6.23-rc5
with patches available.

Feel free to add new regressions/remove fixed etc.
http://kernelnewbies.org/known_regressions

List of Aces

Name                    Regressions fixed since 21-Jun-2007
Adrian Bunk                            9
Linus Torvalds                         6
Andi Kleen                             5
Hugh Dickins                           5
Andrew Morton                          4
Al Viro                                3
Alan Stern                             3
Alexey Starikovskiy                    3
Cornelia Huck                          3
Jens Axboe                             3
Stephen Hemminger                      3
Tejun Heo                              3



Kconfig

Subject         : CONFIG_HOTPLUG_CPU: kconfig bug?
References      : http://lkml.org/lkml/2007/8/27/204
Last known good : ?
Submitter       : Hugh Dickins <hugh@veritas.com>
Caused-By       : ?
Handled-By      : Roman Zippel <zippel@linux-m68k.org>
                  Sam Ravnborg <sam@ravnborg.org>
Patch           : http://lkml.org/lkml/2007/8/29/301
Status          : patch available



MMC

Subject         : Unable to access memory card reader anymore
References      : http://bugzilla.kernel.org/show_bug.cgi?id=8885
Last known good : ?
Submitter       : Christian Casteyde <casteyde.christian@free.fr>
Caused-By       : ?
Handled-By      : Alan Stern <stern@rowland.harvard.edu>
Patch           : http://bugzilla.kernel.org/attachment.cgi?id=12438
Status          : patch available



MTD

Subject         : error: implicit declaration of function 'cfi_interleave'
References      : http://lkml.org/lkml/2007/8/6/272
Last known good : ?
Submitter       : Ingo Molnar <mingo@elte.hu>
Caused-By       : ?
Handled-By      : David Woodhouse <dwmw2@infradead.org>
Patch           : http://lkml.org/lkml/2007/8/9/586
Status          : patch available



Networking

Subject         : [OOPS] 2.6.23-rc5 ? network/via-rhine
References      : http://lkml.org/lkml/2007/9/2/58
Last known good : ?
Submitter       : Mark Hindley <mark@hindley.org.uk>
Caused-By       : ?
Handled-By      : David S. Miller <davem@sunset.davemloft.net>
Patch           : http://git.kernel.org/?p=linux/kernel/git/davem/net-2.6.git;a=commit;h=5c127c58ae9bf196d787815b1bd6b0aec5aee816
Status          : patch available



PATA/SATA

Subject         : sata_via: write errors on PATA drive connected to VT6421
References      : http://lkml.org/lkml/2007/8/20/248
Last known good : ?
Submitter       : Ondrej Zary <linux@rainbow-software.org>
Caused-By       : ?
Handled-By      : Ondrej Zary <linux@rainbow-software.org>
Patch           : http://lkml.org/lkml/2007/8/31/310
Status          : patch available

Subject         : NULL pointer dereference in ata_piix
References      : http://lkml.org/lkml/2007/9/1/33
Last known good : ?
Submitter       : Grant Wilson <grant.wilson@zen.co.uk>
Caused-By       : ?
Handled-By      : Jeff Garzik <jeff@garzik.org>
Patch           : http://lkml.org/lkml/2007/9/1/46
Status          : patch available



Regards,
Michal

--
LOG
http://www.stardust.webpages.pl/log/
