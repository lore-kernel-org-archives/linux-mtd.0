Received: from lo.gmane.org ([80.91.229.12])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QXUyJ-0003n3-Al
	for linux-mtd@lists.infradead.org; Fri, 17 Jun 2011 09:04:12 +0000
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1QXUyG-0001gh-BC
	for linux-mtd@lists.infradead.org; Fri, 17 Jun 2011 11:04:08 +0200
Received: from mar92-9-82-237-75-54.fbx.proxad.net ([82.237.75.54])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Fri, 17 Jun 2011 11:04:08 +0200
Received: from gilles.ganault by mar92-9-82-237-75-54.fbx.proxad.net with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Fri, 17 Jun 2011 11:04:08 +0200
To: linux-mtd@lists.infradead.org
From: Gilles <gilles.ganault@free.fr>
Subject: Re: [NAND] Are partitions persistent?
Date: Fri, 17 Jun 2011 11:03:57 +0200
Message-ID: <u26mv6p5o25fugrjepefl74q8rgct8uq0s@4ax.com>
References: <khpjv6l6bhe815s0rj9frue0l5qqpb8hfq@4ax.com>
	<BANLkTi=fnNB2CXkbSGhrs91TLUB05KWwrQ@mail.gmail.com>
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

On Fri, 17 Jun 2011 02:26:15 -0400, Mike Frysinger
<vapier.adi@gmail.com> wrote:
>u-boot by default does not know any of partitions, only offsets and
>lengths.  it is up to you to make sure the two concepts are kept in
>line.

Thanks Mike, that's what I thought.
