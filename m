Received: from 71-19-161-253.dedicated.allstream.net ([71.19.161.253]
 helo=nsa.nbspaymentsolutions.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VjcG8-0007wV-AW
 for linux-mtd@lists.infradead.org; Thu, 21 Nov 2013 21:58:01 +0000
Received: from DeadDuck (unknown [172.20.177.82])
 by nsa.nbspaymentsolutions.com (Postfix) with ESMTP id ED03A3FC4CD
 for <linux-mtd@lists.infradead.org>; Thu, 21 Nov 2013 16:59:51 -0500 (EST)
From: Bill Pringlemeir <bpringlemeir@nbsps.com>
To: linux-mtd@lists.infradead.org
Subject: Re: VF610+ColdFireM54418 controller.
References: <87siupheou.fsf@nbsps.com>
Date: Thu, 21 Nov 2013 16:52:28 -0500
In-Reply-To: <87siupheou.fsf@nbsps.com> (Bill Pringlemeir's message of "Thu,
 21 Nov 2013 12:01:21 -0500")
Message-ID: <87k3g1h17n.fsf@nbsps.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 21 Nov 2013, bpringlemeir@nbsps.com wrote:

> All registers are 32bit R/W unless noted, from section 31.3 of the
> Vybrid NAND chapter.

> Is there an existing driver that can be adapted?  

It looks like the mpc5125 SOC has the same NAND controller; the CPU/SOC
has support in the tree, but no NAND controller in mpc5125twr.dts.  The
registers and buffers differ from the mpc5121 NAND controller which is
in the tree; the difference between the mpc5125+vf610+ColdFireM54418
NAND controller and the mpc5121 NAND controller look significant to me.

Fwiw,
Bill Pringlemeir.
