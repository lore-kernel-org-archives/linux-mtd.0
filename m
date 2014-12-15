Received: from mailapp01.imgtec.com ([195.59.15.196])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y0bTZ-000803-OL
 for linux-mtd@lists.infradead.org; Mon, 15 Dec 2014 19:38:38 +0000
Message-ID: <548F3834.3020504@imgtec.com>
Date: Mon, 15 Dec 2014 16:36:20 -0300
From: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
MIME-Version: 1.0
To: Daniel Ehrenberg <dehrenberg@google.com>
Subject: Re: [PATCH 6/6] mtd: spi-nand: Support common SPI NAND devices
References: <1417525136-25731-1-git-send-email-ezequiel.garcia@imgtec.com>	<1417525136-25731-7-git-send-email-ezequiel.garcia@imgtec.com>
 <CAAK6Zt0-BVoFa5+_B9HYCcEvtajTOpPPzdrm4RHO4PYgE2Y5LA@mail.gmail.com>
In-Reply-To: <CAAK6Zt0-BVoFa5+_B9HYCcEvtajTOpPPzdrm4RHO4PYgE2Y5LA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Cc: bpqw@micron.com, Ionela Voinescu <ionela.voinescu@imgtec.com>,
 frankliu@micron.com, Andrew Bresticker <abrestic@chromium.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 arnaud.mouiche@invoxia.com, Brian Norris <computersforpeace@gmail.com>,
 James Hartley <james.hartley@imgtec.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 12/12/2014 10:27 PM, Daniel Ehrenberg wrote:
> On Tue, Dec 2, 2014 at 4:58 AM, Ezequiel Garcia
> <ezequiel.garcia@imgtec.com> wrote:
[..]
>> +
>> +enum spi_nand_device_variant {
>> +       SPI_NAND_GENERIC,
>> +       SPI_NAND_MT29F,
>> +       SPI_NAND_GD5F,
>> +};
> 
> What is the purpose of including SPI_NAND_GENERIC? It looks like it
> doesn't work anyway.
> 

For the time being, I'm not sure we will require a device-specific compatible
string, or rather, auto-detect the device using the device ID.

So, this patch leaves the door opened for both options.

I've been talking to Brian on IRC, and auto-detecting the device seems like
the way to go. However, I wanted to have some feedback on the general approach
having the community approval, before moving forward in any direction.

Thanks for the feedback,
-- 
Ezequiel
