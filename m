Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TBs5g-0004q3-9S
 for linux-mtd@lists.infradead.org; Wed, 12 Sep 2012 18:55:13 +0000
Received: by lagu2 with SMTP id u2so1326006lag.36
 for <linux-mtd@lists.infradead.org>; Wed, 12 Sep 2012 11:55:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5050D6D8.8090605@broadcom.com>
References: <505044E3.3040601@broadcom.com> <5050C56C.8070603@wwwdotorg.org>
 <5050D6D8.8090605@broadcom.com>
Date: Wed, 12 Sep 2012 11:55:09 -0700
Message-ID: <CAOesGMh3mhQSRxYU_qdRVyBvQ27Kpi_4iRRYomH6ufzON_dxCw@mail.gmail.com>
Subject: Re: [PATCH 1/3] ARM: Remove bcmring NAND driver
From: Olof Johansson <olof@lixom.net>
To: Christian Daudt <csd@broadcom.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Arnd Bergmann <arnd@arndb.de>, Stephen Warren <swarren@wwwdotorg.org>,
 arm@kernel.org, linux-mtd@lists.infradead.org,
 "JD \(Jiandong\) Zheng" <jdzheng@broadcom.com>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 12, 2012 at 11:39 AM, Christian Daudt <csd@broadcom.com> wrote:
> On 12-09-12 10:25 AM, Stephen Warren wrote:
>>
>> On 09/12/2012 02:16 AM, Christian Daudt wrote:
>>>
>>> This driver is being removed as part of the cleanup of the bcmring
>>> SoC from mainline as it is no longer maintained.
>>>   arch/arm/configs/bcmring_defconfig |    2 -
>>
>> Out of curiosity, if you're removing the whole thing, why edit the
>> defconfig at all; just delete it instead in whatever patch removes the
>> arch/arm parts?
>>
> I figured it'd be better to remove the config portion on this patch so it is
> self-contained - just in case the other patch gets held up for some reason
> then this one can still be applied and no junk would be left around. But
> agreed - it doesn't really affect things either way.

Just skip the defconfig update in this patch -- if the Kconfig option
goes away then the build system will just ignore it even if it's in
the defconfig. Also, if you touch it here and remove it in the other
patch you might end up getting a conflict due to the file removal when
things go upstream, which is just extra churn.


-Olof
