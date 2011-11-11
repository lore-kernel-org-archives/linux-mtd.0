Received: from smtp.newsguy.com ([74.209.136.69])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1ROiZZ-0006KK-Sm
 for linux-mtd@lists.infradead.org; Fri, 11 Nov 2011 04:18:38 +0000
Message-ID: <4EBCAFEF.50109@newsguy.com>
Date: Thu, 10 Nov 2011 21:17:35 -0800
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH v3] mtd: nand: Add driver for M-sys / Sandisk diskonchip G4
References: <1320441908-9684-1-git-send-email-mikedunn@newsguy.com>	<87lirnkbap.fsf@free.fr>
 <4EBC504C.5000008@newsguy.com> <87hb2bk4yz.fsf@free.fr>
In-Reply-To: <87hb2bk4yz.fsf@free.fr>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Yes, mtd_write should not assume oob
can be written first.


Meant to say nand_write


Mike
