Received: from lo.gmane.org ([80.91.229.12])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QbWKk-00073H-A2
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2011 11:19:59 +0000
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1QbWKd-0001ap-J6
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2011 13:19:51 +0200
Received: from mar92-9-82-237-75-54.fbx.proxad.net ([82.237.75.54])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 28 Jun 2011 13:19:51 +0200
Received: from gilles.ganault by mar92-9-82-237-75-54.fbx.proxad.net with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 28 Jun 2011 13:19:51 +0200
To: linux-mtd@lists.infradead.org
From: Gilles <gilles.ganault@free.fr>
Subject: Re: [Ubifs] Reboot -> "recovery needed"?
Date: Tue, 28 Jun 2011 13:19:40 +0200
Message-ID: <45ej07pjslh20fb66illqsmn9r0au0fejb@4ax.com>
References: <1rhb079etc7nr1tasfal6eag1d6lmfhd73@4ax.com>
	<1309246418.23597.31.camel@sauron>
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

On Tue, 28 Jun 2011 10:33:34 +0300, Artem Bityutskiy
<dedekind1@gmail.com> wrote:
>Your reboot command does not unmount the file-system, so from UBIFS's
>point of view you do unclean reboot, and UBIFS needs to do recovery.

Thanks for the info. I'll see if I can edit the source code to
"reboot" to unmount the root filesystem, or replace "reboot" with
another application or script.
