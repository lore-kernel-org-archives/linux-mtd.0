Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aqxPI-0007iz-1F
 for linux-mtd@lists.infradead.org; Fri, 15 Apr 2016 06:39:11 +0000
Date: Fri, 15 Apr 2016 08:38:45 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, boris.brezillon@free-electrons.com,
 alex@nextthing.co, Daniel Walter <dwalter@sigma-star.at>
Subject: Re: [PATCH 3/4] Initial implementation for ubihealthd.
Message-ID: <20160415063845.GB31101@pengutronix.de>
References: <1446764403-22742-1-git-send-email-richard@nod.at>
 <1446764403-22742-4-git-send-email-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1446764403-22742-4-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Nov 06, 2015 at 12:00:02AM +0100, Richard Weinberger wrote:

> +
> +	int shutdown = 0;
> +	int stats_timer = create_and_arm_timer(60);
> +	if (stats_timer < 0) {
> +		log_fatal("Could not create stats timer, aborting");
> +		_exit(1);
> +	}
> +	int read_peb_timer = create_and_arm_timer(read_completion / num_pebs);
> +	if (read_peb_timer < 0) {
> +		log_fatal("Could not create read timer, aborting");
> +		_exit(1);
> +	}
> +	int scrub_peb_timer = create_and_arm_timer(scrub_completion / num_pebs);
> +	if (scrub_peb_timer < 0) {
> +		log_fatal("Could not create scrubbing timer, aborting");
> +		_exit(1);
> +	}

I tried to configure a "do as fast as you can" and realized that when
read_/scrub_completion is configured lower than the number of pebs and
create_and_arm_timer is called with 0 as argument then the program no
longer works. This should probably be catched.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
