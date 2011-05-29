Received: from lo.gmane.org ([80.91.229.12])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QQfxC-0000kq-Rs
	for linux-mtd@lists.infradead.org; Sun, 29 May 2011 13:22:51 +0000
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1QQfx9-0006Xd-C8
	for linux-mtd@lists.infradead.org; Sun, 29 May 2011 15:22:47 +0200
Received: from mar92-9-82-237-75-54.fbx.proxad.net ([82.237.75.54])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Sun, 29 May 2011 15:22:47 +0200
Received: from gilles.ganault by mar92-9-82-237-75-54.fbx.proxad.net with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Sun, 29 May 2011 15:22:47 +0200
To: linux-mtd@lists.infradead.org
From: Gilles <gilles.ganault@free.fr>
Subject: Re: [Ubi] Wrong major:minor
Date: Sun, 29 May 2011 15:22:31 +0200
Message-ID: <i1i4u6dqtro926ue9i2m6co7skb0v22thv@4ax.com>
References: <5d84u6d24de3ikt776vdrqpnhhecs3aoio@4ax.com>
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

On Sun, 29 May 2011 12:39:33 +0200, Gilles <gilles.ganault@free.fr>
wrote:
>I'm no Linux expert, and was wondering how to find out what the
>correct major:minor is for the Ubi device nodes? Are they defined
>somewhere in the Linux source code?

I have a couple more newbie questions:

1. A tutorial mentionned using ubinfo, ubiformat, ubiattach, ubimkvol,
and finally mount: Why do we need all those commands to use NAND
memory from uClinux?

2. Am I correct in understanding that the stack looks like this?
_______________________
| Linux
|_______________________
|UBIFS
|_______________________
|UBI
|_______________________
|MTD
|_______________________
|Hardware NAND memory
|_______________________

Thank you.
