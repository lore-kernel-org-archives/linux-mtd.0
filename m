Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FEoG2-0005ZY-Bw
	for linux-mtd@lists.infradead.org; Thu, 02 Mar 2006 08:54:24 -0500
Date: Thu, 2 Mar 2006 14:54:00 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Lennert Buytenhek <buytenh@wantstofly.org>
Message-ID: <20060302135400.GB12074@wohnheim.fh-wedel.de>
References: <20060302131203.GA29525@xi.wantstofly.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20060302131203.GA29525@xi.wantstofly.org>
Cc: Jesse Off <joff@embeddedARM.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH,RFC] ts72xx NAND driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2 March 2006 14:12:03 +0100, Lennert Buytenhek wrote:
> 
> Any feedback appreciated..

Just some minor (irrelevant?) stuff.

> +extern int parse_cmdline_partitions(struct mtd_info *master,
> +		struct mtd_partition **pparts, const char *mtd_id);

Adrian Bunk would send a patch against these lines within a few weeks.
His reasoning is that .c files should include headers instead of
adding function declarations on their own.

> +	if (nand_scan (ts7250_mtd, 1)) {
> +		kfree (ts7250_mtd);
                     ^
Non-compliant to kernel coding style.

> +	del_mtd_device (ts7250_mtd);

Jörn

-- 
To my face you have the audacity to advise me to become a thief - the worst
kind of thief that is conceivable, a thief of spiritual things, a thief of
ideas! It is insufferable, intolerable!
-- M. Binet in Scarabouche
