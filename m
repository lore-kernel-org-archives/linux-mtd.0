Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CvHMQ-0007OD-TF
	for linux-mtd@lists.infradead.org; Sun, 30 Jan 2005 10:51:40 -0500
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Josh Boyer <jdub@us.ibm.com>
In-Reply-To: <1107013860.10670.5.camel@windu.rchland.ibm.com>
References: <1106946232.7542.33.camel@windu.rchland.ibm.com>
	<1106998793.17802.3.camel@sauron.oktetlabs.ru>
	<1107013860.10670.5.camel@windu.rchland.ibm.com>
Content-Type: text/plain
Date: Sun, 30 Jan 2005 18:51:04 +0300
Message-Id: <1107100264.17802.17.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: haverkam@de.ibm.com, linux-mtd@lists.infradead.org
Subject: Re: NAND partitioning
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2005-01-29 at 09:51 -0600, Josh Boyer wrote:
> Not necessarily.  I was actually thinking of having JFFS2 just "ignore"
> such eraseblocks.  Essentially treating them as bad blocks perhaps.
> 
> However, such blocks could be scattered across the entire device rather
> than contained within a certain address range on the chip.  Updating the
> data would be a bit tricky, which is why I said a driver would need to
> be created in order to deal with it.
> 
Hmm. If we have several binary blocks, and JFFS2 just skips them, why
should we have better wear-leveling? If we imagine we move binary blocks
sometimes, the wear-leveling would be really better.
