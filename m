Received: from r00tworld.com ([212.85.137.150])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zh20V-0001iY-15
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2015 21:00:15 +0000
From: "PaX Team" <pageexec@freemail.hu>
To: Brian Norris <computersforpeace@gmail.com>
Date: Tue, 29 Sep 2015 22:56:25 +0200
MIME-Version: 1.0
Subject: Re: question about potential integer truncation in default_erasesize
Reply-to: pageexec@freemail.hu
CC: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 re.emese@gmail.com, spender@grsecurity.net
Message-ID: <560AFAF9.12740.62C6764A@pageexec.freemail.hu>
In-reply-to: <20150929020220.GB31505@google.com>
References: <56069B10.450.51AFEC35@pageexec.freemail.hu>,
 <20150929020220.GB31505@google.com>
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 28 Sep 2015 at 19:02, Brian Norris wrote:

> On Sat, Sep 26, 2015 at 03:18:08PM +0200, PaX Team wrote:
> > hi all,
> > 
> > drivers/mtd/chips/map_rom.c:default_erasesize can truncate map_info.size
> > from unsigned long to unsigned int on 64 bit archs and i'm wondering if
> > this is intentional or should/could map_info.size be turned into an unsigned
> > int field? FTR, this issue was detected with the upcoming version of the
> > size overflow plugin we have in PaX/grsecurity and there're a handful of
> > similar cases in the tree where potentially unwanted or unnecessary integer
> > truncations occur, this being one of these. any opinion/help is welcome!
> 
> This is being assigned to the erasesize, which is 32-bit already, and
> all of MTD expects a 32-bit erasesize, so it'd be a pretty big job to
> "fix" the truncation.

to make sure i got this right, map_info.size in other uses can hold a
value larger than 4GB (so it has to stay 64 bit, at least on 64 bit
archs) but for erasesize it should never have such a big value? that'd
actually be fine for us since it means when the overflow plugin instruments
this code any runtime trigger means a real problem, not a false positive.

cheers,
 PaX Team
