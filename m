Received: from krynn.axis.se ([193.13.178.10])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16duOd-0003mN-00
	for <linux-mtd@lists.infradead.org>; Thu, 21 Feb 2002 14:40:31 +0000
Subject: Re: MTD concat layer
From: Jonas Holmberg <jonas.holmberg@axis.com>
To: Robert Kaiser <rob@sysgo.de>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
In-Reply-To: 
	<Pine.LNX.4.21.0202201620030.16780-100000@dagobert.svc.sysgo.de>
References: <Pine.LNX.4.21.0202201620030.16780-100000@dagobert.svc.sysgo.de>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 21 Feb 2002 15:51:36 +0100
Message-Id: <1014303096.10758.6.camel@pcjonashg>
Mime-Version: 1.0
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Wed, 2002-02-20 at 16:35, Robert Kaiser wrote:
> Hi Jonas,
> 
> On 20 Feb 2002, Jonas Holmberg wrote:
> 
> > I'm ready to do some serious testing now.
> 
> Good!
> 
> > Should I use these patches or
> > do you have newer versions?
> 
> The erase function has a bug for which I'm currently developing
> a fix. I hope to get it done by tomorrow. The bug does not show
> up if you use erase/eraseall, but will probably manifest itself
> when using JFFS/JFFS2 on a concatenated device.

Yep, I get the following when erasing across chip boundry:

JFFS: jffs_write_node: Failed to write, requested 8260, wrote 1
Last[3] is c6a6, datum is 3931
Didn't write all bytes in flash_safe_writev(). Returned -5
JFFS: jffs_write_node: Failed to write, requested 8260, wrote 1
Last[3] is c6a6, datum is 3931
Didn't write all bytes in flash_safe_writev(). Returned -5
JFFS: jffs_write_node: Failed to write, requested 8260, wrote 1
Last[3] is c6a6, datum is 3931
Didn't write all bytes in flash_safe_writev(). Returned -5
JFFS: jffs_write_node: Failed to write, requested 8260, wrote 1
Last[3] is c6a6, datum is 3931

Other than that it seems fine. I have tried mixing CFI and JEDEC chips
as well. I'm awaiting your erase-fix.

It seems like JFFS uses writev. Are you planning to implement the
v-functions?

> 
> > When can we expect to see this in CVS?
> 
> Good question :-). Apparently David is not yet completely convinced
> that it should be implemented the way I did. If you do some serious
> testing, your test results might help to persuade him (or prove to him
> that his scepticism was right). In any case, please share your
> results.

Is it much work implementing it his way instead? I have no opinion of
which is better. Your concat layer looks very clean, but David use to be
right :-)

/Jonas
