Received: from mail-gw2-out.broadcom.com ([216.31.210.63])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZvuMK-00044W-AP
 for linux-mtd@lists.infradead.org; Mon, 09 Nov 2015 21:52:17 +0000
Subject: Re: Hang on reboot in nand_get_device()
To: Brian Norris <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>
References: <55958F4C.1020002@isoar.ca> <20151106180052.GE12143@google.com>
 <20151106195903.0d55d819@bbrezillon> <20151109194651.GI12143@google.com>
 <20151109215508.7b14f5f3@bbrezillon> <20151109223613.1e83b256@bbrezillon>
 <20151109214456.GJ12143@google.com>
CC: "Andrew E. Mileski" <andrewm@isoar.ca>, linux-mtd
 <linux-mtd@lists.infradead.org>
From: Scott Branden <sbranden@broadcom.com>
Message-ID: <56411579.6040507@broadcom.com>
Date: Mon, 9 Nov 2015 13:51:53 -0800
MIME-Version: 1.0
In-Reply-To: <20151109214456.GJ12143@google.com>
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

Hi Brian,

I'm confused as to what the outcome is here and what the final patch is. 
  Will this affect the previous fixes we made such that shutdown is 
called on reboot so that MTD operations to the controller are not in 
progress on reboot?

Thanks,
  Scott

On 15-11-09 01:44 PM, Brian Norris wrote:
> On Mon, Nov 09, 2015 at 10:36:13PM +0100, Boris Brezillon wrote:
>> Just want to add that this discussion shouldn't prevent your fix from
>> being applied. The main reason I'm arguing here is because I want to
>> understand the rationale behind the current handling of FL_PM_SUSPENDED
>> and FL_SHUTDOWN.
>
> Sure, that's reasonable. I'd also like to touch this code only once (or
> very close to that) in the near future, so it's best if we get to a good
> understanding.
>
> I'll send this as a proper patch, if that sounds OK:
>
> http://patchwork.ozlabs.org/patch/541065/
>
>> On Mon, 9 Nov 2015 21:55:08 +0100
>> Boris Brezillon <boris.brezillon@free-electrons.com> wrote:
>>
>>>>>
>>>>> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
>>>>> index ceb68ca..812b8b1 100644
>>>>> --- a/drivers/mtd/nand/nand_base.c
>>>>> +++ b/drivers/mtd/nand/nand_base.c
>>>>> @@ -830,6 +830,20 @@ nand_get_device(struct mtd_info *mtd, int new_state)
>>>>>   retry:
>>>>>          spin_lock(lock);
>>>>>
>>>>> +       /* putting the NAND chip in shutdown state should always succeed. */
>>>>> +       if (new_state == FL_SHUTDOWN) {
>>>>> +               /*
>>>>> +                * release the controller if the chip put in shutdown state
>>>>> +                * is the current active device.
>>>>> +                */
>>>>> +               if (chip->controller->active == chip)
>>>>> +                       chip->controller->active = NULL;
>>>>> +
>>>>> +               chip->state = new_state;
>>>>> +               spin_unlock(lock);
>>>>> +               return 0;
>>>>> +       }
>>>>> +
>>>>>          /* Hardware controller shared among independent devices */
>>>>>          if (!chip->controller->active)
>>>>>                  chip->controller->active = chip;
>>>>>
>>>>
>>>> This looks a lot more subtle and potentially wrong. What exactly is the
>>>> rationale here? It appears you're kind of unlocking the controller (any
>>>> other flash on the same controller can still go ahead) but at the same
>>>> time forcing no further users of this particular flash.
>>
>> It's even worst: I'm not waiting for the chip to become ready, so I'm
>> potentially re-introducing the bug Scott was trying to solve with his
>> reboot notifier.
>
> Ah, I see! Good catch. My distaste for duplication pays off, then :)
>
> Brian
>
