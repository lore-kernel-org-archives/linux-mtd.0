Received: from lo.gmane.org ([80.91.229.12])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QbXU4-00005v-Sa
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2011 12:33:41 +0000
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1QbXU1-0003lG-5a
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2011 14:33:37 +0200
Received: from mar92-9-82-237-75-54.fbx.proxad.net ([82.237.75.54])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 28 Jun 2011 14:33:37 +0200
Received: from gilles.ganault by mar92-9-82-237-75-54.fbx.proxad.net with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 28 Jun 2011 14:33:37 +0200
To: linux-mtd@lists.infradead.org
From: Gilles <gilles.ganault@free.fr>
Subject: Re: [Ubifs] Reboot -> "recovery needed"?
Date: Tue, 28 Jun 2011 14:33:24 +0200
Message-ID: <1bij07h511u24jct1qrpvo4622jogipiuj@4ax.com>
References: <1rhb079etc7nr1tasfal6eag1d6lmfhd73@4ax.com>
	<1309246418.23597.31.camel@sauron>
	<45ej07pjslh20fb66illqsmn9r0au0fejb@4ax.com>
	<1309260162.23597.66.camel@sauron>
	<gfej07dg451r0l2co91fuvn4k2ujktk1ta@4ax.com>
	<1309261088.23597.68.camel@sauron>
	<enfj071fg5ebr0n2u15t2nogem32afb5kh@4ax.com>
	<1309263271.23597.70.camel@sauron>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 28 Jun 2011 15:14:27 +0300, Artem Bityutskiy
<dedekind1@gmail.com> wrote:
>Then you do not have to worry about UBIFS recovery - it will be quick
>and will do almost nothing - just check that everything is all-right and
>mark the master node as clean.

What is the command for this? Google says that it's part of the Ubifs
source code:

www.spinics.net/lists/stable-commits/msg11702.html
