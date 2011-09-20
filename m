Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R5u3m-00082G-LB
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2011 06:44:03 +0000
Received: by wwp14 with SMTP id 14so179454wwp.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 19 Sep 2011 23:44:00 -0700 (PDT)
Subject: Re: [PATCH V3] mtd: Add DiskOnChip G3 support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Date: Tue, 20 Sep 2011 09:46:37 +0300
In-Reply-To: <1316454213-22559-1-git-send-email-robert.jarzmik@free.fr>
References: <1316454213-22559-1-git-send-email-robert.jarzmik@free.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1316501205.4849.36.camel@sauron>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I really feel unsure about merging this driver because no one reviewed
it. On the surface it does look neat, though. Could you please CC lkml
on next submission?

On Mon, 2011-09-19 at 19:43 +0200, Robert Jarzmik wrote:
> +static void doc_delay(struct docg3 *docg3, int nbNOPs)
> +{
> +	int i;
> +
> +	doc_dbg("NOP x %d\n", nbNOPs);
> +	for (i = 0; i < nbNOPs; i++)
> +		doc_writeb(0, DoC_NOP);
> +}

Why you implement dalaying this way, instead of using udelay/mdelay?

> +static int doc_wait_ready(struct docg3 *docg3)
> +{
> +	int maxWaitCycles = 100;
> +
> +	do {
> +		doc_delay(docg3, 4);
> +	} while (!doc_is_ready(docg3) && maxWaitCycles--);
> +	doc_delay(docg3, 2);
> +	if (maxWaitCycles > 0)
> +		return 0;
> +	else
> +		return -EIO;
> +}

There are things like cpu_relax() which are used in busy-loops - did you
look at those?


> +/*
> + * Debug sysfs entries
> + */
> +#ifdef CONFIG_DEBUG_FS

You do not need to use CONFIG_DEBUG_FS - debugfs makes all calls to be
noop if it is not present.

Either remove all macros or use DEBUG

> +#define DEBUGFS_RO_ATTR(name, show_fct) \
> +	static int name##_open(struct inode *inode, struct file *file) \
> +	{ return single_open(file, show_fct, inode->i_private); }      \
> +	static const struct file_operations name##_fops = { \
> +		.owner = THIS_MODULE, \
> +		.open = name##_open, \
> +		.llseek = seq_lseek, \
> +		.read = seq_read, \
> +		.release = single_release \
> +	};

Hmm, looks like something which should be generic, not DoC-specific.

-- 
Best Regards,
Artem Bityutskiy
