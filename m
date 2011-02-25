Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PsxdZ-0004FT-Dk
	for linux-mtd@lists.infradead.org; Fri, 25 Feb 2011 13:23:14 +0000
Received: by wyf23 with SMTP id 23so1642108wyf.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 25 Feb 2011 05:23:11 -0800 (PST)
Subject: Re: CONFIG_MTD_NAND_VERIFY_WRITE with Software ECC
From: Artem Bityutskiy <dedekind1@gmail.com>
To: David Peverley <pev@sketchymonkey.com>
In-Reply-To: <AANLkTikKe2ub8CZ+vP-1gXjtr=-BDJ6nc8aEG_9iJj6K@mail.gmail.com>
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
	<AANLkTikKe2ub8CZ+vP-1gXjtr=-BDJ6nc8aEG_9iJj6K@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 25 Feb 2011 15:21:49 +0200
Message-ID: <1298640109.2798.110.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Ivan Djelic <ivan.djelic@parrot.com>,
	Ricard Wanderlof <ricard.wanderlof@axis.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-02-25 at 12:59 +0000, David Peverley wrote:
> Hi All,
> 
> > How about changing the MTD interface a little and teach it to:
> > 1. Report the bit-flip level (or you name it properly) - the amount of
> > bits flipped in this NAND page (or sub-page). If we read more than one
> > NAND page at one go, and several pages had bit-flips of different level,
> > report the maximum.
> This is important to allow the file-system to make an informed
> decision based on what happened within MTD. i.e. it would be able to
> ascertain whether a read corrected N bit errors and thus be able to
> re-program a block as required. I think is the only way to accomplish
> handling this at the FS level? However, given that the count comes
> from a specific read operation, I think it would need to be
> implemented as part of the read call e.g. passing in something like
> "unsigned *bit_errors"? This would mean changing something fundamental
> or providing a new API to read with this extra parameter so I'm not
> sure how this could be accomplished 'nicely'...

I do not think it is an issue - changing in-kernel API is relatively
easy and straight-forward task.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
