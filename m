Received: from router-100m.swansea.linux.org.uk ([194.168.151.17] helo=the-village.bc.nu)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 157KRE-00052P-00
	for <linux-mtd@lists.infradead.org>; Tue, 05 Jun 2001 18:16:18 +0100
Subject: Re: Missing cache flush.
To: kira@linuxgrrls.org (kira brown)
Date: Tue, 5 Jun 2001 18:16:33 +0100 (BST)
Cc: dwmw2@infradead.org (David Woodhouse), davem@redhat.com (David S. Miller),
	cw@f00f.org (Chris Wedgwood), jgarzik@mandrakesoft.com (Jeff Garzik),
	bjornw@axis.com, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
In-Reply-To: <Pine.LNX.4.30.0106051028390.10786-100000@carrot.linuxgrrls.org> from "kira brown" at Jun 05, 2001 10:29:16 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-Id: <E157KRV-00076q-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
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

> 3. Buggy implementations like the Cyrix 486es that don't properly maintain
>    cache coherency.

The early Cyrix CPUs (and some 1.x rev 6x86 cpus I believe too) arent supported
and dont work. The problem is best corrected with a hammer and a visit to
ebay
