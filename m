Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DaarC-0002kw-G1
	for linux-mtd@lists.infradead.org; Tue, 24 May 2005 10:58:13 -0400
Date: Tue, 24 May 2005 16:58:04 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Kluba Patrik <pajko@kukac.halom.u-szeged.hu>
Message-ID: <20050524145804.GB24361@wohnheim.fh-wedel.de>
References: <Pine.LNX.4.61.0505230933320.25999@kukac.halom.u-szeged.hu>
	<1116942160.6736.201.camel@tglx.tec.linutronix.de>
	<Pine.LNX.4.61.0505241621400.9119@kukac.halom.u-szeged.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.61.0505241621400.9119@kukac.halom.u-szeged.hu>
Cc: "Artem B. Bityuckiy" <dedekind@yandex.ru>,
	Thomas Gleixner <tglx@linutronix.de>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH][02/03] nandsim default values in Kconfig
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 24 May 2005 16:25:54 +0200, Kluba Patrik wrote:
> 
> >I'd prefer to have them available as module parameters, so I can change
> >the settings without recompiling on module load.
> 
> What if I rewrite nandsim's module parameters for easier setting of the 
> values, like erase block size, page size, OOB size, etc. instead of to have 
> the developer enter ID bytes, and change a table entry based on the given 
> values? In this case, which entry should be changed?

How about you #include "nandsim_config.h" ?

Then you can edit nandsim_config.h with your favorite editor and have
all the options visible in a couple of lines.

Jörn

-- 
The wise man seeks everything in himself; the ignorant man tries to get
everything from somebody else.
-- unknown
