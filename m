Received: from lo.gmane.org ([80.91.229.12])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QRjXu-0006kf-Lo
	for linux-mtd@lists.infradead.org; Wed, 01 Jun 2011 11:25:07 +0000
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1QRjXt-0001wy-JR
	for linux-mtd@lists.infradead.org; Wed, 01 Jun 2011 13:25:05 +0200
Received: from mar92-9-82-237-75-54.fbx.proxad.net ([82.237.75.54])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 01 Jun 2011 13:25:05 +0200
Received: from gilles.ganault by mar92-9-82-237-75-54.fbx.proxad.net with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 01 Jun 2011 13:25:05 +0200
To: linux-mtd@lists.infradead.org
From: Gilles <gilles.ganault@free.fr>
Subject: Re: [Ubi] Wrong major:minor
Date: Wed, 01 Jun 2011 13:22:50 +0200
Message-ID: <v58cu6p3r5civ2ae44r5ad9hc34rqaab6e@4ax.com>
References: <5d84u6d24de3ikt776vdrqpnhhecs3aoio@4ax.com>
	<BANLkTimab0pKp68f_coPfsjm_6GdKAxSew@mail.gmail.com>
	<i1q6u61tl5go0ou25i0dcupco020ea94a3@4ax.com>
	<BANLkTinmGVeysdwxGSRBsMVXPRnAtOWivg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 30 May 2011 12:29:56 -0400, Mike Frysinger
<vapier.adi@gmail.com> wrote:

>On Mon, May 30, 2011 at 05:53, Gilles wrote:
>>            #BAD echo /sbin/mdev > /proc/sys/kernel/hotplug;
>
>i dont know why you've disabled this.  if you want dynamic nodes after
>boot, you need it.

Because...
1. of that error:
====
Starting mdev...
sh: can't open '/proc/sys/kernel/hotplug': No such file or directory
====

2. and because I don't actually need hotplugging, since the appliance
is a closed-box, so users can't actually (un)plug devices anyway.

I just needed mdev so that Linux would create the right dev nodes for
Ubi.

Thank you.
