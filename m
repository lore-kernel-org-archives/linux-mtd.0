Received: from mail-wi0-f182.google.com ([209.85.212.182])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XxzXX-0006lD-CX
 for linux-mtd@lists.infradead.org; Mon, 08 Dec 2014 14:43:56 +0000
Received: by mail-wi0-f182.google.com with SMTP id h11so4964891wiw.15
 for <linux-mtd@lists.infradead.org>; Mon, 08 Dec 2014 06:43:32 -0800 (PST)
Date: Mon, 8 Dec 2014 14:43:28 +0000
From: Peter Griffin <peter.griffin@linaro.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [STLinux Kernel] [PATCH v2 RESEND 10/11] mtd: st_spi_fsm:
 Provide mask to obtain correct boot device pins
Message-ID: <20141208144328.GA1104@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1417688512-7644-1-git-send-email-lee.jones@linaro.org>
 <1417688512-7644-11-git-send-email-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1417688512-7644-11-git-send-email-lee.jones@linaro.org>
Cc: Christophe Kerello <christophe.kerello@st.com>, kernel@stlinux.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Lee,

On Thu, 04 Dec 2014, Lee Jones wrote:

> From: Christophe Kerello <christophe.kerello@st.com>
> 
> This patch adds a mask to be able to get the right boot device selection.

Have you seen this series I posted https://lkml.org/lkml/2014/11/19/71?

It is trying to consolodate the way the various STI drivers are handling syscfg
registers in the upstream kernel. Now this series came about mainly due to the mixing of address
spaces in the reg property, but the overall aim was to get all STI drivers handling
syscfg registers in a uniform way.

Sadly it seems this driver uses another approach for syscfg handling with extra
DT properties encoding the offset and mask.

IMHO I don't think it makes sense to add more DT properties for doing this. We should consider
migrating this over to using the interface provided in the series above, and for the mask I
would suggest implementing it in a similar way to the code in drivers/phy/phy-stih41x-usb.c 
which solves much the same problem by statically encoding the information in the driver
and making a decision based on the compatible flag.

regards,

Peter.
