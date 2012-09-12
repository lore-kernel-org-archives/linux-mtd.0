Received: from mail-pz0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TBqSs-0001AE-AW
 for linux-mtd@lists.infradead.org; Wed, 12 Sep 2012 17:11:03 +0000
Received: by dajq27 with SMTP id q27so1187986daj.36
 for <linux-mtd@lists.infradead.org>; Wed, 12 Sep 2012 10:10:59 -0700 (PDT)
Message-ID: <5050C21B.2030407@gmail.com>
Date: Wed, 12 Sep 2012 22:40:51 +0530
From: Vikram Narayanan <vikram186@gmail.com>
MIME-Version: 1.0
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH 3/9] mtd: gpmi: add a new field for HW_GPMI_TIMING1
References: <1347344231-10295-1-git-send-email-b32955@freescale.com>
 <1347344231-10295-4-git-send-email-b32955@freescale.com>
 <504F7C22.1050605@gmail.com> <504FF050.1070202@freescale.com>
In-Reply-To: <504FF050.1070202@freescale.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Huang Shijie,

<Dropped Cc's>

On 9/12/2012 7:45 AM, Huang Shijie wrote:
> 于 2012年09月12日 02:00, Vikram Narayanan 写道:
>> Hello Huang Shijie,
>>
>> On 9/11/2012 11:47 AM, Huang Shijie wrote:
>>> The gpmi_nfc_compute_hardware_timing{} should contains all the
>>> fields setting for gpmi timing registers. It already contains the fields
>>> for HW_GPMI_TIMING0 and HW_GPMI_CTRL1.
>>>
>>> So it is better to add a new field setting for HW_GPMI_TIMING1 in
>>> this data structure. This makes the code more clear in logic.
>>>
>>> This patch also changes some comments to make the code more readable.
>>>
>>> Signed-off-by: Huang Shijie<b32955@freescale.com>
>>> ---
>>> drivers/mtd/nand/gpmi-nand/gpmi-lib.c | 17 +++++++++--------
>>> drivers/mtd/nand/gpmi-nand/gpmi-nand.h | 9 +++++++++
>>> drivers/mtd/nand/gpmi-nand/gpmi-regs.h | 3 +++
>>> 3 files changed, 21 insertions(+), 8 deletions(-)
>>>
<snip>
>>> + /* [1] Set HW_GPMI_TIMING0 */
>>> reg = BF_GPMI_TIMING0_ADDRESS_SETUP(hw.address_setup_in_cycles) |
>>> BF_GPMI_TIMING0_DATA_HOLD(hw.data_hold_in_cycles) |
>>> BF_GPMI_TIMING0_DATA_SETUP(hw.data_setup_in_cycles) ;
>>>
>>> writel(reg, gpmi_regs + HW_GPMI_TIMING0);
>>>
>>> - /*
>>> - * DLL_ENABLE must be set to 0 when setting RDN_DELAY or HALF_PERIOD.
>>> - */
>>> + /* [2] Set HW_GPMI_TIMING1 */
>>> + writel(BF_GPMI_TIMING1_BUSY_TIMEOUT(hw.device_busy_timeout),
>>> + gpmi_regs + HW_GPMI_TIMING1);
>>> +
>>> + /* [3] The following code is to set the HW_GPMI_CTRL1. */
>>> +
>>> + /* DLL_ENABLE must be set to 0 when setting RDN_DELAY or
>>> HALF_PERIOD. */
>>> writel(BM_GPMI_CTRL1_DLL_ENABLE, gpmi_regs + HW_GPMI_CTRL1_CLR);
>>
>>
>> Are these [1], [2], [3] notation references to some other comments?
> no.
>
> These notations just help to comment the steps of setting timing registers.
> Are you confused at this?

Not much. But this is the notation usually used for references. you can 
keep this as it is. Not an issue.

Regards,
Vikram
