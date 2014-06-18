Received: from smtp.codeaurora.org ([198.145.11.231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WxDpB-0004kj-N9
 for linux-mtd@lists.infradead.org; Wed, 18 Jun 2014 11:14:42 +0000
Message-ID: <53A17488.5030304@codeaurora.org>
Date: Wed, 18 Jun 2014 14:14:16 +0300
From: Tanya Brokhman <tlinder@codeaurora.org>
MIME-Version: 1.0
To: Matt Hevern <matt.hevern@gmail.com>
Subject: Re: UBIFS becomes read-only when written, then fails to mount
References: <20140618044434.GA9331@gmail.com>	<53A16066.4040805@codeaurora.org>
 <CAKZMjSvceerbBqN6-jcBvbinJB5GdZpJSB-Bqg1ofMYN7pQqew@mail.gmail.com>
In-Reply-To: <CAKZMjSvceerbBqN6-jcBvbinJB5GdZpJSB-Bqg1ofMYN7pQqew@mail.gmail.com>
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

On 6/18/2014 2:02 PM, Matt Hevern wrote:
>>>    ubiblke: unknown partition table
>>> ....
>>
>>
>> How did you create your ubifs and ubi images?
>
>
> I used the following commands:
>
> mkfs.ubifs -x "none" -m 2048 -r config -e 126976  -c 256 -o config.ubifs

try adding the "-F" flag to mkfs.ubifs. let me know if it helps

> then
> ubinize -o system.ubi -s 2048 -m 2048 -p "128 KiB" system.ini
>
> ----system.ini
> 4 other volumes here
>
> [config]
> mode=ubi
> image=config.ubifs
> vol_id=5
> vol_type=dynamic
> vol_size=20MiB
> vol_name=config
> vol_alignment=1
> vol_flags=autoresize
> ----
>
> Then this is written using ubiformat.
>
>
> Matt
>


-- 
QUALCOMM ISRAEL, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
