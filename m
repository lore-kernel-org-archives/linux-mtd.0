Received: from smtp.codeaurora.org ([198.145.11.231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xo6l6-0005hM-RJ
 for linux-mtd@lists.infradead.org; Tue, 11 Nov 2014 08:25:05 +0000
Message-ID: <5461C7C6.6060604@codeaurora.org>
Date: Tue, 11 Nov 2014 10:24:38 +0200
From: Tanya Brokhman <tlinder@codeaurora.org>
MIME-Version: 1.0
To: Joe Perches <joe@perches.com>, Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH V6] UBI: Extend UBI layer debug/messaging capabilities
References: <1415023112-21704-1-git-send-email-tlinder@codeaurora.org>	
 <5460F7D8.2030100@nod.at> <1415642273.8868.8.camel@perches.com>
In-Reply-To: <1415642273.8868.8.camel@perches.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Cc: dedekind1@gmail.com, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/10/2014 7:57 PM, Joe Perches wrote:
> On Mon, 2014-11-10 at 18:37 +0100, Richard Weinberger wrote:
>> Am 03.11.2014 um 14:58 schrieb Tanya Brokhman:
>>> If there is more then one UBI device mounted, there is no way to
>>> distinguish between messages from different UBI devices.
>>> Add device number to all ubi layer message types.
>
> Adding "error" and "warning" to the message logs is
> duplicative to the KERN_<LEVEL> logging information.
>
>>> Changes from V5:
>>> 	- Added ptr verification @ ubi_err/ubi_msg/ubi_warn
>>> 	Removed extra printing of ubi number
>>> 	Removed new messages.
>
> Did you all ever look at what I posted?

I did. Its not my place to re-post your change in my patch. I personally 
prefer it the way I've done it but it's just a matter of opinion and 
personal preference. Artem took this one in...

>
> https://lkml.org/lkml/2014/10/14/280
>
> smaller code, consistent prefixing, consistent with
> typical kernel style, etc.
>
>> While testing I noticed that the log output looks quite different.
>>
>> e.g.
>> [   26.564111] UBI-0: ubi_attach_mtd_dev:default fastmap pool size: 256
>> [   26.565438] UBI-0: ubi_attach_mtd_dev:default fastmap WL pool size: 128
>
> If __func__ is really desired, it's generally better to
> put a space after the "%s:", __func__ so there's visual
> separation between the prefixes and the content.
>
> I agree that emitting function names isn't particularly
> useful.

I have to disagree here, but again - this is personal preference.

>
> (and Richard, do please remember to trim your posts,
>   you sent > 100KB of unnecessary quoted stuff)
>


Thanks,
Tanya Brokhman
-- 
Qualcomm Israel, on behalf of Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
