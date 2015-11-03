Received: from bh-25.webhostbox.net ([208.91.199.152])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZtPyP-0000zX-Bt
 for linux-mtd@lists.infradead.org; Tue, 03 Nov 2015 01:01:18 +0000
Subject: Re: [3/3] mtd: cfi_cmdset_{0001, 0002}: use common MTD reboot
 boilerplate
To: Brian Norris <computersforpeace@gmail.com>
References: <1417746968-28747-3-git-send-email-computersforpeace@gmail.com>
 <20151102200513.GA26475@roeck-us.net> <20151102215818.GD7274@google.com>
 <20151102221633.GA30556@roeck-us.net> <20151102232122.GG7274@google.com>
Cc: linux-mtd@lists.infradead.org, cdoban@broadcom.com, rjui@broadcom.com,
 sbranden@broadcom.com
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <56380745.7000407@roeck-us.net>
Date: Mon, 2 Nov 2015 17:00:53 -0800
MIME-Version: 1.0
In-Reply-To: <20151102232122.GG7274@google.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/02/2015 03:21 PM, Brian Norris wrote:
> On Mon, Nov 02, 2015 at 02:16:33PM -0800, Guenter Roeck wrote:
>> On Mon, Nov 02, 2015 at 01:58:18PM -0800, Brian Norris wrote:
>>> On Mon, Nov 02, 2015 at 12:05:13PM -0800, Guenter Roeck wrote:
>>>> On Thu, Dec 04, 2014 at 06:36:08PM -0800, Brian Norris wrote:
>>>>> We don't have to implement this glue code in the chip driver any more.
>>>>>
>>>>> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
>>>>> ---
>>>>> Not tested yet
>>>>>
>>>> Tested-by: Guenter Roeck <linux@roeck-us.net>
>>>
>>> Thanks! Did you verify that your reboot notifier callback (e.g.,
>>> cfi_intelext_reset()) is actually called on reboot?
>>>
>> No, I just verified that it boots and shuts down correctly.
>>
>> Do you want me to verify if the notifier is called, given the
>> problems you discovered with the patch ?
>
> Up to you. It'd be nice to know, but even with that info, we'd have more
> work to do before we can take this, since I'm pretty sure there are
> platforms out there where the notifier won't be called.
>

I added a WARN() into cfi_intelext_reset() and got:

WARNING: CPU: 0 PID: 504 at drivers/mtd/chips/cfi_cmdset_0001.c:2611 cfi_intelext_reset+0x44/0x130()
cfi_intelext_reset called

which we can take as hint that it was called.

> (And sorry, my emails can be a little evolutionary as they progress,
> when I start to type before I've finished investigating everything.)
>
> BTW, do you want to send out the patch for your suggestion in the other
> thread, or should I?
>
Please go ahead and do it. I can test it if you Cc: me on it.

Thanks,
Guenter
