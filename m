Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRckh-0002Bb-9Z
 for linux-mtd@lists.infradead.org; Tue, 18 Aug 2015 09:00:16 +0000
Date: Tue, 18 Aug 2015 10:59:53 +0200
From: Antoine Tenart <antoine.tenart@free-electrons.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Antoine Tenart <antoine.tenart@free-electrons.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] mtd: nand: pxa3xx-nand: fix readid without keep_config
Message-ID: <20150818085953.GB3261@kwain>
References: <1439323034-8820-1-git-send-email-robert.jarzmik@free.fr>
 <1439323034-8820-3-git-send-email-robert.jarzmik@free.fr>
 <20150816213655.GA4585@laptop.cereza>
 <87oai6an6j.fsf@belgarion.home>
 <CAAEAJfC_QM=fZOZ1guThuY7hXbAbr7O7U6p3aewqOzVaAsbuMQ@mail.gmail.com>
 <87k2stagad.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87k2stagad.fsf@belgarion.home>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Mon, Aug 17, 2015 at 09:03:38PM +0200, Robert Jarzmik wrote:
> Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> writes:
> 
> > On 16 August 2015 at 19:22, Robert Jarzmik <robert.jarzmik@free.fr> wrote:
> >> Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> writes:
> >>
> >>> On 11 Aug 09:57 PM, Robert Jarzmik wrote:
> >>>> The cases of READID detection are broken on pxa3xx. The reason is that
> >>>> in the early stages of nand probing, ie. at pxa3xx_nand_scan(), we
> >>>> always have :
> >>>>  - info->use_dma = 0 (regardless of dma support yet)
> >>>>  - info->chunk_size = 0 (not yet detected)
> >>>>
> >>>> The READID issued by pxa3xx_nand_scan() will therefore end up in
> >>>> handle_data_pio(), and do_bytes will be 0, leading to not reading the
> >>>> nand id, and blocking detection.
> >>>>
> >>>> This doesn't happen if "keep_config" is used, which is probably the most
> >>>> tested case.
> >>>>
> >>>> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
> >>>> Fixes: 70ed85232a93 ("mtd: nand: pxa3xx: Introduce multiple page I/O
> >>>> support")
> >>>
> >>> To be fair, Antoine submitted this a while ago:
> >>>
> >>> http://lists.infradead.org/pipermail/linux-mtd/2015-April/058739.html
> >>>
> >>> Not sure which one takes precedence in such a case (and yours
> >>> has a proper Fixes tag).
> >> His has precedence. How is it that a fix patch is not yet merge since April ?
> >> Is it because it's part of a still in review serie ?
> 
> Antoine, could you resubmit this single patch with this as trailer please :
> Acked-by: Robert Jarzmik <robert.jarzmik@free>
> Fixes: 70ed85232a93 ("mtd: nand: pxa3xx: Introduce multiple page I/O
> support")

I just resend it.

Antoine

-- 
Antoine Ténart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
