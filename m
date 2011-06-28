Received: from lo.gmane.org ([80.91.229.12])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QbWUa-0007Gp-Od
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2011 11:30:09 +0000
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1QbWUW-0006Do-Sr
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2011 13:30:04 +0200
Received: from mar92-9-82-237-75-54.fbx.proxad.net ([82.237.75.54])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 28 Jun 2011 13:30:04 +0200
Received: from gilles.ganault by mar92-9-82-237-75-54.fbx.proxad.net with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 28 Jun 2011 13:30:04 +0200
To: linux-mtd@lists.infradead.org
From: Gilles <gilles.ganault@free.fr>
Subject: Re: [Ubifs] Reboot -> "recovery needed"?
Date: Tue, 28 Jun 2011 13:25:33 +0200
Message-ID: <gfej07dg451r0l2co91fuvn4k2ujktk1ta@4ax.com>
References: <1rhb079etc7nr1tasfal6eag1d6lmfhd73@4ax.com>
	<1309246418.23597.31.camel@sauron>
	<45ej07pjslh20fb66illqsmn9r0au0fejb@4ax.com>
	<1309260162.23597.66.camel@sauron>
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

On Tue, 28 Jun 2011 14:22:38 +0300, Artem Bityutskiy
<dedekind1@gmail.com> wrote:
>> Thanks for the info. I'll see if I can edit the source code to
>> "reboot" to unmount the root filesystem, or replace "reboot" with
>> another application or script.
>
>I think it may be enough to re-mount read-only, and probably it is
>impossible to unmount in many cases. But I am not 100% sure.

So I could rename "reboot" something else, then write a shell script
named "reboot" that will first remount the Ubifs partition ro, and
then call the real "reboot"?
