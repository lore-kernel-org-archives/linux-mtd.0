Received: from s131.mittwaldmedien.de ([62.216.178.31])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1ENAoa-0002k0-4F
	for linux-mtd@lists.infradead.org; Wed, 05 Oct 2005 11:04:27 -0400
Received: from localhost (localhost [127.0.0.1])
	by s131.mittwaldmedien.de (Postfix) with ESMTP id DA9C55E4129
	for <linux-mtd@lists.infradead.org>;
	Wed,  5 Oct 2005 17:04:13 +0200 (CEST)
Received: from lin01.mn-solutions.de (p54B28E33.dip0.t-ipconnect.de
	[84.178.142.51])
	by s131.mittwaldmedien.de (Postfix) with ESMTP id EB39F5E4115
	for <linux-mtd@lists.infradead.org>;
	Wed,  5 Oct 2005 17:04:12 +0200 (CEST)
Received: from mnz66.mn-solutions.de (mnz66.mn-logistik.de [192.168.233.66])
	by lin01.mn-solutions.de (Postfix) with ESMTP id 4779E1E014A
	for <linux-mtd@lists.infradead.org>;
	Wed,  5 Oct 2005 17:03:41 +0200 (CEST)
From: Holger Schurig <hs4233@mail.mn-solutions.de>
To: linux-mtd@lists.infradead.org
Date: Wed, 5 Oct 2005 17:01:54 +0200
References: <200510051437.11856.hs4233@mail.mn-solutions.de>
In-Reply-To: <200510051437.11856.hs4233@mail.mn-solutions.de>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200510051701.54776.hs4233@mail.mn-solutions.de>
Subject: Re: Bug: Flash writing & suspending
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> I use Kernel 2.6.13-rc2, but with the MTD (drivers/mtd/, include/mtd,
> include/linux/mtd) from today's CVS. JFFS2 is still the old one.

Oh, BTW, the same error happens also on:

a) plain 2.6.13-rc2
b) 2.6.13-rc2 with both MTD and JFFS2 from CVS (using the ./patchkernel.sh)

The reason I just installed (manually) the MTD stuff only has to do with a 
suspicion about the problem source.

I suspect that maybe MTD is writing data into the StrataFlash. While this 
erasing & writings happens, it probably polls the built-in state-machine 
status of the chips. Probably during such an operation the suspend-to-memory 
takes place. The hardware switches off the power to the StrataFlash, but MTD 
doesn't know about this.

At resume time, the StataFlash get's power and resets to some initial state. 
Linux thaws the processes, among them the JFFS2/MTD thread. Which continues 
to poll the StrataFlash, but because it has been resetted in the meantime ...
