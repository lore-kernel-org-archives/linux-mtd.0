Received: from mtxmxout3.matrox.com ([138.11.2.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TZ0jc-0005BQ-LZ
 for linux-mtd@lists.infradead.org; Thu, 15 Nov 2012 14:48:05 +0000
Date: Thu, 15 Nov 2012 09:48:00 -0500
From: Christopher Harvey <charvey@matrox.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH v3] mtd: omap: nand: Remove 0xFF's that prefixed 16bit
 NAND addresses
Message-ID: <20121115144800.GI2508@harvey-pc.matrox.com>
References: <20121029195127.GA32749@harvey-pc.matrox.com>
 <1352977329.2221.29.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1352977329.2221.29.camel@sauron.fi.intel.com>
Cc: Ivan Djelic <ivan.djelic@parrot.com>, linux-omap@vger.kernel.org,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 15, 2012 at 01:02:09PM +0200, Artem Bityutskiy wrote:
> On Mon, 2012-10-29 at 15:51 -0400, Christopher Harvey wrote:
> > In 16bit NAND mode the GPMC would send the address 0xNN as 0xFFNN
> > instead of 0x00NN on the bus. The 0xFFs were actually uninitialized
> > bits that were left unset in the GPMC command output register. The
> > reason they weren't initialized in 16bit mode is that if the same code
> > that writes to this register was used in 8bit mode then 2 commands
> > would be output in 8bit mode. One for the low byte, and an extra 0x0
> > command for the high byte. This commit uses writew if we're using
> > 16bit NAND. This commit also changes the high byte in the command
> > output register, but they are ignored by NAND chips anyway.
> > 
> > Most chips seem fine with the extra 0xFFs, but the ONFI spec says
> > otherwise.
> > 
> > Signed-off-by: Christopher Harvey <charvey@matrox.com>
> 
> Pushed to l2-mtd.git, thanks!

!!! Did anybody get around to testing this? I thought this patch had
    been abandoned. Will testing get done on an omap chip now that it
    is in a tree?

I should have prefixed it with RFC.

-C

-- 

CONFIDENTIAL & WITHOUT PREJUDICE

This e-mail and any files transmitted with it, is confidential, may be
protected under NDA and/or privileged and shall be treated as
such. The e-mail and its attachments are intended only for use of the
individual(s) or entity(ies) indicated above. Any other person is
hereby advised that it strictly forbidden to disclose, distribute or
reproduce this message.  If you have received this e-mail in error,
please advise me by return e-mail or by telephone at 514-822-6000,
immediately and destroy the message and its contents immediately.
Thank You.

CONFIDENTIEL - SANS PRÉJUDICE

Ce courriel et tout document qui y est joint, est confidentiel, peut
être privilégié et protégé par entente de confidentialité et est à
l'usage exclusif du destinataire. Toute autre personne est par les
présentes avisée qu'il lui est strictement interdit de le diffuser, le
distribuer ou le reproduire. Si vous recevez ce courriel par erreur,
veuillez m'en aviser immédiatement, par retour de courriel ou par
téléphone au (514) 822-6000 et détruire ce message et toute copie de
celui-ci immédiatement.  Merci.
