Received: from lo.gmane.org ([80.91.229.12])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QUhtH-0001uf-MJ
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 16:15:28 +0000
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1QUhtD-00054X-SS
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 18:15:23 +0200
Received: from mar92-9-82-237-75-54.fbx.proxad.net ([82.237.75.54])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 09 Jun 2011 18:15:23 +0200
Received: from gilles.ganault by mar92-9-82-237-75-54.fbx.proxad.net with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 09 Jun 2011 18:15:23 +0200
To: linux-mtd@lists.infradead.org
From: Gilles <gilles.ganault@free.fr>
Subject: Re: [Ubiattach] "vtbl_check: too large reserved_pebs"
Date: Thu, 09 Jun 2011 18:15:11 +0200
Message-ID: <8cs1v6pdevc4nv71mqcrnojipnctdco8hd@4ax.com>
References: <mv61v65qqumjmnr9dkejjacgg4id8srbe7@4ax.com>	<4DF0B36E.2020605@free-electrons.com>	<7.0.1.0.2.20110609135430.06967d28@free.fr>	<4DF0BFA0.4030402@free-electrons.com>
	<e2p1v6tlj2gka1lq4q2bd0mk5al776ivms@4ax.com>
	<4DF0EBE1.9000903@free-electrons.com>
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

On Thu, 09 Jun 2011 17:50:57 +0200, David Wagner
<david.wagner@free-electrons.com> wrote:
>I should have mentionned that every sub-result has to be considered an
>integer, here, sorry.
>512+2048 = 2560
>2560 / 2048 = 1 // That's where it is important that the result be
>                // an integer.
>1 * 2048 = 2048
>131072 - 2048 = 129024

Thanks a lot.
