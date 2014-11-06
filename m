Received: from webbox1416.server-home.net ([77.236.96.61])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XmH43-0000oF-8J
 for linux-mtd@lists.infradead.org; Thu, 06 Nov 2014 07:01:04 +0000
From: Alexander Stein <alexander.stein@systec-electronic.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 1/1 RFC] mtd: spi-nor: Fix ID for Spansion s70fl01gs
Date: Thu, 06 Nov 2014 08:02:17 +0100
Message-ID: <41653887.oz5HLbAWvy@ws-stein>
In-Reply-To: <20141105211334.GV23619@ld-irv-0074>
References: <1411983795-6444-1-git-send-email-alexander.stein@systec-electronic.com>
 <20141105211334.GV23619@ld-irv-0074>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: Marek Vasut <marex@denx.de>, linux-mtd@lists.infradead.org,
 Kevin Cernekee <cernekee@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Brian,

thanks for replying.

On Wednesday 05 November 2014 13:13:34, Brian Norris wrote:
> On Mon, Sep 29, 2014 at 11:43:15AM +0200, Alexander Stein wrote:
> > The Device ID is the same as with s25fl512s as stated in datasheet:
> > 6. Identification (RDID)
> > The Read Identification (RDID) command outputs the one-byte manufacturer
> > identification, followed by the two-byte device identification and the
> > bytes for the Common Flash Interface (CFI) tables. Each die of the FL01GS
> > dual die stack will have identical identification data as the FL512S die,
> > with the exception of the CFI data at byte 27h, as shown in Table 6.1.
> > 
> > If DT is configured with 's70fl01gs' I get the following warnings (on a 3.12
> > kernel, but that shouldn't matter):
> > m25p80 spi32766.0: found s25fl512s, expected s70fl01gs
> > m25p80 spi32766.1: found s25fl512s, expected s70fl01gs
> > 
> > Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>
> > ---
> > I am aware that there is now an ID conflict. But this is due that the
> > s70fl01gs simply uses two separate chips. How to handle that?
> 
> Maybe you should just be specifying s25fl512s in your DT instead?

This is what I'm doing now. It seems to me that this is currently the only valid solution.

> Are we sure there are no s70fl01gs devices which use the current ID? I
> know some manufacturers are prone to doing the stupidest things you can
> think of (like arbitrarily-changing IDs).

To quote from http://www.spansion.com/Support/Datasheets/S70FL01GS.pdf:
6. Read Identification (RDID)
The Read Identification (RDID) command outputs the one-byte manufacturer identification, followed by the 
two-byte device identification and the bytes for the Common Flash Interface (CFI) tables. Each die of the 
FL01GS dual die stack will have identical identification data as the FL512S die, with the exception of the CFI 
data at byte 27h, as shown in Table 6.1.

So, AFAICS you can only distinguish two FL512S from a FL01GS by reading this CFI byte which isn't done in linux.

Best regards,
Alexander
-- 
Dipl.-Inf. Alexander Stein

SYS TEC electronic GmbH
Am Windrad 2
08468 Heinsdorfergrund
Tel.: 03765 38600-1156
Fax: 03765 38600-4100
Email: alexander.stein@systec-electronic.com
Website: www.systec-electronic.com
 
Managing Director: Dipl.-Phys. Siegmar Schmidt
Commercial registry: Amtsgericht Chemnitz, HRB 28082
