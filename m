Received: from lo.gmane.org ([80.91.229.12])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QNQYj-00084W-Ou
	for linux-mtd@lists.infradead.org; Fri, 20 May 2011 14:20:10 +0000
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1QNQYg-0001Km-5Q
	for linux-mtd@lists.infradead.org; Fri, 20 May 2011 16:20:06 +0200
Received: from wlan231186.mobiel.utwente.nl ([130.89.231.186])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Fri, 20 May 2011 16:20:06 +0200
Received: from timonterbraak by wlan231186.mobiel.utwente.nl with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Fri, 20 May 2011 16:20:06 +0200
To: linux-mtd@lists.infradead.org
From: Timon ter Braak <timonterbraak@gmail.com>
Subject: Re: ubiattach error!
Date: Fri, 20 May 2011 14:14:37 +0000 (UTC)
Message-ID: <loom.20110520T161007-38@post.gmane.org>
References: <71103bce1003230226q7fce2443vad3853d7c6d6d947@mail.gmail.com>
	<1270715032.6754.108.camel@localhost>
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

Artem Bityutskiy <dedekind1 <at> gmail.com> writes:

> 
> > # ubiattach /dev/ubi_ctrl -m 3
> > UBI: attaching mtd3 to ubi0
> > UBI: physical eraseblock size:   524288 bytes (512 KiB)
> > UBI: logical eraseblock size:    516096 bytes
> > UBI: smallest flash I/O unit:    4096
> > UBI: VID header offset:          4096 (aligned 4096)
> > UBI: data offset:                8192
> > UBI error: ubi_scan_add_used: two LEBs with same sequence number 4
> > ubiattach: error!: cannot attach mtd3
> >           error 22 (Invalid argument)
> 
> Looks weird, is this reproducible with nandsim?
> 

After a power cut / reset, we experience similar problems.
I just upgraded to linux 2.6.39 as more and more UBIFS 'bugs' seem to get solved.
Unfortunately, we use a Spansion GL512P (64MB) NOR Flash chip,
which makes life kind of hard:

[    0.510000] UBI: attaching mtd1 to ubi0
[    0.510000] UBI: physical eraseblock size:   131072 bytes (128 KiB)
[    0.520000] UBI: logical eraseblock size:    130944 bytes
[    0.530000] UBI: smallest flash I/O unit:    1
[    0.530000] UBI: VID header offset:          64 (aligned 64)
[    0.540000] UBI: data offset:                128
[    0.540000] UBI error: ubi_scan_add_used: two LEBs with same sequence number 9
[    0.550000] UBI error: ubi_init: cannot attach mtd1
