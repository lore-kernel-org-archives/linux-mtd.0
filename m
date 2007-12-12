Received: from e2.ny.us.ibm.com ([32.97.182.142])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1J2Shc-0007qj-Aq
	for linux-mtd@lists.infradead.org; Wed, 12 Dec 2007 14:36:55 +0000
Received: from d01relay07.pok.ibm.com (d01relay07.pok.ibm.com [9.56.227.147])
	by e2.ny.us.ibm.com (8.13.8/8.13.8) with ESMTP id lBCEakeY005668
	for <linux-mtd@lists.infradead.org>; Wed, 12 Dec 2007 09:36:46 -0500
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d01relay07.pok.ibm.com (8.13.8/8.13.8/NCO v8.7) with ESMTP id
	lBCEahJU1138928
	for <linux-mtd@lists.infradead.org>; Wed, 12 Dec 2007 09:36:43 -0500
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	lBCEagD4011265
	for <linux-mtd@lists.infradead.org>; Wed, 12 Dec 2007 07:36:42 -0700
Date: Wed, 12 Dec 2007 08:36:39 -0600
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: Alexey Korolev <akorolev@infradead.org>
Subject: Re: Limited support of NAND features in MTD.
Message-ID: <20071212083639.337f3049@weaponx>
In-Reply-To: <Pine.LNX.4.64.0712121107010.19025@pentafluge.infradead.org>
References: <Pine.LNX.4.64.0712121107010.19025@pentafluge.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, joern@logfs.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 12 Dec 2007 11:51:40 +0000 (GMT)
Alexey Korolev <akorolev@infradead.org> wrote:

> Hi,
> 
> It is not a secret that current MTD supports very limited set of NAND
> features. Some of missed features like partial page read or cached read
> are able to improve file system performance and its implementation do
> not require s/w redesign. 
> 
> I have a question is there any limitations/restrictions to support extended features? 
> Does it make sense to implement these features and manage them
> through nand_chip->options flag, letting people to choose whether to use
> features or not? If it is not a good idea what is the best way to manage
> it?
> 
> Currently my clooeague and I did prototypes of partial page read and cached read 
> functionalities showing performance increase. For example partial page read showed about 20%
> of file open/stat time performance increase in JFFS2 on LP NAND. Cached
> read increases overall read performance but value strongly depends on
> platform IO latencies. Now we are thinking to create and sent patches.
> 
> So your suggestions/recomendations are welcome!

Here is my suggestion.  Create the patches and send them :).

More seriously, it is often better to send out patches to show more
concretely what you'd like to accomplish.  Then people can review them
and make suggestions for improvements or changes.  I personally find it
rewarding to do so even if my patches aren't excepted in the end.  I
always learn something, and the code is archived for those that want to
play with it.

josh
