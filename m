Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xmfjz-000358-89
 for linux-mtd@lists.infradead.org; Fri, 07 Nov 2014 09:22:00 +0000
Message-ID: <1415352094.958.294.camel@sauron.fi.intel.com>
Subject: Re: [RFC/PATCH 0/5 v2] mtd:ubi: Read disturb and Data retention
 handling
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Tanya Brokhman <tlinder@codeaurora.org>, "Jeff Lauruhn (jlauruhn)"
 <jlauruhn@micron.com>
Date: Fri, 07 Nov 2014 11:21:34 +0200
In-Reply-To: <54563211.6070409@codeaurora.org>
References: <1414331342-27839-1-git-send-email-tlinder@codeaurora.org>
 <544D5BEC.50802@nod.at> <544E052B.1040505@codeaurora.org>
 <544E08AE.7080506@nod.at> <5450C997.9010205@codeaurora.org>
 <5450D6C4.4040400@nod.at> <54538ABC.1040605@codeaurora.org>
 <5453ABF9.4070208@nod.at> <5453AD4D.2000303@nod.at>
 <0D23F1ECC880A74392D56535BCADD7351C2D0438@NTXBOIMBX03.micron.com>
 <54563211.6070409@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Richard Weinberger <richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2014-11-02 at 15:30 +0200, Tanya Brokhman wrote:
> > If NAND why not use ECC to monitor for disturb?
> 
> We don't want just to monitor, we want to prevent cases where ecc cant 
> be fixed. You said it yourself later on "BCH ECC will tell you if bits 
> have changed and will correct up to 5". The goal is to prevent more then 
> 5 errors that can't be fixed.
> 
> NAND is a great storage unit, but you have to follow the rules.  Please 
> refer to Micron datasheet MT29F2G08ABAEAH4 page 100.  NAND is made up of 
> blocks(2048 in this case), each block has a number of pages.  The block 
> is the smallest erasable unit and the only way to change 0's to 1's. 
> Pages are the smallest programmable unit and can only change 1's to 0's. 
>   P/E cycling (100,000 in this case) wears out the block.  We provide 
> 64bytes of spare area for BCH ECC and NAND management.  BCH ECC will 
> tell you if bits have changed and will correct up to 5.
> >
> > Read disturb is a recoverable failure.  It doesn't affect the cells in the page you are reading it affects the cells on either side of the page you are reading.  P/E cycling for this device is 100,000.  You can program once and read many many times.
> >
> > Data retention is the loss of charge on the cells.  Technically you can only change a 0 to 1 by erasing the whole block.  However, data retention is the loss of charge in a cell over time. In this case data retention is 10 years.
> > Data retention gets worse as temperature goes up.
> 
> Exactly! We're aware of all you described above. This is exactly why we 
> need to handle both read disturb and data retention.

Hi Tanya,

just a friendly notice: did you notice that you drop all the CCs in the
reply? Even the person you replied to was not in "To". I guess it is
worth checking your e-mail client's settings.

Jeff, my main concern about the patches is whether they really address
NAND problems, and whether the complexity they introduce are worth it.
The counter-approach is to just read the entire flash periodically, and
just scrub the PEBs (physical eraseblocks) which have have enough
bit-flips (more than a configured threshold per ECC unit, say 1 or 2).

I tried to explain my concerns in here:
http://lists.infradead.org/pipermail/linux-mtd/2014-November/056385.html
http://lists.infradead.org/pipermail/linux-mtd/2014-November/056386.html

Thanks!
