Message-ID: <4DB6C13F.2020402@codeaurora.org>
Date: Tue, 26 Apr 2011 18:27:35 +0530
From: Murali Nalajala <mnalajal@codeaurora.org>
MIME-Version: 1.0
To: Matthieu CASTET <matthieu.castet@parrot.com>
Subject: Re: [PATCH V2 2/2] mtd: msm_nand: Add initial msm nand driver support.
References: <1302938249-4601-1-git-send-email-mnalajal@codeaurora.org>
	<4DABE8FE.5040300@parrot.com>
In-Reply-To: <4DABE8FE.5040300@parrot.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	Dima Zavin <dima@android.com>,
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Brian Swetland <swetland@google.com>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 4/18/2011 1:02 PM, Matthieu CASTET wrote:
> Hi,
>
> Murali Nalajala a écrit :
>> Add initial msm nand driver support for Qualcomm MSM platforms.
>> This driver is capable of handling both 2k and 4k page support
>> nand devices.
>>
>> This driver was originally developed by Arve Hjønnevåg at google.
>> Its source is available at
>> http://android.git.kernel.org/?p=kernel/msm.git under
>> android-msm-2.6.35 branch.
>>
>> CC: Dima Zavin<dima@android.com>
>> CC: Brian Swetland<swetland@google.com>
>> CC: Arve Hjønnevåg<arve@android.com>
>> Signed-off-by: Murali Nalajala<mnalajal@codeaurora.org>
>> ---
>> Changes in V2
>> * Turn most of the pr_info() calls into pr_debug().
>>
>>   drivers/mtd/devices/Kconfig    |   11 +
>>   drivers/mtd/devices/Makefile   |    1 +
>>   drivers/mtd/devices/msm_nand.c | 1597 ++++++++++++++++++++++++++++++++++++++++
>>   drivers/mtd/devices/msm_nand.h |   77 ++
>>   4 files changed, 1686 insertions(+), 0 deletions(-)
>>   create mode 100644 drivers/mtd/devices/msm_nand.c
>>   create mode 100644 drivers/mtd/devices/msm_nand.h
>>
>
> For the record, I am not sure it is a great idea to make nand drivers
> independent of the nand layer.
> By doing that you could change the expected behavior, and introduce bug
> difficult to debug.
>
> Why do you need that ? Nand drivers can override callbacks of nand framework.
>
> Maybe because the nand layer call the driver page per page, and  you want to
> work with more than one page. But in this case you can extend nand layer.
>
> Or does your controller don't allow sending raw command ?
> And in that case all the nand logic is in the nand controller ?

Our controller doesn't allow sending RAW commands to the flash. All 
these commands are abstracted by the controller logic. Please refer the 
msm_nand.h file where you will find the commands which are different 
from the actual NAND device commands.

eg: To send read/write data command to the device we configure the 
controller with page address & controller specific command. Then the 
controller itself takes care of generating the internal h/w signals 
required by the flash and it polls for the R/B signal & wait states are 
internally controlled by the h/w.

>
> Matthieu



Thanks,
Murali N

-- 
Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.
