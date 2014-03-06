Received: from mail-yh0-x233.google.com ([2607:f8b0:4002:c01::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WLUYq-0000ZE-AM
 for linux-mtd@lists.infradead.org; Thu, 06 Mar 2014 09:25:52 +0000
Received: by mail-yh0-f51.google.com with SMTP id f10so2320719yha.24
 for <linux-mtd@lists.infradead.org>; Thu, 06 Mar 2014 01:25:30 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <5316498A.8080200@mds.com>
References: <6bf927e513554e628fe15d309aac698e@BLUPR07MB002.namprd07.prod.outlook.com>
 <201403021542.09196.marex@denx.de> <5314B336.7090306@mds.com>
 <201403040129.12504.marex@denx.de> <5316498A.8080200@mds.com>
Date: Thu, 6 Mar 2014 14:55:30 +0530
Message-ID: <CAD6G_RSXtjNuGy83CbOQRjmcAXEXThr4dEBjboUYrk6+ftSY-w@mail.gmail.com>
Subject: Re: [PATCH] Check flag status register for Micron n25q512a
From: Jagan Teki <jagannadh.teki@gmail.com>
To: chuck@mds.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: Marek Vasut <marex@denx.de>, harinik@xilinx.com,
 linux-mtd@lists.infradead.org, "Todd Legler \(tlegler\)" <tlegler@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

On Wed, Mar 5, 2014 at 3:15 AM, Chuck Peplinski <chuck@mds.com> wrote:
> On 3/3/2014 6:29 PM, Marek Vasut wrote:
>>>
>>> FSR can apparently toggle without SR.
>>
>> Is that documented anywhere ? How can that be ?
>
> I'm looking at the data sheet for the part, n25q_512mb_1ce3v_65nm.pdf, from
> the Micron web site at
> http://www.micron.com/products/nor-flash/serial-nor-flash#fullPart&236=10.
> The comment that led us in this direction is on page 62:
>
> "ERASE Operations
> When the operation is in progress, the program or erase controller bit of
> the flag status
> register is set to 0. The flag status register must be polled for the
> operation status. When
> the operation completes, that bit is cleared to 1.
> Note that the flag status register must be polled even if operation times
> out."
>
>
>> Hmmmm , I have a feeling that if you actually added wait_till_ready() call
>> at the end of _erase() and _write(), you would get the same effect. This
>> would in turn mean you are instead missing wait_till_ready() somewhere else.
>> Can you try using wait_till_ready() at the end of _erase() and _write()
>> please ?
>
>
> That would be the standard code, right?  That's where we started and it did
> not work.
>
> At some point I'll try some more tests.  I'm not blocked on this now, so
> it's not totally critical.
> One thing I notice:  The web site notes that this part stacks two 256M dies.
> Maybe that's why it is non-standard?
> Sure would be nice to hear from someone at Micron...

BTW: I have some information regarding this part.

We have tested this part both in u-boot and Linux where we could see
an issue while polling read_status, and then we moved to use flag_status
then we saw the consistent behavior.

Inputs we're got from Micron are:
1. Micron (though not clearly documented), stated that flag_status is clearly
    required to be polled, even though read_status reports the exact status.
    They are not willing to change the datasheet but plan on releasing an
    app note or something because this has led to a lot of confusion.
2. At this moment, no one else has such weird design of needing an
flag_status poll.
    So checking for the device ID and polling flag_status looks like
the only option.

The same approach we tried as well.

CCing - Harini (tested flag_status on Linux)
CCing - Todd Legler from Micron.

Todd and Harini - Please share your inputs.


thanks!
-- 
Jagan.
