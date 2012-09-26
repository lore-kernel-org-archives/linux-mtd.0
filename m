Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TGjVH-0004qo-4E
 for linux-mtd@lists.infradead.org; Wed, 26 Sep 2012 04:45:43 +0000
Message-ID: <50628861.7050206@freescale.com>
Date: Wed, 26 Sep 2012 10:15:21 +0530
From: Prabhakar Kushwaha <prabhakar@freescale.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH] driver/mtd:IFC NAND:Initialise internal SRAM before any
 write
References: <1347526489-20186-1-git-send-email-prabhakar@freescale.com>
 <68738277-B1F2-4455-B8FD-67F2DD9E1310@kernel.crashing.org>
In-Reply-To: <68738277-B1F2-4455-B8FD-67F2DD9E1310@kernel.crashing.org>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: scottwood@freescale.com, linuxppc-dev@lists.ozlabs.org,
 linux-mtd@lists.infradead.org, Kumar Gala <galak@kernel.crashing.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09/13/2012 06:23 PM, Kumar Gala wrote:
> On Sep 13, 2012, at 3:54 AM, Prabhakar Kushwaha wrote:
>
>> IFC-1.1.0 uses 28nm techenology for SRAM. This tech has known limitaion for
>> SRAM i.e. "byte select" is not supported. Hence Read Modify Write is
>> implemented in IFC for any "system side write" into sram buffer. Reading an
>> uninitialized memory results in ECC Error from sram wrapper.
>>
>> Hence we must initialize/prefill SRAM buffer by any data before writing
>> anything in SRAM from system side. To initialize SRAM user can use "READID"
>> NAND command with read bytes equal to SRAM size. It will be a one time
>> activity post boot.
>>
>> Signed-off-by: Prabhakar Kushwaha <prabhakar@freescale.com>
>> ---
>> Based upon git://git.infradead.org/linux-mtd.git branch master
>> The compilation of this patch depends upon following patch.
>> http://patchwork.ozlabs.org/patch/177893/
>> This patch is currently applied on git://git.kernel.org/pub/scm/linux/kernel/git/galak/powerpc.git
>> branch next and status is "Awaiting Upstream"
>>
>>
>> drivers/mtd/nand/fsl_ifc_nand.c |   56 ++++++++++++++++++++++++++++++++++++++-
>> 1 file changed, 55 insertions(+), 1 deletion(-)
> If MTD maintainers ack, I'm happy to pull this in via PPC tree.

Hi  Artem,

Can you please ACK this patch so that it can be pulled via PPC tree.

Regards,
Prabhakar
