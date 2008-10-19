Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KrQvF-00051Z-S4
	for linux-mtd@lists.infradead.org; Sun, 19 Oct 2008 05:33:50 +0000
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KrQvC-0001uJ-8k
	for linux-mtd@lists.infradead.org; Sun, 19 Oct 2008 05:33:46 +0000
Received: from lns-bzn-50f-62-147-234-34.adsl.proxad.net ([62.147.234.34])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Sun, 19 Oct 2008 05:33:46 +0000
Received: from moore by lns-bzn-50f-62-147-234-34.adsl.proxad.net with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Sun, 19 Oct 2008 05:33:46 +0000
To: linux-mtd@lists.infradead.org
From: Christopher Moore <moore@free.fr>
Subject: Re: [PATCH 1/4] [MTD] remove bogus warning about missing boot
	=?utf-8?b?YmFuawlsb2NhdGlvbg==?=
Date: Sun, 19 Oct 2008 05:33:37 +0000 (UTC)
Message-ID: <loom.20081019T051651-843@post.gmane.org>
References: <1216712341-25869-1-git-send-email-Uwe.Kleine-Koenig@digi.com>
	<1216712341-25869-2-git-send-email-Uwe.Kleine-Koenig@digi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: news <news@ger.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Uwe Kleine-König <Uwe.Kleine-Koenig <at> digi.com> writes:

> 
> After the deleted block bootloc is only used once as follows:
> 
> 	if (bootloc == 3 && something_else) {
> 		...
> 
> So setting bootloc = 2 doesn't change anything.  Taking that the warning is
> wrong and missleading.
> 
> Signed-off-by: Uwe Kleine-König <Uwe.Kleine-Koenig <at> digi.com>


Nice catch, Uwe.

IMHO the worst thing is that the warning is completely bogus.
It says "Assuming top" but the next line sets bootloc to bottom (2) :(

See also this thread: http://thread.gmane.org/gmane.linux.drivers.mtd/22176

Last time I looked this patch had not been applied so I am pinging it.

Therefore a bit late and FWIW:-
Acked-by: Christopher Moore <moore@free.fr>
