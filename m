Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a4Fo1-0003md-DE
 for linux-mtd@lists.infradead.org; Wed, 02 Dec 2015 22:23:22 +0000
Received: by pabfh17 with SMTP id fh17so54198269pab.0
 for <linux-mtd@lists.infradead.org>; Wed, 02 Dec 2015 14:23:00 -0800 (PST)
Date: Wed, 2 Dec 2015 14:22:57 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Jonas Gorski <jogo@openwrt.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Simon Arlott <simon@fire.lp0.eu>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] mtd: brcmnand: Workaround false ECC uncorrectable errors
Message-ID: <20151202222257.GS64635@google.com>
References: <5659FF4A.7080203@simon.arlott.org.uk>
 <CAOiHx=nMZwQK9ESw9Ggqc6pHWqYQriB-t2eWq++pke8cXhvupw@mail.gmail.com>
 <565F51D2.4010204@simon.arlott.org.uk>
 <CAOiHx=mLmEW=gK_HE6oVqaFZjMUAWoP1PxZchc_mC_A5PJn-Cw@mail.gmail.com>
 <20151202205415.GQ64635@google.com>
 <CAOiHx=mAaU_nny5SmzAEmqBB=OTT_mqGcYhD7ZhjZWbG9wcKsw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOiHx=mAaU_nny5SmzAEmqBB=OTT_mqGcYhD7ZhjZWbG9wcKsw@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 02, 2015 at 10:08:20PM +0100, Jonas Gorski wrote:
> On Wed, Dec 2, 2015 at 9:54 PM, Brian Norris
> <computersforpeace@gmail.com> wrote:
> > If that's really an issue (i.e., we have an implementation + data), I'm
> > sure we could add optimization to nand_check_erased_ecc_chunk() to
> > support the bitflip_threshold == 0 case.
> 
> Maybe I'm missing something, but wasn't the point of introducing
> nand_check_erased_ecc_chunk that bitflips in erased pages should be
> treated as bitflips corrected by the ecc, and therefore fixed up
> before passing the data further on? So having a theshold of 0 would be
> wrong / no protection at all, and could be quite destructive on MLC
> nand, where bitflips in erased pages are rather common.

Yes, that would be pretty destructive on MLC NAND. But there might be
cases where this is reasonable. For instance, we might have:

 (a) SLC NAND that specifies up to 1 bitflip per 512 bytes
 (b) a Hamming ECC engine that can correct 1 bitflip
 (c) said Hamming engine does not handle all-0xff pages correctly, nor
 does it handle near-0xff pages (e.g., with a single 0 bit) correctly

Now, we might (for instance) allow up to ecc_strength / 2 bitflips in
erased pages [1], as a general rule, but for the above case, that means we
don't allow any on Hamming ECC. Hence, bitflip_threshold = 1 / 2 = 0.

This is kind of a degenerate case, so we might consider supporting it
differently than we would for BCH. e.g., don't use
nand_check_erased_ecc_chunk() at all.

Brian

[1] We might do this because we can expect that if an unprogrammed page
has N bitflips, there might be even more than N bitflips after
programming the page.
