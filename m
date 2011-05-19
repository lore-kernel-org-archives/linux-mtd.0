Received: from gw1.transmode.se ([195.58.98.146])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QN6BO-0006Ps-Tk
	for linux-mtd@lists.infradead.org; Thu, 19 May 2011 16:34:44 +0000
In-Reply-To: <4DD4BF87.6030107@mvista.com>
References: <4DD4BF87.6030107@mvista.com>
Subject: Re: mtd: fix hang-up in cfi erase and read contention
To: Tadashi Abe <tabe@mvista.com>
Message-ID: <OFC53F0B6C.74FD45AE-ONC1257895.005ACC69-C1257895.005B0FB6@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Thu, 19 May 2011 18:34:37 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> From: Tadashi Abe <tabe@mvista.com>
>
> cfi erase command hangs up when erase and read contention occurs.
> If read runs at the same address as erase operation, read issues
> Erase-Suspend via get_chip() and the erase goes into sleep in wait queue.
> But in this case, read operation exits by time-out without waking it up.
>
> I think the other variants (0001, 0020 and lpddr) have the same problem too.
> Tested and verified the patch only on CFI-0002 flash, though.
>
> Signed-off-by: Tadashi Abe <tabe@mvista.com>

This looks good for cfi_cmdset_0001.c so:
Acked-by: Joakim Tjernlund <joakim.tjernlund@transmode.se>
