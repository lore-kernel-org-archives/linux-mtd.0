Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xo7GK-0006mx-7k
 for linux-mtd@lists.infradead.org; Tue, 11 Nov 2014 08:57:21 +0000
Message-ID: <5461CF56.5010407@nod.at>
Date: Tue, 11 Nov 2014 09:56:54 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Joe Perches <joe@perches.com>,
 Tanya Brokhman <tlinder@codeaurora.org>
Subject: Re: [PATCH V6] UBI: Extend UBI layer debug/messaging capabilities
References: <1415023112-21704-1-git-send-email-tlinder@codeaurora.org>	
 <5460F7D8.2030100@nod.at> <1415642273.8868.8.camel@perches.com>	
 <5461C7C6.6060604@codeaurora.org> <1415694886.16070.3.camel@perches.com>
In-Reply-To: <1415694886.16070.3.camel@perches.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
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

Am 11.11.2014 um 09:34 schrieb Joe Perches:
> On Tue, 2014-11-11 at 10:24 +0200, Tanya Brokhman wrote:
>> On 11/10/2014 7:57 PM, Joe Perches wrote:
>>> On Mon, 2014-11-10 at 18:37 +0100, Richard Weinberger wrote:
>>>> Am 03.11.2014 um 14:58 schrieb Tanya Brokhman:
>>>>> If there is more then one UBI device mounted, there is no way to
>>>>> distinguish between messages from different UBI devices.
>>>>> Add device number to all ubi layer message types.
>>>
>>> Adding "error" and "warning" to the message logs is
>>> duplicative to the KERN_<LEVEL> logging information.
>>>
>>>>> Changes from V5:
>>>>> 	- Added ptr verification @ ubi_err/ubi_msg/ubi_warn
>>>>> 	Removed extra printing of ubi number
>>>>> 	Removed new messages.
>>>
>>> Did you all ever look at what I posted?
>>
>> I did. Its not my place to re-post your change in my patch. I personally 
>> prefer it the way I've done it but it's just a matter of opinion and 
>> personal preference.
> 
> Don't forget object code size.

That's a good point.
Tanya's patch is already in linux-ubifs.git (http://git.infradead.org/linux-ubifs.git).
Later we could patch ubi.h to use Joe's log functions.

But first I'd like to fix the logging style.
I'm really unhappy with it.

The patch does much more that the commit messages says:
"If there is more then one UBI device mounted, there is no way to
distinguish between messages from different UBI devices.
Add device number to all ubi layer message types.

The R/O block driver messages were replaced by pr_* since
ubi_device structure is not used by it."

There is no hint that it adds the function name to every log message.
If so, I'd have nack'ed the patch.

Thanks,
//richard
