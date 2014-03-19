Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQGXE-0002x5-9h
 for linux-mtd@lists.infradead.org; Wed, 19 Mar 2014 13:27:56 +0000
Message-ID: <53299AF5.5020607@nod.at>
Date: Wed, 19 Mar 2014 14:26:13 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH 2/2] UBI: block: Implement kernel_param_ops->get()
References: <1395225803-25037-1-git-send-email-richard@nod.at>
 <1395225803-25037-2-git-send-email-richard@nod.at>
 <20140319131543.GA529@arch.cereza>
In-Reply-To: <20140319131543.GA529@arch.cereza>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 19.03.2014 14:15, schrieb Ezequiel Garcia:
> Hi Richard,
> 
> On Mar 19, Richard Weinberger wrote:
>> The ->get() function is not optional.
>>
> 
> [..]
>>  static struct kernel_param_ops ubiblock_param_ops = {
>>  	.set    = ubiblock_set_param,
>> +	.get	= param_get_charp,
>>  };
>>  module_param_cb(block, &ubiblock_param_ops, NULL, 0);
> 
> The comment for the function says they are both optional:
> 
> /**
>  * module_param_cb - general callback for a module/cmdline parameter
>  * @name: a valid C identifier which is the parameter name.
>  * @ops: the set & get operations for this parameter.
>  * @perm: visibility in sysfs.
>  *
>  * The ops can have NULL set or get functions.
>  */
> 
> This has no visibility in sysfs, so I can't see how having a NULL
> get() is a problem. What's the issue you're trying to fix here?
> 
> Maybe I'm missing something?
> 

BTW: I think we can omit ->get() as some other drivers also only have ->set().
Who want the credit for a documentation fix? ;)

Thanks,
//richard
