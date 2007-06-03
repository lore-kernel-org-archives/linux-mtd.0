Received: from [63.81.120.155] (helo=imap.sh.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HuvUW-0002du-1h
	for linux-mtd@lists.infradead.org; Sun, 03 Jun 2007 15:12:57 -0400
Message-ID: <466312C2.4090200@ru.mvista.com>
Date: Sun, 03 Jun 2007 23:13:06 +0400
From: Sergei Shtylyov <sshtylyov@ru.mvista.com>
MIME-Version: 1.0
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH] powerpc: Create "rom" (MTD) device prpmc2800
References: <7fc919fce0761f861be3069a853d3169@bga.com>
	<bd6ef296692e8cfb81118f2dc85189a5@kernel.crashing.org>
	<4662EAA9.70104@ru.mvista.com>
	<e4197fd2753f2b4d548d5dde9e3fd1d3@kernel.crashing.org>
	<466308F4.8050004@ru.mvista.com>
	<8ac5664208e0f59329b62ac2138bbc8c@kernel.crashing.org>
In-Reply-To: <8ac5664208e0f59329b62ac2138bbc8c@kernel.crashing.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	Milton Miller <miltonm@bga.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Segher Boessenkool wrote:

>>> You obviously completely misunderstand the semantics
>>> of the "compatible" property.

>>    Oh well, on the chip level, your "compatible" prop would be correct.

> This has nothing to do with a "chip level", it is plain and
> simply the most basic device tree stuff.

    If it was as "plain and simple" as you say, there would be nothing to 
argue about.  What we ended up with is 2 or 3 level hierarchy of nodes which 
doesn't at all seem to be such simple (considering the fact that what's 
covered by a the simple "bank-width" property could be represented by several 
combinations of interleaved flash chips). So, what you wanted us to do was 
either substantially redesign Linux MTD subsys to fit it into that model 
(either that or over-engineer the physmap_of driver to gather that kind of 
information from the multiple "chip" subnodes).  Guess how well would that 
have been accepted even if we had time to do that...

> Segher

WBR, Sergei
