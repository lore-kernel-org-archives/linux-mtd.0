Received: from tiger.actrix.co.nz ([203.96.16.160])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 177WzT-00005R-00
	for <linux-mtd@lists.infradead.org>; Tue, 14 May 2002 08:45:00 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
Reply-To: manningc2@actrix.gen.nz
To: gleixner@autronix.de, David Woodhouse <dwmw2@infradead.org>,
	franck.fleter@netbricks.com
Subject: Re: Boot from NAND flash ???
Date: Tue, 14 May 2002 19:37:41 +1200
Cc: linux-mtd@lists.infradead.org
References: <3CDF6922.9A0A870F@netbricks.com> <20020513101623.DE1A14235@tiger.actrix.co.nz> <200205131118.g4DBImU04255@thomas.tec.autronix.de>
In-Reply-To: <200205131118.g4DBImU04255@thomas.tec.autronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20020514074256.761DD49AA@tiger.actrix.co.nz>
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

> There's another important limitation. Who guarantees you, that your
> "boot-page" does not get bad or is a bad block already. That's the reason,
> why DOC has 4 blocks with the same code.

The first page of NAND is guaranteed to be good.
