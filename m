Received: from carrot.linuxgrrls.org ([212.18.228.66] ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 157daB-0006CB-00
	for <linux-mtd@lists.infradead.org>; Wed, 06 Jun 2001 14:42:47 +0100
Date: Wed, 6 Jun 2001 14:42:57 +0100 (BST)
From: kira brown <kira@linuxgrrls.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Frederic Giasson <fgiasson@mediatrix.com>,
	Abraham vd Merwe <abraham@2d3d.co.za>,
	MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Re: mtd_info->write 
In-Reply-To: <15619.991834880@redhat.com>
Message-ID: <Pine.LNX.4.30.0106061442350.22563-100000@carrot.linuxgrrls.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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


On Wed, 6 Jun 2001, David Woodhouse wrote:

> If you write to a region which already contains data, then read back and
> compare with the data you wrote, you're likely to see differences.

And if you don't see differences, then what's the problem?

kira.
