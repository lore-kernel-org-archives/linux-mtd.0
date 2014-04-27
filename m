Received: from smtp.codeaurora.org ([198.145.11.231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WeNwe-00055C-FO
 for linux-mtd@lists.infradead.org; Sun, 27 Apr 2014 12:12:32 +0000
Message-ID: <789ed0034a7f4aa993addb2bc8c7e914.squirrel@www.codeaurora.org>
In-Reply-To: <1396871016.17040.33.camel@sauron.fi.intel.com>
References: <f08bbebef039d5bb28c2fcd3022165b0.squirrel@www.codeaurora.org>
 <1396260879.9016.70.camel@sauron.fi.intel.com>
 <533A5407.4060900@codeaurora.org>
 <1396871016.17040.33.camel@sauron.fi.intel.com>
Date: Sun, 27 Apr 2014 12:12:11 -0000
Subject: Re: ubifs: assertion fails
From: "Dolev Raviv" <draviv@codeaurora.org>
To: dedekind1@gmail.com
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Cc: Dolev Raviv <draviv@codeaurora.org>, linux-mtd@lists.infradead.org,
 Tanya Brokhman <tlinder@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> On Tue, 2014-04-01 at 08:52 +0300, Tanya Brokhman wrote:
>> The log isn't flooded with the above mentioned error, but it does repeat
>> several times.
>
> Even though you do a lot of I/O operations?
>
> If the accounting becomes incorrect, I think you'd see a warning for
> each and every I/O operations.

Yes, the log seems clean to me. The error actually occurs while stressing
with iozone benchmark.
Could the error be a result of the corner case you described in your
previous mail.

>
> Also, do you have several UBIFS file-systems mounted?
>

Yes, we have prepared images based on ubifs. So almost all the mounted
partitions are ubifs.

>> Is there any way we can help in debugging and fixing this? Also, we're
>> running on a 3.10 based kernel and I saw a lot of patches that change
>> the shrinker after 3.10 on linux-next. What kernel version did you see
>> the shrinker errors on?
>
> Well, you just need to stress the shrinker. I did it by simply adding a
> hack to ubifs module init which kmalloc()'ed a lot of memory. Not
> too-much, but enough to cause some pressure when doing a lot of I/O
> operations and get UBIFS shrinker be invoked. This took me some amount
> of time to get a good hack. I use a normal PC with some Fedora, and
> nandsime. This makes it a lot easier to debug, comparing with doing this
> on a real target. After all, shrinker is a generic component. I think
> that PC had 4GB of RAM. I do not remember how much I allocated in my
> hack.

I'll probably will take a look at this once I finish other more urgent tasks.
>
> I think I used older version than 3.10 back then.
>
> --
> Best Regards,
> Artem Bityutskiy
>
>


-- 
QUALCOMM ISRAEL, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
