Received: from [81.3.11.18] (helo=mail.ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D9X0g-0006OV-Gj
	for linux-mtd@lists.infradead.org; Thu, 10 Mar 2005 18:24:07 -0500
Received: from dsl-213-023-243-193.arcor-ip.net
	([213.23.243.193]:32905 helo=zappa ident=mail)
	by mail.ku-gbr.de with asmtp (Exim 4.24 #1 (Debian))
	id 1D9X0e-0001D6-MC
	for <linux-mtd@lists.infradead.org>; Fri, 11 Mar 2005 00:24:04 +0100
Received: from [10.10.0.17] (helo=sexmachine.doom)
	by zappa with esmtp (Exim 3.36 #1 (Debian)) id 1D9X0d-0001EL-00
	for <linux-mtd@lists.infradead.org>; Fri, 11 Mar 2005 00:24:03 +0100
Received: from konsti by sexmachine.doom with local (Exim 4.43)
	id 1D9X0c-0002dE-LL
	for linux-mtd@lists.infradead.org; Fri, 11 Mar 2005 00:24:02 +0100
Date: Fri, 11 Mar 2005 00:24:02 +0100
From: Konstantin Kletschke <lists@ku-gbr.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20050310232402.GB10058@ku-gbr.de>
References: <20050309131453.GA2497@synertronixx3>
	<Pine.LNX.4.58.0503101314570.4649@phoenix.infradead.org>
	<20050310152212.GB4910@synertronixx3>
	<Pine.LNX.4.58.0503101554220.5450@phoenix.infradead.org>
	<20050310164024.GD4910@synertronixx3>
	<20050310192519.GC18903@qlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20050310192519.GC18903@qlogic.com>
Subject: Re: jffs2 with sync burst mode
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 2005-03-10 13:25 -0600 schrieb Steve Wahl:

> [ I don't actually know what kind of writes and reads the filesystem
> does. I subscribe to this list for the MTD half, not the JFFS

Me neither, I hope the people here will guide me to find out :)

> Since your raw dumps of the flash after the fact appear good(?), I'd
> concentrate on the read operations.  (If the dumps were bad, I'd look
> at the writes.)

Yeah.

> If your hardware screws up with unusual alignment, well, it's not all
> that rare of a bug to find.

Well lets see. If you look at my debug outputs, I am actually tracing
the problem down to the memcpy function itself.
I suspect there is something wrong with the data cache.
memcpy misreads the correct the original and puts garbage into the copy,
which is most often a line above the original. I don't suspect burst
wrap mode or such, because too much other things work well in this mode
and both, source and copy of the memcpy function are actually in RAM
already...

Regards, Konsti

-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
