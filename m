Received: from mailout00.sul.t-online.com ([194.25.134.16] helo=mailout00.sul.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15fRU1-0007DN-00
	for <linux-mtd@lists.infradead.org>; Fri, 07 Sep 2001 20:40:09 +0100
Message-ID: <3B9923F3.3221AEEF@gmx.de>
Date: Fri, 07 Sep 2001 21:45:55 +0200
From: Thomas Eschenbacher <Thomas.Eschenbacher@gmx.de>
MIME-Version: 1.0
To: Eric <ebrower@usa.net>, linux-mtd@lists.infradead.org
Subject: Re: [MTD in kernel 2.4.9]
References: <20010905212443.27840.qmail@nwcst282.netaddress.usa.net>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Eric wrote:
> 
> Have you tried using the patchin.sh script (.../patches/patchin.sh)?
> If that completes and you still get build errors, perhaps it would
> be best if you posted the errors you are seeing.

Hi Eric,

I have taken a look at that script before but was not brave enough to
let it run. I made those few links on my own and did only forget one or
two files that I did't need either.

My fault was to enable that "deprecated/obsolete" stuff because I wanted
to run the same configuration I used to have with kernel 2.4.3. I
applied that patchin-script anyway, disabled the obsoleted parts and it
compiles fine now.

bye,
  Thomas.
-- 
________________________________________________________________________
Thomas Eschenbacher                           Thomas.Eschenbacher@gmx.de
