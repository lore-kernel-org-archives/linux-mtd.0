Received: from e6.ny.us.ibm.com ([32.97.182.106])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BzaPY-0006LI-FD
	for linux-mtd@lists.infradead.org; Tue, 24 Aug 2004 08:28:28 -0400
From: Josh Boyer <jdub@us.ibm.com>
To: Ed Co <edityacomm_knb@yahoo.com>
In-Reply-To: <20040824120929.1377.qmail@web52204.mail.yahoo.com>
References: <20040824120929.1377.qmail@web52204.mail.yahoo.com>
Content-Type: text/plain
Message-Id: <1093350500.2991.23.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Date: Tue, 24 Aug 2004 07:28:20 -0500
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Bottom halves being disabled
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-08-24 at 07:09, Ed Co wrote:
> Hi All,
> 
> In the NOR driver code, the spin locks are acquired
> everywhere with bottom halves disabled using the
> spin_lock_bh() API. My doubt is why are the bottom
> halves disabled? (Doesn't that add to the real time
> latency on the system!)

What version of the code are you using, and which driver?  I seem to
remember dwmw2 doing a s/spin_lock_bh/spin_lock a while ago since MTD
doesn't even use bottom halves.

Latest CVS shows only cfi_cmdset_0020.c, amd_flash.c, and sharp.c as
using spin_lock_bh().  Of those three, two are obsolete and the other is
in need of fixing.

josh
