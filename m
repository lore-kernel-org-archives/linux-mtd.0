Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14uyyC-0007VB-00
	for <linux-mtd@lists.infradead.org>; Wed, 02 May 2001 16:55:16 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3AF02966.9689ABA5@convergence.de> 
References: <3AF02966.9689ABA5@convergence.de> 
To: Frank Neuber <neuber@convergence.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: FIX-Problem: use counter armflash.c 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 02 May 2001 16:55:28 +0100
Message-ID: <17081.988818928@redhat.com>
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


neuber@convergence.de said:
> The use counter never counts down when I unload the module armflash.
> Here is my patch to correct this behavior: 

Not by deregistering every MTD device in the system, you don't :)
Make it remember which device(s) it owns instead.


neuber@convergence.de said:
> There is another usecounter problem in armflash. In the afs_cfi_init()
> function the  function do_map_probe() is called. After this call the
> usecount  of the module cfi_cmdset_0001 is incremented and would never
> be decremented. How can I fix this behaviour? Is there anybody who is
> working with mtd's on arm-integrator? 

That one should be fixed now - I just have to fix up the command sets 
accordingly.

--
dwmw2
