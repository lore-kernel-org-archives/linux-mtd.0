Received: from nic.netdirect.ca ([216.16.235.2] helo=rubicon.netdirect.ca)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IPDle-0008VM-UX
	for linux-mtd@lists.infradead.org; Sun, 26 Aug 2007 09:46:51 +0100
Date: Sun, 26 Aug 2007 04:36:33 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@mindspring.com>
To: Jesper Juhl <jesper.juhl@gmail.com>
Subject: Re: [PATCH 1/4] mtd: Don't cast kmalloc() return value in
	drivers/mtd/maps/pmcmsp-flash.c
In-Reply-To: <200708260354.27928.jesper.juhl@gmail.com>
Message-ID: <Pine.LNX.4.64.0708260434160.6485@localhost.localdomain>
References: <200708260352.33343.jesper.juhl@gmail.com>
	<200708260354.27928.jesper.juhl@gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Denys Vlasenko <vda.linux@googlemail.com>,
	MTD mailing list <linux-mtd@lists.infradead.org>,
	Marc St-Jean <stjeanma@pmc-sierra.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 26 Aug 2007, Jesper Juhl wrote:

> +	msp_maps = kmalloc(fcnt * sizeof(struct mtd_info), GFP_KERNEL);
>  	memset(msp_maps, 0, fcnt * sizeof(struct mtd_info));

...

> +		msp_parts[i] = kmalloc(pcnt * sizeof(struct mtd_partition),
> +			GFP_KERNEL);
>  		memset(msp_parts[i], 0, pcnt * sizeof(struct mtd_partition));

again, both of the above could be done with a single call to kcalloc()
in each case.  why are you so philosophically opposed to doing it that
way?

rday
-- 
========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
========================================================================
