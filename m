Received: from proxima.lp0.eu ([2001:8b0:ffea:0:205:b4ff:fe12:530])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a4Eya-00038W-Ry
 for linux-mtd@lists.infradead.org; Wed, 02 Dec 2015 21:30:22 +0000
Subject: Re: [PATCH] mtd: brcmnand: Workaround false ECC uncorrectable errors
To: Jonas Gorski <jogo@openwrt.org>, Brian Norris <computersforpeace@gmail.com>
References: <5659FF4A.7080203@simon.arlott.org.uk>
 <CAOiHx=nMZwQK9ESw9Ggqc6pHWqYQriB-t2eWq++pke8cXhvupw@mail.gmail.com>
 <565F51D2.4010204@simon.arlott.org.uk>
 <CAOiHx=mLmEW=gK_HE6oVqaFZjMUAWoP1PxZchc_mC_A5PJn-Cw@mail.gmail.com>
 <20151202205415.GQ64635@google.com>
 <CAOiHx=mAaU_nny5SmzAEmqBB=OTT_mqGcYhD7ZhjZWbG9wcKsw@mail.gmail.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>
From: Simon Arlott <simon@fire.lp0.eu>
Message-ID: <565F62C7.8010009@simon.arlott.org.uk>
Date: Wed, 2 Dec 2015 21:29:43 +0000
MIME-Version: 1.0
In-Reply-To: <CAOiHx=mAaU_nny5SmzAEmqBB=OTT_mqGcYhD7ZhjZWbG9wcKsw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 02/12/15 21:08, Jonas Gorski wrote:
> On Wed, Dec 2, 2015 at 9:54 PM, Brian Norris
> <computersforpeace@gmail.com> wrote:
>>
>> BTW, I think Kamal had code to handle protecting bitflips in erased
>> pages code in the Broadcom STB Linux BSP. Perhaps he can port that to
>> upstream with nand_check_erased_ecc_chunk()? IIUC, that would probably
>> handle your case too, Simon, although it wouldn't be optimal for an
>> all-0xff check (i.e., bitflip_threshold == 0).
>>
>> If that's really an issue (i.e., we have an implementation + data), I'm
>> sure we could add optimization to nand_check_erased_ecc_chunk() to
>> support the bitflip_threshold == 0 case.
> 
> Maybe I'm missing something, but wasn't the point of introducing
> nand_check_erased_ecc_chunk that bitflips in erased pages should be
> treated as bitflips corrected by the ecc, and therefore fixed up
> before passing the data further on? So having a theshold of 0 would be
> wrong / no protection at all, and could be quite destructive on MLC
> nand, where bitflips in erased pages are rather common.

Without this patch I can't access erased pages at all. I don't know if
the controller will still return an uncorrectable error if the page is
erased but has 1 or more bit flips.

-- 
Simon Arlott
