Message-ID: <4F3E14BD.10705@freebox.fr>
Date: Fri, 17 Feb 2012 09:50:05 +0100
From: Florian Fainelli <ffainelli@freebox.fr>
MIME-Version: 1.0
To: Huang Shijie <shijie8@gmail.com>
Subject: Re: [PATCH] mtd: fix the wrong check condition
References: <1329302008-10228-1-git-send-email-b32955@freescale.com>
 <4F3C712A.5060406@gmail.com> <4F3C7433.5030306@freescale.com>
 <4F3CE2D4.4070506@freebox.fr>
 <CAMiH66GRD97y4mK-9TCRqsQkTOoqqwVp4gREv3=0qiX_vrueGA@mail.gmail.com>
In-Reply-To: <CAMiH66GRD97y4mK-9TCRqsQkTOoqqwVp4gREv3=0qiX_vrueGA@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Huang Shijie <b32955@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Matthieu Castet <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 02/17/12 04:07, Huang Shijie a écrit :
> hi,
>
> On Thu, Feb 16, 2012 at 7:04 PM, Florian Fainelli<ffainelli@freebox.fr>  wrote:
>> Hi,
>>
>> On 02/16/12 04:12, Huang Shijie wrote:
>>> Hi,
>>>> (Add Florian and Matthieu)
>>>>
>>>> On 2/15/2012 2:33 AM, Huang Shijie wrote:
>>>>> If we use `||` check condition, many NAND chips which are not
>>>>> ONFI nands have to do the ONFI detection.
>>>>
>>>> Running the ONFI detection on non-ONFI NAND should not, ideally, be a
>>>> problem. They should fail one or both tests included in the routine:
>>>> the 'O N F I' string check or the CRC calculation.
>>> NO.
>>
>> Can you please post the dump of the ONFI page as read by your controller? Is
>> the CRC check passing? The ONFI crc function is made so that a page full of
>> zeroes or 0xff won't generate a respectively 0 or ff checksum, so we should
>> catch this during the CRC check.
>>
> Sorry. I did not check the log carefully.
>
> the Hynix nand does _not_ pass the CRC check, but it passed the "ONFI"
> string check.

This is exactly what I saw too with a different Hynix chip, it replied 
ONFI, but the CRC check failed.

>
> The log "ONFI flash detected" made me misunderstood.

Yes I agree, the log is there too soon, thanks for your patch.

Thanks.

>
> BR
> Huang Shijie
>
>
>>> I have Hynix nand in my hand: H27UBG8T2A (page size :8192, oob:448).
>>> It is not an ONFI nand. See the datasheet in the attachment.
>>> But it accidentally can pass the ONFI detection, and get the result :
>>> page size 4192, oob:96. This is a wrong result.
>>
>> I have already seen a Hynix chip answering to the READID command too, and
>> this was highly confusing our bootloader, however, I suppose that we should
>> be able to circumvent this issue anyway.
>>
>>>
>>>
>>>
>>>>> Use `&&` here to detect the ONFI NAND when we can not find any type
>>>>> in the nand_flash_ids.
>>>>
>>>> There are many chips whose ID might be in the NAND table but for which
>>>> it is preferable (or even required) to check by ONFI for one reason or
>>>> another. For instance, some ONFI chips might use odd-sized OOB that
>>>> isn't in the ID decoding algorithm.
>>>>
>>> This nand is 32Gb, but we can not parse it out from the id.
>>> I ever want to add a new database which use the all the 8/6 bytes id as
>>> key.
>>> It seems it's time to change it now.
>>
>> You have said that already, but we have yet to see patches for this, I guess
>> if you can post your database patch that will be easier to comment on.
>> --
>> Florian
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
