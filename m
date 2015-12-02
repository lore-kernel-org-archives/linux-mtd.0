Received: from mail-pf0-x229.google.com ([2607:f8b0:400e:c00::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a4EQB-0007pP-N0
 for linux-mtd@lists.infradead.org; Wed, 02 Dec 2015 20:54:41 +0000
Received: by pfdd184 with SMTP id d184so1769555pfd.3
 for <linux-mtd@lists.infradead.org>; Wed, 02 Dec 2015 12:54:18 -0800 (PST)
Date: Wed, 2 Dec 2015 12:54:15 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Jonas Gorski <jogo@openwrt.org>
Cc: Simon Arlott <simon@fire.lp0.eu>, Florian Fainelli <f.fainelli@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH] mtd: brcmnand: Workaround false ECC uncorrectable errors
Message-ID: <20151202205415.GQ64635@google.com>
References: <5659FF4A.7080203@simon.arlott.org.uk>
 <CAOiHx=nMZwQK9ESw9Ggqc6pHWqYQriB-t2eWq++pke8cXhvupw@mail.gmail.com>
 <565F51D2.4010204@simon.arlott.org.uk>
 <CAOiHx=mLmEW=gK_HE6oVqaFZjMUAWoP1PxZchc_mC_A5PJn-Cw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOiHx=mLmEW=gK_HE6oVqaFZjMUAWoP1PxZchc_mC_A5PJn-Cw@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Wed, Dec 02, 2015 at 09:44:04PM +0100, Jonas Gorski wrote:
> On Wed, Dec 2, 2015 at 9:17 PM, Simon Arlott <simon@fire.lp0.eu> wrote:
> > On 01/12/15 10:41, Jonas Gorski wrote:
> >> On Sat, Nov 28, 2015 at 8:23 PM, Simon Arlott <simon@fire.lp0.eu> wrote:
> >>> +
> >>> +       /* Go to start of buffer */
> >>> +       buf -= FC_WORDS;
> >>> +
> >>> +       /* Erased if all data bytes are 0xFF */
> >>> +       buf_erased = memchr_inv(buf, 0xFF, FC_WORDS) == NULL;
> >>> +
> >>> +       if (!buf_erased)
> >>> +               goto out_free;
> >>
> >> We now have a function exactly for that use case in 4.4,
> >> nand_check_erased_buf [1], consider using that. This also has the
> >> benefit of treating bit flips as correctable as long as the ECC scheme
> >> is strong enough.
> >
> > I have no idea whether or not it's appropriate to specify
> > bitflips_threshold > 0 so it'd just be a more complex way to do
> > a memchr_inv() search for 0xFF.
> 
> The threshold would be the amount of bitflips the code can correct, so
> basically ecc.strength (at least that is my understanding).
> 
> > The code also has to check for the hamming code bytes being all 0x00,
> > because according to the comments [2], the controller also has
> > difficulty with the non-erased all-0xFFs scenario too.
> 
> According to brcmnand.c hamming can fix up to fifteen bitflips, but in

Hamming only protects 1 bitflip. The '15' is the value used by the
controller to represent Hamming (i.e., there is no BCH-15).

> the current code you would fail a hamming protected all-0xff-page for
> even a single bitflip in the data or in the ecc bytes, which means
> that all-0xff-pages wouldn't be protected at all.

BTW, I think Kamal had code to handle protecting bitflips in erased
pages code in the Broadcom STB Linux BSP. Perhaps he can port that to
upstream with nand_check_erased_ecc_chunk()? IIUC, that would probably
handle your case too, Simon, although it wouldn't be optimal for an
all-0xff check (i.e., bitflip_threshold == 0).

If that's really an issue (i.e., we have an implementation + data), I'm
sure we could add optimization to nand_check_erased_ecc_chunk() to
support the bitflip_threshold == 0 case.

Brian
