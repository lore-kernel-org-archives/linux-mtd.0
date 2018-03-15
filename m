Received: from mail-it0-x241.google.com ([2607:f8b0:4001:c0b::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ewMao-0005qp-Iu
 for linux-mtd@lists.infradead.org; Thu, 15 Mar 2018 06:42:27 +0000
Received: by mail-it0-x241.google.com with SMTP id w3-v6so7683724itc.4
 for <linux-mtd@lists.infradead.org>; Wed, 14 Mar 2018 23:42:15 -0700 (PDT)
Subject: Re: [PATCH 2/2] mtd: ubi: use put_device() if device_register fail
To: Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@bootlin.com>
References: <cover.1520592440.git.arvind.yadav.cs@gmail.com>
 <5d9b08afdad2fbc65bac48d8ae22f4925bb80512.1520592440.git.arvind.yadav.cs@gmail.com>
 <20180314195652.59b21594@bbrezillon> <3619597.KITkZyk1Wv@blindfold>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr, dedekind1@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
From: Arvind Yadav <arvind.yadav.cs@gmail.com>
Message-ID: <728eddc9-210f-94ae-eca0-d9bbc6bbf55c@gmail.com>
Date: Thu, 15 Mar 2018 12:11:19 +0530
MIME-Version: 1.0
In-Reply-To: <3619597.KITkZyk1Wv@blindfold>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On Thursday 15 March 2018 12:55 AM, Richard Weinberger wrote:
> Am Mittwoch, 14. März 2018, 19:56:52 CET schrieb Boris Brezillon:
>> On Fri,  9 Mar 2018 16:20:49 +0530
>>
>> Arvind Yadav <arvind.yadav.cs@gmail.com> wrote:
>>> if device_register() returned an error! Always use put_device()
>>> to give up the reference initialized.
>>>
>>> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
>>> ---
>>>
>>>   drivers/mtd/ubi/vmt.c | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/mtd/ubi/vmt.c b/drivers/mtd/ubi/vmt.c
>>> index 3fd8d7f..db85b68 100644
>>> --- a/drivers/mtd/ubi/vmt.c
>>> +++ b/drivers/mtd/ubi/vmt.c
>>> @@ -609,6 +609,7 @@ int ubi_add_volume(struct ubi_device *ubi, struct
>>> ubi_volume *vol)>
>>>   	return err;
>>>   
>>>   out_cdev:
>>> +	put_device(&vol->dev);
>>>
>>>   	cdev_del(&vol->cdev);
>> use-after-free bug here: put_device() has freed the vol obj, and you're
>> dereferencing the pointer just after that.
Thanks Boris, to point out this error.
> eeek, thanks for looking at more context.
> Arvind, while you are right that put_device() is missing, please double check
> that freeing the devices is also correct.
>
> Thanks,
> //richard
Sorry for that. I will take care of this.

~arvind
