Received: from lo.gmane.org ([80.91.229.12])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1RJMRb-0001aw-N7
	for linux-mtd@lists.infradead.org; Thu, 27 Oct 2011 09:40:17 +0000
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1RJMRS-0002RL-Ok
	for linux-mtd@lists.infradead.org; Thu, 27 Oct 2011 11:40:06 +0200
Received: from 192.33.93.31 ([192.33.93.31])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 27 Oct 2011 11:40:06 +0200
Received: from reardonj by 192.33.93.31 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 27 Oct 2011 11:40:06 +0200
To: linux-mtd@lists.infradead.org
From: Joel Reardon <reardonj@inf.ethz.ch>
Subject: Re: Security enhancement for UBIFS with secure erase feature
Date: Thu, 27 Oct 2011 09:33:12 +0000 (UTC)
Message-ID: <loom.20111027T111843-772@post.gmane.org>
References: <02855DE82B1CA94A9115CCD637A1325643CD9EC4A3@goemail-server.goerlitz.int>
	<1315747360.18731.57.camel@sauron>
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

Greetings all:

So coincidentally I've been working on a secure deletion patch for UBIFS. (I'm a
grad student researching secure deletion here in Zurich.) I'm mostly finished
implementing it and the results are really good. It works by encrypting each
data node individually with a different key, storing the keys in a (logically)
fixed area, and then periodically atomically updating the key blocks to purge
the old
unwanted keys. A small number  erase block erasures are needed to purge all
deleted data, and since each data node is individually encrypted, there's no
overhead added in terms of seeking / random access, and truncations and
overwrites are also securely deleted. The keys are written ahead of time, and
assigned out as they are needed.

The implementation is well separated from the rest of UBIFS; it uses the
compress/decompress functions to handle cryptographic operations. The state of
keys (unused, used, deleted) is managed by the tree node cache: when adding a
node, the key is used, when removing it, then its deleted; the replay
mechanism thus also performs key management with the same code. Its a handful
of changes to UBIFS and a new data structure containing all the key
functionality. Keys are purged during checkpoint, and I was careful to make
sure that a full device scan is not needed for my modification, it works with
the commit/replay, and it can recover when power is lost during any point of
the purging proceedure.

I have a couple questions to ask the main developer, mostly about orphans for
which I found the documentation not quite clear. I'm quite keen to get
this integrated into UBIFS, however this will be the first time I've
contributed to the kernel so in this regard I'm unsure of the best practices
and so forth.

cheers,
Joel
