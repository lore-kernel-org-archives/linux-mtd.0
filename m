Received: from avon.wwwdotorg.org ([2001:470:1f0f:bd7::2])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VBWiS-0001b4-PB
 for linux-mtd@lists.infradead.org; Mon, 19 Aug 2013 21:10:21 +0000
Message-ID: <521289A3.5040705@wwwdotorg.org>
Date: Mon, 19 Aug 2013 15:09:55 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
To: Alexander Shiyan <shc_work@mail.ru>
Subject: Re: [PATCH v4 1/4] mtd: nand: gpio: Add DT property to automatically
 determine bus width
References: <1376637583-12485-1-git-send-email-shc_work@mail.ru>
In-Reply-To: <1376637583-12485-1-git-send-email-shc_work@mail.ru>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Ian Campbell <ian.campbell@citrix.com>, Pawel Moll <pawel.moll@arm.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Rob Herring <rob.herring@calxeda.com>, linux-mtd@lists.infradead.org,
 Grant Likely <grant.likely@linaro.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/16/2013 01:19 AM, Alexander Shiyan wrote:
> This patch adds a property to automatically determine the NAND
> bus width. This property works if the bus width is not specified
> explicitly.

> diff --git a/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt

> +- gpio-control-nand,bank-width-auto : Device bus width is determined
> +  automatically if "bank-width" is omitted (Boolean).

How would a driver determine the bank width automatically; is there some
obvious way a driver should do this based on the/a NAND specification?
Is there more than one way this auto-detection could occur, and if so,
which of those methods is this property indicating will work?

I'd rather expect the property description include details of the
auto-detection mechanism that the DT states will work.
