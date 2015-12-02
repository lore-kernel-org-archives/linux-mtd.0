Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a4Ebw-0000Ew-UA
 for linux-mtd@lists.infradead.org; Wed, 02 Dec 2015 21:06:50 +0000
Received: by pabfh17 with SMTP id fh17so52656299pab.0
 for <linux-mtd@lists.infradead.org>; Wed, 02 Dec 2015 13:06:28 -0800 (PST)
Date: Wed, 2 Dec 2015 13:06:25 -0800
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
Message-ID: <20151202210625.GR64635@google.com>
References: <5659FF4A.7080203@simon.arlott.org.uk>
 <CAOiHx=nMZwQK9ESw9Ggqc6pHWqYQriB-t2eWq++pke8cXhvupw@mail.gmail.com>
 <565F51D2.4010204@simon.arlott.org.uk>
 <CAOiHx=mLmEW=gK_HE6oVqaFZjMUAWoP1PxZchc_mC_A5PJn-Cw@mail.gmail.com>
 <20151202205415.GQ64635@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151202205415.GQ64635@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 02, 2015 at 12:54:15PM -0800, Brian Norris wrote:
> BTW, I think Kamal had code to handle protecting bitflips in erased
> pages code in the Broadcom STB Linux BSP. Perhaps he can port that to
> upstream with nand_check_erased_ecc_chunk()? IIUC, that would probably
> handle your case too, Simon, although it wouldn't be optimal for an
> all-0xff check (i.e., bitflip_threshold == 0).

I think this was for BCH only, actually. Hamming wasn't used as much on
STB. So the above would only help part of this patch. I'm less sure of
the behavior for the Hamming engine.

Brian
