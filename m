Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQGM5-0002Mo-Pu
 for linux-mtd@lists.infradead.org; Wed, 19 Mar 2014 13:16:27 +0000
Date: Wed, 19 Mar 2014 10:15:43 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 2/2] UBI: block: Implement kernel_param_ops->get()
Message-ID: <20140319131543.GA529@arch.cereza>
References: <1395225803-25037-1-git-send-email-richard@nod.at>
 <1395225803-25037-2-git-send-email-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1395225803-25037-2-git-send-email-richard@nod.at>
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

Hi Richard,

On Mar 19, Richard Weinberger wrote:
> The ->get() function is not optional.
> 

[..]
>  static struct kernel_param_ops ubiblock_param_ops = {
>  	.set    = ubiblock_set_param,
> +	.get	= param_get_charp,
>  };
>  module_param_cb(block, &ubiblock_param_ops, NULL, 0);

The comment for the function says they are both optional:

/**
 * module_param_cb - general callback for a module/cmdline parameter
 * @name: a valid C identifier which is the parameter name.
 * @ops: the set & get operations for this parameter.
 * @perm: visibility in sysfs.
 *
 * The ops can have NULL set or get functions.
 */

This has no visibility in sysfs, so I can't see how having a NULL
get() is a problem. What's the issue you're trying to fix here?

Maybe I'm missing something?
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
