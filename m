Date: Wed, 17 Jan 2007 23:14:42 +0000 (GMT)
From: Artem Bityutskiy <dedekind@infradead.org>
To: Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: OneNAND: Always print error messages
In-Reply-To: <929664.73441168584534274.JavaMail.weblogic@ep_ml28>
Message-ID: <Pine.LNX.4.64.0701172314160.11157@pentafluge.infradead.org>
References: <929664.73441168584534274.JavaMail.weblogic@ep_ml28>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Adrian Hunter <ext-adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2007-01-12 at 06:48 +0000, Kyungmin Park wrote:
> As you know, nand flash has several initial bad blocks.
> Maybe many uses don't like to see the some error message at boot time.

Yeah, it indeed makes few sense to print out error message if we meet a
bad block. But being silent when errors occur is bad as well.

> At least, onenand_wait(), onenand_do_read_oob() have to change from 
KERN_ERR to KERN_DEBUG

KERN_ERR and KERN_DEBUG are just printk priorities. I would better say
"printk to DEBUG()".

> I'm not sure how to handle error message, especillay at onenand_wait().
> controller error is very important but it's too verbose at boot time.

We can avoid doing this if (1) we cannot read OOB (1) and we are
scanning (2). In other cases we print the error message. Comments?

-- 
Best regards,
Artem Bityutskiy
