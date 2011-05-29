Received: from lo.gmane.org ([80.91.229.12])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QQdLy-00085G-RL
	for linux-mtd@lists.infradead.org; Sun, 29 May 2011 10:36:15 +0000
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1QQdLq-0002nC-5F
	for linux-mtd@lists.infradead.org; Sun, 29 May 2011 12:36:06 +0200
Received: from mar92-9-82-237-75-54.fbx.proxad.net ([82.237.75.54])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Sun, 29 May 2011 12:36:06 +0200
Received: from gilles.ganault by mar92-9-82-237-75-54.fbx.proxad.net with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Sun, 29 May 2011 12:36:06 +0200
To: linux-mtd@lists.infradead.org
From: Gilles <gilles.ganault@free.fr>
Subject: Re: [ubifs] "cannot parse device table file 'device_table.txt'"
Date: Sun, 29 May 2011 12:35:53 +0200
Message-ID: <gu64u6lhaqaroshib93letv1acq8d1snm5@4ax.com>
References: <9ms9t650c8kmhe1ed5gdb7mv7cqdovcrca@4ax.com>
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

On Thu, 19 May 2011 12:49:54 +0200, Gilles <gilles.ganault@free.fr>
wrote:
>Error: count cannot be zero if increment is non-zero
>Error: cannot parse '/dev/mtdblock0     b       640     0       0 31
>0       0       1       -'

In case someone else has the same issue, here's the correct line:

/dev/mtd0	c	640	0	0	90	0	0	0	-
/dev/mtd1	c	640	0	0	90	2	0	0	-
/dev/mtd2	c	640	0	0	90	4	0	0	-
/dev/mtd3	c	640	0	0	90	6	0	0	-
/dev/mtd4	c	640	0	0	90	8	0	0	-
/dev/mtd5	c	640	0	0	90	10	0	0	-

/dev/mtdblock0	b	640	0	0	31	0	0	0	-
/dev/mtdblock1	b	640	0	0	31	1	0	0	-
/dev/mtdblock2	b	640	0	0	31	2	0	0	-
/dev/mtdblock3	b	640	0	0	31	3	0	0	-
/dev/mtdblock4	b	640	0	0	31	4	0	0	-
/dev/mtdblock5	b	640	0	0	31	5	0	0	-
