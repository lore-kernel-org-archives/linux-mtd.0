Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZYwlq-0002Hf-PN
 for linux-mtd@lists.infradead.org; Mon, 07 Sep 2015 13:47:43 +0000
Received: by pacfv12 with SMTP id fv12so100091742pac.2
 for <linux-mtd@lists.infradead.org>; Mon, 07 Sep 2015 06:47:19 -0700 (PDT)
From: Bhuvanchandra <bhuvanchandradv@gmail.com>
Subject: Re: UBIFS errors when file-system is full
To: Stefan Agner <stefan@agner.ch>, Brian Norris <computersforpeace@gmail.com>
References: <55AF4447.50500@nod.at> <55B24F2F.9020705@gmail.com>
 <55B26D24.3060006@nod.at> <55BBA6A5.9020701@gmail.com>
 <55BC68D6.2070008@nod.at> <55C3379E.50000@gmail.com>
 <55C4A695.7060608@nod.at> <e3d338cfd875b941061d5ac3da9f29c0@agner.ch>
 <55CAF568.5090704@nod.at> <812d355821f585decf92a66628caef7b@agner.ch>
 <20150901014315.GF81844@google.com>
 <f3a5ff1f82ee358541125b920460c17a@agner.ch>
Cc: Richard Weinberger <richard@nod.at>,
 Bhuvanchandra DV <bhuvanchandradv@gmail.com>, linux-mtd@lists.infradead.org,
 bhuvanchandra.dv@gmail.com
Message-ID: <55ED9565.30907@gmail.com>
Date: Mon, 7 Sep 2015 19:17:17 +0530
MIME-Version: 1.0
In-Reply-To: <f3a5ff1f82ee358541125b920460c17a@agner.ch>
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

On 09/03/2015 01:28 AM, Stefan Agner wrote:

> On 2015-08-31 18:43, Brian Norris wrote:
>> Why do you actually need to check the idle bit? If you need to read it
>> to clear out some FIFO, then that's fine -- just read it, but don't use
>> it as a second condition. The complete()/wait_for_completion()
>> synchronization should be sufficient on its own. (If not, then I think
>> you have other problems.)
>>
>> The NFC_IRQ_STATUS-based condition looks like it could lead to races
>> because your interrupt may fire between setting and checking
>> the idle bit. So the IRQ handler will increment the completion struct
>> (cmd_done), but you *won't* be doing the corresponding decrement via
>> wait_for_completion(). If you don't do that... then the subsequent
>> wait_for_completion() will immediately succeed.
> Tested over night and did some additional tests today, I did not see any
> issues for more than 2000 boots, so this really seems to fix the issue!
> Thanks Brian, will send out v12 soon.

The io_paral ubi-test also now passed with these fixes.
Thanks!

Best regards,
Bhuvan

>
> --
> Stefan
