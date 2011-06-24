Received: from lo.gmane.org ([80.91.229.12])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1Qa58g-0004F4-GS
	for linux-mtd@lists.infradead.org; Fri, 24 Jun 2011 12:05:35 +0000
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1Qa58a-0000XX-Hd
	for linux-mtd@lists.infradead.org; Fri, 24 Jun 2011 14:05:28 +0200
Received: from mar92-9-82-237-75-54.fbx.proxad.net ([82.237.75.54])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Fri, 24 Jun 2011 14:05:28 +0200
Received: from gilles.ganault by mar92-9-82-237-75-54.fbx.proxad.net with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Fri, 24 Jun 2011 14:05:28 +0200
To: linux-mtd@lists.infradead.org
From: Gilles <gilles.ganault@free.fr>
Subject: Re: [Ubi] Wrong major:minor
Date: Fri, 24 Jun 2011 14:05:13 +0200
Message-ID: <8av807po08nju08nd167d549hios21adn1@4ax.com>
References: <5d84u6d24de3ikt776vdrqpnhhecs3aoio@4ax.com>
	<1306917381.4405.76.camel@localhost>
	<1306917455.4405.77.camel@localhost>
	<BANLkTikha6F8GbWDNpwB4Q-v1V36ARcVVA@mail.gmail.com>
	<87mxh78nai.fsf@macbook.be.48ers.dk>
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

On Fri, 24 Jun 2011 13:46:29 +0200, Peter Korsgaard
<jacmet@sunsite.dk> wrote:
>>>>> "Mike" == Mike Frysinger <vapier.adi@gmail.com> writes:
> Mike> yeah, i dont think there should be.  at least nothing specific to
> Mike> ubi.  perhaps a general kernel thing where you could match the
> Mike> registered name to a static #, but then that wouldnt be ubi's
> Mike> problem.  that'd be in the core logic and work for all devices.
>
>That already exists - CONFIG_DEVTMPFS.

Thanks for the tip. Turns out mdev is fast enough to create the dev
nodes at run-time, but it's good to know there's an alternative.
