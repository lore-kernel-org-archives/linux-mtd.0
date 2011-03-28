Received: from nbd.name ([46.4.11.11])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q4DCg-0003wc-Az
	for linux-mtd@lists.infradead.org; Mon, 28 Mar 2011 14:13:59 +0000
Message-ID: <4D909800.50701@phrozen.org>
Date: Mon, 28 Mar 2011 16:15:28 +0200
From: John Crispin <john@phrozen.org>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH V2 06/10] MIPS: lantiq: add NOR flash support
References: <1298996006-15960-1-git-send-email-blogic@openwrt.org>
	<1298996006-15960-7-git-send-email-blogic@openwrt.org>
	<1299488320.2746.5.camel@localhost> <4D74CEC2.4040506@openwrt.org>
In-Reply-To: <4D74CEC2.4040506@openwrt.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>,
	Ralph Hempel <ralph.hempel@lantiq.com>, linux-mtd@lists.infradead.org,
	Daniel Schwierzeck <daniel.schwierzeck@googlemail.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 07/03/11 13:25, John Crispin wrote:
> On 07/03/11 09:58, Artem Bityutskiy wrote:
>> On Tue, 2011-03-01 at 17:13 +0100, John Crispin wrote:
>>   
>>> NOR flash is attached to the same EBU (External Bus Unit) as PCI. As described
>>> in the PCI patch, the EBU is a little buggy, resulting in the upper and lower
>>> 16 bit of the data on a 32 bit read are swapped. (essentially we have a addr^=2)
>>>
>>> To work around this we do a addr^=2 during the probe. Once probed we adapt
>>> cfi->addr_unlock1 and cfi->addr_unlock2 to represent the endianess bug.
>>>
>>> Changes in V2
>>> * handle the endianess bug inside the map code and not in the generic cfi code
>>> * remove the addr swizzle patch
>>>
>>> Signed-off-by: John Crispin <blogic@openwrt.org>
>>> Signed-off-by: Ralph Hempel <ralph.hempel@lantiq.com>
>>> Cc: David Woodhouse <dwmw2@infradead.org>
>>> Cc: Daniel Schwierzeck <daniel.schwierzeck@googlemail.com>
>>> Cc: linux-mips@linux-mips.org
>>> Cc: linux-mtd@lists.infradead.org
>>>     
>> There are a couple checkpatch.pl warnings, would you please address them
>> and resend?
>>
>>   
> Hi,
> 
> of course.
> 
> thanks,
> John
> 
> 

Hi,

i fixed one of the warnings. the remaining warning wants me to put at
least 4 lines into the help section in the Kconfig. However 3 lines were
enough to explain what the driver does.

John
