Received: from [145.253.187.130] (helo=proxy.baslerweb.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A9lBu-0002Np-Jl
	for <linux-mtd@lists.infradead.org>; Wed, 15 Oct 2003 13:55:50 +0100
From: Thomas Koeller <thomas.koeller@baslerweb.com>
To: Dinesh Kumar <mljangir@yahoo.co.in>
Date: Wed, 15 Oct 2003 14:58:26 +0200
References: <20031015115257.16327.qmail@web8006.mail.in.yahoo.com>
In-Reply-To: <20031015115257.16327.qmail@web8006.mail.in.yahoo.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200310151458.26409.thomas.koeller@baslerweb.com>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
cc: ecos-discuss@sources.redhat.com
Subject: Re: [ECOS] Stress testing JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dinesh Kumar wrote:
> I am newbie to JFFS2. What is the reason behind not
> freeing jffs2_raw_node_ref from RAM (even after they
> have been used)?

Their purpose is to represent physical nodes in the FLASH,
and so they must remain just as long as those.

tk
--------------------------------------------------

Thomas Koeller, Software Development

Basler Vision Technologies
An der Strusbek 60-62
22926 Ahrensburg
Germany

Tel +49 (4102) 463-162
Fax +49 (4102) 463-239

mailto:thomas.koeller@baslerweb.com
http://www.baslerweb.com

==============================
