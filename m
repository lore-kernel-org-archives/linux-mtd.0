Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TVnSA-0007mA-OU
 for linux-mtd@lists.infradead.org; Tue, 06 Nov 2012 18:00:47 +0000
Message-ID: <5099504A.5060505@parrot.com>
Date: Tue, 6 Nov 2012 19:00:42 +0100
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Jon Hunter <jon-hunter@ti.com>
Subject: Re: [PATCH 1/3] omap gpmc : add support of setting CYCLE2CYCLEDELAY
 and BUSTURNAROUND
References: <1352220277-4251-1-git-send-email-matthieu.castet@parrot.com>
 <5099478A.50901@ti.com>
In-Reply-To: <5099478A.50901@ti.com>
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

Jon Hunter a écrit :
> On 11/06/2012 10:44 AM, Matthieu CASTET wrote:
>>  
>>  	/* caller is expected to have initialized CONFIG1 to cover
>>  	 * at least sync vs async
>> diff --git a/arch/arm/plat-omap/include/plat/gpmc.h b/arch/arm/plat-omap/include/plat/gpmc.h
>> index 2e6e259..34ca454 100644
>> --- a/arch/arm/plat-omap/include/plat/gpmc.h
>> +++ b/arch/arm/plat-omap/include/plat/gpmc.h
>> @@ -131,6 +131,8 @@ struct gpmc_timings {
>>  	/* The following are only on OMAP3430 */
>>  	u16 wr_access;		/* WRACCESSTIME */
>>  	u16 wr_data_mux_bus;	/* WRDATAONADMUXBUS */
>> +	u16 cycle2cycledelay;	/* CYCLE2CYCLEDELAY */
>> +	u16 busturnaround;		/* BUSTURNAROUND */
> 
> So you should be able to move these out of OMAP3430 specific as they are
> generic.
Thanks for the quick review.

I will post another patch, unless this is already done in  Afzal patch (Is there
a tree where I can get Afzal pending patches ?)


Matthieu
