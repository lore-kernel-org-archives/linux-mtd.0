Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FOt7G-0007Xt-HJ
	for linux-mtd@lists.infradead.org; Thu, 30 Mar 2006 04:06:57 -0500
Message-ID: <442B9FA5.9070901@ru.mvista.com>
Date: Thu, 30 Mar 2006 13:06:45 +0400
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: "Belyakov, Alexander" <alexander.belyakov@intel.com>
References: <F048F58F304F0040BC3E937DE4E231E701DC3ABB@NNSMSX401>
In-Reply-To: <F048F58F304F0040BC3E937DE4E231E701DC3ABB@NNSMSX401>
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "Korolev, Alexey" <alexey.korolev@intel.com>, linux-mtd@lists.infradead.org,
	"Kutergin, Timofey" <timofey.kutergin@intel.com>
Subject: Re: [PATCH/RFC] MTD: Striping layer core
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Alexander,

Belyakov, Alexander wrote:
> One may say that striping is quite similar to already existing in MTD
> concatenation layer. That is not true since these layers have some sharp
> distinctions. The first one is the purpose. Concatenation only purpose
> is to make larger device from several smaller devices. Striping purpose
> is to make devices operate faster. Next difference is provided access to
> sub-devices. Concatenation layer provides linear access to sub-devices.
> Striping provides interleaved access to sub-devices.
>   
Still it's unclear why not to provide a configurable extension to 
mtdconcat rather than create a new layer.
> Simultaneous operation means separate threads. Each independent chip
> which participates in creation of striped volume has its own worker
> thread. Worker threads are created at the stage of striped device
> initialization. Each worker thread has its own operation queue and
> interleaving algorithm feeds them. Worker threads interact with flash
> drivers (CFI, NAND subsystem).
>   
Sooo many threads... :(
>
> 3. POSSIBLE CONFIGURATIONS AND LIMITATIONS
> It is possible to stripe devices of the same type. We can't stripe NOR
> and NAND, but only NOR and NOR or NAND and NAND. Flashes of the same
> type can differ in erase size and total size. 
>   
Why is that? Being able to deal only with flash chips of the same type, 
your approach has very limited applicability (probably limited to almost 
only Intel platforms ;))

And, well, just having looked through the patch, I'd like to point out 
multiple #ifdef's in C code and multiple whitespace problems.
> @@ -155,6 +158,15 @@
>  		};
>  	};
>  	up(&map_mutex);
> +
> +#ifdef CONFIG_MTD_CMDLINE_STRIPE
> +#ifndef MODULE
> +	if(mtd_stripe_init()) {
> +	    printk(KERN_WARNING "MTD stripe initialization from cmdline
> has failed\n");
> +	}
> +#endif
> +#endif
>   
Bah, what's going on here?
> +/* Operation codes */
> +#define MTD_STRIPE_OPCODE_READ		0x1
> +#define MTD_STRIPE_OPCODE_WRITE		0x2
> +#define MTD_STRIPE_OPCODE_READ_ECC	0x3
> +#define MTD_STRIPE_OPCODE_WRITE_ECC	0x4
> +#define MTD_STRIPE_OPCODE_WRITE_OOB	0x5
> +#define MTD_STRIPE_OPCODE_ERASE		0x6
>   
You don't need READ_OOB, eh?
> +/*
> + * Miscelaneus support routines
> + */
> + 
> +/*
> + * searches for least common multiple of a and b
> + * returns: LCM or 0 in case of error
> + */
> +u_int32_t
> +lcm(u_int32_t a, u_int32_t b)
> +{
> +    u_int32_t lcm;
> +    u_int32_t t1 = a;
> +    u_int32_t t2 = b;
> +    
> +    if(a <= 0 || b <= 0) 
> +    {
> +    	lcm = 0;
> +	printk(KERN_ERR "lcm(): wrong arguments\n");
> +    }
> +    else if(a == b)
> +    {
> +	/* trivial case */
> +	lcm = a;
> +    }
> +    else
> +    {
> +        do
> +        {
> +            lcm = a;
> +            a = b;
> +            b = lcm - a*(lcm/a);
> +        }
> +        while(b!=0);
> +	
> +	if(t1 % a)
> +		lcm = (t2 / a) * t1;
> +	else
> +		lcm = (t1 / a) * t2;
> +    }
> +
> +    return lcm;
> +} /* int lcm(int a, int b) */
> +
> +u_int32_t last_offset(struct mtd_stripe *stripe, int subdev_num);
> +
> +/*
> + * Calculates last_offset for specific striped subdevice
> + * NOTE: subdev array MUST be sorted
> + * by subdevice size (from the smallest to the largest)
> + */
> +u_int32_t
> +last_offset(struct mtd_stripe *stripe, int subdev_num)
>   
Aint this one and stuff alike gonna be static?
> +int stripe_merge_oobinfo(struct mtd_info *mtd, struct mtd_info
> *subdev[], int num_devs)
> +{
> +    int ret = 0;
> +    int i, j;
> +    uint32_t eccpos_max_num = sizeof(mtd->oobinfo.eccpos) /
> sizeof(uint32_t);
> +    uint32_t eccpos_counter = 0;
> +    uint32_t oobfree_max_num = 8; /* array size defined in mtd-abi.h */
> +    uint32_t oobfree_counter = 0;
> +    
> +    if(mtd->type != MTD_NANDFLASH)
> +	return 0;
> +    
> +    mtd->oobinfo.useecc = subdev[0]->oobinfo.useecc;
> +    mtd->oobinfo.eccbytes = subdev[0]->oobinfo.eccbytes;
> +    for(i = 1; i < num_devs; i++)
> +    {
> +	if(mtd->oobinfo.useecc != subdev[i]->oobinfo.useecc ||
> +	    mtd->oobinfo.eccbytes != subdev[i]->oobinfo.eccbytes)
> +	{
> +	    printk(KERN_ERR "stripe_merge_oobinfo(): oobinfo parameters
> is not compatible for all subdevices\n");
> +	    return -EINVAL;
> +	}
> +    }
>   
I guess this is a limitation that is not mentioned anywhere.
> +    
> +    mtd->oobinfo.eccbytes *= num_devs;
> +    
> +    /* drop old oobavail value */
> +    mtd->oobavail = 0;
> +    
> +    /* merge oobfree space positions */
> +    for(i = 0; i < num_devs; i++)
> +    {
> +	for(j = 0; j < oobfree_max_num; j++)
> +	{
> +	    if(subdev[i]->oobinfo.oobfree[j][1])
> +	    {
> +		if(oobfree_counter >= oobfree_max_num)
> +		    break;
> +
> +		mtd->oobinfo.oobfree[oobfree_counter][0] =
> subdev[i]->oobinfo.oobfree[j][0] +
> +							    i *
> subdev[i]->oobsize;
> +		mtd->oobinfo.oobfree[oobfree_counter][1] =
> subdev[i]->oobinfo.oobfree[j][1];
> +							    
> +		mtd->oobavail += subdev[i]->oobinfo.oobfree[j][1];
> +		oobfree_counter++;
> +	    }
> +	}
> +    }
> +    
> +    /* merge ecc positions */
> +    for(i = 0; i < num_devs; i++)
> +    {
> +	for(j = 0; j < eccpos_max_num; j++)
> +	{
> +	    if(subdev[i]->oobinfo.eccpos[j])
> +	    {
> +		if(eccpos_counter >= eccpos_max_num)
> +		{
> +		    printk(KERN_ERR "stripe_merge_oobinfo(): eccpos
> merge error\n");
> +		    return -EINVAL;
> +		}
> +
> mtd->oobinfo.eccpos[eccpos_counter]=subdev[i]->oobinfo.eccpos[j] + i *
> subdev[i]->oobsize;
> +		eccpos_counter++;
> +	    }
> +	}
> +    }
> +    
> +    return ret;
> +}
> +
> +/* End of support routines */
> +
> +/* Multithreading support routines */
> +
> +/* Write to flash thread */
> +static void
> +stripe_write_thread(void *arg)
> +{
> +    struct mtd_sw_thread_info* info = (struct mtd_sw_thread_info*)arg;
> +    struct mtd_stripe_op* op;
> +    struct subop_struct* subops;
> +    u_int32_t retsize;
> +    int err;
> +	
> +    int i;
> +    struct list_head *pos;
> +
> +    /* erase operation stuff */	
> +    struct erase_info erase;	/* local copy */
> +    struct erase_info *instr;	/* pointer to original */
> +	
> +    info->thread = current;
> +    up(&info->sw_thread_startstop);
> +
> +    while(info->sw_thread)
> +    {
> +	/* wait for downcoming write/erase operation */
> +	down(&info->sw_thread_wait);
> +		
> +	/* issue operation to the device and remove it from the list
> afterwards*/
> +	spin_lock(&info->list_lock);
> +	if(!list_empty(&info->list))
> +	{
> +	    op = list_entry(info->list.next,struct mtd_stripe_op, list);
> +	}
> +	else
> +	{
> +	    /* no operation in queue but sw_thread_wait has been rised.
> +	     * it means stripe_stop_write_thread() has been called
> +	     */
> +	    op = NULL;
> +	}
> +	spin_unlock(&info->list_lock);
> +
> +        /* leave main thread loop if no ops */		
> +	if(!op)
> +	    break;
> +		
> +	err = 0;
> +	op->status = 0;
> +		
> +	switch(op->opcode)
> +	{
> +	    case MTD_STRIPE_OPCODE_WRITE:
> +	    case MTD_STRIPE_OPCODE_WRITE_OOB:
> +		/* proceed with list head first */
> +		subops = &op->subops;
> +				
> +		for(i = 0; i < subops->ops_num; i++)
> +		{
> +		    if(op->opcode == MTD_STRIPE_OPCODE_WRITE)
> +    			err = info->subdev->write(info->subdev,
> subops->ops_array[i].ofs, subops->ops_array[i].len, &retsize,
> subops->ops_array[i].buf);
> +		    else
> +			err = info->subdev->write_oob(info->subdev,
> subops->ops_array[i].ofs, subops->ops_array[i].len, &retsize,
> subops->ops_array[i].buf);
> +		    
> +		    if(err)
> +		    {
> +			op->status = -EINVAL;
> +			printk(KERN_ERR "mtd_stripe: write operation
> failed %d\n",err);
> +				break;
> +		    }
> +		}
> +				
> +		if(!op->status)
> +		{
> +		    /* now proceed each list element except head */
> +		    list_for_each(pos, &op->subops.list)
> +		    {
> +			subops = list_entry(pos, struct subop_struct,
> list);
> +				
> +			for(i = 0; i < subops->ops_num; i++)
> +			{
> +			    if(op->opcode == MTD_STRIPE_OPCODE_WRITE)
> +				err = info->subdev->write(info->subdev,
> subops->ops_array[i].ofs, subops->ops_array[i].len, &retsize,
> subops->ops_array[i].buf);
> +			    else
> +				err =
> info->subdev->write_oob(info->subdev, subops->ops_array[i].ofs,
> subops->ops_array[i].len, &retsize, subops->ops_array[i].buf);
> +				
> +			    if(err)
> +			    {
> +				op->status = -EINVAL;
> +				printk(KERN_ERR "mtd_stripe: write
> operation failed %d\n",err);
> +				break;
> +			    }
> +			}
> +					
> +			if(op->status)
> +			    break;
> +		    }
> +		}
> +		break;
> +				
> +	    case MTD_STRIPE_OPCODE_ERASE:
> +		subops = &op->subops;
> +		instr = (struct erase_info *)subops->ops_array[0].buf;
> +				
> +		/* make a local copy of original erase instruction to
> avoid modifying the caller's struct */
> +		erase = *instr;
> +		erase.addr = subops->ops_array[0].ofs;
> +		erase.len = subops->ops_array[0].len;
> +
> +		if ((err = stripe_dev_erase(info->subdev, &erase)))
> +		{
> +		    /* sanity check: should never happen since
> +		     * block alignment has been checked early in
> stripe_erase() */
> +					 
> +		    if(erase.fail_addr != 0xffffffff)
> +			/* For now this adddres shows address
> +			 * at failed subdevice,but not at "super" device
> */		    
> +			op->fail_addr = erase.fail_addr; 
> +		}
> +
> +		op->status = err;
> +		op->state = erase.state;
> +		break;
> +		
> +	    case MTD_STRIPE_OPCODE_WRITE_ECC:
> +		/* proceed with list head first */
> +		subops = &op->subops;
> +				
> +		for(i = 0; i < subops->ops_num; i++)
> +		{
> +		    err = info->subdev->write_ecc(info->subdev,
> subops->ops_array[i].ofs, subops->ops_array[i].len,
> +						    &retsize,
> subops->ops_array[i].buf,
> +
> subops->ops_array[i].eccbuf, &info->subdev->oobinfo);
> +		    if(err)
> +		    {
> +			op->status = -EINVAL;
> +			printk(KERN_ERR "mtd_stripe: write operation
> failed %d\n",err);
> +				break;
> +		    }
> +		}
> +				
> +		if(!op->status)
> +		{
> +		    /* now proceed each list element except head */
> +		    list_for_each(pos, &op->subops.list)
> +		    {
> +			subops = list_entry(pos, struct subop_struct,
> list);
> +				
> +			for(i = 0; i < subops->ops_num; i++)
> +			{
> +			    err = info->subdev->write_ecc(info->subdev,
> subops->ops_array[i].ofs, subops->ops_array[i].len,
> +							    &retsize,
> subops->ops_array[i].buf,
> +
> subops->ops_array[i].eccbuf, &info->subdev->oobinfo);
> +			    if(err)
> +			    {
> +				op->status = -EINVAL;
> +				printk(KERN_ERR "mtd_stripe: write
> operation failed %d\n",err);
> +				break;
> +			    }
> +			}
> +					
> +			if(op->status)
> +			    break;
> +		    }
> +		}
> +		break;
> +	    
> +	    case MTD_STRIPE_OPCODE_READ_ECC:
> +	    case MTD_STRIPE_OPCODE_READ:
> +		/* proceed with list head first */
> +		subops = &op->subops;
> +				
> +		for(i = 0; i < subops->ops_num; i++)
> +		{
> +		    if(op->opcode == MTD_STRIPE_OPCODE_READ_ECC)
> +		    {
> +			err = info->subdev->read_ecc(info->subdev,
> subops->ops_array[i].ofs, subops->ops_array[i].len,
> +						    &retsize,
> subops->ops_array[i].buf,
> +
> subops->ops_array[i].eccbuf, &info->subdev->oobinfo);
> +		    }
> +		    else
> +		    {
> +			err = info->subdev->read(info->subdev,
> subops->ops_array[i].ofs, subops->ops_array[i].len,
> +					    &retsize,
> subops->ops_array[i].buf);
> +		    }
> +		    
> +		    if(err)
> +		    {
> +			op->status = -EINVAL;
> +			printk(KERN_ERR "mtd_stripe: read operation
> failed %d\n",err);
> +				break;
> +		    }
> +		}
> +				
> +		if(!op->status)
> +		{
> +		    /* now proceed each list element except head */
> +		    list_for_each(pos, &op->subops.list)
> +		    {
> +			subops = list_entry(pos, struct subop_struct,
> list);
> +				
> +			for(i = 0; i < subops->ops_num; i++)
> +			{
> +			    if(op->opcode == MTD_STRIPE_OPCODE_READ_ECC)
> +			    {
> +				err =
> info->subdev->read_ecc(info->subdev, subops->ops_array[i].ofs,
> subops->ops_array[i].len,
> +							    &retsize,
> subops->ops_array[i].buf,
> +
> subops->ops_array[i].eccbuf, &info->subdev->oobinfo);
> +			    }
> +			    else
> +			    {
> +				err = info->subdev->read(info->subdev,
> subops->ops_array[i].ofs, subops->ops_array[i].len,
> +							    &retsize,
> subops->ops_array[i].buf);
> +			    }
> +			    
> +			    if(err)
> +			    {
> +				op->status = -EINVAL;
> +				printk(KERN_ERR "mtd_stripe: read
> operation failed %d\n",err);
> +				break;
> +			    }
> +			}
> +					
> +			if(op->status)
> +			    break;
> +		    }
> +		}
> +	    
> +		break;
> +				
> +	    default:
> +		/* unknown operation code */
> +		printk(KERN_ERR "mtd_stripe: invalid operation code %d",
> op->opcode);
> +		op->status = -EINVAL;
> +		break;
> +	};
> +		
> +	/* remove issued operation from the list */
> +	spin_lock(&info->list_lock);
> +	list_del(&op->list);
> +	spin_unlock(&info->list_lock);
> +		
> +	/* raise semaphore to let stripe_write() or stripe_erase()
> continue */
> +	up(&op->sem);
> +    }
> +	
> +    info->thread = NULL;
> +    up(&info->sw_thread_startstop);
> +}
> +
> +/* Launches write to flash thread */
> +int
> +stripe_start_write_thread(struct mtd_sw_thread_info* info, struct
> mtd_info *device)
> +{
> +    pid_t pid;
> +    int ret = 0;
> +	
> +    if(info->thread)
> +	BUG();
> +		
> +    info->subdev = device;				/* set the
> pointer to corresponding device */
> +
> +    init_MUTEX_LOCKED(&info->sw_thread_startstop);	/* init
> start/stop semaphore */
> +    info->sw_thread = 1; 				/* set continue
> thread flag */
> +    init_MUTEX_LOCKED(&info->sw_thread_wait);	/* init "wait for data"
> semaphore */
> +	
> +    INIT_LIST_HEAD(&info->list);			/* initialize
> operation list head */
> +	
> +    spin_lock_init(&info->list_lock);		/* init list lock */
> +	
> +    pid = kernel_thread((int (*)(void *))stripe_write_thread, info,
> CLONE_KERNEL); /* flags (3rd arg) TBD */
> +    if (pid < 0)
> +    {
> +	printk(KERN_ERR "fork failed for MTD stripe thread: %d\n",
> -pid);
> +	ret = pid;
> +    }
> +    else
> +    {
> +	/* wait thread started */
> +	DEBUG(MTD_DEBUG_LEVEL1, "MTD stripe: write thread has pid %d\n",
> pid);
> +	down(&info->sw_thread_startstop);
> +    }
> + 
> +    return ret;
> +}
> +
> +/* Complete write to flash thread */
> +void
> +stripe_stop_write_thread(struct mtd_sw_thread_info* info)
> +{
> +    if(info->thread)
> +    {
> +	info->sw_thread = 0;			/* drop thread flag */
> +	up(&info->sw_thread_wait);		/* let the thread
> complete */
> +	down(&info->sw_thread_startstop);	/* wait for thread
> completion */
> +	DEBUG(MTD_DEBUG_LEVEL1, "MTD stripe: writing thread has been
> stopped\n");
> +    }
> +}
> +
> +/* Updates write/erase thread priority to max value
> + * based on operations in the queue
> + */
> +void
> +stripe_set_write_thread_prio(struct mtd_sw_thread_info* info)
> +{
> +    struct mtd_stripe_op *op;
> +    int oldnice, newnice;
> +    struct list_head *pos;
> +    
> +    newnice = oldnice = info->thread->static_prio - MAX_RT_PRIO - 20;
> +
> +    spin_lock(&info->list_lock);
> +    list_for_each(pos, &info->list)
> +    {
> +        op = list_entry(pos, struct mtd_stripe_op, list);
> +	newnice = (op->op_prio < newnice) ? op->op_prio : newnice;
> +    }
> +    spin_unlock(&info->list_lock);
> +    
> +    newnice = (newnice < -20) ? -20 : newnice;
> +    
> +    if(oldnice != newnice)
> +	set_user_nice(info->thread, newnice);
> +}
> +
> +/* add sub operation into the array
> +   op - pointer to the operation structure
> +   ofs - operation offset within subdevice
> +   len - data to be written/erased
> +   buf - pointer to the buffer with data to be written (NULL is erase
> operation)
> +   
> +   returns: 0 - success
> +*/
> +static inline int
> +stripe_add_subop(struct mtd_stripe_op *op, u_int32_t ofs, u_int32_t
> len, const u_char *buf, const u_char *eccbuf)
> +{
> +    u_int32_t size;				/* number of items in
> the new array (if any) */
> +    struct subop_struct *subop;
> +
> +    if(!op)
> +	BUG(); /* error */
> +
> +    /* get tail list element or head */	
> +    subop = list_entry(op->subops.list.prev, struct subop_struct,
> list);
> +		
> +    /* check if current suboperation array is already filled or not */
> +    if(subop->ops_num >= subop->ops_num_max)
> +    {
> +	/* array is full. allocate new one and add to list */
> +	size = SIZEOF_STRUCT_MTD_STRIPE_SUBOP(op->subops.ops_num_max);
> +	subop = kmalloc(size, GFP_KERNEL);
> +	if(!subop)
> +	{
> +    	    printk(KERN_ERR "mtd_stripe: memory allocation error!\n");
> +	    return -ENOMEM;
> +	}
> +		
> +	memset(subop, 0, size);
> +	subop->ops_num = 0;
> +	subop->ops_num_max = op->subops.ops_num_max;
> +	subop->ops_array = (struct subop *)(subop + 1);
> +		
> +	list_add_tail(&subop->list, &op->subops.list);
> +    }
> +
> +    subop->ops_array[subop->ops_num].ofs = ofs;
> +    subop->ops_array[subop->ops_num].len = len;
> +    subop->ops_array[subop->ops_num].buf = (u_char *)buf;
> +    subop->ops_array[subop->ops_num].eccbuf = (u_char *)eccbuf;
> +
> +    subop->ops_num++;	/* increase stored suboperations counter */
> +	
> +    return 0;
> +}
> +
> +/* deallocates memory allocated by stripe_add_subop routine */
> +static void
> +stripe_destroy_op(struct mtd_stripe_op *op)
> +{
> +    struct subop_struct *subop;
> +	
> +    while(!list_empty(&op->subops.list))
> +    {
> +	subop = list_entry(op->subops.list.next,struct subop_struct,
> list);
> +	list_del(&subop->list);
> +	kfree(subop);
> +    }
> +}
> +
> +/* adds new operation to the thread queue and unlock wait semaphore for
> specific thread */
> +static void
> +stripe_add_op(struct mtd_sw_thread_info* info, struct mtd_stripe_op*
> op)
> +{
> +    if(!info || !op)
> +    	BUG();
> +	
> +    spin_lock(&info->list_lock);
> +    list_add_tail(&op->list, &info->list);
> +    spin_unlock(&info->list_lock);
> +}
> +
> +/* End of multithreading support routines */
> +
> +
> +/* 
> + * MTD methods which look up the relevant subdevice, translate the
> + * effective address and pass through to the subdevice.
> + */
> +
> +
> +/* sychroneous read from striped volume */
> +static int
> +stripe_read_sync(struct mtd_info *mtd, loff_t from, size_t len,
> +	    size_t * retlen, u_char * buf)
> +{
> +    u_int32_t from_loc = (u_int32_t)from;	/* we can do this since
> whole MTD size in current implementation has u_int32_t type */
> +	
> +    struct mtd_stripe *stripe = STRIPE(mtd);
> +    int err = -EINVAL;
> +    int i;
> +
> +    u_int32_t subdev_offset;		/* equal size subdevs offset
> (interleaved block size count)*/
> +    u_int32_t subdev_number;		/* number of current subdev */
> +    u_int32_t subdev_offset_low;	/* subdev offset to read/write
> (bytes). used for "first" probably unaligned with erasesize data block
> */
> +    size_t subdev_len;			/* data size to be read/written
> from/to subdev at this turn (bytes) */
> +    int dev_count;			/* equal size subdev count */
> +    size_t len_left = len;		/* total data size to read/write
> left (bytes) */
> +    size_t retsize;			/* data read/written from/to
> subdev (bytes) */
> +
> +    *retlen = 0;
> +
> +    DEBUG(MTD_DEBUG_LEVEL2, "stripe_read_sync(): offset = 0x%08x, size
> = %d\n", from_loc, len);
> +
> +    /* Check whole striped device bounds here */
> +    if(from_loc + len > mtd->size)
> +    {
> +	return err;
> +    }
> +	
> +    /* Locate start position and corresponding subdevice number */
> +    subdev_offset = 0;
> +    subdev_number = 0;
> +    dev_count = stripe->num_subdev;
> +    for(i = (stripe->num_subdev - 1); i > 0; i--)
> +    {
> +	if(from_loc >= stripe->subdev_last_offset[i-1])
> +	{
> +    	    dev_count = stripe->num_subdev - i; /* get "equal size"
> devices count */
> +	    subdev_offset = stripe->subdev[i - 1]->size /
> stripe->interleave_size - 1;
> +	    subdev_offset += ((from_loc - stripe->subdev_last_offset[i -
> 1]) / stripe->interleave_size) / dev_count;
> +	    subdev_number = i + ((from_loc -
> stripe->subdev_last_offset[i - 1]) / stripe->interleave_size) %
> dev_count;
> +	    break;
> +	}
> +    }
> +	
> +    if(subdev_offset == 0)
> +    {
> +	subdev_offset = (from_loc / stripe->interleave_size) /
> dev_count;
> +	subdev_number = (from_loc / stripe->interleave_size) %
> dev_count;
> +    }
> +
> +    subdev_offset_low = from_loc % stripe->interleave_size;
> +    subdev_len = (len_left < (stripe->interleave_size -
> subdev_offset_low)) ? len_left : (stripe->interleave_size -
> subdev_offset_low);
> +    subdev_offset_low += subdev_offset * stripe->interleave_size;
> +	
> +    /* Synch read here */
> +    DEBUG(MTD_DEBUG_LEVEL3, "stripe_read_sync(): device = %d, offset =
> 0x%08x, len = %d\n", subdev_number, subdev_offset_low, subdev_len);
> +    err =
> stripe->subdev[subdev_number]->read(stripe->subdev[subdev_number],
> subdev_offset_low, subdev_len, &retsize, buf);
> +    if(!err)
> +    {
> +	*retlen += retsize;
> +	len_left -= subdev_len;
> +	buf += subdev_len;
> +	if(from_loc + *retlen >=
> stripe->subdev_last_offset[stripe->num_subdev - dev_count])
> +    	    dev_count--;
> +    }
> +		
> +    while(!err && len_left > 0 && dev_count > 0)
> +    {
> +    	subdev_number++;
> +	if(subdev_number >= stripe->num_subdev)
> +	{
> +	    subdev_number = stripe->num_subdev - dev_count;
> +	    subdev_offset++;
> +	}
> +	subdev_len = (len_left < stripe->interleave_size) ? len_left :
> stripe->interleave_size;
> +
> +	/* Synch read here */
> +	DEBUG(MTD_DEBUG_LEVEL3, "stripe_read_sync(): device = %d, offset
> = 0x%08x, len = %d\n", subdev_number, subdev_offset *
> stripe->interleave_size, subdev_len);
> +	err =
> stripe->subdev[subdev_number]->read(stripe->subdev[subdev_number],
> subdev_offset * stripe->interleave_size, subdev_len, &retsize, buf);
> +	if(err)
> +	    break;
> +			
> +	*retlen += retsize;
> +	len_left -= subdev_len;
> +	buf += subdev_len;
> +		
> +	if(from_loc + *retlen >=
> stripe->subdev_last_offset[stripe->num_subdev - dev_count])
> +	    dev_count--;
> +    }
> +	
> +    DEBUG(MTD_DEBUG_LEVEL2, "stripe_read_sync(): read %d bytes\n",
> *retlen);
> +    return err;
> +}
> +
> +
> +/* asychroneous read from striped volume */
> +static int
> +stripe_read_async(struct mtd_info *mtd, loff_t from, size_t len,
> +	    size_t * retlen, u_char * buf)
> +{
> +    u_int32_t from_loc = (u_int32_t)from;	/* we can do this since
> whole MTD size in current implementation has u_int32_t type */
> +	
> +    struct mtd_stripe *stripe = STRIPE(mtd);
> +    int err = -EINVAL;
> +    int i;
> +
> +    u_int32_t subdev_offset;		/* equal size subdevs offset
> (interleaved block size count)*/
> +    u_int32_t subdev_number;		/* number of current subdev */
> +    u_int32_t subdev_offset_low;	/* subdev offset to read/write
> (bytes). used for "first" probably unaligned with erasesize data block
> */
> +    size_t subdev_len;			/* data size to be read/written
> from/to subdev at this turn (bytes) */
> +    int dev_count;			/* equal size subdev count */
> +    size_t len_left = len;		/* total data size to read/write
> left (bytes) */
> +
> +    struct mtd_stripe_op *ops;		/* operations array (one per
> thread) */
> +    u_int32_t size;			/* amount of memory to be
> allocated for thread operations */
> +    u_int32_t queue_size;
> +
> +    *retlen = 0;
> +
> +    DEBUG(MTD_DEBUG_LEVEL2, "stripe_read_async(): offset = 0x%08x, size
> = %d\n", from_loc, len);
> +
> +    /* Check whole striped device bounds here */
> +    if(from_loc + len > mtd->size)
> +    {
> +	return err;
> +    }
> +
> +    /* allocate memory for multithread operations */
> +    queue_size = len / stripe->interleave_size / stripe->num_subdev +
> 1;	/* default queue size. could be set to predefined value */
> +    size = stripe->num_subdev *
> SIZEOF_STRUCT_MTD_STRIPE_OP(queue_size);
> +    ops = kmalloc(size, GFP_KERNEL);
> +    if(!ops)
> +    {
> +	printk(KERN_ERR "mtd_stripe: memory allocation error!\n");
> +	return -ENOMEM;
> +    }
> +	
> +    memset(ops, 0, size);
> +    for(i = 0; i < stripe->num_subdev; i++)
> +    {
> +	ops[i].opcode = MTD_STRIPE_OPCODE_READ;
> +	ops[i].caller_id = 0; 			/* TBD */
> +	init_MUTEX_LOCKED(&ops[i].sem);		/* mutex is locked here.
> to be unlocked by device thread */
> +	//ops[i].status = 0;			/* TBD */
> +
> +	INIT_LIST_HEAD(&ops[i].subops.list);	/* initialize
> suboperation list head */
> +
> +	ops[i].subops.ops_num = 0;		/* to be increased later
> here */
> +	ops[i].subops.ops_num_max = queue_size;	/* total number of
> suboperations can be stored in the array */
> +	ops[i].subops.ops_array = (struct subop *)((char *)(ops +
> stripe->num_subdev) + i * queue_size * sizeof(struct subop));
> +    }
> +	
> +    /* Locate start position and corresponding subdevice number */
> +    subdev_offset = 0;
> +    subdev_number = 0;
> +    dev_count = stripe->num_subdev;
> +    for(i = (stripe->num_subdev - 1); i > 0; i--)
> +    {
> +	if(from_loc >= stripe->subdev_last_offset[i-1])
> +	{
> +    	    dev_count = stripe->num_subdev - i; /* get "equal size"
> devices count */
> +	    subdev_offset = stripe->subdev[i - 1]->size /
> stripe->interleave_size - 1;
> +	    subdev_offset += ((from_loc - stripe->subdev_last_offset[i -
> 1]) / stripe->interleave_size) / dev_count;
> +	    subdev_number = i + ((from_loc -
> stripe->subdev_last_offset[i - 1]) / stripe->interleave_size) %
> dev_count;
> +	    break;
> +	}
> +    }
> +	
> +    if(subdev_offset == 0)
> +    {
> +	subdev_offset = (from_loc / stripe->interleave_size) /
> dev_count;
> +	subdev_number = (from_loc / stripe->interleave_size) %
> dev_count;
> +    }
> +
> +    subdev_offset_low = from_loc % stripe->interleave_size;
> +    subdev_len = (len_left < (stripe->interleave_size -
> subdev_offset_low)) ? len_left : (stripe->interleave_size -
> subdev_offset_low);
> +    subdev_offset_low += subdev_offset * stripe->interleave_size;
> +	
> +    /* asynch read here */
> +    DEBUG(MTD_DEBUG_LEVEL3, "stripe_read_async(): device = %d, offset =
> 0x%08x, len = %d\n", subdev_number, subdev_offset_low, subdev_len);
> +    err = stripe_add_subop(&ops[subdev_number], subdev_offset_low,
> subdev_len, buf, NULL);
> +    if(!err)
> +    {
> +	*retlen += subdev_len;
> +	len_left -= subdev_len;
> +	buf += subdev_len;
> +	if(from_loc + *retlen >=
> stripe->subdev_last_offset[stripe->num_subdev - dev_count])
> +    	    dev_count--;
> +    }
> +		
> +    while(!err && len_left > 0 && dev_count > 0)
> +    {
> +    	subdev_number++;
> +	if(subdev_number >= stripe->num_subdev)
> +	{
> +	    subdev_number = stripe->num_subdev - dev_count;
> +	    subdev_offset++;
> +	}
> +	subdev_len = (len_left < stripe->interleave_size) ? len_left :
> stripe->interleave_size;
> +
> +	/* Synch read here */
> +	DEBUG(MTD_DEBUG_LEVEL3, "stripe_read_async(): device = %d,
> offset = 0x%08x, len = %d\n", subdev_number, subdev_offset *
> stripe->interleave_size, subdev_len);
> +        err = stripe_add_subop(&ops[subdev_number], subdev_offset *
> stripe->interleave_size, subdev_len, buf, NULL);
> +	if(err)
> +	    break;
> +			
> +	*retlen += subdev_len;
> +	len_left -= subdev_len;
> +	buf += subdev_len;
> +		
> +	if(from_loc + *retlen >=
> stripe->subdev_last_offset[stripe->num_subdev - dev_count])
> +	    dev_count--;
> +    }
> +
> +    /* Push operation into the corresponding threads queue and rise
> semaphores */
> +    for(i = 0; i < stripe->num_subdev; i++)
> +    {
> +	stripe_add_op(&stripe->sw_threads[i], &ops[i]);
> +
> +	/* set original operation priority */
> +	ops[i].op_prio = current->static_prio - MAX_RT_PRIO - 20;
> +	stripe_set_write_thread_prio(&stripe->sw_threads[i]);
> +
> +	up(&stripe->sw_threads[i].sw_thread_wait);
> +    }
> +	
> +    /* wait for all suboperations completed and check status */
> +    for(i = 0; i < stripe->num_subdev; i++)
> +    {
> +	down(&ops[i].sem);
> +		
> +	/* set error if one of operations has failed */
> +	if(ops[i].status)
> +	    err = ops[i].status;
> +    }
> +
> +    /* Deallocate all memory before exit */
> +    for(i = 0; i < stripe->num_subdev; i++)
> +    {
> +	stripe_destroy_op(&ops[i]);
> +    }
> +    kfree(ops);
> +	
> +    DEBUG(MTD_DEBUG_LEVEL2, "stripe_read_async(): read %d bytes\n",
> *retlen);
> +    return err;
> +}
> +
> +
> +static int
> +stripe_read(struct mtd_info *mtd, loff_t from, size_t len,
> +	    size_t * retlen, u_char * buf)
> +{
> +    int err;
> +    if(mtd->type == MTD_NANDFLASH)
> +	err = stripe_read_async(mtd, from, len, retlen, buf);
> +    else
> +	err = stripe_read_sync(mtd, from, len, retlen, buf);
> +
> +    return err;
> +}
> +
> +
> +static int
> +stripe_write(struct mtd_info *mtd, loff_t to, size_t len,
> +	     size_t * retlen, const u_char * buf)
> +{
> +    u_int32_t to_loc = (u_int32_t)to;	/* we can do this since whole
> MTD size in current implementation has u_int32_t type */
> +
> +    struct mtd_stripe *stripe = STRIPE(mtd);
> +    int err = -EINVAL;
> +    int i;
> +
> +    u_int32_t subdev_offset;		/* equal size subdevs offset
> (interleaved block size count)*/
> +    u_int32_t subdev_number;		/* number of current subdev */
> +    u_int32_t subdev_offset_low;	/* subdev offset to read/write
> (bytes). used for "first" probably unaligned block */
> +    size_t subdev_len;			/* data size to be read/written
> from/to subdev at this turn (bytes) */
> +    int dev_count;			/* equal size subdev count */
> +    size_t len_left = len;		/* total data size to read/write
> left (bytes) */
> +	
> +    struct mtd_stripe_op *ops;		/* operations array (one per
> thread) */
> +    u_int32_t size;			/* amount of memory to be
> allocated for thread operations */
> +    u_int32_t queue_size;
> +
> +    *retlen = 0;
> +
> +    DEBUG(MTD_DEBUG_LEVEL2, "stripe_write(): offset = 0x%08x, size =
> %d\n", to_loc, len);
> +	
> +    /* check if no data is going to be written */
> +    if(!len)
> +        return 0;
> +	
> +    /* Check whole striped device bounds here */
> +    if(to_loc + len > mtd->size)
> +        return err;
> +	
> +    /* allocate memory for multithread operations */
> +    queue_size = len / stripe->interleave_size / stripe->num_subdev +
> 1;	/* default queue size. could be set to predefined value */
> +    size = stripe->num_subdev *
> SIZEOF_STRUCT_MTD_STRIPE_OP(queue_size);
> +    ops = kmalloc(size, GFP_KERNEL);
> +    if(!ops)
> +    {
> +	printk(KERN_ERR "mtd_stripe: memory allocation error!\n");
> +	return -ENOMEM;
> +    }
> +	
> +    memset(ops, 0, size);
> +    for(i = 0; i < stripe->num_subdev; i++)
> +    {
> +	ops[i].opcode = MTD_STRIPE_OPCODE_WRITE;
> +	ops[i].caller_id = 0; 			/* TBD */
> +	init_MUTEX_LOCKED(&ops[i].sem);		/* mutex is locked here.
> to be unlocked by device thread */
> +	//ops[i].status = 0;			/* TBD */
> +
> +	INIT_LIST_HEAD(&ops[i].subops.list);	/* initialize
> suboperation list head */
> +
> +	ops[i].subops.ops_num = 0;		/* to be increased later
> here */
> +	ops[i].subops.ops_num_max = queue_size;	/* total number of
> suboperations can be stored in the array */
> +	ops[i].subops.ops_array = (struct subop *)((char *)(ops +
> stripe->num_subdev) + i * queue_size * sizeof(struct subop));
> +    }
> +						
> +    /* Locate start position and corresponding subdevice number */
> +    subdev_offset = 0;
> +    subdev_number = 0;
> +    dev_count = stripe->num_subdev;
> +    for(i = (stripe->num_subdev - 1); i > 0; i--)
> +    {
> +	if(to_loc >= stripe->subdev_last_offset[i-1])
> +	{
> +	    dev_count = stripe->num_subdev - i; /* get "equal size"
> devices count */
> +	    subdev_offset = stripe->subdev[i - 1]->size /
> stripe->interleave_size - 1;
> +	    subdev_offset += ((to_loc - stripe->subdev_last_offset[i -
> 1]) / stripe->interleave_size) / dev_count;
> +	    subdev_number = i + ((to_loc - stripe->subdev_last_offset[i
> - 1]) / stripe->interleave_size) % dev_count;
> +	    break;
> +	}
> +    }
> +	
> +    if(subdev_offset == 0)
> +    {
> +	subdev_offset = (to_loc / stripe->interleave_size) / dev_count;
> +	subdev_number = (to_loc / stripe->interleave_size) % dev_count;
> +    }
> +	
> +    subdev_offset_low = to_loc % stripe->interleave_size;
> +    subdev_len = (len_left < (stripe->interleave_size -
> subdev_offset_low)) ? len_left : (stripe->interleave_size -
> subdev_offset_low);
> +    subdev_offset_low += subdev_offset * stripe->interleave_size;
> +	
> +    /* Add suboperation to queue here */
> +    err = stripe_add_subop(&ops[subdev_number], subdev_offset_low,
> subdev_len, buf, NULL);
> +    if(!err)
> +    {
> +	*retlen += subdev_len;
> +	len_left -= subdev_len;
> +	buf += subdev_len;
> +	if(to_loc + *retlen >=
> stripe->subdev_last_offset[stripe->num_subdev - dev_count])
> +    	    dev_count--;
> +    }
> +			
> +    while(!err && len_left > 0 && dev_count > 0)
> +    {
> +	subdev_number++;
> +	if(subdev_number >= stripe->num_subdev)
> +	{
> +	    subdev_number = stripe->num_subdev - dev_count;
> +	    subdev_offset++;
> +	}
> +	subdev_len = (len_left < stripe->interleave_size) ? len_left :
> stripe->interleave_size;
> +
> +	/* Add suboperation to queue here */
> +	err = stripe_add_subop(&ops[subdev_number], subdev_offset *
> stripe->interleave_size, subdev_len, buf, NULL);
> +	if(err)
> +	    break;
> +			
> +	*retlen += subdev_len;
> +	len_left -= subdev_len;
> +	buf += subdev_len;
> +		
> +	if(to_loc + *retlen >=
> stripe->subdev_last_offset[stripe->num_subdev - dev_count])
> +	    dev_count--;
> +    }
> +    
> +    /* Push operation into the corresponding threads queue and rise
> semaphores */
> +    for(i = 0; i < stripe->num_subdev; i++)
> +    {
> +	stripe_add_op(&stripe->sw_threads[i], &ops[i]);
> +
> +	/* set original operation priority */
> +	ops[i].op_prio = current->static_prio - MAX_RT_PRIO - 20;
> +	stripe_set_write_thread_prio(&stripe->sw_threads[i]);
> +
> +	up(&stripe->sw_threads[i].sw_thread_wait);
> +    }
> +	
> +    /* wait for all suboperations completed and check status */
> +    for(i = 0; i < stripe->num_subdev; i++)
> +    {
> +	down(&ops[i].sem);
> +		
> +	/* set error if one of operations has failed */
> +	if(ops[i].status)
> +	    err = ops[i].status;
> +    }
> +
> +    /* Deallocate all memory before exit */
> +    for(i = 0; i < stripe->num_subdev; i++)
> +    {
> +	stripe_destroy_op(&ops[i]);
> +    }
> +    kfree(ops);
> +	
> +    DEBUG(MTD_DEBUG_LEVEL2, "stripe_write(): written %d bytes\n",
> *retlen);
> +    return err;
> +}
> +
> +
> +/* synchroneous ecc read from striped volume */
> +static int
> +stripe_read_ecc_sync(struct mtd_info *mtd, loff_t from, size_t len,
> +		    size_t * retlen, u_char * buf, u_char * eccbuf,
> +		    struct nand_oobinfo *oobsel)
> +{
> +    u_int32_t from_loc = (u_int32_t)from;	/* we can do this since
> whole MTD size in current implementation has u_int32_t type */
> +	
> +    struct mtd_stripe *stripe = STRIPE(mtd);
> +    int err = -EINVAL;
> +    int i;
> +
> +    u_int32_t subdev_offset;		/* equal size subdevs offset
> (interleaved block size count)*/
> +    u_int32_t subdev_number;		/* number of current subdev */
> +    u_int32_t subdev_offset_low;	/* subdev offset to read/write
> (bytes). used for "first" probably unaligned with erasesize data block
> */
> +    size_t subdev_len;			/* data size to be read/written
> from/to subdev at this turn (bytes) */
> +    int dev_count;			/* equal size subdev count */
> +    size_t len_left = len;		/* total data size to read/write
> left (bytes) */
> +    size_t retsize;			/* data read/written from/to
> subdev (bytes) */
> +    
> +    *retlen = 0;
> +
> +    DEBUG(MTD_DEBUG_LEVEL2, "stripe_read_ecc_sync(): offset = 0x%08x,
> size = %d\n", from_loc, len);
> +    
> +    if(oobsel != NULL)
> +    {
> +        /* check if oobinfo is has been chandes by FS */
> +	if(memcmp(oobsel, &mtd->oobinfo, sizeof(struct nand_oobinfo)))
> +	{
> +	    printk(KERN_ERR "stripe_read_ecc_sync(): oobinfo has been
> changed by FS (not supported yet)\n");
> +	    return err;
> +	}
> +    }
> +
> +    /* Check whole striped device bounds here */
> +    if(from_loc + len > mtd->size)
> +    {
> +	return err;
> +    }
> +	
> +    /* Locate start position and corresponding subdevice number */
> +    subdev_offset = 0;
> +    subdev_number = 0;
> +    dev_count = stripe->num_subdev;
> +    for(i = (stripe->num_subdev - 1); i > 0; i--)
> +    {
> +	if(from_loc >= stripe->subdev_last_offset[i-1])
> +	{
> +    	    dev_count = stripe->num_subdev - i; /* get "equal size"
> devices count */
> +	    subdev_offset = stripe->subdev[i - 1]->size /
> stripe->interleave_size - 1;
> +	    subdev_offset += ((from_loc - stripe->subdev_last_offset[i -
> 1]) / stripe->interleave_size) / dev_count;
> +	    subdev_number = i + ((from_loc -
> stripe->subdev_last_offset[i - 1]) / stripe->interleave_size) %
> dev_count;
> +	    break;
> +	}
> +    }
> +	
> +    if(subdev_offset == 0)
> +    {
> +	subdev_offset = (from_loc / stripe->interleave_size) /
> dev_count;
> +	subdev_number = (from_loc / stripe->interleave_size) %
> dev_count;
> +    }
> +
> +    subdev_offset_low = from_loc % stripe->interleave_size;
> +    subdev_len = (len_left < (stripe->interleave_size -
> subdev_offset_low)) ? len_left : (stripe->interleave_size -
> subdev_offset_low);
> +    subdev_offset_low += subdev_offset * stripe->interleave_size;
> +	
> +    /* Synch read here */
> +    DEBUG(MTD_DEBUG_LEVEL3, "stripe_read_ecc_sync(): device = %d,
> offset = 0x%08x, len = %d\n", subdev_number, subdev_offset_low,
> subdev_len);
> +    err =
> stripe->subdev[subdev_number]->read_ecc(stripe->subdev[subdev_number],
> subdev_offset_low, subdev_len, &retsize, buf, eccbuf,
> &stripe->subdev[subdev_number]->oobinfo);
> +    if(!err)
> +    {
> +	*retlen += retsize;
> +	len_left -= subdev_len;
> +	buf += subdev_len;
> +	eccbuf += stripe->subdev[subdev_number]->oobavail;
> +	
> +	if(from_loc + *retlen >=
> stripe->subdev_last_offset[stripe->num_subdev - dev_count])
> +    	    dev_count--;
> +    }
> +		
> +    while(!err && len_left > 0 && dev_count > 0)
> +    {
> +    	subdev_number++;
> +	if(subdev_number >= stripe->num_subdev)
> +	{
> +	    subdev_number = stripe->num_subdev - dev_count;
> +	    subdev_offset++;
> +	}
> +	subdev_len = (len_left < stripe->interleave_size) ? len_left :
> stripe->interleave_size;
> +
> +	/* Synch read here */
> +	DEBUG(MTD_DEBUG_LEVEL3, "stripe_read_ecc_sync(): device = %d,
> offset = 0x%08x, len = %d\n", subdev_number, subdev_offset *
> stripe->interleave_size, subdev_len);
> +	err =
> stripe->subdev[subdev_number]->read_ecc(stripe->subdev[subdev_number],
> subdev_offset * stripe->interleave_size, subdev_len, &retsize, buf,
> eccbuf, &stripe->subdev[subdev_number]->oobinfo);
> +	if(err)
> +	    break;
> +			
> +	*retlen += retsize;
> +	len_left -= subdev_len;
> +	buf += subdev_len;
> +	eccbuf += stripe->subdev[subdev_number]->oobavail;
> +		
> +	if(from + *retlen >=
> stripe->subdev_last_offset[stripe->num_subdev - dev_count])
> +	    dev_count--;
> +    }
> +	
> +    DEBUG(MTD_DEBUG_LEVEL2, "stripe_read_ecc_sync(): read %d bytes\n",
> *retlen);
> +    return err;
> +}
> +
> +
> +/* asynchroneous ecc read from striped volume */
> +static int
> +stripe_read_ecc_async(struct mtd_info *mtd, loff_t from, size_t len,
> +		    size_t * retlen, u_char * buf, u_char * eccbuf,
> +		    struct nand_oobinfo *oobsel)
> +{
> +    u_int32_t from_loc = (u_int32_t)from;	/* we can do this since
> whole MTD size in current implementation has u_int32_t type */
> +	
> +    struct mtd_stripe *stripe = STRIPE(mtd);
> +    int err = -EINVAL;
> +    int i;
> +
> +    u_int32_t subdev_offset;		/* equal size subdevs offset
> (interleaved block size count)*/
> +    u_int32_t subdev_number;		/* number of current subdev */
> +    u_int32_t subdev_offset_low;	/* subdev offset to read/write
> (bytes). used for "first" probably unaligned with erasesize data block
> */
> +    size_t subdev_len;			/* data size to be read/written
> from/to subdev at this turn (bytes) */
> +    int dev_count;			/* equal size subdev count */
> +    size_t len_left = len;		/* total data size to read/write
> left (bytes) */
> +
> +    struct mtd_stripe_op *ops;		/* operations array (one per
> thread) */
> +    u_int32_t size;			/* amount of memory to be
> allocated for thread operations */
> +    u_int32_t queue_size;
> +    
> +    *retlen = 0;
> +
> +    DEBUG(MTD_DEBUG_LEVEL2, "stripe_read_ecc_async(): offset = 0x%08x,
> size = %d\n", from_loc, len);
> +    
> +    if(oobsel != NULL)
> +    {
> +        /* check if oobinfo is has been chandes by FS */
> +	if(memcmp(oobsel, &mtd->oobinfo, sizeof(struct nand_oobinfo)))
> +	{
> +	    printk(KERN_ERR "stripe_read_ecc_async(): oobinfo has been
> changed by FS (not supported yet)\n");
> +	    return err;
> +	}
> +    }
> +
> +    /* Check whole striped device bounds here */
> +    if(from_loc + len > mtd->size)
> +    {
> +	return err;
> +    }
> +
> +    /* allocate memory for multithread operations */
> +    queue_size = len / stripe->interleave_size / stripe->num_subdev +
> 1;	/* default queue size. could be set to predefined value */
> +    size = stripe->num_subdev *
> SIZEOF_STRUCT_MTD_STRIPE_OP(queue_size);
> +    ops = kmalloc(size, GFP_KERNEL);
> +    if(!ops)
> +    {
> +	printk(KERN_ERR "mtd_stripe: memory allocation error!\n");
> +	return -ENOMEM;
> +    }
> +	
> +    memset(ops, 0, size);
> +    for(i = 0; i < stripe->num_subdev; i++)
> +    {
> +	ops[i].opcode = MTD_STRIPE_OPCODE_READ_ECC;
> +	ops[i].caller_id = 0; 			/* TBD */
> +	init_MUTEX_LOCKED(&ops[i].sem);		/* mutex is locked here.
> to be unlocked by device thread */
> +	//ops[i].status = 0;			/* TBD */
> +
> +	INIT_LIST_HEAD(&ops[i].subops.list);	/* initialize
> suboperation list head */
> +
> +	ops[i].subops.ops_num = 0;		/* to be increased later
> here */
> +	ops[i].subops.ops_num_max = queue_size;	/* total number of
> suboperations can be stored in the array */
> +	ops[i].subops.ops_array = (struct subop *)((char *)(ops +
> stripe->num_subdev) + i * queue_size * sizeof(struct subop));
> +    }
> +	
> +    /* Locate start position and corresponding subdevice number */
> +    subdev_offset = 0;
> +    subdev_number = 0;
> +    dev_count = stripe->num_subdev;
> +    for(i = (stripe->num_subdev - 1); i > 0; i--)
> +    {
> +	if(from_loc >= stripe->subdev_last_offset[i-1])
> +	{
> +    	    dev_count = stripe->num_subdev - i; /* get "equal size"
> devices count */
> +	    subdev_offset = stripe->subdev[i - 1]->size /
> stripe->interleave_size - 1;
> +	    subdev_offset += ((from_loc - stripe->subdev_last_offset[i -
> 1]) / stripe->interleave_size) / dev_count;
> +	    subdev_number = i + ((from_loc -
> stripe->subdev_last_offset[i - 1]) / stripe->interleave_size) %
> dev_count;
> +	    break;
> +	}
> +    }
> +	
> +    if(subdev_offset == 0)
> +    {
> +	subdev_offset = (from_loc / stripe->interleave_size) /
> dev_count;
> +	subdev_number = (from_loc / stripe->interleave_size) %
> dev_count;
> +    }
> +
> +    subdev_offset_low = from_loc % stripe->interleave_size;
> +    subdev_len = (len_left < (stripe->interleave_size -
> subdev_offset_low)) ? len_left : (stripe->interleave_size -
> subdev_offset_low);
> +    subdev_offset_low += subdev_offset * stripe->interleave_size;
> +	
> +    /* Issue read operation here */
> +    DEBUG(MTD_DEBUG_LEVEL3, "stripe_read_ecc_async(): device = %d,
> offset = 0x%08x, len = %d\n", subdev_number, subdev_offset_low,
> subdev_len);
> +
> +    err = stripe_add_subop(&ops[subdev_number], subdev_offset_low,
> subdev_len, buf, eccbuf);
> +    if(!err)
> +    {
> +	*retlen += subdev_len;
> +	len_left -= subdev_len;
> +	buf += subdev_len;
> +	if(eccbuf)
> +	    eccbuf += stripe->subdev[subdev_number]->oobavail;
> +	
> +	if(from_loc + *retlen >=
> stripe->subdev_last_offset[stripe->num_subdev - dev_count])
> +    	    dev_count--;
> +    }
> +		
> +    while(!err && len_left > 0 && dev_count > 0)
> +    {
> +    	subdev_number++;
> +	if(subdev_number >= stripe->num_subdev)
> +	{
> +	    subdev_number = stripe->num_subdev - dev_count;
> +	    subdev_offset++;
> +	}
> +	subdev_len = (len_left < stripe->interleave_size) ? len_left :
> stripe->interleave_size;
> +
> +	/* Issue read operation here */
> +	DEBUG(MTD_DEBUG_LEVEL3, "stripe_read_ecc_async(): device = %d,
> offset = 0x%08x, len = %d\n", subdev_number, subdev_offset *
> stripe->interleave_size, subdev_len);
> +
> +	err = stripe_add_subop(&ops[subdev_number], subdev_offset *
> stripe->interleave_size, subdev_len, buf, eccbuf);
> +	if(err)
> +	    break;
> +
> +	*retlen += subdev_len;
> +	len_left -= subdev_len;
> +	buf += subdev_len;
> +	if(eccbuf)
> +	    eccbuf += stripe->subdev[subdev_number]->oobavail;
> +		
> +	if(from + *retlen >=
> stripe->subdev_last_offset[stripe->num_subdev - dev_count])
> +	    dev_count--;
> +    }
> +
> +    /* Push operation into the corresponding threads queue and rise
> semaphores */
> +    for(i = 0; i < stripe->num_subdev; i++)
> +    {
> +	stripe_add_op(&stripe->sw_threads[i], &ops[i]);
> +
> +	/* set original operation priority */
> +	ops[i].op_prio = current->static_prio - MAX_RT_PRIO - 20;
> +	stripe_set_write_thread_prio(&stripe->sw_threads[i]);
> +
> +	up(&stripe->sw_threads[i].sw_thread_wait);
> +    }
> +	
> +    /* wait for all suboperations completed and check status */
> +    for(i = 0; i < stripe->num_subdev; i++)
> +    {
> +	down(&ops[i].sem);
> +		
> +	/* set error if one of operations has failed */
> +	if(ops[i].status)
> +	    err = ops[i].status;
> +    }
> +
> +    /* Deallocate all memory before exit */
> +    for(i = 0; i < stripe->num_subdev; i++)
> +    {
> +	stripe_destroy_op(&ops[i]);
> +    }
> +    kfree(ops);
> +	
> +    DEBUG(MTD_DEBUG_LEVEL2, "stripe_read_ecc_async(): read %d bytes\n",
> *retlen);
> +    return err;
> +}
> +
> +
> +static int
> +stripe_read_ecc(struct mtd_info *mtd, loff_t from, size_t len,
> +	        size_t * retlen, u_char * buf, u_char * eccbuf,
> +		struct nand_oobinfo *oobsel)
> +{
> +    int err;
> +    if(mtd->type == MTD_NANDFLASH)
> +	err = stripe_read_ecc_async(mtd, from, len, retlen, buf, eccbuf,
> oobsel);
> +    else
> +	err = stripe_read_ecc_sync(mtd, from, len, retlen, buf, eccbuf,
> oobsel);
> +    
> +    return err;
> +}
> +
> +
> +static int
> +stripe_write_ecc(struct mtd_info *mtd, loff_t to, size_t len,
> +		 size_t * retlen, const u_char * buf, u_char * eccbuf,
> +		 struct nand_oobinfo *oobsel)
> +{
> +    u_int32_t to_loc = (u_int32_t)to;	/* we can do this since whole
> MTD size in current implementation has u_int32_t type */
> +
> +    struct mtd_stripe *stripe = STRIPE(mtd);
> +    int err = -EINVAL;
> +    int i;
> +
> +    u_int32_t subdev_offset;		/* equal size subdevs offset
> (interleaved block size count)*/
> +    u_int32_t subdev_number;		/* number of current subdev */
> +    u_int32_t subdev_offset_low;	/* subdev offset to read/write
> (bytes). used for "first" probably unaligned block */
> +    size_t subdev_len;			/* data size to be read/written
> from/to subdev at this turn (bytes) */
> +    int dev_count;			/* equal size subdev count */
> +    size_t len_left = len;		/* total data size to read/write
> left (bytes) */
> +	
> +    struct mtd_stripe_op *ops;		/* operations array (one per
> thread) */
> +    u_int32_t size;			/* amount of memory to be
> allocated for thread operations */
> +    u_int32_t queue_size;
> +    
> +    *retlen = 0;
> +
> +    DEBUG(MTD_DEBUG_LEVEL2, "stripe_write_ecc(): offset = 0x%08x, size
> = %d\n", to_loc, len);
> +
> +    if(oobsel != NULL)
> +    {
> +        /* check if oobinfo is has been chandes by FS */
> +	if(memcmp(oobsel, &mtd->oobinfo, sizeof(struct nand_oobinfo)))
> +	{
> +	    printk(KERN_ERR "stripe_write_ecc(): oobinfo has been
> changed by FS (not supported yet)\n");
> +	    return err;
> +	}
> +    }
> +	
> +    /* check if no data is going to be written */
> +    if(!len)
> +        return 0;
> +	
> +    /* Check whole striped device bounds here */
> +    if(to_loc + len > mtd->size)
> +        return err;
> +	
> +    /* allocate memory for multithread operations */
> +    queue_size = len / stripe->interleave_size / stripe->num_subdev +
> 1;	/* default queue size */
> +    size = stripe->num_subdev *
> SIZEOF_STRUCT_MTD_STRIPE_OP(queue_size);
> +    ops = kmalloc(size, GFP_KERNEL);
> +    if(!ops)
> +    {
> +	printk(KERN_ERR "mtd_stripe: memory allocation error!\n");
> +	return -ENOMEM;
> +    }
> +	
> +    memset(ops, 0, size);
> +    for(i = 0; i < stripe->num_subdev; i++)
> +    {
> +	ops[i].opcode = MTD_STRIPE_OPCODE_WRITE_ECC;
> +	ops[i].caller_id = 0; 			/* TBD */
> +	init_MUTEX_LOCKED(&ops[i].sem);		/* mutex is locked here.
> to be unlocked by device thread */
> +	//ops[i].status = 0;			/* TBD */
> +
> +	INIT_LIST_HEAD(&ops[i].subops.list);	/* initialize
> suboperation list head */
> +
> +	ops[i].subops.ops_num = 0;		/* to be increased later
> here */
> +	ops[i].subops.ops_num_max = queue_size;	/* total number of
> suboperations can be stored in the array */
> +	ops[i].subops.ops_array = (struct subop *)((char *)(ops +
> stripe->num_subdev) + i * queue_size * sizeof(struct subop));
> +    }
> +						
> +    /* Locate start position and corresponding subdevice number */
> +    subdev_offset = 0;
> +    subdev_number = 0;
> +    dev_count = stripe->num_subdev;
> +    for(i = (stripe->num_subdev - 1); i > 0; i--)
> +    {
> +	if(to_loc >= stripe->subdev_last_offset[i-1])
> +	{
> +	    dev_count = stripe->num_subdev - i; /* get "equal size"
> devices count */
> +	    subdev_offset = stripe->subdev[i - 1]->size /
> stripe->interleave_size - 1;
> +	    subdev_offset += ((to_loc - stripe->subdev_last_offset[i -
> 1]) / stripe->interleave_size) / dev_count;
> +	    subdev_number = i + ((to_loc - stripe->subdev_last_offset[i
> - 1]) / stripe->interleave_size) % dev_count;
> +	    break;
> +	}
> +    }
> +	
> +    if(subdev_offset == 0)
> +    {
> +	subdev_offset = (to_loc / stripe->interleave_size) / dev_count;
> +	subdev_number = (to_loc / stripe->interleave_size) % dev_count;
> +    }
> +	
> +    subdev_offset_low = to_loc % stripe->interleave_size;
> +    subdev_len = (len_left < (stripe->interleave_size -
> subdev_offset_low)) ? len_left : (stripe->interleave_size -
> subdev_offset_low);
> +    subdev_offset_low += subdev_offset * stripe->interleave_size;
> +	
> +    /* Add suboperation to queue here */
> +    err = stripe_add_subop(&ops[subdev_number], subdev_offset_low,
> subdev_len, buf, eccbuf);
> +    if(!err)
> +    {
> +	*retlen += subdev_len;
> +	len_left -= subdev_len;
> +	buf += subdev_len;
> +	if(eccbuf)
> +	    eccbuf += stripe->subdev[subdev_number]->oobavail;
> +	
> +	if(to_loc + *retlen >=
> stripe->subdev_last_offset[stripe->num_subdev - dev_count])
> +    	    dev_count--;
> +    }
> +			
> +    while(!err && len_left > 0 && dev_count > 0)
> +    {
> +	subdev_number++;
> +	if(subdev_number >= stripe->num_subdev)
> +	{
> +	    subdev_number = stripe->num_subdev - dev_count;
> +	    subdev_offset++;
> +	}
> +	subdev_len = (len_left < stripe->interleave_size) ? len_left :
> stripe->interleave_size;
> +
> +	/* Add suboperation to queue here */
> +	err = stripe_add_subop(&ops[subdev_number], subdev_offset *
> stripe->interleave_size, subdev_len, buf, eccbuf);
> +	if(err)
> +	    break;
> +			
> +	*retlen += subdev_len;
> +	len_left -= subdev_len;
> +	buf += subdev_len;
> +	if(eccbuf)
> +	    eccbuf += stripe->subdev[subdev_number]->oobavail;
> +		
> +	if(to_loc + *retlen >=
> stripe->subdev_last_offset[stripe->num_subdev - dev_count])
> +	    dev_count--;
> +    }
> +    
> +    /* Push operation into the corresponding threads queue and rise
> semaphores */
> +    for(i = 0; i < stripe->num_subdev; i++)
> +    {
> +	stripe_add_op(&stripe->sw_threads[i], &ops[i]);
> +
> +	/* set original operation priority */
> +	ops[i].op_prio = current->static_prio - MAX_RT_PRIO - 20;
> +	stripe_set_write_thread_prio(&stripe->sw_threads[i]);
> +
> +	up(&stripe->sw_threads[i].sw_thread_wait);
> +    }
> +	
> +    /* wait for all suboperations completed and check status */
> +    for(i = 0; i < stripe->num_subdev; i++)
> +    {
> +	down(&ops[i].sem);
> +		
> +	/* set error if one of operations has failed */
> +	if(ops[i].status)
> +	    err = ops[i].status;
> +    }
> +
> +    /* Deallocate all memory before exit */
> +    for(i = 0; i < stripe->num_subdev; i++)
> +    {
> +	stripe_destroy_op(&ops[i]);
> +    }
> +    kfree(ops);
> +	
> +    DEBUG(MTD_DEBUG_LEVEL2, "stripe_write_ecc(): written %d bytes\n",
> *retlen);
> +    return err;
> +}
> +
> +
> +static int
> +stripe_read_oob(struct mtd_info *mtd, loff_t from, size_t len,
> +		size_t * retlen, u_char * buf)
> +{
> +    u_int32_t from_loc = (u_int32_t)from;	/* we can do this since
> whole MTD size in current implementation has u_int32_t type */
> +	
> +    struct mtd_stripe *stripe = STRIPE(mtd);
> +    int err = -EINVAL;
> +    int i;
> +
> +    u_int32_t subdev_offset;		/* equal size subdevs offset
> (interleaved block size count)*/
> +    u_int32_t subdev_number;		/* number of current subdev */
> +    u_int32_t subdev_offset_low;	/* subdev offset to read/write
> (bytes). used for "first" probably unaligned with erasesize data block
> */
> +    size_t subdev_len;			/* data size to be read/written
> from/to subdev at this turn (bytes) */
> +    int dev_count;			/* equal size subdev count */
> +    size_t len_left = len;		/* total data size to read/write
> left (bytes) */
> +    size_t retsize;			/* data read/written from/to
> subdev (bytes) */
> +    
> +    u_int32_t subdev_oobavail = stripe->subdev[0]->oobsize;
> +	
> +    *retlen = 0;
> +
> +    DEBUG(MTD_DEBUG_LEVEL2, "stripe_read_oob(): offset = 0x%08x, size =
> %d\n", from_loc, len);
> +
> +    /* Check whole striped device bounds here */
> +    if(from_loc + len > mtd->size)
> +    {
> +	return err;
> +    }
> +	
> +    /* Locate start position and corresponding subdevice number */
> +    subdev_offset = 0;
> +    subdev_number = 0;
> +    dev_count = stripe->num_subdev;
> +    for(i = (stripe->num_subdev - 1); i > 0; i--)
> +    {
> +	if(from_loc >= stripe->subdev_last_offset[i-1])
> +	{
> +    	    dev_count = stripe->num_subdev - i; /* get "equal size"
> devices count */
> +	    subdev_offset = stripe->subdev[i - 1]->size /
> stripe->interleave_size - 1;
> +	    subdev_offset += ((from_loc - stripe->subdev_last_offset[i -
> 1]) / stripe->interleave_size) / dev_count;
> +	    subdev_number = i + ((from_loc -
> stripe->subdev_last_offset[i - 1]) / stripe->interleave_size) %
> dev_count;
> +	    break;
> +	}
> +    }
> +	
> +    if(subdev_offset == 0)
> +    {
> +	subdev_offset = (from_loc / stripe->interleave_size) /
> dev_count;
> +	subdev_number = (from_loc / stripe->interleave_size) %
> dev_count;
> +    }
> +
> +    subdev_offset_low = from_loc % subdev_oobavail;
> +    subdev_len = (len_left < (subdev_oobavail - subdev_offset_low)) ?
> len_left : (subdev_oobavail - subdev_offset_low);
> +    subdev_offset_low += subdev_offset * stripe->interleave_size;
> +	
> +    /* Synch read here */
> +    DEBUG(MTD_DEBUG_LEVEL3, "stripe_read_oob(): device = %d, offset =
> 0x%08x, len = %d\n", subdev_number, subdev_offset_low, subdev_len);
> +    err =
> stripe->subdev[subdev_number]->read_oob(stripe->subdev[subdev_number],
> subdev_offset_low, subdev_len, &retsize, buf);
> +    if(!err)
> +    {
> +	*retlen += retsize;
> +	len_left -= subdev_len;
> +	buf += subdev_len;
> +
> +	/* increase flash offset by interleave size since oob blocks 
> +	 * aligned with page size (i.e. interleave size) */
> +	from_loc += stripe->interleave_size;
> +	
> +	if(from_loc >= stripe->subdev_last_offset[stripe->num_subdev -
> dev_count])
> +    	    dev_count--;
> +    }
> +		
> +    while(!err && len_left > 0 && dev_count > 0)
> +    {
> +    	subdev_number++;
> +	if(subdev_number >= stripe->num_subdev)
> +	{
> +	    subdev_number = stripe->num_subdev - dev_count;
> +	    subdev_offset++;
> +	}
> +	subdev_len = (len_left < subdev_oobavail) ? len_left :
> subdev_oobavail;
> +
> +	/* Synch read here */
> +	DEBUG(MTD_DEBUG_LEVEL3, "stripe_read_oob(): device = %d, offset
> = 0x%08x, len = %d\n", subdev_number, subdev_offset *
> stripe->interleave_size, subdev_len);
> +	err =
> stripe->subdev[subdev_number]->read_oob(stripe->subdev[subdev_number],
> subdev_offset * stripe->interleave_size, subdev_len, &retsize, buf);
> +	if(err)
> +	    break;
> +			
> +	*retlen += retsize;
> +	len_left -= subdev_len;
> +	buf += subdev_len;
> +
> +	/* increase flash offset by interleave size since oob blocks 
> +	 * aligned with page size (i.e. interleave size) */
> +	from_loc += stripe->interleave_size;
> +		
> +	if(from_loc >= stripe->subdev_last_offset[stripe->num_subdev -
> dev_count])
> +	    dev_count--;
> +    }
> +	
> +    DEBUG(MTD_DEBUG_LEVEL2, "stripe_read_oob(): read %d bytes\n",
> *retlen);
> +    return err;
> +}
> +
> +static int
> +stripe_write_oob(struct mtd_info *mtd, loff_t to, size_t len,
> +		 size_t *retlen, const u_char * buf)
> +{
> +    u_int32_t to_loc = (u_int32_t)to;	/* we can do this since whole
> MTD size in current implementation has u_int32_t type */
> +
> +    struct mtd_stripe *stripe = STRIPE(mtd);
> +    int err = -EINVAL;
> +    int i;
> +
> +    u_int32_t subdev_offset;		/* equal size subdevs offset
> (interleaved block size count)*/
> +    u_int32_t subdev_number;		/* number of current subdev */
> +    u_int32_t subdev_offset_low;	/* subdev offset to read/write
> (bytes). used for "first" probably unaligned block */
> +    size_t subdev_len;			/* data size to be read/written
> from/to subdev at this turn (bytes) */
> +    int dev_count;			/* equal size subdev count */
> +    size_t len_left = len;		/* total data size to read/write
> left (bytes) */
> +	
> +    struct mtd_stripe_op *ops;		/* operations array (one per
> thread) */
> +    u_int32_t size;			/* amount of memory to be
> allocated for thread operations */
> +    u_int32_t queue_size;
> +    
> +    //u_int32_t subdev_oobavail = stripe->subdev[0]->oobavail;
> +    u_int32_t subdev_oobavail = stripe->subdev[0]->oobsize;
> +
> +    *retlen = 0;
> +
> +    DEBUG(MTD_DEBUG_LEVEL2, "stripe_write_oob(): offset = 0x%08x, size
> = %d\n", to_loc, len);
> +	
> +    /* check if no data is going to be written */
> +    if(!len)
> +        return 0;
> +	
> +    /* Check whole striped device bounds here */
> +    if(to_loc + len > mtd->size)
> +        return err;
> +	
> +    /* allocate memory for multithread operations */
> +    queue_size = len / subdev_oobavail / stripe->num_subdev + 1;
> /* default queue size. could be set to predefined value */
> +    size = stripe->num_subdev *
> SIZEOF_STRUCT_MTD_STRIPE_OP(queue_size);
> +    ops = kmalloc(size, GFP_KERNEL);
> +    if(!ops)
> +    {
> +	printk(KERN_ERR "stripe_write_oob(): memory allocation
> error!\n");
> +	return -ENOMEM;
> +    }
> +	
> +    memset(ops, 0, size);
> +    for(i = 0; i < stripe->num_subdev; i++)
> +    {
> +	ops[i].opcode = MTD_STRIPE_OPCODE_WRITE_OOB;
> +	ops[i].caller_id = 0; 			/* TBD */
> +	init_MUTEX_LOCKED(&ops[i].sem);		/* mutex is locked here.
> to be unlocked by device thread */
> +	//ops[i].status = 0;			/* TBD */
> +
> +	INIT_LIST_HEAD(&ops[i].subops.list);	/* initialize
> suboperation list head */
> +
> +	ops[i].subops.ops_num = 0;		/* to be increased later
> here */
> +	ops[i].subops.ops_num_max = queue_size;	/* total number of
> suboperations can be stored in the array */
> +	ops[i].subops.ops_array = (struct subop *)((char *)(ops +
> stripe->num_subdev) + i * queue_size * sizeof(struct subop));
> +    }
> +						
> +    /* Locate start position and corresponding subdevice number */
> +    subdev_offset = 0;
> +    subdev_number = 0;
> +    dev_count = stripe->num_subdev;
> +    for(i = (stripe->num_subdev - 1); i > 0; i--)
> +    {
> +	if(to_loc >= stripe->subdev_last_offset[i-1])
> +	{
> +	    dev_count = stripe->num_subdev - i; /* get "equal size"
> devices count */
> +	    subdev_offset = stripe->subdev[i - 1]->size /
> stripe->interleave_size - 1;
> +	    subdev_offset += ((to_loc - stripe->subdev_last_offset[i -
> 1]) / stripe->interleave_size) / dev_count;
> +	    subdev_number = i + ((to_loc - stripe->subdev_last_offset[i
> - 1]) / stripe->interleave_size) % dev_count;
> +	    break;
> +	}
> +    }
> +	
> +    if(subdev_offset == 0)
> +    {
> +	subdev_offset = (to_loc / stripe->interleave_size) / dev_count;
> +	subdev_number = (to_loc / stripe->interleave_size) % dev_count;
> +    }
> +	
> +    subdev_offset_low = to_loc % subdev_oobavail;
> +    subdev_len = (len_left < (subdev_oobavail - subdev_offset_low)) ?
> len_left : (subdev_oobavail - subdev_offset_low);
> +    subdev_offset_low += subdev_offset * stripe->interleave_size;
> +	
> +    /* Add suboperation to queue here */
> +    err = stripe_add_subop(&ops[subdev_number], subdev_offset_low,
> subdev_len, buf, NULL);
> +
>
> +    if(!err)
> +    {
> +	*retlen += subdev_len;
> +	len_left -= subdev_len;
> +	buf += subdev_len;
> +	
> +	/* increase flash offset by interleave size since oob blocks 
> +	 * aligned with page size (i.e. interleave size) */
> +	to_loc += stripe->interleave_size;
> +
> +	if(to_loc >= stripe->subdev_last_offset[stripe->num_subdev -
> dev_count])
> +    	    dev_count--;
> +    }
> +			
> +    while(!err && len_left > 0 && dev_count > 0)
> +    {
> +	subdev_number++;
> +	if(subdev_number >= stripe->num_subdev)
> +	{
> +	    subdev_number = stripe->num_subdev - dev_count;
> +	    subdev_offset++;
> +	}
> +	subdev_len = (len_left < subdev_oobavail) ? len_left :
> subdev_oobavail;
> +
> +	/* Add suboperation to queue here */
> +	err = stripe_add_subop(&ops[subdev_number], subdev_offset *
> stripe->interleave_size, subdev_len, buf, NULL);
> +	if(err)
> +	    break;
> +			
> +	*retlen += subdev_len;
> +	len_left -= subdev_len;
> +	buf += subdev_len;
> +
> +	/* increase flash offset by interleave size since oob blocks 
> +	 * aligned with page size (i.e. interleave size) */
> +	to_loc += stripe->interleave_size;
> +		
> +	if(to_loc >= stripe->subdev_last_offset[stripe->num_subdev -
> dev_count])
> +	    dev_count--;
> +    }
> +    
> +    /* Push operation into the corresponding threads queue and rise
> semaphores */
> +    for(i = 0; i < stripe->num_subdev; i++)
> +    {
> +	stripe_add_op(&stripe->sw_threads[i], &ops[i]);
> +
> +	/* set original operation priority */
> +	ops[i].op_prio = current->static_prio - MAX_RT_PRIO - 20;
> +	stripe_set_write_thread_prio(&stripe->sw_threads[i]);
> +
> +	up(&stripe->sw_threads[i].sw_thread_wait);
> +    }
> +	
> +    /* wait for all suboperations completed and check status */
> +    for(i = 0; i < stripe->num_subdev; i++)
> +    {
> +	down(&ops[i].sem);
> +		
> +	/* set error if one of operations has failed */
> +	if(ops[i].status)
> +	    err = ops[i].status;
> +    }
> +
> +    /* Deallocate all memory before exit */
> +    for(i = 0; i < stripe->num_subdev; i++)
> +    {
> +	stripe_destroy_op(&ops[i]);
> +    }
> +    kfree(ops);
> +	
> +    DEBUG(MTD_DEBUG_LEVEL2, "stripe_write_oob(): written %d bytes\n",
> *retlen);
> +    return err;
> +}
> +
> +/* this routine aimed to support striping on NOR_ECC
> + * it has been taken from cfi_cmdset_0001.c
> + */
> +static int 
> +stripe_writev (struct mtd_info *mtd, const struct kvec *vecs, unsigned
> long count, 
> +		loff_t to, size_t * retlen)
> +{
> +    int i, page, len, total_len, ret = 0, written = 0, cnt = 0,
> towrite;
> +    u_char *bufstart;
> +    char* data_poi;
> +    char* data_buf;
> +    loff_t write_offset;
> +    int rl_wr;
> +
> +    u_int32_t pagesize;
> +
> +    DEBUG(MTD_DEBUG_LEVEL2, "==> stripe_writev()\n");
> +
> +#ifdef MTD_PROGRAM_REGIONS
> +    /* Montavista patch for Sibley support detected */    
> +    if(mtd->flags & MTD_PROGRAM_REGIONS)
> +    {
> +	pagesize = MTD_PROGREGION_SIZE(mtd);
> +    }
> +    else if(mtd->flags & MTD_ECC)
> +    {
> +	pagesize = mtd->eccsize;
> +    }
> +    else
> +    {
> +	printk(KERN_ERR "stripe_writev() has been called for device
> without MTD_PROGRAM_REGIONS or MTD_ECC set\n");
> +	return -EINVAL;
> +    }
> +#else
> +    if(mtd->flags & MTD_ECC)
> +    {
> +	pagesize = mtd->eccsize;
> +    }
> +    else
> +    {
> +	printk(KERN_ERR "stripe_writev() has been called for device
> without MTD_ECC set\n");
> +	return -EINVAL;
> +    }
> +#endif
> +    
> +    data_buf = kmalloc(pagesize, GFP_KERNEL);
> +    
> +    /* Preset written len for early exit */
> +    *retlen = 0;
> +
> +    /* Calculate total length of data */
> +    total_len = 0;
> +    for (i = 0; i < count; i++)
> +    	total_len += (int) vecs[i].iov_len;
> +
> +    /* check if no data is going to be written */
> +    if(!total_len)
> +    {
> +	kfree(data_buf);
> +	return 0;
> +    }
> +
> +    /* Do not allow write past end of page */
> +    if ((to + total_len) > mtd->size) {
> +	DEBUG (MTD_DEBUG_LEVEL0, "stripe_writev(): Attempted write past
> end of device\n");
> +        kfree(data_buf);
> +        return -EINVAL;
> +    }
> +
> +    /* Setup start page */
> +    page = ((int) to) / pagesize;
> +    towrite = (page + 1) * pagesize - to;  /* rest of the page */
> +    write_offset = to;
> +    written = 0; 
> +    /* Loop until all iovecs' data has been written */
> +    len = 0;
> +    while (len < total_len) {
> +        bufstart = (u_char *)vecs->iov_base;
> +        bufstart += written;
> +        data_poi = bufstart;
> +
> +        /* If the given tuple is >= reet of page then
> +         * write it out from the iov
> +	 */
> +	if ( (vecs->iov_len-written) >= towrite) {       /* The fastest
> case is to write data by int * blocksize */
> +	    ret = mtd->write(mtd, write_offset, towrite, &rl_wr,
> data_poi);
> +	    if(ret)
> +	        break;
> +    	    len += towrite;
> +            page ++;
> +            write_offset = page * pagesize;
> +            towrite = pagesize;
> +            written += towrite;
> +            if(vecs->iov_len  == written) {
> +                vecs ++;
> +                written = 0;
> +            }
> +  	}
> +  	else 
> +  	{
> +  	    cnt = 0;
> +	    while(cnt < towrite ) {
> +	        data_buf[cnt++] = ((u_char *)
> vecs->iov_base)[written++];
> +                if(vecs->iov_len == written )
> +                {
> +		    if((cnt+len) == total_len )
> +            		break;
> +                    vecs ++;
> +	            written = 0;
> +		}
> +	    }
> +	    data_poi = data_buf;
> +	    ret = mtd->write(mtd, write_offset, cnt, &rl_wr, data_poi);
> +	    if (ret)
> +	        break;
> +	    len += cnt;
> +            page ++;
> +	    write_offset = page * pagesize;
> +	    towrite = pagesize;
> +  	}
> +    }
> +
> +    if(retlen)
> +	*retlen = len;
> +    kfree(data_buf);
> +    
> +    DEBUG(MTD_DEBUG_LEVEL2, "<== stripe_writev()\n");
> +    
> +    return ret;
> +}
> +
> +
> +static int 
> +stripe_writev_ecc (struct mtd_info *mtd, const struct kvec *vecs,
> unsigned long count, 
> +		    loff_t to, size_t * retlen, u_char *eccbuf, struct
> nand_oobinfo *oobsel)
> +{
> +    int i, page, len, total_len, ret = 0, written = 0, cnt = 0,
> towrite;
> +    u_char *bufstart;
> +    char* data_poi;
> +    char* data_buf;
> +    loff_t write_offset;
> +    data_buf = kmalloc(mtd->oobblock, GFP_KERNEL);
> +    int rl_wr;
> +    
> +    DEBUG(MTD_DEBUG_LEVEL2, "==> stripe_writev_ecc()\n");
> +
> +    if(oobsel != NULL)
> +    {
> +        /* check if oobinfo is has been chandes by FS */
> +	if(memcmp(oobsel, &mtd->oobinfo, sizeof(struct nand_oobinfo)))
> +	{
> +	    printk(KERN_ERR "stripe_writev_ecc(): oobinfo has been
> changed by FS (not supported yet)\n");
> +	    kfree(data_buf);
> +	    return -EINVAL;
> +	}
> +    }
> +    
> +    if(!(mtd->flags & MTD_ECC))
> +    {
> +	printk(KERN_ERR "stripe_writev_ecc() has been called for device
> without MTD_ECC set\n");
> +	kfree(data_buf);
> +	return -EINVAL;
> +    }
> +    
> +    /* Preset written len for early exit */
> +    *retlen = 0;
> +
> +    /* Calculate total length of data */
> +    total_len = 0;
> +    for (i = 0; i < count; i++)
> +    	total_len += (int) vecs[i].iov_len;
> +
> +    /* check if no data is going to be written */
> +    if(!total_len)
> +    {
> +	kfree(data_buf);
> +	return 0;
> +    }
> +
> +    /* Do not allow write past end of page */
> +    if ((to + total_len) > mtd->size) {
> +	DEBUG (MTD_DEBUG_LEVEL0, "stripe_writev_ecc(): Attempted write
> past end of device\n");
> +        kfree(data_buf);
> +        return -EINVAL;
> +    }
> +    
> +    /* Check "to" and "len" alignment here */
> +    /* NOTE: can't use if(to & (mtd->ooblock - 1)) alignment check here
> since
> +     * mtd->oobblock can be not-power-of-two number */
> +    if((((int) to) % mtd->oobblock) || (total_len % mtd->oobblock))
> +    {
> +	printk(KERN_ERR "stripe_writev_ecc(): Attempted write not
> aligned data!\n");
> +        kfree(data_buf);
> +        return -EINVAL;
> +    }
> +    
> +    /* Setup start page. Notaligned data is not allowed for write_ecc.
> */
> +    page = ((int) to) / mtd->oobblock;
> +    towrite = (page + 1) * mtd->oobblock - to;  /* aligned with
> oobblock */
> +    write_offset = to;
> +    written = 0; 
> +    /* Loop until all iovecs' data has been written */
> +    len = 0;
> +    while (len < total_len) {
> +        bufstart = (u_char *)vecs->iov_base;
> +        bufstart += written;
> +        data_poi = bufstart;
> +
> +        /* If the given tuple is >= reet of page then
> +         * write it out from the iov
> +	 */
> +	if ( (vecs->iov_len-written) >= towrite) {       /* The fastest
> case is to write data by int * blocksize */
> +	    ret = mtd->write_ecc(mtd, write_offset, towrite, &rl_wr,
> data_poi, eccbuf, oobsel);
> +	    if(ret)
> +	        break;
> +	    len += rl_wr;
> +            page ++;
> +            write_offset = page * mtd->oobblock;
> +            towrite = mtd->oobblock;
> +            written += towrite;
> +            if(vecs->iov_len  == written) {
> +                vecs ++;
> +                written = 0;
> +            }
> +	    
> +	    if(eccbuf)
> +		eccbuf += mtd->oobavail;
> +  	}
> +  	else 
> +  	{
> +  	    cnt = 0;
> +	    while(cnt < towrite ) {
> +	        data_buf[cnt++] = ((u_char *)
> vecs->iov_base)[written++];
> +                if(vecs->iov_len == written )
> +                {
> +		    if((cnt+len) == total_len )
> +            		break;
> +                    vecs ++;
> +	            written = 0;
> +		}
> +	    }
> +	    data_poi = data_buf;
> +	    ret = mtd->write_ecc(mtd, write_offset, cnt, &rl_wr,
> data_poi, eccbuf, oobsel);
> +	    if (ret)
> +	        break;
> +	    len += rl_wr;
> +            page ++;
> +	    write_offset = page * mtd->oobblock;
> +	    towrite = mtd->oobblock;
> +	    
> +	    if(eccbuf)
> +		eccbuf += mtd->oobavail;
> +  	}
> +    }
> +
> +    if(retlen)
> +	*retlen = len;
> +    kfree(data_buf);
> +    
> +    DEBUG(MTD_DEBUG_LEVEL2, "<== stripe_writev_ecc()\n");
> +
> +    return ret;
> +}
> +
> +
> +static void
> +stripe_erase_callback(struct erase_info *instr)
> +{
> +    wake_up((wait_queue_head_t *) instr->priv);
> +}
> +
> +static int
> +stripe_dev_erase(struct mtd_info *mtd, struct erase_info *erase)
> +{
> +    int err;
> +    wait_queue_head_t waitq;
> +    DECLARE_WAITQUEUE(wait, current);
> +
> +    init_waitqueue_head(&waitq);
> +
> +    erase->mtd = mtd;
> +    erase->callback = stripe_erase_callback;
> +    erase->priv = (unsigned long) &waitq;
> +	
> +    DEBUG(MTD_DEBUG_LEVEL2, "stripe_dev_erase(): addr=0x%08x,
> len=%d\n", erase->addr, erase->len);
> +
> +    /*
> +     * FIXME: Allow INTERRUPTIBLE. Which means
> +     * not having the wait_queue head on the stack.
> +     */
> +    err = mtd->erase(mtd, erase);
> +    if (!err)
> +    {
> +	set_current_state(TASK_UNINTERRUPTIBLE);
> +	add_wait_queue(&waitq, &wait);
> +	if (erase->state != MTD_ERASE_DONE
> +	    && erase->state != MTD_ERASE_FAILED)
> +		schedule();
> +	remove_wait_queue(&waitq, &wait);
> +	set_current_state(TASK_RUNNING);
> +
> +	err = (erase->state == MTD_ERASE_FAILED) ? -EIO : 0;
> +    }
> +    return err;
> +}
> +
> +static int
> +stripe_erase(struct mtd_info *mtd, struct erase_info *instr)
> +{
> +    struct mtd_stripe *stripe = STRIPE(mtd);
> +    int i, err;
> +    struct mtd_stripe_erase_bounds *erase_bounds;
> +
> +    u_int32_t subdev_offset;		/* equal size subdevs offset
> (interleaved block size count)*/
> +    u_int32_t subdev_number;		/* number of current subdev */
> +    u_int32_t subdev_offset_low;	/* subdev offset to erase
> (bytes) */
> +    size_t subdev_len;			/* data size to be erased at
> this turn (bytes) */
> +    int dev_count;			/* equal size subdev count */
> +    size_t len_left;			/* total data size left to be
> erased (bytes) */
> +    size_t len_done;			/* total data size erased */
> +    u_int32_t from;
> +
> +    struct mtd_stripe_op *ops;		/* operations array (one per
> thread) */
> +    u_int32_t size;			/* amount of memory to be
> allocated for thread operations */
> +    u_int32_t queue_size;
> +
> +    DEBUG(MTD_DEBUG_LEVEL2, "stripe_earse(): addr=0x%08x, len=%d\n",
> instr->addr, instr->len);
> +	
> +    if(!(mtd->flags & MTD_WRITEABLE))
> +	return -EROFS;
> +
> +    if(instr->addr > stripe->mtd.size)
> +	return -EINVAL;
> +
> +    if(instr->len + instr->addr > stripe->mtd.size)
> +	return -EINVAL;
> +
> +    /*
> +     * Check for proper erase block alignment of the to-be-erased area.
> +     */
> +    if(!stripe->mtd.numeraseregions)
> +    {
> +	/* striped device has uniform erase block size */
> +	/* NOTE: can't use if(instr->addr & (stripe->mtd.erasesize - 1))
> alignment check here
> +	 * since stripe->mtd.erasesize can be not-power-of-two number */
> +	if(instr->addr % stripe->mtd.erasesize || instr->len %
> stripe->mtd.erasesize)
> +	    return -EINVAL;
> +    }
> +    else
> +    {
> +	/* we should not get here */
> +	return -EINVAL;
> +    }
> +
> +    instr->fail_addr = 0xffffffff;
> +
> +    /* allocate memory for multithread operations */
> +    queue_size = 1;	/* queue size for erase opration is 1 */
> +    size = stripe->num_subdev *
> SIZEOF_STRUCT_MTD_STRIPE_OP(queue_size);
> +    ops = kmalloc(size, GFP_KERNEL);
> +    if(!ops)
> +    {
> +	printk(KERN_ERR "mtd_stripe: memory allocation error!\n");
> +	return -ENOMEM;
> +    }
> +	
> +    memset(ops, 0, size);
> +    for(i = 0; i < stripe->num_subdev; i++)
> +    {
> +    	ops[i].opcode = MTD_STRIPE_OPCODE_ERASE;
> +	ops[i].caller_id = 0; 			/* TBD */
> +	init_MUTEX_LOCKED(&ops[i].sem);		/* mutex is locked here.
> to be unlocked by device thread */
> +	//ops[i].status = 0;			/* TBD */
> +	ops[i].fail_addr = 0xffffffff;
> +
> +	INIT_LIST_HEAD(&ops[i].subops.list);	/* initialize
> suboperation list head */
> +
> +	ops[i].subops.ops_num = 0;		/* to be increased later
> here */
> +	ops[i].subops.ops_num_max = queue_size;	/* total number of
> suboperations can be stored in the array */
> +	ops[i].subops.ops_array = (struct subop *)((char *)(ops +
> stripe->num_subdev) + i * queue_size * sizeof(struct subop));
> +    }
> +	
> +    len_left = instr->len;
> +    len_done = 0;
> +    from = instr->addr;
> +	
> +    /* allocate memory for erase boundaries for all subdevices */
> +    erase_bounds = kmalloc(stripe->num_subdev * sizeof(struct
> mtd_stripe_erase_bounds), GFP_KERNEL);
> +    if(!erase_bounds)
> +    {
> +	kfree(ops);
> +	return -ENOMEM;
> +    }
> +    memset(erase_bounds, 0, sizeof(struct mtd_stripe_erase_bounds) *
> stripe->num_subdev);
> +	
> +    /* Locate start position and corresponding subdevice number */
> +    subdev_offset = 0;
> +    subdev_number = 0;
> +    dev_count = stripe->num_subdev;
> +    for(i = (stripe->num_subdev - 1); i > 0; i--)
> +    {
> +	if(from >= stripe->subdev_last_offset[i-1])
> +	{
> +	    dev_count = stripe->num_subdev - i; /* get "equal size"
> devices count */
> +	    subdev_offset = stripe->subdev[i - 1]->size /
> stripe->interleave_size - 1;
> +	    subdev_offset += ((from - stripe->subdev_last_offset[i - 1])
> / stripe->interleave_size) / dev_count;
> +	    subdev_number = i + ((from - stripe->subdev_last_offset[i -
> 1]) / stripe->interleave_size) % dev_count;
> +	    break;
> +	}
> +    }
> +	
> +    if(subdev_offset == 0)
> +    {
> +	subdev_offset = (from / stripe->interleave_size) / dev_count;
> +	subdev_number = (from / stripe->interleave_size) % dev_count;
> +    }
> +
> +    /* Should by optimized for erase op */
> +    subdev_offset_low = from % stripe->interleave_size;
> +    subdev_len = (len_left < (stripe->interleave_size -
> subdev_offset_low)) ? len_left : (stripe->interleave_size -
> subdev_offset_low);
> +    subdev_offset_low += subdev_offset * stripe->interleave_size;
> +	
> +    /* Add/extend block-to-be erased */
> +    if(!erase_bounds[subdev_number].need_erase)
> +    {
> +	erase_bounds[subdev_number].need_erase = 1;
> +	erase_bounds[subdev_number].addr = subdev_offset_low;
> +    }
> +    erase_bounds[subdev_number].len += subdev_len;
> +    len_left -= subdev_len;
> +    len_done += subdev_len;
> +	
> +    if(from + len_done >= stripe->subdev_last_offset[stripe->num_subdev
> - dev_count])
> +	dev_count--;
> +		
> +    while(len_left > 0 && dev_count > 0)
> +    {
> +	subdev_number++;
> +	if(subdev_number >= stripe->num_subdev)
> +	{
> +	    subdev_number = stripe->num_subdev - dev_count;
> +	    subdev_offset++;
> +	}
> +	subdev_len = (len_left < stripe->interleave_size) ? len_left :
> stripe->interleave_size; /* can by optimized for erase op*/
> +	
> +	/* Add/extend block-to-be erased */
> +	if(!erase_bounds[subdev_number].need_erase)
> +	{
> +	    erase_bounds[subdev_number].need_erase = 1;
> +	    erase_bounds[subdev_number].addr = subdev_offset *
> stripe->interleave_size;
> +	}
> +	erase_bounds[subdev_number].len += subdev_len;
> +	len_left -= subdev_len;
> +	len_done += subdev_len;
> +
> +        DEBUG(MTD_DEBUG_LEVEL3, "stripe_erase(): device = %d, addr =
> 0x%08x, len = %d\n", subdev_number, erase_bounds[subdev_number].addr,
> erase_bounds[subdev_number].len);
> +
> +	if(from + len_done >=
> stripe->subdev_last_offset[stripe->num_subdev - dev_count])
> +	    dev_count--;
> +    }
> +		
> +    /* now do the erase: */
> +    err = 0;
> +    for(i = 0; i < stripe->num_subdev; i++)
> +    {
> +	if(erase_bounds[i].need_erase)
> +	{
> +	    if (!(stripe->subdev[i]->flags & MTD_WRITEABLE))
> +	    {
> +		err = -EROFS;
> +		break;
> +	    }
> +	    
> +	    stripe_add_subop(&ops[i], erase_bounds[i].addr,
> erase_bounds[i].len, (u_char *)instr, NULL);
> +	}
> +    }
> +		
> +    /* Push operation queues into the corresponding threads */
> +    for(i = 0; i < stripe->num_subdev; i++)
> +    {
> +    	if(erase_bounds[i].need_erase)
> +	{
> +	    stripe_add_op(&stripe->sw_threads[i], &ops[i]);
> +	    
> +    	    /* set original operation priority */
> +	    ops[i].op_prio = current->static_prio - MAX_RT_PRIO - 20;
> +    	    stripe_set_write_thread_prio(&stripe->sw_threads[i]);
> +	    
> +	    up(&stripe->sw_threads[i].sw_thread_wait);
> +	}
> +    }
> +	
> +    /* wait for all suboperations completed and check status */
> +    for(i = 0; i < stripe->num_subdev; i++)
> +    {
> +    	if(erase_bounds[i].need_erase)
> +	{
> +	    down(&ops[i].sem);
> +		
> +	    /* set error if one of operations has failed */
> +	    if(ops[i].status)
> +	    {
> +		err = ops[i].status;
> +
> +		/* FIX ME: For now this adddres shows address
> +		 * at the last failed subdevice,
> +		 * but not at the "super" device */
> +		if(ops[i].fail_addr != 0xffffffff)
> +		    instr->fail_addr = ops[i].fail_addr; 
> +	    }
> +						
> +	    instr->state = ops[i].state;
> +	}
> +    }
> +
> +    /* Deallocate all memory before exit */
> +    kfree(erase_bounds);
> +    for(i = 0; i < stripe->num_subdev; i++)
> +    {
> +	stripe_destroy_op(&ops[i]);
> +    }
> +    kfree(ops);
> +
> +    if(err)
> +	return err;
> +
> +    if(instr->callback)
> +    	instr->callback(instr);
> +    return 0;
> +}
> +
> +static int
> +stripe_lock(struct mtd_info *mtd, loff_t ofs, size_t len)
> +{
> +    u_int32_t ofs_loc = (u_int32_t)ofs;	/* we can do this since
> whole MTD size in current implementation has u_int32_t type */
> +	
> +    struct mtd_stripe *stripe = STRIPE(mtd);
> +    int err = -EINVAL;
> +    int i;
> +
> +    u_int32_t subdev_offset;		/* equal size subdevs offset
> (interleaved block size count)*/
> +    u_int32_t subdev_number;		/* number of current subdev */
> +    u_int32_t subdev_offset_low;	/* subdev offset to lock
> (bytes). used for "first" probably unaligned with erasesize data block
> */
> +    size_t subdev_len;			/* data size to be locked @
> subdev at this turn (bytes) */
> +    int dev_count;			/* equal size subdev count */
> +    size_t len_left = len;		/* total data size to lock left
> (bytes) */
> +	
> +    size_t retlen = 0;
> +    struct mtd_stripe_erase_bounds *erase_bounds;
> +
> +    /* Check whole striped device bounds here */
> +    if(ofs_loc + len > mtd->size)
> +	return err;
> +
> +    /* allocate memory for lock boundaries for all subdevices */
> +    erase_bounds = kmalloc(stripe->num_subdev * sizeof(struct
> mtd_stripe_erase_bounds), GFP_KERNEL);
> +    if(!erase_bounds)
> +	return -ENOMEM;
> +    memset(erase_bounds, 0, sizeof(struct mtd_stripe_erase_bounds) *
> stripe->num_subdev);
> +	
> +    /* Locate start position and corresponding subdevice number */
> +    subdev_offset = 0;
> +    subdev_number = 0;
> +    dev_count = stripe->num_subdev;
> +    for(i = (stripe->num_subdev - 1); i > 0; i--)
> +    {
> +	if(ofs_loc >= stripe->subdev_last_offset[i-1])
> +	{
> +	    dev_count = stripe->num_subdev - i; /* get "equal size"
> devices count */
> +	    subdev_offset = stripe->subdev[i - 1]->size /
> stripe->interleave_size - 1;
> +	    subdev_offset += ((ofs_loc - stripe->subdev_last_offset[i -
> 1]) / stripe->interleave_size) / dev_count;
> +	    subdev_number = i + ((ofs_loc - stripe->subdev_last_offset[i
> - 1]) / stripe->interleave_size) % dev_count;
> +	    break;
> +	}
> +    }
> +	
> +    if(subdev_offset == 0)
> +    {
> +	subdev_offset = (ofs_loc / stripe->interleave_size) / dev_count;
> +	subdev_number = (ofs_loc / stripe->interleave_size) % dev_count;
> +    }
> +
> +    subdev_offset_low = ofs_loc % stripe->interleave_size;
> +    subdev_len = (len_left < (stripe->interleave_size -
> subdev_offset_low)) ? len_left : (stripe->interleave_size -
> subdev_offset_low);
> +    subdev_offset_low += subdev_offset * stripe->interleave_size;
> +
> +    /* Add/extend block-to-be locked */
> +    if(!erase_bounds[subdev_number].need_erase)
> +    {
> +	erase_bounds[subdev_number].need_erase = 1;
> +	erase_bounds[subdev_number].addr = subdev_offset_low;
> +    }
> +    erase_bounds[subdev_number].len += subdev_len;
> +
> +    retlen += subdev_len;
> +    len_left -= subdev_len;
> +    if(ofs + retlen >= stripe->subdev_last_offset[stripe->num_subdev -
> dev_count])
> +	dev_count--;
> +	
> +    while(len_left > 0 && dev_count > 0)
> +    {
> +	subdev_number++;
> +	if(subdev_number >= stripe->num_subdev)
> +	{
> +	    subdev_number = stripe->num_subdev - dev_count;
> +	    subdev_offset++;
> +	}
> +	subdev_len = (len_left < stripe->interleave_size) ? len_left :
> stripe->interleave_size;
> +		
> +	/* Add/extend block-to-be locked */
> +	if(!erase_bounds[subdev_number].need_erase)
> +	{
> +	    erase_bounds[subdev_number].need_erase = 1;
> +	    erase_bounds[subdev_number].addr = subdev_offset *
> stripe->interleave_size;
> +	}
> +	erase_bounds[subdev_number].len += subdev_len;
> +
> +	retlen += subdev_len;
> +	len_left -= subdev_len;
> +		
> +	if(ofs + retlen >= stripe->subdev_last_offset[stripe->num_subdev
> - dev_count])
> +	    dev_count--;
> +    }
> +
> +    /* now do lock */
> +    err = 0;
> +    for(i = 0; i < stripe->num_subdev; i++)
> +    {
> +	if(erase_bounds[i].need_erase)
> +	{
> +	    if (stripe->subdev[i]->lock)
> +	    {
> +   	       err = stripe->subdev[i]->lock(stripe->subdev[i],
> erase_bounds[i].addr, erase_bounds[i].len);
> +	       if(err)
> +	 	   break;
> +	    };	   
> +	}
> +    }
> +
> +    /* Free allocated memory here */
> +    kfree(erase_bounds);
> +	
> +    return err;
> +}
> +
> +static int
> +stripe_unlock(struct mtd_info *mtd, loff_t ofs, size_t len)
> +{
> +    u_int32_t ofs_loc = (u_int32_t)ofs;	/* we can do this since
> whole MTD size in current implementation has u_int32_t type */
> +	
> +    struct mtd_stripe *stripe = STRIPE(mtd);
> +    int err = -EINVAL;
> +    int i;
> +
> +    u_int32_t subdev_offset;		/* equal size subdevs offset
> (interleaved block size count)*/
> +    u_int32_t subdev_number;		/* number of current subdev */
> +    u_int32_t subdev_offset_low;	/* subdev offset to unlock
> (bytes). used for "first" probably unaligned with erasesize data block
> */
> +    size_t subdev_len;			/* data size to be unlocked @
> subdev at this turn (bytes) */
> +    int dev_count;			/* equal size subdev count */
> +    size_t len_left = len;		/* total data size to unlock
> left (bytes) */
> +	
> +    size_t retlen = 0;
> +    struct mtd_stripe_erase_bounds *erase_bounds;
> +
> +    /* Check whole striped device bounds here */
> +    if(ofs_loc + len > mtd->size)
> +	return err;
> +
> +    /* allocate memory for unlock boundaries for all subdevices */
> +    erase_bounds = kmalloc(stripe->num_subdev * sizeof(struct
> mtd_stripe_erase_bounds), GFP_KERNEL);
> +    if(!erase_bounds)
> +	return -ENOMEM;
> +    memset(erase_bounds, 0, sizeof(struct mtd_stripe_erase_bounds) *
> stripe->num_subdev);
> +	
> +    /* Locate start position and corresponding subdevice number */
> +    subdev_offset = 0;
> +    subdev_number = 0;
> +    dev_count = stripe->num_subdev;
> +    for(i = (stripe->num_subdev - 1); i > 0; i--)
> +    {
> +	if(ofs_loc >= stripe->subdev_last_offset[i-1])
> +	{
> +	    dev_count = stripe->num_subdev - i; /* get "equal size"
> devices count */
> +	    subdev_offset = stripe->subdev[i - 1]->size /
> stripe->interleave_size - 1;
> +	    subdev_offset += ((ofs_loc - stripe->subdev_last_offset[i -
> 1]) / stripe->interleave_size) / dev_count;
> +	    subdev_number = i + ((ofs_loc - stripe->subdev_last_offset[i
> - 1]) / stripe->interleave_size) % dev_count;
> +	    break;
> +	}
> +    }
> +	
> +    if(subdev_offset == 0)
> +    {
> +	subdev_offset = (ofs_loc / stripe->interleave_size) / dev_count;
> +	subdev_number = (ofs_loc / stripe->interleave_size) % dev_count;
> +    }
> +
> +    subdev_offset_low = ofs_loc % stripe->interleave_size;
> +    subdev_len = (len_left < (stripe->interleave_size -
> subdev_offset_low)) ? len_left : (stripe->interleave_size -
> subdev_offset_low);
> +    subdev_offset_low += subdev_offset * stripe->interleave_size;
> +
> +    /* Add/extend block-to-be unlocked */
> +    if(!erase_bounds[subdev_number].need_erase)
> +    {
> +	erase_bounds[subdev_number].need_erase = 1;
> +	erase_bounds[subdev_number].addr = subdev_offset_low;
> +    }
> +    erase_bounds[subdev_number].len += subdev_len;
> +
> +    retlen += subdev_len;
> +    len_left -= subdev_len;
> +    if(ofs + retlen >= stripe->subdev_last_offset[stripe->num_subdev -
> dev_count])
> +	dev_count--;
> +	
> +    while(len_left > 0 && dev_count > 0)
> +    {
> +	subdev_number++;
> +	if(subdev_number >= stripe->num_subdev)
> +	{
> +	    subdev_number = stripe->num_subdev - dev_count;
> +	    subdev_offset++;
> +	}
> +	subdev_len = (len_left < stripe->interleave_size) ? len_left :
> stripe->interleave_size;
> +		
> +	/* Add/extend block-to-be unlocked */
> +	if(!erase_bounds[subdev_number].need_erase)
> +	{
> +	    erase_bounds[subdev_number].need_erase = 1;
> +	    erase_bounds[subdev_number].addr = subdev_offset *
> stripe->interleave_size;
> +	}
> +	erase_bounds[subdev_number].len += subdev_len;
> +
> +	retlen += subdev_len;
> +	len_left -= subdev_len;
> +		
> +	if(ofs + retlen >= stripe->subdev_last_offset[stripe->num_subdev
> - dev_count])
> +	    dev_count--;
> +    }
> +
> +    /* now do unlock */
> +    err = 0;
> +    for(i = 0; i < stripe->num_subdev; i++)
> +    {
> +	if(erase_bounds[i].need_erase)
> +	{
> +	    if (stripe->subdev[i]->unlock)
> +	    {
> +	       err = stripe->subdev[i]->unlock(stripe->subdev[i],
> erase_bounds[i].addr, erase_bounds[i].len);
> +	       if(err)
> +	  	   break;
> +	    };	   
> +	}
> +    }
> +
> +    /* Free allocated memory here */
> +    kfree(erase_bounds);
> +	
> +    return err;
> +}
> +
> +static void
> +stripe_sync(struct mtd_info *mtd)
> +{
> +    struct mtd_stripe *stripe = STRIPE(mtd);
> +    int i;
> +
> +    for (i = 0; i < stripe->num_subdev; i++)
> +    {
> +	struct mtd_info *subdev = stripe->subdev[i];
> +	if (subdev->sync)
> +  	   subdev->sync(subdev);
> +    }
> +}
> +
> +static int
> +stripe_suspend(struct mtd_info *mtd)
> +{
> +    struct mtd_stripe *stripe = STRIPE(mtd);
> +    int i, rc = 0;
> +
> +    for (i = 0; i < stripe->num_subdev; i++)
> +    {
> +	struct mtd_info *subdev = stripe->subdev[i];
> +	if (subdev->suspend)
> +	{
> +	   if ((rc = subdev->suspend(subdev)) < 0)
> +	       return rc;
> +	};       
> +    }
> +    return rc;
> +}
> +
> +static void
> +stripe_resume(struct mtd_info *mtd)
> +{
> +    struct mtd_stripe *stripe = STRIPE(mtd);
> +    int i;
> +
> +    for (i = 0; i < stripe->num_subdev; i++)
> +    {
> +	struct mtd_info *subdev = stripe->subdev[i];
> +	if (subdev->resume)
> +  	   subdev->resume(subdev);
> +    }
> +}
> +
> +static int
> +stripe_block_isbad(struct mtd_info *mtd, loff_t ofs)
> +{
> +    u_int32_t from_loc = (u_int32_t)ofs;	/* we can do this since
> whole MTD size in current implementation has u_int32_t type */
> +	
> +    struct mtd_stripe *stripe = STRIPE(mtd);
> +    int res = 0;
> +    int i;
> +
> +    u_int32_t subdev_offset;		/* equal size subdevs offset
> (interleaved block size count)*/
> +    u_int32_t subdev_number;		/* number of current subdev */
> +    u_int32_t subdev_offset_low;	/* subdev offset to read/write
> (bytes). used for "first" probably unaligned with erasesize data block
> */
> +    size_t subdev_len;			/* data size to be read/written
> from/to subdev at this turn (bytes) */
> +    int dev_count;			/* equal size subdev count */
> +    size_t len_left = mtd->oobblock;	/* total data size to read/write
> left (bytes) */
> +	
> +    DEBUG(MTD_DEBUG_LEVEL2, "stripe_block_isbad(): offset = 0x%08x\n",
> from_loc);
> +
> +    from_loc = (from_loc / mtd->oobblock) * mtd->oobblock;	/* align
> offset here */
> +	
> +    /* Locate start position and corresponding subdevice number */
> +    subdev_offset = 0;
> +    subdev_number = 0;
> +    dev_count = stripe->num_subdev;
> +    for(i = (stripe->num_subdev - 1); i > 0; i--)
> +    {
> +	if(from_loc >= stripe->subdev_last_offset[i-1])
> +	{
> +    	    dev_count = stripe->num_subdev - i; /* get "equal size"
> devices count */
> +	    subdev_offset = stripe->subdev[i - 1]->size /
> stripe->interleave_size - 1;
> +	    subdev_offset += ((from_loc - stripe->subdev_last_offset[i -
> 1]) / stripe->interleave_size) / dev_count;
> +	    subdev_number = i + ((from_loc -
> stripe->subdev_last_offset[i - 1]) / stripe->interleave_size) %
> dev_count;
> +	    break;
> +	}
> +    }
> +	
> +    if(subdev_offset == 0)
> +    {
> +	subdev_offset = (from_loc / stripe->interleave_size) /
> dev_count;
> +	subdev_number = (from_loc / stripe->interleave_size) %
> dev_count;
> +    }
> +
> +    subdev_offset_low = from_loc % stripe->interleave_size;
> +    subdev_len = (len_left < (stripe->interleave_size -
> subdev_offset_low)) ? len_left : (stripe->interleave_size -
> subdev_offset_low);
> +    subdev_offset_low += subdev_offset * stripe->interleave_size;
> +	
> +    /* check block on subdevice is bad here */
> +    DEBUG(MTD_DEBUG_LEVEL3, "stripe_block_isbad(): device = %d, offset
> = 0x%08x\n", subdev_number, subdev_offset_low);
> +    res =
> stripe->subdev[subdev_number]->block_isbad(stripe->subdev[subdev_number]
> , subdev_offset_low);
> +    if(!res)
> +    {
> +	len_left -= subdev_len;
> +	from_loc += subdev_len;
> +	if(from_loc >= stripe->subdev_last_offset[stripe->num_subdev -
> dev_count])
> +    	    dev_count--;
> +    }
> +		
> +    while(!res && len_left > 0 && dev_count > 0)
> +    {
> +    	subdev_number++;
> +	if(subdev_number >= stripe->num_subdev)
> +	{
> +	    subdev_number = stripe->num_subdev - dev_count;
> +	    subdev_offset++;
> +	}
> +	subdev_len = (len_left < stripe->interleave_size) ? len_left :
> stripe->interleave_size;
> +
> +        /* check block on subdevice is bad here */
> +	DEBUG(MTD_DEBUG_LEVEL3, "stripe_block_isbad(): device = %d,
> offset = 0x%08x\n", subdev_number, subdev_offset *
> stripe->interleave_size);
> +	res =
> stripe->subdev[subdev_number]->block_isbad(stripe->subdev[subdev_number]
> , subdev_offset * stripe->interleave_size);
> +	if(res)
> +	{
> +	    break;
> +	}
> +	else
> +	{
> +	    len_left -= subdev_len;
> +	    from_loc += subdev_len;
> +	    if(from_loc >= stripe->subdev_last_offset[stripe->num_subdev
> - dev_count])
> +		dev_count--;
> +	}
> +    }
> +	
> +    DEBUG(MTD_DEBUG_LEVEL2, "<== stripe_block_isbad()\n");
> +    return res;
> +}
> +
> +/* returns 0 - success */
> +static int
> +stripe_block_markbad(struct mtd_info *mtd, loff_t ofs)
> +{
> +    u_int32_t from_loc = (u_int32_t)ofs;	/* we can do this since
> whole MTD size in current implementation has u_int32_t type */
> +	
> +    struct mtd_stripe *stripe = STRIPE(mtd);
> +    int err = -EINVAL;
> +    int i;
> +
> +    u_int32_t subdev_offset;		/* equal size subdevs offset
> (interleaved block size count)*/
> +    u_int32_t subdev_number;		/* number of current subdev */
> +    u_int32_t subdev_offset_low;	/* subdev offset to read/write
> (bytes). used for "first" probably unaligned with erasesize data block
> */
> +    size_t subdev_len;			/* data size to be read/written
> from/to subdev at this turn (bytes) */
> +    int dev_count;			/* equal size subdev count */
> +    size_t len_left = mtd->oobblock;	/* total data size to read/write
> left (bytes) */
> +	
> +    DEBUG(MTD_DEBUG_LEVEL2, "stripe_block_markbad(): offset =
> 0x%08x\n", from_loc);
> +
> +    from_loc = (from_loc / mtd->oobblock) * mtd->oobblock;	/* align
> offset here */
> +	
> +    /* Locate start position and corresponding subdevice number */
> +    subdev_offset = 0;
> +    subdev_number = 0;
> +    dev_count = stripe->num_subdev;
> +    for(i = (stripe->num_subdev - 1); i > 0; i--)
> +    {
> +	if(from_loc >= stripe->subdev_last_offset[i-1])
> +	{
> +    	    dev_count = stripe->num_subdev - i; /* get "equal size"
> devices count */
> +	    subdev_offset = stripe->subdev[i - 1]->size /
> stripe->interleave_size - 1;
> +	    subdev_offset += ((from_loc - stripe->subdev_last_offset[i -
> 1]) / stripe->interleave_size) / dev_count;
> +	    subdev_number = i + ((from_loc -
> stripe->subdev_last_offset[i - 1]) / stripe->interleave_size) %
> dev_count;
> +	    break;
> +	}
> +    }
> +	
> +    if(subdev_offset == 0)
> +    {
> +	subdev_offset = (from_loc / stripe->interleave_size) /
> dev_count;
> +	subdev_number = (from_loc / stripe->interleave_size) %
> dev_count;
> +    }
> +
> +    subdev_offset_low = from_loc % stripe->interleave_size;
> +    subdev_len = (len_left < (stripe->interleave_size -
> subdev_offset_low)) ? len_left : (stripe->interleave_size -
> subdev_offset_low);
> +    subdev_offset_low += subdev_offset * stripe->interleave_size;
> +	
> +    /* check block on subdevice is bad here */
> +    DEBUG(MTD_DEBUG_LEVEL3, "stripe_block_markbad(): device = %d,
> offset = 0x%08x\n", subdev_number, subdev_offset_low);
> +    err =
> stripe->subdev[subdev_number]->block_markbad(stripe->subdev[subdev_numbe
> r], subdev_offset_low);
> +    if(!err)
> +    {
> +	len_left -= subdev_len;
> +	from_loc += subdev_len;
> +	if(from_loc >= stripe->subdev_last_offset[stripe->num_subdev -
> dev_count])
> +    	    dev_count--;
> +    }
> +		
> +    while(!err && len_left > 0 && dev_count > 0)
> +    {
> +    	subdev_number++;
> +	if(subdev_number >= stripe->num_subdev)
> +	{
> +	    subdev_number = stripe->num_subdev - dev_count;
> +	    subdev_offset++;
> +	}
> +	subdev_len = (len_left < stripe->interleave_size) ? len_left :
> stripe->interleave_size;
> +
> +        /* check block on subdevice is bad here */
> +	DEBUG(MTD_DEBUG_LEVEL3, "stripe_block_markbad(): device = %d,
> offset = 0x%08x\n", subdev_number, subdev_offset *
> stripe->interleave_size);
> +	err =
> stripe->subdev[subdev_number]->block_markbad(stripe->subdev[subdev_numbe
> r], subdev_offset * stripe->interleave_size);
> +	if(err)
> +	{
> +	    break;
> +	}
> +	else
> +	{
> +	    len_left -= subdev_len;
> +	    from_loc += subdev_len;
> +	    if(from_loc >= stripe->subdev_last_offset[stripe->num_subdev
> - dev_count])
> +		dev_count--;
> +	}
> +    }
> +	
> +    DEBUG(MTD_DEBUG_LEVEL2, "<== stripe_block_markbad()\n");
> +    return err;
> +}
> +
> +/*
> + * This function constructs a virtual MTD device by interleaving
> (striping)
> + * num_devs MTD devices. A pointer to the new device object is
> + * stored to *new_dev upon success. This function does _not_
> + * register any devices: this is the caller's responsibility.
> + */
> +struct mtd_info *mtd_stripe_create(struct mtd_info *subdev[],	/*
> subdevices to stripe */
> +				   int num_devs,		/*
> number of subdevices      */
> +				   char *name, 			/* name
> for the new device   */
> +				   int interleave_size)		/*
> interleaving size (sanity check is required) */
> +{				
> +    int i,j;
> +    size_t size;
> +    struct mtd_stripe *stripe;
> +    u_int32_t curr_erasesize;
> +    int sort_done = 0;
> +	
> +    printk(KERN_NOTICE "Striping MTD devices:\n");
> +    for (i = 0; i < num_devs; i++)
> +	    printk(KERN_NOTICE "(%d): \"%s\"\n", i, subdev[i]->name);
> +    printk(KERN_NOTICE "into device \"%s\"\n", name);
> +	
> +    /* check if trying to stripe same device */
> +    for(i = 0; i < num_devs; i++)
> +    {
> +        for(j = i; j < num_devs; j++)
> +	{
> +	    if(i != j && !(strcmp(subdev[i]->name,subdev[j]->name)))
> +	    {
> +		printk(KERN_ERR "MTD Stripe failed. The same subdevice
> names were found.\n");
> +		return NULL;
> +	    }
> +	}
> +    }
> +
> +    /* allocate the device structure */
> +    size = SIZEOF_STRUCT_MTD_STRIPE(num_devs);
> +    stripe = kmalloc(size, GFP_KERNEL);
> +    if (!stripe)
> +    {
> +        printk(KERN_ERR "mtd_stripe_create(): memory allocation
> error\n");
> +        return NULL;
> +    }
> +    memset(stripe, 0, size);
> +    stripe->subdev = (struct mtd_info **) (stripe + 1);
> +    stripe->subdev_last_offset = (u_int32_t *) ((char *)(stripe + 1) +
> num_devs * sizeof(struct mtd_info *));
> +    stripe->sw_threads = (struct mtd_sw_thread_info *)((char *)(stripe
> + 1) + num_devs * sizeof(struct mtd_info *) + num_devs *
> sizeof(u_int32_t));
> +	
> +    /*
> +     * Set up the new "super" device's MTD object structure, check for
> +     * incompatibilites between the subdevices.
> +     */
> +    stripe->mtd.type = subdev[0]->type;
> +    stripe->mtd.flags = subdev[0]->flags;
> +    stripe->mtd.size = subdev[0]->size;
> +    stripe->mtd.erasesize = subdev[0]->erasesize;
> +    stripe->mtd.oobblock = subdev[0]->oobblock;
> +    stripe->mtd.oobsize = subdev[0]->oobsize;
> +    stripe->mtd.oobavail = subdev[0]->oobavail;
> +    stripe->mtd.ecctype = subdev[0]->ecctype;
> +    stripe->mtd.eccsize = subdev[0]->eccsize;
> +    if (subdev[0]->read_ecc)
> +	stripe->mtd.read_ecc = stripe_read_ecc;
> +    if (subdev[0]->write_ecc)
> +    	stripe->mtd.write_ecc = stripe_write_ecc;
> +    if (subdev[0]->read_oob)
> +	stripe->mtd.read_oob = stripe_read_oob;
> +    if (subdev[0]->write_oob)
> +	stripe->mtd.write_oob = stripe_write_oob;
> +
> +    stripe->subdev[0] = subdev[0];
> +
> +    for(i = 1; i < num_devs; i++)
> +    {
> +	/* 
> +	 * Check device compatibility,
> +	 */
> +	if(stripe->mtd.type != subdev[i]->type)
> +	{
> +	    kfree(stripe);
> +	    printk(KERN_ERR "mtd_stripe_create(): incompatible device
> type on \"%s\"\n",
> +			    subdev[i]->name);
> +	    return NULL;
> +	}
> +	
> +	/*
> +	 * Check MTD flags
> +	 */
> +	if(stripe->mtd.flags != subdev[i]->flags)
> +	{
> +	    /*
> +	     * Expect all flags to be
> +	     * equal on all subdevices.
> +	     */
> +	    kfree(stripe);
> +	    printk(KERN_ERR "mtd_stripe_create(): incompatible device
> flags on \"%s\"\n",
> +			    subdev[i]->name);
> +	    return NULL;
> +	}
> +	
> +	stripe->mtd.size += subdev[i]->size;
> +	
> +	/*
> +	 * Check OOB and ECC data
> +	 */
> +	if (stripe->mtd.oobblock   !=  subdev[i]->oobblock ||
> +	    stripe->mtd.oobsize    !=  subdev[i]->oobsize ||
> +	    stripe->mtd.oobavail   !=  subdev[i]->oobavail ||
> +	    stripe->mtd.ecctype    !=  subdev[i]->ecctype ||
> +	    stripe->mtd.eccsize    !=  subdev[i]->eccsize ||
> +	    !stripe->mtd.read_ecc  != !subdev[i]->read_ecc ||
> +	    !stripe->mtd.write_ecc != !subdev[i]->write_ecc ||
> +	    !stripe->mtd.read_oob  != !subdev[i]->read_oob ||
> +	    !stripe->mtd.write_oob != !subdev[i]->write_oob)
> +	{
> +	    kfree(stripe);
> +	    printk(KERN_ERR "mtd_stripe_create(): incompatible OOB or
> ECC data on \"%s\"\n",
> +			    subdev[i]->name);
> +	    return NULL;
> +	}
> +	stripe->subdev[i] = subdev[i];
> +    }
> +
> +    stripe->num_subdev = num_devs;
> +    stripe->mtd.name = name;
> +
> +    /*
> +     * Main MTD routines
> +     */
> +    stripe->mtd.erase = stripe_erase;
> +    stripe->mtd.read = stripe_read;
> +    stripe->mtd.write = stripe_write;
> +    stripe->mtd.sync = stripe_sync;
> +    stripe->mtd.lock = stripe_lock;
> +    stripe->mtd.unlock = stripe_unlock;
> +    stripe->mtd.suspend = stripe_suspend;
> +    stripe->mtd.resume = stripe_resume;
> +
> +#ifdef MTD_PROGRAM_REGIONS
> +	/* Montavista patch for Sibley support detected     */
> +	if((stripe->mtd.flags & MTD_PROGRAM_REGIONS) ||
> (stripe->mtd.flags & MTD_ECC))	
> +	    stripe->mtd.writev = stripe_writev;
> +#else
> +	if(stripe->mtd.flags & MTD_ECC)	
> +	    stripe->mtd.writev = stripe_writev;
> +#endif
> +
> +    /* not sure about that case. probably should be used not only for
> NAND */
> +    if(stripe->mtd.type == MTD_NANDFLASH)
> +	stripe->mtd.writev_ecc = stripe_writev_ecc;
> +    
> +    if(subdev[0]->block_isbad)
> +	stripe->mtd.block_isbad = stripe_block_isbad;
> +	
> +    if(subdev[0]->block_markbad)
> +	stripe->mtd.block_markbad = stripe_block_markbad;
> +    
> +    /* NAND specific */
> +    if(stripe->mtd.type == MTD_NANDFLASH)
> +    {
> +        stripe->mtd.oobblock *= num_devs;
> +	stripe->mtd.oobsize *= num_devs;
> +        stripe->mtd.oobavail *= num_devs; /* oobavail is to be changed
> later in stripe_merge_oobinfo() */
> +	stripe->mtd.eccsize *= num_devs;
> +    }
> +
> +#ifdef MTD_PROGRAM_REGIONS
> +    /* Montavista patch for Sibley support detected     */
> +    if(stripe->mtd.flags & MTD_PROGRAM_REGIONS)
> +	stripe->mtd.oobblock *= num_devs;
> +    else if(stripe->mtd.flags & MTD_ECC)
> +	stripe->mtd.eccsize *= num_devs;
> +#else
> +    if(stripe->mtd.flags & MTD_ECC)
> +	stripe->mtd.eccsize *= num_devs;
> +#endif
> +	
> +    /* Sort all subdevices by their size (from largest to smallest)*/
> +    while(!sort_done)
> +    {
> +	sort_done = 1;
> +	for(i=0; i < num_devs - 1; i++)
> +	{
> +	    struct mtd_info *subdev = stripe->subdev[i];
> +	    if(subdev->size > stripe->subdev[i+1]->size)
> +	    {
> +		stripe->subdev[i] = stripe->subdev[i+1];
> +		stripe->subdev[i+1] = subdev;
> +		sort_done = 0;
> +	    }
> +	}
> +    }
> +    
> +    /* Create new device with uniform erase size */
> +    curr_erasesize = subdev[0]->erasesize;
> +    for (i = 1; i < num_devs; i++)
> +    {
> +    	curr_erasesize = lcm(curr_erasesize, subdev[i]->erasesize);
> +    }
> +    curr_erasesize *= num_devs;
> +
> +    /* Check if there are different size devices in the array*/    
> +    for (i = 1; i < num_devs; i++)
> +    {
> +	/* note: subdevices must be already sorted by their size here */
> +	if(subdev[i - 1]->size > subdev[i]->size)
> +	{
> +	    u_int32_t tmp_erasesize = subdev[i]->erasesize;
> +	    for(j = 0; j < i; j++)
> +	    {
> +		tmp_erasesize = lcm(tmp_erasesize,
> subdev[j]->erasesize);
> +	    }
> +	    tmp_erasesize *= i;
> +	    curr_erasesize = lcm(curr_erasesize, tmp_erasesize);
> +	}
> +    }
> +    	
> +    /* Check if erase size found is valid */
> +    if(curr_erasesize <= 0)
> +    {
> +    	kfree(stripe);
> +    	printk(KERN_ERR "mtd_stripe_create(): Can't find lcm of
> subdevice erase sizes\n");
> +    	return NULL;
> +    }
> +	
> +    /* Check interleave size validity here */
> +    if(curr_erasesize % interleave_size)
> +    {
> +	kfree(stripe);
> +	printk(KERN_ERR "mtd_stripe_create(): Wrong interleave size\n");
> +	return NULL;
> +    }
> +    stripe->interleave_size = interleave_size;
> +	
> +    stripe->mtd.erasesize = curr_erasesize;
> +    stripe->mtd.numeraseregions = 0;
> +	
> +    /* update (truncate) super device size in accordance with new
> erasesize */
> +    stripe->mtd.size = (stripe->mtd.size / stripe->mtd.erasesize) *
> stripe->mtd.erasesize;
> +	
> +    /* Calculate last data offset for each striped device */
> +    for (i = 0; i < num_devs; i++)
> +    	stripe->subdev_last_offset[i] = last_offset(stripe, i);
> +
> +    /* NAND specific */
> +    if(stripe->mtd.type == MTD_NANDFLASH)
> +    {
> +	/* Fill oobavail with correct values here */
> +	for (i = 0; i < num_devs; i++)
> +	    stripe->subdev[i]->oobavail =
> stripe_get_oobavail(stripe->subdev[i]);
> +
> +        /* Sets new device oobinfo
> +	 * NAND flash check is performed inside stripe_merge_oobinfo()
> +         * - this should be made after subdevices sorting done for
> proper eccpos and oobfree positioning
> +	 * NOTE: there are some limitations with different size NAND
> devices striping. all devices must have
> +         * the same oobfree and eccpos maps */
> +	if(stripe_merge_oobinfo(&stripe->mtd, subdev, num_devs))
> +        {
> +    	    kfree(stripe);
> +    	    printk(KERN_ERR "mtd_stripe_create(): oobinfo merge has
> failed\n");
> +	    return NULL;
> +	}
> +    }
> +		
> +    /* Create worker threads */
> +    for (i = 0; i < num_devs; i++)
> +    {
> +	if(stripe_start_write_thread(&stripe->sw_threads[i],
> stripe->subdev[i]) < 0)
> +	{
> +	    kfree(stripe);
> +	    return NULL;
> +	}
> +    }
> +    
> +    return &stripe->mtd;
> +}
> +
>   

> +EXPORT_SYMBOL(mtd_stripe_init);
> +EXPORT_SYMBOL(mtd_stripe_exit);
>   
Why do you need these functions exported?
> +/* 
> + * This is the handler for our kernel parameter, called from 
> + * main.c::checksetup(). Note that we can not yet kmalloc() anything,
> + * so we only save the commandline for later processing.
> + *
> + * This function needs to be visible for bootloaders.
>   
Can you please elaborate on this?
> +struct mtd_info *mtd_stripe_create(
> +    struct mtd_info *subdev[],  /* subdevices to stripe      */
> +    int num_devs,               /* number of subdevices      */
> +    char *name,                 /* name for the new device   */
> +    int inteleave_size);  	/* interleaving size         */
> +
> +
> +struct mtd_info *mtd_stripe_create(struct mtd_info *subdev[],	/*
> subdevices to stripe */
> +				   int num_devs,		/*
> number of subdevices      */
> +				   char *name, 			/* name
> for the new device   */
> +				   int interleave_size);	/*
> interleaving size (sanity check is required) */
>   
Cool, it's an important func, why not declare it twice? ;)


Vitaly
