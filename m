Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TVpqZ-0002q0-70
 for linux-mtd@lists.infradead.org; Tue, 06 Nov 2012 20:34:08 +0000
Message-ID: <5099743B.3040804@ti.com>
Date: Tue, 6 Nov 2012 14:34:03 -0600
From: Jon Hunter <jon-hunter@ti.com>
MIME-Version: 1.0
To: Matthieu CASTET <matthieu.castet@parrot.com>
Subject: Re: [PATCH 1/3] omap gpmc : add support of setting CYCLE2CYCLEDELAY
 and BUSTURNAROUND
References: <1352220277-4251-1-git-send-email-matthieu.castet@parrot.com>
 <5099478A.50901@ti.com> <5099504A.5060505@parrot.com>
In-Reply-To: <5099504A.5060505@parrot.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
Cc: Afzal Mohammed <afzal@ti.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On 11/06/2012 12:00 PM, Matthieu CASTET wrote:
> Jon Hunter a écrit :
>> On 11/06/2012 10:44 AM, Matthieu CASTET wrote:
>>>  
>>>  	/* caller is expected to have initialized CONFIG1 to cover
>>>  	 * at least sync vs async
>>> diff --git a/arch/arm/plat-omap/include/plat/gpmc.h b/arch/arm/plat-omap/include/plat/gpmc.h
>>> index 2e6e259..34ca454 100644
>>> --- a/arch/arm/plat-omap/include/plat/gpmc.h
>>> +++ b/arch/arm/plat-omap/include/plat/gpmc.h
>>> @@ -131,6 +131,8 @@ struct gpmc_timings {
>>>  	/* The following are only on OMAP3430 */
>>>  	u16 wr_access;		/* WRACCESSTIME */
>>>  	u16 wr_data_mux_bus;	/* WRDATAONADMUXBUS */
>>> +	u16 cycle2cycledelay;	/* CYCLE2CYCLEDELAY */
>>> +	u16 busturnaround;		/* BUSTURNAROUND */
>>
>> So you should be able to move these out of OMAP3430 specific as they are
>> generic.
> Thanks for the quick review.
> 
> I will post another patch, unless this is already done in  Afzal patch (Is there
> a tree where I can get Afzal pending patches ?)

Afzal keeps his kernel tree on gitorious [1]. However, I am not sure
what Afzal's plans are for the remaining patches not yet merged and
which branch you should look at (I have a lot of problems viewing
anything on gitorious these days).

Afzal, let us know how you prefer to handle this.

Cheers
Jon

[1] http://gitorious.org/x0148406-public/linux-kernel
