Received: from lo.gmane.org ([80.91.229.12])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QUh1o-0000Jj-O2
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 15:20:13 +0000
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1QUh1i-0005Qf-J7
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 17:20:06 +0200
Received: from mar92-9-82-237-75-54.fbx.proxad.net ([82.237.75.54])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 09 Jun 2011 17:20:06 +0200
Received: from gilles.ganault by mar92-9-82-237-75-54.fbx.proxad.net with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 09 Jun 2011 17:20:06 +0200
To: linux-mtd@lists.infradead.org
From: Gilles <gilles.ganault@free.fr>
Subject: Re: [Ubiattach] "vtbl_check: too large reserved_pebs"
Date: Thu, 09 Jun 2011 17:19:30 +0200
Message-ID: <e2p1v6tlj2gka1lq4q2bd0mk5al776ivms@4ax.com>
References: <mv61v65qqumjmnr9dkejjacgg4id8srbe7@4ax.com>
	<4DF0B36E.2020605@free-electrons.com>
	<7.0.1.0.2.20110609135430.06967d28@free.fr>
	<4DF0BFA0.4030402@free-electrons.com>
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

On Thu, 09 Jun 2011 14:42:08 +0200, David Wagner
<david.wagner@free-electrons.com> wrote:
>>> In most cases, the formula for the offset boils down to:
>>> LEB_size = PEB_size - (((Subpage_size + Page_size) * Page_size) /
>>> Page_size)
>> 
>> Thanks for the tip, but after recompiling a new root filesystem, I'm
>> still getting the same error:
>[...]
>> BTW, using the formula above, I find this: 131.072 - ((( 512 + 2.048) *
>> 2.048 ) / 2.048 ) = 128.512
>> 
>> I wonder if maybe I should leave some room in the NAND partition for the
>> Ubifs journal + error log? I used vol_size=248MiB in ubi.cfg, but maybe
>> this is toot big?
>
>(I forgot to reply to all in my first answer)
>
>Oops, sorry, the formula is
>((Subpage_size + Page_size)) / Page_size) * Page_size
>That is, subpage+page truncated to page.

Thanks, but I must have misunderstood the formula, as I find the same
number:

PEB_size - ((Subpage_size + Page_size)) / Page_size) * Page_size =
LEB_size

131.072 - ((512 + 2048 ) / 2048) * 2048) = 128.512
