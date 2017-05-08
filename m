Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d7egC-0000ex-93
 for linux-mtd@lists.infradead.org; Mon, 08 May 2017 09:10:09 +0000
Subject: Re: Race to power off harming SATA SSDs
To: Ricard Wanderlof <ricard.wanderlof@axis.com>,
 David Woodhouse <dwmw2@infradead.org>
Cc: Pavel Machek <pavel@ucw.cz>, Tejun Heo <tj@kernel.org>,
 boris.brezillon@free-electrons.com, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-mtd@lists.infradead.org, Henrique de Moraes Holschuh <hmh@hmh.eng.br>
References: <20170410232118.GA4816@khazad-dum.debian.net>
 <20170410235206.GA28603@wtj.duckdns.org>
 <20170507204007.GA25628@atrey.karlin.mff.cuni.cz>
 <1494228094.6528.14.camel@infradead.org>
 <alpine.DEB.2.11.1705080930150.6882@lnxricardw1>
 <1494231215.6528.22.camel@infradead.org>
 <alpine.DEB.2.11.1705081034420.6882@lnxricardw1>
 <1494233673.6528.28.camel@infradead.org>
 <alpine.DEB.2.11.1705081059580.6882@lnxricardw1>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <7ee84982-cfad-94d7-4e22-4edbeb852b32@redhat.com>
Date: Mon, 8 May 2017 11:09:43 +0200
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.11.1705081059580.6882@lnxricardw1>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On 08-05-17 11:06, Ricard Wanderlof wrote:
> 
> On Mon, 8 May 2017, David Woodhouse wrote:
> 
>>> On Mon, 8 May 2017, David Woodhouse wrote:
>>>> Our empirical testing trumps your "can never happen" theory :)
>>>
>>> I'm sure it does. But what is the explanation then? Has anyone analyzed
>>> what is going on using an oscilloscope to verify relationship between
>>> erase command and supply voltage drop?
>>
>> Not that I'm aware of. Once we have reached the "it does happen and we
>> have to cope" there was not a lot of point in working out *why* it
>> happened.
>>
>> In fact, the only examples I *personally* remember were on NOR flash,
>> which takes longer to erase. So it's vaguely possible that it doesn't
>> happen on NAND. But really, it's not something we should be depending
>> on and the software mechanisms have to remain in place.
> 
> My point is really that say that the problem is in fact not that the erase
> is cut short due to the power fail, but that the software issues a second
> command before the first erase command has completed, for instance, or
> some other situation. Then we'd have a concrete situation which we can
> resolve (i.e., fix the bug), rather than assuming that it's the hardware's
> fault and implement various software workarounds.

You're forgetting that the SSD itself (this thread is about SSDs) also has
a major software component which is doing housekeeping all the time, so even
if the main CPU gets reset the SSD's controller may still happily be erasing
blocks.

Regards,

Hans
