Received: from lo.gmane.org ([80.91.229.12])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Q2Sop-0001Bi-HT
	for linux-mtd@lists.infradead.org; Wed, 23 Mar 2011 18:30:10 +0000
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1Q2Son-0004BK-2D
	for linux-mtd@lists.infradead.org; Wed, 23 Mar 2011 19:30:05 +0100
Received: from 92-100-130-122.dynamic.avangarddsl.ru ([92.100.130.122])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 23 Mar 2011 19:30:05 +0100
Received: from yanok by 92-100-130-122.dynamic.avangarddsl.ru with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 23 Mar 2011 19:30:05 +0100
To: linux-mtd@lists.infradead.org
From: Ilya Yanok <yanok@emcraft.com>
Subject: Re: [RFC] Handling of errors for AMD NOR
	=?utf-8?b?KGNmaV9jbWRzZXRfMDAwMik=?= chips
Date: Wed, 23 Mar 2011 18:27:48 +0000 (UTC)
Message-ID: <loom.20110323T192107-666@post.gmane.org>
References: <4D797E23.6070409@emcraft.com> <4D7F1CF3.5010301@tqsc.de>
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

Hello Markus,

Markus Niebel <list-09_linux_mtd <at> tqsc.de> writes:
> what type of chips are causing your problems?

As Detlev has already wrote they are 16-bit Spansion S29GL512P.

> AFAIK in cfi_cmdset_0002 the use of max timouts from cfi query struct is 
> missing (support in the per chip struct is prepared). This should be 
> done first (I think).

Hm, I have to admit I'm not really a flash expert. Could you please give me some
pointer?

> Regarding the handling of status bits you can use MERGESTATUS / 
> cfi_merge_status (from linux/mtd/cfi.h)

Well, most of my code is actually stolen from cfi_merge_status implementation.
Still, I think it's incorrect to use MERGESTATUS directly: we need to filter
that have already finished (with no toggling bits), otherwise we can take the
data byte as a status.

> Would it be useful to send rough patches for 2.6.34 for the max timout?

Yes, please do post them. Any information would be useful.

Regards, Ilya.
