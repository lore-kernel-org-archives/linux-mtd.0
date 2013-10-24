Received: from mail-db8lp0189.outbound.messaging.microsoft.com
 ([213.199.154.189] helo=db8outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZHfO-0003kg-7U
 for linux-mtd@lists.infradead.org; Thu, 24 Oct 2013 09:57:22 +0000
Message-ID: <5268EEDB.8000406@freescale.com>
Date: Thu, 24 Oct 2013 15:26:43 +0530
From: Prabhakar Kushwaha <prabhakar@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] driver/mtd/IFC: Add support of 8K page size NAND flash
References: <1380021083-15986-1-git-send-email-prabhakar@freescale.com>
 <20131023164332.GU23337@ld-irv-0074.broadcom.com>
In-Reply-To: <20131023164332.GU23337@ld-irv-0074.broadcom.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: scottwood@freescale.com, linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/23/2013 10:13 PM, Brian Norris wrote:
> On Tue, Sep 24, 2013 at 04:41:23PM +0530, Prabhakar Kushwaha wrote:
>> Current IFC driver supports till 4K page size NAND flash.
>> Add support of 8K Page size NAND flash
>>    - Add nand_ecclayout for 4 bit & 8 bit ecc
>>    - Defines constants
>>    - also fix ecc.strength for 8bit ecc of 8K page size NAND
>>
>> Signed-off-by: Prabhakar Kushwaha <prabhakar@freescale.com>
> These ECC layouts are rather horrendous and large, but they're the best
> we've got...
>
> Pushed to l2-mtd.git with compile testing only. Let me know if there are
> any Tested-by's (or NAK's).
>
>
Thanks Brian for applying this patch to l2-mtd.git.
I only tested this patch.

This same patch has been pushed for review on u-boot mailing list. Till 
now no comments.
means no NAK's :)

Regards,
Prabhakar
