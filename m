Received: from mgw-ext04.nokia.com ([131.228.20.96])
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1Ep1nj-0004q9-0X
	for linux-mtd@lists.infradead.org; Wed, 21 Dec 2005 06:06:35 -0500
Date: Wed, 21 Dec 2005 13:06:46 +0200
From: Jarkko Lavinen <jarkko.lavinen@nokia.com>
To: linux-mtd@lists.infradead.org
Message-ID: <20051221110646.GA12156@angel.research.nokia.com>
References: <20051216122331.GA801@angel.research.nokia.com>
	<43A690EA.5050903@gmx.de>
	<20051221093034.GA7781@angel.research.nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20051221093034.GA7781@angel.research.nokia.com>
Cc: Christian Lehne <christian_lehne@gmx.de>, tglx@linutronix.de,
	priewasser@gmail.com, "Zhao, Forrest" <forrest.zhao@intel.com>
Subject: Re: EBH with OneNAND doesn't work
Reply-To: Jarkko Lavinen <jarkko.lavinen@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 21, 2005 at 11:30:34AM +0200, Jarkko Lavinen wrote:
> +		jffs2_copy_nand_fsdata(c, n, buf, sizeof(sizeof(struct jffs2_unknown_node)), oob_size);

Grrr... sizeof(sizeof()) looks ugly crap.

Jarkko
