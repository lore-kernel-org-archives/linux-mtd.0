Received: from mail-wg0-x231.google.com ([2a00:1450:400c:c00::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WxFf9-0004wU-Hn
 for linux-mtd@lists.infradead.org; Wed, 18 Jun 2014 13:12:28 +0000
Received: by mail-wg0-f49.google.com with SMTP id y10so809215wgg.8
 for <linux-mtd@lists.infradead.org>; Wed, 18 Jun 2014 06:12:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <53A186DF.6030309@codeaurora.org>
References: <20140618044434.GA9331@gmail.com> <53A16066.4040805@codeaurora.org>
 <CAKZMjSvceerbBqN6-jcBvbinJB5GdZpJSB-Bqg1ofMYN7pQqew@mail.gmail.com>
 <53A17488.5030304@codeaurora.org>
 <CAKZMjSt-mUAhtD1EVtDRN7CpNPibaW_qQKbknPiUtbj2nC-5Cw@mail.gmail.com>
 <53A186DF.6030309@codeaurora.org>
Date: Wed, 18 Jun 2014 23:12:04 +1000
Message-ID: <CAKZMjSuxWaVxc+b-HmiCg-=uw91jhMDp5QMeDtc=VG2kYZd=6g@mail.gmail.com>
Subject: Re: UBIFS becomes read-only when written, then fails to mount
From: Matt Hevern <matt.hevern@gmail.com>
To: Tanya Brokhman <tlinder@codeaurora.org>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jun 18, 2014 at 10:32 PM, Tanya Brokhman <tlinder@codeaurora.org> wrote:
> On 6/18/2014 2:45 PM, Matt Hevern wrote:
>>
>> On Wed, Jun 18, 2014 at 9:14 PM, Tanya Brokhman <tlinder@codeaurora.org>
>> wrote:
>>>
>>> On 6/18/2014 2:02 PM, Matt Hevern wrote:
>>>>>>
>>>>>>
>>>>>>     ubiblke: unknown partition table
>>>>>> ....
>>>>>
>>>>>
>>>>>
>>>>>
>>>>> How did you create your ubifs and ubi images?
>>>>
>>>>
>>>>
>>>>
>>>> I used the following commands:
>>>>
>>>> mkfs.ubifs -x "none" -m 2048 -r config -e 126976  -c 256 -o config.ubifs
>>>
>>>
>>>
>>> try adding the "-F" flag to mkfs.ubifs. let me know if it helps
>>
>>
>>
>> Hi Tanya,
>>
>> This issue doesn't seem to be easy for me to reproduce as it's only
>> happened to me once in over 12 months of use.
>> I don't really have any way to verify that the  '-F' space fixup works
>> or not, and i'm not sure i can use it...
>>   according to the man page kernel 3.0 is required, and ii'm running
>> 2.6.35.3.
>>
>> Is there something in the logs which makes you suspect that this
>> problem is related to the -F 'fix up free space' mechanism ?
>>
>> Matt
>>
>
> yes. this part:
>
> UBI: background thread "ubi_bgt0d" started, PID 492
>   ubiblka: unknown partition table
>   ubiblkb: unknown partition table
>   ubiblkc: unknown partition table
>   ubiblkd: unknown partition table
>   ubiblke: unknown partition table
> i'm working with kernel3.10 but i was having similar issues until i started
> creating the img with "-F". I don't remember the exact error i got but i
> think it was also something on mount or first write issued to device.

In my case the system had initially been running fine for some time. I
noticed the problem after a reboot, but I'm not sure exactly when it
first occured.
After this, I started the system and manually attached and mounted the
volume, which was OK.
Then a subsequent write to the filesystem triggered the errors, and
resulted in it being mounted read-only.
Later on after repeating this with logging a few times, even mounting
the volume failed.
