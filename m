Received: from mail-out.m-online.net ([212.18.0.10])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WV3M9-0001bp-HV
 for linux-mtd@lists.infradead.org; Tue, 01 Apr 2014 18:24:18 +0000
Date: Tue, 1 Apr 2014 20:23:50 +0200
From: Gerhard Sittig <gsi@denx.de>
To: Stas Sergeev <stsp@list.ru>
Subject: Re: nandwrite and contiguous space
Message-ID: <20140401182350.GS2775@book.gsilab.sittig.org>
References: <533A8749.4050802@list.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <533A8749.4050802@list.ru>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2014-04-01 at 13:30 +0400, Stas Sergeev wrote:
> 
> I am looking for a NAND flasher that supports searching
> for the contiguous region of good blocks (within a specified
> range), and flashes an image to it. It seems nandwrite - the
> default linux flasher - can only skip bad blocks, but the scenario
> I need, doesn't seem to be supported.

Isn't the point that the set of good blocks keeps changing over
time?  What might be good now, may be bad a second later or next
year, doesn't matter as long as it won't stay good forever.

> Is there any other flasher that does support this?
> Or maybe some trick with nandwrite exists?
> If not, how difficult is it to implement such a capability into
> nandwrite?

If you want a sequence of good blocks, this very much sounds like
the LEBs which UBI provides.  Aren't you asking for an UBI
volume?  What am I missing?


virtually yours
Gerhard Sittig
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr. 5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office@denx.de
