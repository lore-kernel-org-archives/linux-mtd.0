Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 157dcS-0006Co-00
	for <linux-mtd@lists.infradead.org>; Wed, 06 Jun 2001 14:45:08 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.30.0106061442350.22563-100000@carrot.linuxgrrls.org> 
References: <Pine.LNX.4.30.0106061442350.22563-100000@carrot.linuxgrrls.org> 
To: kira brown <kira@linuxgrrls.org>
Cc: Frederic Giasson <fgiasson@mediatrix.com>,
    Abraham vd Merwe <abraham@2d3d.co.za>,
    MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Re: mtd_info->write 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 06 Jun 2001 14:49:08 +0100
Message-ID: <17170.991835348@redhat.com>
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

kira@linuxgrrls.org said:
> > If you write to a region which already contains data, then read back
> > and compare with the data you wrote, you're likely to see differences.

> And if you don't see differences, then what's the problem? 

There is no problem. Either way. I may want to write 
~JFFS2_NODETYPE_ACCURATE to a word on the flash chip. I don't care about 
any bits apart from the _one_ bit I asked it to zero.


--
dwmw2
