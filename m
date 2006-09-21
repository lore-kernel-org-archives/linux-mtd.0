Received: from 147.175.241.83.in-addr.dgcsystems.net ([83.241.175.147]
	helo=tmnt04.transmode.se)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GQMZJ-0007Sp-8f
	for linux-mtd@lists.infradead.org; Thu, 21 Sep 2006 12:18:13 +0100
Message-ID: <451274E0.6090602@transmode.se>
Date: Thu, 21 Sep 2006 13:17:52 +0200
From: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
MIME-Version: 1.0
To: Radoslaw Bisewski <radbis@googlemail.com>
Subject: Re: JFFS2 appears to "freeze" during erase
References: <F6AD7E21CDF4E145A44F61F43EE6D9399B42C8@tmnt04.transmode.se>
	<ee47688c0609210125vf796aa2qb2817c4e77c42417@mail.gmail.com>
In-Reply-To: <ee47688c0609210125vf796aa2qb2817c4e77c42417@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Radoslaw Bisewski wrote:
> This bug is caused by the use of erase_free_sem semaphore. Block erasing
> function jffs2_erase_block is called with erase_free_sem locked, i.e.
> erase_free_sem will be locked for the time needed to erase flash block (
> ~1 s for typical NOR chip), in the worst scenario access to file system
> may be blocked for a numer of seconds when the number of blocks is being
> erased. Workaround for this bug is simple - erase_free_sem cannot be
> locked when jffs2_erase_block function is called. See attached patch.
>
Me again

I think there is a bug in jffs2_erase_pending_blocks() after applying your patch:
	spin_unlock(&c->erase_completion_lock);
 done:
	D1(printk(KERN_DEBUG "jffs2_erase_pending_blocks completed\n"));

	up(&c->erase_free_sem);

the up(&c->erase_free_sem); needs to move to before done:

 Jocke
