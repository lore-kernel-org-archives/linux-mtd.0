Received: from smtp1-g21.free.fr ([212.27.42.1])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1R62V0-0000H0-PX
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2011 15:44:43 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: dedekind1@gmail.com
Subject: Re: [PATCH V3] mtd: Add DiskOnChip G3 support
References: <1316454213-22559-1-git-send-email-robert.jarzmik@free.fr>
	<1316501205.4849.36.camel@sauron>
Date: Tue, 20 Sep 2011 17:44:27 +0200
In-Reply-To: <1316501205.4849.36.camel@sauron> (Artem Bityutskiy's message of
	"Tue, 20 Sep 2011 09:46:37 +0300")
Message-ID: <87fwjrjk10.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy <dedekind1@gmail.com> writes:

> I really feel unsure about merging this driver because no one reviewed
> it. On the surface it does look neat, though. Could you please CC lkml
> on next submission?
OK, when we have covered your comments, I'll report a V4 to lkml as well.

> On Mon, 2011-09-19 at 19:43 +0200, Robert Jarzmik wrote:
>> +static void doc_delay(struct docg3 *docg3, int nbNOPs)
>> +{
>> +	int i;
>> +
>> +	doc_dbg("NOP x %d\n", nbNOPs);
>> +	for (i = 0; i < nbNOPs; i++)
>> +		doc_writeb(0, DoC_NOP);
>> +}
>
> Why you implement dalaying this way, instead of using udelay/mdelay?
That's from observation, as I have no specification available.

>From my understanding, the clock applied to the chip can be variable, but the
memory bus writes ensure the necessary time, as the NOP write takes as much time
as the DOCG3 decides it to last.

Unless you have a timing to provide (or even better, a specification), I'll
leave the NOP writes.

>> +static int doc_wait_ready(struct docg3 *docg3)
>> +{
>> +	int maxWaitCycles = 100;
>> +
>> +	do {
>> +		doc_delay(docg3, 4);
>> +	} while (!doc_is_ready(docg3) && maxWaitCycles--);
>> +	doc_delay(docg3, 2);
>> +	if (maxWaitCycles > 0)
>> +		return 0;
>> +	else
>> +		return -EIO;
>> +}
>
> There are things like cpu_relax() which are used in busy-loops - did you
> look at those?
No, but I'll amend that loop with cpu_relax, that makes perfect sense.

>
>> +/*
>> + * Debug sysfs entries
>> + */
>> +#ifdef CONFIG_DEBUG_FS
>
> You do not need to use CONFIG_DEBUG_FS - debugfs makes all calls to be
> noop if it is not present.
>
> Either remove all macros or use DEBUG
OK, will remove the ifdef.

>> +#define DEBUGFS_RO_ATTR(name, show_fct) \
>> +	static int name##_open(struct inode *inode, struct file *file) \
>> +	{ return single_open(file, show_fct, inode->i_private); }      \
>> +	static const struct file_operations name##_fops = { \
>> +		.owner = THIS_MODULE, \
>> +		.open = name##_open, \
>> +		.llseek = seq_lseek, \
>> +		.read = seq_read, \
>> +		.release = single_release \
>> +	};
>
> Hmm, looks like something which should be generic, not DoC-specific.
True, but it's not available yet.
And as it's not available, and I don't think debugfs will accept such a patch, I
think I'll leave it here. And if you wish, I'll fill in a separate patch to
debugfs, and *if* it's merged, I'll remove that part then.

Cheers.

-- 
Robert
