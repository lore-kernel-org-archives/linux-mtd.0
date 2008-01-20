Received: from filer.fsl.cs.sunysb.edu ([130.245.126.2])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JGhIi-0007jK-LB
	for linux-mtd@lists.infradead.org; Sun, 20 Jan 2008 21:02:03 +0000
Date: Sun, 20 Jan 2008 16:01:35 -0500
Message-Id: <200801202101.m0KL1Z3w006821@agora.fsl.cs.sunysb.edu>
From: Erez Zadok <ezk@cs.sunysb.edu>
To: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
Subject: Re: [PATCH] block2mtd lockdep_init_map warning 
In-reply-to: Your message of "Wed, 16 Jan 2008 22:20:54 +0100."
	<20080116212054.GA891@lazybastard.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
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

In message <20080116212054.GA891@lazybastard.org>, =?utf-8?B?SsO2cm4=?= Engel writes:
[...]
> Patch didn't compile due to function ordering.  Here is an updated version.

Joern/Peter, I've tested this updated patch with v2.6.24-rc8-74-ga7da60f.
It worked fine for me.

Thanks,
Erez.

> Acked-and-tested-by: Joern Engel <joern@lazybastard.org>
> 
> diff --git a/kernel/module.c b/kernel/module.c
> index c2e3e2e..0397b1e 100644
> --- a/kernel/module.c
> +++ b/kernel/module.c
> @@ -1645,6 +1645,17 @@ static inline void add_kallsyms(struct module *mod,
>  }
>  #endif /* CONFIG_KALLSYMS */
>  
> +/*
> + * link the module with the whole machine is stopped with interrupts off
> + * - this defends against kallsyms not taking locks
> + */
> +static int __link_module(void *_mod)
> +{
> +	struct module *mod = _mod;
> +	list_add(&mod->list, &modules);
> +	return 0;
> +}
> +
>  /* Allocate and load the module: note that size of section 0 is always
>     zero, and we rely on this for optional sections. */
>  static struct module *load_module(void __user *umod,
> @@ -2023,6 +2034,11 @@ static struct module *load_module(void __user *umod,
>  		printk(KERN_WARNING "%s: Ignoring obsolete parameters\n",
>  		       mod->name);
>  
> +	/* Now sew it into the lists so we can get lockdep and oops
> +         * info during argument parsing.  Noone should access us, since
> +         * strong_try_module_get() will fail. */
> +	stop_machine_run(__link_module, mod, NR_CPUS);
> +
>  	/* Size of section 0 is 0, so this works well if no params */
>  	err = parse_args(mod->name, mod->args,
>  			 (struct kernel_param *)
> @@ -2031,7 +2047,7 @@ static struct module *load_module(void __user *umod,
>  			 / sizeof(struct kernel_param),
>  			 NULL);
>  	if (err < 0)
> -		goto arch_cleanup;
> +		goto unlink;
>  
>  	err = mod_sysfs_setup(mod,
>  			      (struct kernel_param *)
> @@ -2039,7 +2055,7 @@ static struct module *load_module(void __user *umod,
>  			      sechdrs[setupindex].sh_size
>  			      / sizeof(struct kernel_param));
>  	if (err < 0)
> -		goto arch_cleanup;
> +		goto unlink;
>  	add_sect_attrs(mod, hdr->e_shnum, secstrings, sechdrs);
>  	add_notes_attrs(mod, hdr->e_shnum, secstrings, sechdrs);
>  
> @@ -2054,7 +2070,8 @@ static struct module *load_module(void __user *umod,
>  	/* Done! */
>  	return mod;
>  
> - arch_cleanup:
> + unlink:
> +	stop_machine_run(__unlink_module, mod, NR_CPUS);
>  	module_arch_cleanup(mod);
>   cleanup:
>  	module_unload_free(mod);
> @@ -2076,17 +2093,6 @@ static struct module *load_module(void __user *umod,
>  	goto free_hdr;
>  }
>  
> -/*
> - * link the module with the whole machine is stopped with interrupts off
> - * - this defends against kallsyms not taking locks
> - */
> -static int __link_module(void *_mod)
> -{
> -	struct module *mod = _mod;
> -	list_add(&mod->list, &modules);
> -	return 0;
> -}
> -
>  /* This is where the real work happens */
>  asmlinkage long
>  sys_init_module(void __user *umod,
> @@ -2111,10 +2117,6 @@ sys_init_module(void __user *umod,
>  		return PTR_ERR(mod);
>  	}
>  
> -	/* Now sew it into the lists.  They won't access us, since
> -           strong_try_module_get() will fail. */
> -	stop_machine_run(__link_module, mod, NR_CPUS);
> -
>  	/* Drop lock so they can recurse */
>  	mutex_unlock(&module_mutex);
