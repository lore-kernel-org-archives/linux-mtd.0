Message-ID: <4FB49C60.5030002@atmel.com>
Date: Thu, 17 May 2012 14:36:16 +0800
From: Josh Wu <josh.wu@atmel.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH v7 3/3] MTD: atmel_nand: Update driver to support
 Programmable Multibit ECC controller
References: <1337093256-19117-1-git-send-email-josh.wu@atmel.com>
 <1337093256-19117-4-git-send-email-josh.wu@atmel.com>
 <1337160353.24809.26.camel@sauron.fi.intel.com>
 <20403.29677.517067.528042@ipc1.ka-ro>
 <1337161217.24809.38.camel@sauron.fi.intel.com>
In-Reply-To: <1337161217.24809.38.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: hongxu.cn@gmail.com, nicolas.ferre@atmel.com, linux-mtd@lists.infradead.org,
 ivan.djelic@parrot.com, plagnioj@jcrosoft.com,
 linux-arm-kernel@lists.infradead.org,
 =?UTF-8?B?TG90aGFyIFdhw59tYW5u?= <LW@KARO-electronics.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, Artem

On 5/16/2012 5:40 PM, Artem Bityutskiy wrote:
> On Wed, 2012-05-16 at 11:31 +0200, Lothar Waßmann wrote:
>>>> +		dev_warn(host->dev, "Only 2048 page size is currently " \
>>>> +			"supported for PMECC, rolling back to Software ECC\n");
>>> Why do you use backslashes?
>>>
>> message text should not be split across lines anyway to ease grepping
>> for the message.
> I think the consensus is that it is personal decision of the author. I
> am not trying to enforce this and I also split messages. In this case I
> was only wondering why that backslash is used? I never saw this before
> in the linux kernel.
>

oh, I add the backslash only because if without it, there should be a 
warning about message is splitting into two lines.

Now I think I will just keep the text message in one line. That will 
avoid any warnings. thanks.

Best Regards,
Josh Wu
