Received: from mailapp01.imgtec.com ([195.59.15.196])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aHWBy-00049r-B5
 for linux-mtd@lists.infradead.org; Fri, 08 Jan 2016 12:30:55 +0000
Subject: Re: [PATCH] mtd: jz4780_nand: replace if/else blocks with switch/case
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Brian Norris
 <computersforpeace@gmail.com>
References: <1452189188-139318-1-git-send-email-computersforpeace@gmail.com>
 <20160108132836.79fb4a81@bbrezillon>
CC: <linux-mtd@lists.infradead.org>, Alex Smith <alex@alex-smith.me.uk>
From: Harvey Hunt <harvey.hunt@imgtec.com>
Message-ID: <568FABE8.8070604@imgtec.com>
Date: Fri, 8 Jan 2016 12:30:32 +0000
MIME-Version: 1.0
In-Reply-To: <20160108132836.79fb4a81@bbrezillon>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On 08/01/16 12:28, Boris Brezillon wrote:
> On Thu,  7 Jan 2016 09:53:08 -0800
> Brian Norris <computersforpeace@gmail.com> wrote:
>
>> Using switch/case helps make this logic more clear and more robust. With
>> this structure:
>>
>>   * it's clear that this driver only support ECC_{HW,SOFT,SOFT_BCH}; and
>>
>>   * we can sanely handle new ECC unsupported modes (right now, this code
>>     makes incorrect assumptions about the possible values in the
>>     nand_ecc_modes_t enum; e.g., what happens with NAND_ECC_HW_OOB_FIRST?)
>>
>> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
>> Cc: Alex Smith <alex@alex-smith.me.uk>
>> Cc: Harvey Hunt <harvey.hunt@imgtec.com>
>
> LGTM
>
> Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>
>

If it helps, I can add my Tested-By later today?

Harvey
