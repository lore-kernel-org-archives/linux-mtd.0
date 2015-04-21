Received: from kiutl.biot.com ([31.172.244.210])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YkZWO-0005AB-9t
 for linux-mtd@lists.infradead.org; Tue, 21 Apr 2015 14:51:32 +0000
Received: from spamd by kiutl.biot.com with sa-checked (Exim 4.83)
 (envelope-from <bert@biot.com>) id 1YkZW1-0000qy-PG
 for linux-mtd@lists.infradead.org; Tue, 21 Apr 2015 16:51:10 +0200
Message-ID: <553663CD.5040705@biot.com>
Date: Tue, 21 Apr 2015 16:50:53 +0200
From: Bert Vermeulen <bert@biot.com>
MIME-Version: 1.0
To: dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nand: Add NAND driver for Mikrotik RB4xx series boards
References: <1429624974-10335-1-git-send-email-bert@biot.com>
In-Reply-To: <1429624974-10335-1-git-send-email-bert@biot.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 21/04/15 16:02, Bert Vermeulen wrote:
> The NAND chip containing the root filesystem is behind an SPI-connected
> CPLD. This driver uses the spi-rb4xx driver to communicate with the CPLD.
>
> The CPLD also acts as a GPIO expander: the ALE/CLE/NCE pins are set via
> CPLD commands. Some LEDs on the board are also accessed this way.

The spi-rb4xx driver can be found here:
https://git.kernel.org/cgit/linux/kernel/git/broonie/spi.git/log/?h=topic/rb4xx

I was a bit quick to pull the trigger on this one: I have some cleanup 
on the Kconfig and headers. I'll wait a couple of days to submit those, 
in case anyone has comments on the code.


-- 
Bert Vermeulen
bert@biot.com
