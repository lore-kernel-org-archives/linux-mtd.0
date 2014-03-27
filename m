Received: from smtprelay.synopsys.com ([198.182.44.111])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WTCDR-0000eG-5Z
 for linux-mtd@lists.infradead.org; Thu, 27 Mar 2014 15:27:38 +0000
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] axs_nand - add driver for NAND controller used on
 Synopsys AXS dev boards
Date: Thu, 27 Mar 2014 15:27:04 +0000
Message-ID: <1395934023.3511.1.camel@abrodkin-8560l.internal.synopsys.com>
References: <1394626349-16024-1-git-send-email-abrodkin@synopsys.com>
In-Reply-To: <1394626349-16024-1-git-send-email-abrodkin@synopsys.com>
Content-Language: en-US
Content-Type: text/plain; charset="koi8-r"
Content-ID: <1CFA6DDAFF3CB74B8CBFE99EE64EEDB8@internal.synopsys.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Francois Bedard <Francois.Bedard@synopsys.com>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "grant.likely@linaro.org" <grant.likely@linaro.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2014-03-12 at 16:12 +0400, Alexey Brodkin wrote:
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
>=20
> Cc: Vineet Gupta <vgupta@synopsys.com>
> ---
>  Documentation/devicetree/bindings/mtd/axs-nand.txt |  17 +
>  drivers/mtd/nand/Kconfig                           |   6 +
>  drivers/mtd/nand/Makefile                          |   1 +
>  drivers/mtd/nand/axs_nand.c                        | 412 +++++++++++++++=
++++++
>  4 files changed, 436 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/axs-nand.txt
>  create mode 100644 drivers/mtd/nand/axs_nand.c

Any chance to this patch reviewed, commented, accepted?

Regards,
Alexey
