Received: from mail-ig0-x232.google.com ([2607:f8b0:4001:c05::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZQGIv-0006v6-1j
 for linux-mtd@lists.infradead.org; Fri, 14 Aug 2015 14:49:57 +0000
Received: by igfj19 with SMTP id j19so14077293igf.0
 for <linux-mtd@lists.infradead.org>; Fri, 14 Aug 2015 07:49:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1439505965-134748-4-git-send-email-computersforpeace@gmail.com>
References: <1439505965-134748-1-git-send-email-computersforpeace@gmail.com>
 <1439505965-134748-4-git-send-email-computersforpeace@gmail.com>
Date: Fri, 14 Aug 2015 16:49:35 +0200
Message-ID: <CAGhQ9Vz==CwRAR5V5woJfae45c0mKGb9vEceVMWMXNbzZtpgQg@mail.gmail.com>
Subject: Re: [RFT PATCH 3/4] mtd: spi-nor: add forward declaration for mtd_info
From: Joachim  Eastwood <manabian@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Marek Vasut <marex@denx.de>,
 Han Xu <han.xu@freescale.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 14 August 2015 at 00:46, Brian Norris <computersforpeace@gmail.com> wrote:
> This header can't actually stand alone, as it relies on the declaration
> (but not definition) of struct mtd_info. Let's fix that.
>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Not much to test here I guess, but it was a part of the patch set I
applied so FWIW:

Tested-by: Joachim Eastwood <manabian@gmail.com>

regards,
Joachim Eastwood
