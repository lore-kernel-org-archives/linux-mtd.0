Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PsxGB-000401-Jz
	for linux-mtd@lists.infradead.org; Fri, 25 Feb 2011 12:59:04 +0000
Received: by iwn36 with SMTP id 36so1098246iwn.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 25 Feb 2011 04:59:01 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1298635930.2798.96.camel@localhost>
References: <AANLkTikWMGSCzGdPUBgtZKY2F6=pZ=6X+p7LUUmuKhp+@mail.gmail.com>
	<Pine.LNX.4.64.1102151355160.2784@lnxricardw.se.axis.com>
	<AANLkTimS2Dqn9W+1zMsb=wgQAPKZaPZ+UePUmAGbQLCz@mail.gmail.com>
	<Pine.LNX.4.64.1102151536400.2784@lnxricardw.se.axis.com>
	<AANLkTi=zwmN2T7T=dePB0PJk_+Ahdvzjrn9t-rA7TtVa@mail.gmail.com>
	<Pine.LNX.4.64.1102171013090.2784@lnxricardw.se.axis.com>
	<1298623342.2798.9.camel@localhost>
	<Pine.LNX.4.64.1102250956200.2784@lnxricardw.se.axis.com>
	<1298629762.2798.38.camel@localhost>
	<20110225113609.GB21841@parrot.com>
	<1298635930.2798.96.camel@localhost>
Date: Fri, 25 Feb 2011 12:59:01 +0000
Message-ID: <AANLkTikKe2ub8CZ+vP-1gXjtr=-BDJ6nc8aEG_9iJj6K@mail.gmail.com>
Subject: Re: CONFIG_MTD_NAND_VERIFY_WRITE with Software ECC
From: David Peverley <pev@sketchymonkey.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Ivan Djelic <ivan.djelic@parrot.com>,
	Ricard Wanderlof <ricard.wanderlof@axis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

> How about changing the MTD interface a little and teach it to:
> 1. Report the bit-flip level (or you name it properly) - the amount of
> bits flipped in this NAND page (or sub-page). If we read more than one
> NAND page at one go, and several pages had bit-flips of different level,
> report the maximum.
This is important to allow the file-system to make an informed
decision based on what happened within MTD. i.e. it would be able to
ascertain whether a read corrected N bit errors and thus be able to
re-program a block as required. I think is the only way to accomplish
handling this at the FS level? However, given that the count comes
from a specific read operation, I think it would need to be
implemented as part of the read call e.g. passing in something like
"unsigned *bit_errors"? This would mean changing something fundamental
or providing a new API to read with this extra parameter so I'm not
sure how this could be accomplished 'nicely'...

Something else to consider - what about bit-flips during writes? These
are currently only spotted if you enable write verify (and also not
dealt with or even notified beyond a generic errcode) and ought to be
handled / notified in a similar manner to the read but it's a lot
harder to decide how to split this functionality between the MTD and
FS layers as they're both closely involved. Not everyone wants to
enable the additional overhead of verifys. Would it be reasonable just
to leave it to the ECC check on the next read to that block instead?

In many ways it would be a lot easier (and involve only a single
implementation) to provide a config option where if a read or write in
MTD fails with a (correctable) bit flip or flips that the MTD itself
takes it on itself to erase the block and re-write the data cleanly. I
like this from the simplicity perspective and the fact it would be
transparent. However its contrary to the concept of this level of
management being performed exclusively by the FS layer. Of course you
still need some sort of stats collecting to help the FS if it wants to
use these stats to assist in deciding when to retire blocks...

~Pev
