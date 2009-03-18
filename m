Received: from mail-out.m-online.net ([212.18.0.10])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LjqOs-00086U-Lz
	for linux-mtd@lists.infradead.org; Wed, 18 Mar 2009 07:41:24 +0000
Message-ID: <49C0A59D.3040105@grandegger.com>
Date: Wed, 18 Mar 2009 08:41:17 +0100
From: Wolfgang Grandegger <wg@grandegger.com>
MIME-Version: 1.0
To: avorontsov@ru.mvista.com
Subject: Re: [PATCH 1/4] NAND: FSL-UPM: add multi chip support
References: <1237281143-8768-1-git-send-email-wg@grandegger.com>
	<1237281143-8768-2-git-send-email-wg@grandegger.com>
	<20090317192735.GC4287@oksana.dev.rtsoft.ru>
In-Reply-To: <20090317192735.GC4287@oksana.dev.rtsoft.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Anton Vorontsov wrote:
> On Tue, Mar 17, 2009 at 10:12:19AM +0100, Wolfgang Grandegegr wrote:
>> From: Wolfgang Grandegger <wg@grandegger.com>
>>
>> This patch adds support for multi-chip NAND devices to the FSL-UPM
>> driver. This requires support for multiple GPIOs for the RNB pins.
>>
>> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
>> ---
>>  drivers/mtd/nand/fsl_upm.c |   90 +++++++++++++++++++++++++++++++++----------
>>  1 files changed, 69 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/fsl_upm.c b/drivers/mtd/nand/fsl_upm.c
>> index 7815a40..ca7e85a 100644
>> --- a/drivers/mtd/nand/fsl_upm.c
>> +++ b/drivers/mtd/nand/fsl_upm.c
>> @@ -23,6 +23,8 @@
>>  #include <linux/io.h>
>>  #include <asm/fsl_lbc.h>
>>  
>> +#define FSL_UPM_NAND_MAX_CHIPS 4
> 
> Is there any reason to hardcode max chips? Some obscure limit in the
> UPMs maybe?

Not really. It's limited by NAND_MAX_CHIP. See
http://lxr.linux.no/linux+v2.6.28.8/include/linux/mtd/nand.h#L40

> Otherwise we'd better allocate the rnb_gpios dynamically, depending
> on the num-chips property.

Could be done.

Wolfgang.
