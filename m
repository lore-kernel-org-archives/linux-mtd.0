Received: from n1-vm1.bullet.mail.gq1.yahoo.com ([67.195.23.153])
	by bombadil.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OioYe-0005zG-BF
	for linux-mtd@lists.infradead.org; Tue, 10 Aug 2010 13:07:58 +0000
Message-ID: <893387.4342.qm@web180301.mail.gq1.yahoo.com>
Date: Tue, 10 Aug 2010 06:07:47 -0700 (PDT)
From: David Brownell <david-b@pacbell.net>
Subject: RE: [PATCH] m25p80: add support for a callback to platform code on
	successful device probe
To: 'Mike Frysinger' <vapier.adi@gmail.com>,
	Sudhakar Rajashekhara <sudhakar.raj@ti.com>
In-Reply-To: <016d01cb386e$22e28660$68a79320$@raj@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-mtd@lists.infradead.org,
	davinci-linux-open-source@linux.davincidsp.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> On Tue, Aug 10, 2010 at 12:47:05, Mike Frysinger wrote:

> it is necessary
> > that you do these things from kernel space instead of
> standard
> > userspace.

Hard to get userspace to do this stuff if
you're doing a network boot, and thus need
to have the MAC address working early.. it's
easy if the kernel can get the MAC address,
else not possible to boot.  Right?
