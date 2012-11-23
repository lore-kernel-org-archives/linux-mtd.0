Received: from mail-ie0-f177.google.com ([209.85.223.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TbpGS-0005vR-HI
 for linux-mtd@lists.infradead.org; Fri, 23 Nov 2012 09:09:40 +0000
Received: by mail-ie0-f177.google.com with SMTP id k13so1143436iea.36
 for <linux-mtd@lists.infradead.org>; Fri, 23 Nov 2012 01:09:34 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CALF0-+VY17Gud1p0EFkXFP1YG+AEbjmXLbgjGSFrjd61paJZ5A@mail.gmail.com>
References: <CAMjNe_cJG6wkiPDvVZzqURz4gVTW8Dx4JrM-KPVbVedLwsDfcw@mail.gmail.com>
 <CALF0-+WioO2vhKWA7ZofktKnfcKCcKTsqdEVpwA2BjQzqCSE9Q@mail.gmail.com>
 <CAMjNe_ce5Ra7C=yNiSPaq36e1B1qbcvp53Rnc11YS0qoZ9sc1g@mail.gmail.com>
 <CALF0-+VY17Gud1p0EFkXFP1YG+AEbjmXLbgjGSFrjd61paJZ5A@mail.gmail.com>
Date: Fri, 23 Nov 2012 14:39:34 +0530
Message-ID: <CAMjNe_cPnj4gj6TisGt4=OppEnHyBrDMCC31WcczzrpzFppoeg@mail.gmail.com>
Subject: Re: [RFC] LFTL: a FTL for large parallel IO flash cards
From: srimugunthan dhandapani <srimugunthan.dhandapani@gmail.com>
To: Ezequiel Garcia <elezegarcia@gmail.com>, jevinsweval@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Nov 17, 2012 at 6:41 PM, Ezequiel Garcia <elezegarcia@gmail.com> wrote:
> Hi,
>
> On Sat, Nov 17, 2012 at 8:37 AM, srimugunthan dhandapani
> <srimugunthan.dhandapani@gmail.com> wrote:
>> On Sat, Nov 17, 2012 at 2:04 AM, Ezequiel Garcia <elezegarcia@gmail.com> wrote:
>>> Hi,
>>>
>>> Thanks for the patch!
>>>
>>> Though I haven't read the code in detail, I have a few minor comments to make.
>>
>> Thanks for the comments. This is my first big patch. I have only sent
>> trivial patches before.
>> Sorry for the mistakes
>> I will resend with formatted patch later.
>>
>> I realize the code is not perfect. There are also some very long functions.
>> For this thread, I request people to kindly ignore code format.
>> Some general comments with respect to design, any reference
>> papers/code i should be aware of,
>> or ideas to improve performance(particularly random IO performance)
>>  will be very helpful for me.
>>
>
> I understand that. However, keep in mind some developers feel uncomfortable
> when looking at badly formatted code and this may hurt the reviewing process.
>
> IMHO, if you want to get feedback, try to ease developers reviewing process
> by making the code as polished as possible.
> Some numbers on how this is performing, comparing against current alternatives
> as ubifs, jffs2, etc. might be useful.
>
> Just a thought!
>
> Good luck,
>
>     Ezequiel

People were asking about what was the flash card that i was using.
It is NetApp FlashCache.

http://www.netapp.com/us/products/storage-systems/flash-cache/

It is currently used as accelaration flash cards.

The card was donated to our college and I did the LFTL as part of my
masters thesis.
thanks,
mugunthan
