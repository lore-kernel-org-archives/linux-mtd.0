Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JBpBc-0007ds-Ha
	for linux-mtd@lists.infradead.org; Mon, 07 Jan 2008 10:26:34 +0000
Date: Mon, 7 Jan 2008 11:20:27 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH] block2mtd lockdep_init_map warning
Message-ID: <20080107102025.GA5338@lazybastard.org>
References: <200801061911.m06JBldW020012@agora.fsl.cs.sunysb.edu>
	<1199700326.7143.10.camel@twins>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1199700326.7143.10.camel@twins>
Cc: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>,
	Rusty Russell <rusty@rustcorp.com.au>,
	linux-kernel@vger.kernel.org, mingo@redhat.com,
	linux-mtd@lists.infradead.org, Erez Zadok <ezk@cs.sunysb.edu>,
	dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 7 January 2008 11:05:26 +0100, Peter Zijlstra wrote:
> 
> Would something like this work for people?

Looks a lot better than what I thought of.  However, does the #ifdef
within is_module_address() make sense when afaict lockdep is the only
caller of that function?  Looks as if the whole function should be made
conditional or none of it.

> Not-Yet-Signed-off-by: Peter Zijlstra <a.p.zijlstra@chello.nl>
> ---
> Index: linux-2.6/include/linux/sched.h
> ===================================================================
> --- linux-2.6.orig/include/linux/sched.h
> +++ linux-2.6/include/linux/sched.h
> @@ -1160,6 +1160,7 @@ struct task_struct {
>  	int lockdep_depth;
>  	struct held_lock held_locks[MAX_LOCK_DEPTH];
>  	unsigned int lockdep_recursion;
> +	struct module *loading_module;
>  #endif
>  
>  /* journalling filesystem info */
> Index: linux-2.6/kernel/module.c
> ===================================================================
> --- linux-2.6.orig/kernel/module.c
> +++ linux-2.6/kernel/module.c
> @@ -2023,6 +2023,9 @@ static struct module *load_module(void _
>  		printk(KERN_WARNING "%s: Ignoring obsolete parameters\n",
>  		       mod->name);
>  
> +#ifdef CONFIG_LOCKDEP
> +	current->loading_module = mod;
> +#endif
>  	/* Size of section 0 is 0, so this works well if no params */
>  	err = parse_args(mod->name, mod->args,
>  			 (struct kernel_param *)
> @@ -2030,6 +2033,9 @@ static struct module *load_module(void _
>  			 sechdrs[setupindex].sh_size
>  			 / sizeof(struct kernel_param),
>  			 NULL);
> +#ifdef CONFIG_LOCKDEP
> +	current->loading_module = NULL
> +#endif
>  	if (err < 0)
>  		goto arch_cleanup;
>  
> @@ -2454,6 +2460,17 @@ int is_module_address(unsigned long addr
>  		}
>  	}
>  
> +#ifdef CONFIG_LOCKDEP
> +	if (current->loading_module) {
> +		mod = current->loading_module;
> +		if (within(addr, mod->module_init, mod->init_text_size)
> +		    || within(addr, mod->module_core, mod->core_text_size)) {
> +			preempt_enable();
> +			return 1;
> +		}
> +	}
> +#endif
> +
>  	preempt_enable();
>  
>  	return 0;
> 
> 
> 

Jörn

-- 
I don't understand it. Nobody does.
-- Richard P. Feynman
