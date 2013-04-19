Received: from mail.free-electrons.com ([94.23.35.102])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UTAPj-0004ph-W1
 for linux-mtd@lists.infradead.org; Fri, 19 Apr 2013 12:27:40 +0000
Date: Fri, 19 Apr 2013 09:27:43 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [RFC/PATCH v2] ubi: Add ubiblock read-write driver
Message-ID: <20130419122742.GA2459@localhost>
References: <1355314912-9321-1-git-send-email-elezegarcia@gmail.com>
 <201304181630.58886.vapier@gentoo.org>
 <20130419001259.GA2259@localhost>
 <201304182128.19518.vapier@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <201304182128.19518.vapier@gentoo.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Ezequiel Garcia <elezegarcia@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, richard.weinberger@gmail.com,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 linux-mtd@lists.infradead.org, Tim Bird <tim.bird@am.sony.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 18, 2013 at 09:28:16PM -0400, Mike Frysinger wrote:
> On Thursday 18 April 2013 20:13:00 Ezequiel Garcia wrote:
> > On Thu, Apr 18, 2013 at 04:30:55PM -0400, Mike Frysinger wrote:
> > > i wonder if the write support should be put behind a CONFIG option.
> > > personally, the write support is kind of neat and semi-useful for
> > > development, but i don't plan on shipping anything on that :).  i just
> > > want read-only support to load an ext2 fs on top of UBI.
> > 
> > Mmm... good input. Maybe putting write support behind a CONFIG and
> > showing a big fat warning when the module loads will do?
> > (something to prevent regular users from using this carelessly).
> > 
> > May I ask why would you want to put ext2 fs? Have you considered f2fs?
> 
> well, unless i misread things, f2fs is designed for consumer flash 
> (mmc/cf/etc...) where the flash (e.g. NAND) is behind a FTL.  the device i'm 
> interested isn't behind a FTL (the NAND is connected directly to the NAND 
> controller in the SoC),

Indeed f2fs is designed for flash behind FTL. The thing is the ubi+ubiblock
should act as a FTL, providing bad block management and wear leveling.

So that's why I've been wondering about using f2fs. Probably I should
give it a try and post the results, instead of just wondering.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
