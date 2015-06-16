Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z4rPX-00011y-6f
 for linux-mtd@lists.infradead.org; Tue, 16 Jun 2015 14:00:20 +0000
Message-ID: <55802A44.6040708@nod.at>
Date: Tue, 16 Jun 2015 15:53:08 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp>
Subject: Re: [PATCH v2] mtd: nand: support for Toshiba BENAND (Built-in ECC
 NAND)
References: <1434038402-26365-1-git-send-email-yoshitake.kobayashi@toshiba.co.jp>
 <CAFLxGvzSosfd50=UUcSRgjiVw=48FP8hgxb9bhL9UDGHTBz9yw@mail.gmail.com>
 <558025B7.3030103@toshiba.co.jp>
In-Reply-To: <558025B7.3030103@toshiba.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 16.06.2015 um 15:33 schrieb KOBAYASHI Yoshitake:
>>> +       /* correctable */
>>> +       else if (status & NAND_STATUS_RECOM_REWRT) {
>>> +               pr_info("BENAND : Recommended to rewrite!\n");
>>> +               bitflips = chip->ecc.strength;
>>
>> In your case this might be okay, as you set strength to 1.
>> Otherweise you'd have to report the real number of bitflips.
> 
> I also thought it is okay in this case.
> BENAND return corrected data to Host NAND Controller till uncorrectable status.
> The current patch uses this Read Status command 70h to abstract BENAND Multi
> bit ECC and Need to Rewrite judgement so BENAND would look like 1bit ECC device.

The layers above MTD need to know how many bits got repaired.
It seems like BENAND suffers from the same shortcomings than On-Die-ECC. ;-\
Please see my patches how to deal with that. Maybe you can find a better solution.

Thanks,
//richard
