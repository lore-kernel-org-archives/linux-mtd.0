Received: from mailout-de.gmx.net ([213.165.64.22] helo=mail.gmx.net)
	by bombadil.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P0wwz-0007ni-Px
	for linux-mtd@lists.infradead.org; Wed, 29 Sep 2010 13:44:03 +0000
Message-ID: <4CA3429E.4070104@gmx.net>
Date: Wed, 29 Sep 2010 15:43:58 +0200
From: Carl-Daniel Hailfinger <c-d.hailfinger.devel.2006@gmx.net>
MIME-Version: 1.0
To: Ben Hutchings <bhutchings@solarflare.com>
Subject: Re: [RFC] Online firmware upgrade in non-embedded systems
References: <1285696787.2282.45.camel@achroite.uk.solarflarecom.com>	
	<4CA26F35.6060408@gmx.net>	
	<1285763700.2283.6.camel@achroite.uk.solarflarecom.com>	
	<4CA334FA.2080707@gmx.net>
	<1285765850.2283.15.camel@achroite.uk.solarflarecom.com>
In-Reply-To: <1285765850.2283.15.camel@achroite.uk.solarflarecom.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: netdev <netdev@vger.kernel.org>,
	sf-linux-drivers <linux-net-drivers@solarflare.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	flashrom <flashrom@flashrom.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 29.09.2010 15:10, Ben Hutchings wrote:
> On Wed, 2010-09-29 at 14:45 +0200, Carl-Daniel Hailfinger wrote:
>   
>> On 29.09.2010 14:35, Ben Hutchings wrote:
>>     
>>> On Wed, 2010-09-29 at 00:41 +0200, Carl-Daniel Hailfinger wrote:
>>>   
>>>       
>>>> [adding flashrom@flashrom.org to CC, senders will be whitelisted after a
>>>> short delay]
>>>>
>>>> On 28.09.2010 19:59, Ben Hutchings wrote:
>>>>     
>>>>         
>>>>> Network and disk controllers normally have at least some firmware in
>>>>> flash to support their use as boot devices. [...]
>>>>>   
>>>>>       
>>>>>           
>>>> Given that the flashrom utility <http://www.flashrom.org/> (GPLv2)
>>>> supports flashing many network cards, SATA/PATA controllers, graphics
>>>> cards, and of course the main system firmware/BIOS/EFI, and it does that
>>>> from userspace without any kernel support,
>>>>     
>>>>         
>>> [...]
>>>
>>> I'm looking for a clean solution, not a hack.
>>>   
>>>       
>> What would qualify as a clean solution?
>>     
>
> One where hardware access is mediated by the kernel, and doesn't involve
> unloading or potentially conflicting with the driver for that hardware.
>   

flashrom can ask the kernel driver to "please stop accessing flash". No
unloading needed, no conflict in place.


>> And is cross-platform code one of your goals?
>>     
>
> Not at this level.  At the application level, yes, but we already have a
> working application so I'm not interested in using flashrom for that.
>   

I see. Just because I'm interested in how other flashing applications
solve this: Does that application work on *BSD as well? And could you
tell me the name of the app so I can take a look at it? Thanks.

Regards,
Carl-Daniel

-- 
http://www.hailfinger.org/
