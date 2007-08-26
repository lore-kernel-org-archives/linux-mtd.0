Received: from nic.netdirect.ca ([216.16.235.2] helo=rubicon.netdirect.ca)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IPKPJ-00036k-8E
	for linux-mtd@lists.infradead.org; Sun, 26 Aug 2007 16:52:12 +0100
Date: Sun, 26 Aug 2007 11:41:58 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@mindspring.com>
To: Jesper Juhl <jesper.juhl@gmail.com>
Subject: Re: [PATCH 1/4] mtd: Don't cast kmalloc() return value in
	drivers/mtd/maps/pmcmsp-flash.c
In-Reply-To: <9a8748490708260619x24d42a7w7618b3c7ce625fa@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.0708261141400.4267@localhost.localdomain>
References: <200708260352.33343.jesper.juhl@gmail.com>
	<200708260354.27928.jesper.juhl@gmail.com>
	<Pine.LNX.4.64.0708260434160.6485@localhost.localdomain>
	<9a8748490708260619x24d42a7w7618b3c7ce625fa@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Denys Vlasenko <vda.linux@googlemail.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Marc St-Jean <stjeanma@pmc-sierra.com>,
	MTD mailing list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 26 Aug 2007, Jesper Juhl wrote:

> Check the second patch in the series, please.

ah, got it.  sorry for jumping the gun.

rday
-- 
========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
========================================================================
