Received: from fg-out-1718.google.com ([72.14.220.152])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LLTP6-0005hQ-Ce
	for linux-mtd@lists.infradead.org; Sat, 10 Jan 2009 02:16:48 +0000
Received: by fg-out-1718.google.com with SMTP id 13so1539696fge.26
	for <linux-mtd@lists.infradead.org>;
	Fri, 09 Jan 2009 18:16:46 -0800 (PST)
Date: Sat, 10 Jan 2009 05:16:41 +0300
From: Alexander Beregalov <a.beregalov@gmail.com>
To: akorolev@infradead.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: mtd/lpddr/qinfo_probe.c needs lpddr_cmds to be compiled
Message-ID: <20090110021641.GA26951@orion>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

drivers/built-in.o: In function `lpddr_probe':
drivers/mtd/lpddr/qinfo_probe.c:215:
undefined reference to `lpddr_cmdset'

# CONFIG_MTD_LPDDR is not set
CONFIG_MTD_QINFO_PROBE=y
