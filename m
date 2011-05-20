Received: from lo.gmane.org ([80.91.229.12])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QNRcf-0000nS-2Y
	for linux-mtd@lists.infradead.org; Fri, 20 May 2011 15:28:17 +0000
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1QNRcc-0001mk-Df
	for linux-mtd@lists.infradead.org; Fri, 20 May 2011 17:28:14 +0200
Received: from mar92-9-82-237-75-54.fbx.proxad.net ([82.237.75.54])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Fri, 20 May 2011 17:28:14 +0200
Received: from gilles.ganault by mar92-9-82-237-75-54.fbx.proxad.net with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Fri, 20 May 2011 17:28:14 +0200
To: linux-mtd@lists.infradead.org
From: Gilles <gilles.ganault@free.fr>
Subject: Re: [ubifs] "cannot parse device table file 'device_table.txt'"
Date: Fri, 20 May 2011 17:28:01 +0200
Message-ID: <u12dt69l3v9cvavpqhuv5ot7knicvj7jl8@4ax.com>
References: <9ms9t650c8kmhe1ed5gdb7mv7cqdovcrca@4ax.com>
	<1305883637.2630.123.camel@localhost>
	<ekect6d8fta52gjlpf5faqo81fskllta5k@4ax.com>
	<1305887241.2630.137.camel@localhost>
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

On Fri, 20 May 2011 13:27:21 +0300, Artem Bityutskiy
<dedekind1@gmail.com> wrote:
>I do not know the right format for the device table either. In your case
>you have: start = 0, increment = 1, count = -;
>
>I do not know what "-" means, but mkfs.ubifs interprets it as "zero" and
>then complains that you ask it to create zero devices starting from
>number zero with increment 0.
>
>May be this '-' means something and mkfs.ubifs does not properly handle
>that?

I guess not too many people use Ubifs with uCLinux yet, which might
explain why the samples provided with the distro don't work. I'll read
up on that file and try to figure out why mkfs.ubifs isn't happy.

Thank you.
