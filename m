Received: from mail-gw2-out.broadcom.com ([216.31.210.63])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YXe7S-0001vc-Hf
 for linux-mtd@lists.infradead.org; Mon, 16 Mar 2015 23:08:22 +0000
Message-ID: <55076247.4070104@broadcom.com>
Date: Mon, 16 Mar 2015 16:07:51 -0700
From: Scott Branden <sbranden@broadcom.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 2/3] Documentation: devicetree: add binding doc for
 Broadcom NAND controller
References: <1425691129-1150-1-git-send-email-computersforpeace@gmail.com>
 <1425691129-1150-3-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1425691129-1150-3-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Kevin Cernekee <cernekee@gmail.com>, Corneliu Doban <cdoban@broadcom.com>,
 Ray Jui <rjui@broadcom.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 linux-kernel@vger.kernel.org, Jonathan Richardson <jonathar@broadcom.com>,
 Anatol Pomazao <anatol@google.com>, bcm-kernel-feedback-list@broadcom.com,
 Dmitry Torokhov <dtor@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,


On 15-03-06 05:18 PM, Brian Norris wrote:
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
>   .../devicetree/bindings/mtd/brcmstb_nand.txt       | 109 +++++++++++++++++++++
>   1 file changed, 109 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/mtd/brcmstb_nand.txt
>
> diff --git a/Documentation/devicetree/bindings/mtd/brcmstb_nand.txt b/Documentation/devicetree/bindings/mtd/brcmstb_nand.txt
> new file mode 100644
> index 000000000000..933d44943cbb
> --- /dev/null

Could you change the binding document with the vendor prefix to match 
all the other drivers we have been submitting? ie. "brcm,brcmnand.txt"

Regards,
  Scott
