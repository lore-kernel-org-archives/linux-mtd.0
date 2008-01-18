Received: from an-out-0708.google.com ([209.85.132.248])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JFvTN-0000VQ-6y
	for linux-mtd@lists.infradead.org; Fri, 18 Jan 2008 17:57:52 +0000
Received: by an-out-0708.google.com with SMTP id c3so241485ana.99
	for <linux-mtd@lists.infradead.org>;
	Fri, 18 Jan 2008 09:57:44 -0800 (PST)
Date: Fri, 18 Jan 2008 11:55:31 -0600
From: Josh Boyer <jwboyer@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Subject: Re: Jffs2 and big file = very slow jffs2_garbage_collect_pass
Message-ID: <20080118115531.2deef9fb@zod.rchland.ibm.com>
In-Reply-To: <4790D11E.6060201@parrot.com>
References: <478F7E6D.8010300@parrot.com>
	<20080117162601.GA6677@lazybastard.org>
	<20080117114353.0bc71dac@zod.rchland.ibm.com>
	<479073D1.5010406@parrot.com>
	<20080118064852.026b0c82@zod.rchland.ibm.com>
	<4790D11E.6060201@parrot.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	=?UTF-8?B?SsO2cm4=?= Engel <joern@logfs.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 18 Jan 2008 17:17:34 +0100
Matthieu CASTET <matthieu.castet@parrot.com> wrote:
 
> I sent a mail, but  because of Message has a suspicious header, the 
> message wait  moderator approval.
> 
> 
> In summary,
> the code spend lot's of time in the rbtree code (7 minutes) and 4 
> minutes in jffs2_get_inode_nodes.
> 
> 
> Matthieu
> 
> 
>   54366 rb_prev                                  543,6600
>   28345 rb_next                                  283,4500
>    8602 default_idle                              71,6833
>   10251 __raw_readsl                              40,0430
>   49648 jffs2_get_inode_nodes                     11,8097
>     251 s3c2412_nand_devready                      7,8438
>    1222 crc32_le                                   4,8492

That seems consistent with JFFS2 doing the CRC checks and constructing
the in-memory representation of your large file.  I suspect the older
list-based in-memory implementation would have taken even longer, but
there could be something amiss with the rb-tree stuff perhaps.

josh
