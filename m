Received: from smtp.codeaurora.org ([198.145.11.231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WxF2s-0002lY-P3
 for linux-mtd@lists.infradead.org; Wed, 18 Jun 2014 12:32:55 +0000
Message-ID: <53A186DF.6030309@codeaurora.org>
Date: Wed, 18 Jun 2014 15:32:31 +0300
From: Tanya Brokhman <tlinder@codeaurora.org>
MIME-Version: 1.0
To: Matt Hevern <matt.hevern@gmail.com>
Subject: Re: UBIFS becomes read-only when written, then fails to mount
References: <20140618044434.GA9331@gmail.com>	<53A16066.4040805@codeaurora.org>	<CAKZMjSvceerbBqN6-jcBvbinJB5GdZpJSB-Bqg1ofMYN7pQqew@mail.gmail.com>	<53A17488.5030304@codeaurora.org>
 <CAKZMjSt-mUAhtD1EVtDRN7CpNPibaW_qQKbknPiUtbj2nC-5Cw@mail.gmail.com>
In-Reply-To: <CAKZMjSt-mUAhtD1EVtDRN7CpNPibaW_qQKbknPiUtbj2nC-5Cw@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 6/18/2014 2:45 PM, Matt Hevern wrote:
> On Wed, Jun 18, 2014 at 9:14 PM, Tanya Brokhman <tlinder@codeaurora.org> wrote:
>> On 6/18/2014 2:02 PM, Matt Hevern wrote:
>>>>>
>>>>>     ubiblke: unknown partition table
>>>>> ....
>>>>
>>>>
>>>>
>>>> How did you create your ubifs and ubi images?
>>>
>>>
>>>
>>> I used the following commands:
>>>
>>> mkfs.ubifs -x "none" -m 2048 -r config -e 126976  -c 256 -o config.ubifs
>>
>>
>> try adding the "-F" flag to mkfs.ubifs. let me know if it helps
>
>
> Hi Tanya,
>
> This issue doesn't seem to be easy for me to reproduce as it's only
> happened to me once in over 12 months of use.
> I don't really have any way to verify that the  '-F' space fixup works
> or not, and i'm not sure i can use it...
>   according to the man page kernel 3.0 is required, and ii'm running 2.6.35.3.
>
> Is there something in the logs which makes you suspect that this
> problem is related to the -F 'fix up free space' mechanism ?
>
> Matt
>

yes. this part:
UBI: background thread "ubi_bgt0d" started, PID 492
   ubiblka: unknown partition table
   ubiblkb: unknown partition table
   ubiblkc: unknown partition table
   ubiblkd: unknown partition table
   ubiblke: unknown partition table
i'm working with kernel3.10 but i was having similar issues until i 
started creating the img with "-F". I don't remember the exact error i 
got but i think it was also something on mount or first write issued to 
device.

-- 
QUALCOMM ISRAEL, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
