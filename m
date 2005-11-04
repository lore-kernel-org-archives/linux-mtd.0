Received: from smtp.osdl.org ([65.172.181.4])
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EYAji-0006gu-4r
	for linux-mtd@lists.infradead.org; Fri, 04 Nov 2005 18:12:44 -0500
Date: Fri, 4 Nov 2005 15:12:39 -0800
From: Andrew Morton <akpm@osdl.org>
To: Pavel Machek <pavel@ucw.cz>, David Woodhouse <dwmw2@infradead.org>
Message-Id: <20051104151239.4a39a529.akpm@osdl.org>
In-Reply-To: <20051101233320.GA31263@elf.ucw.cz>
References: <20051101233320.GA31263@elf.ucw.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-kernel@vger.kernel.org, lenz@cs.wisc.edu,
	linux-mtd@lists.infradead.org, dwmw2@infradead.org, rmk@arm.linux.org.uk
Subject: Re: [patch] collie: fixup mtd a bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Pavel Machek <pavel@ucw.cz> wrote:
>
> Get collie mtd support closer to working/clean state.
> 

This patch throws a screen-sized reject due to conflicting changes in
dwmw2's MTD tree.  I'd suggest that you rework the patch and send it in via
David (who needs to get a wiggle on if he wants his stuff in 2.6.15).

>  	default:
> -		printk("Waiting for chip\n");
> -
>  		set_current_state(TASK_INTERRUPTIBLE);
>  		add_wait_queue(&chip->wq, &wait);
>  
>  		spin_unlock_bh(chip->mutex);
>  
> -		schedule();
> +		udelay(1);
> +
> +		set_current_state(TASK_RUNNING);
>  		remove_wait_queue(&chip->wq, &wait);
>  
>  		if(signal_pending(current))
> @@ -255,7 +256,7 @@ retry:

If you're going to do this then you should remove all that now-pointless
waitqueue and task-state handling.
