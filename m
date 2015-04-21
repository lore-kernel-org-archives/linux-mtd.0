Received: from mail-vn0-x231.google.com ([2607:f8b0:400c:c0f::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YkXL8-0008Lb-GK
 for linux-mtd@lists.infradead.org; Tue, 21 Apr 2015 12:31:47 +0000
Received: by vnbf62 with SMTP id f62so32814935vnb.3
 for <linux-mtd@lists.infradead.org>; Tue, 21 Apr 2015 05:31:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1427292151-3835-1-git-send-email-richard@nod.at>
References: <1427292151-3835-1-git-send-email-richard@nod.at>
Date: Tue, 21 Apr 2015 14:31:23 +0200
Message-ID: <CAFLxGvyu1qfHwOTrzJB-as9TuL3k01oBDFuSt3w_pK1M34Spqg@mail.gmail.com>
Subject: Re: [RFC] On-die ECC support
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset=UTF-8
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brian,

On Wed, Mar 25, 2015 at 3:02 PM, Richard Weinberger <richard@nod.at> wrote:
> Some Micron NAND chips offer an on-die ECC (AKA internal ECC) feature,
> in this mode all ECC is automatically performed by the NAND chips itself.
> Most user are happy with software ECC or hardware ECC performed by the
> NFC (NAND flash controller).
> But there are situations where multi-bit hardware ECC is not available,
> some AT91 based SoCs for example, and due to CPU limitations
> software ECC is not feasible. In such situations on-die ECC can help.
> People are using that feature in the wild for years.
> As this feature is not supported in mainline these guys are using out-of-tree
> patches of doubtful quality. That's why I did that patch series.
>
> This series is based on patches by David Mosberger and in-house patches
> by a customer.
>
> Currently I'm not happy with patch 2/3.
> To allow raw access (access without ECC) we have to disable/enable
> on-die ECC mode in various NAND core functions.
> I could also think of dropping support for raw access completely.
>
> I'd like to thank Ammonit Measurement GmbH for making this contribution to the MTD community happen!
>
> [PATCH 1/3] mtd: nand: Add on-die ECC support
> [PATCH 2/3] mtd: nand: Add support for raw access when using on-die
> [PATCH 3/3] mtd: nand: Wire up on-die ECC support

As the merge window is almost over I fear this patches won't make it into v4.1.
Do you want me to resent them for the v4.2 cycle or are they already
on your TODO list? :)

-- 
Thanks,
//richard
