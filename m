Message-ID: <5050D6D8.8090605@broadcom.com>
Date: Wed, 12 Sep 2012 11:39:20 -0700
From: "Christian Daudt" <csd@broadcom.com>
MIME-Version: 1.0
To: "Stephen Warren" <swarren@wwwdotorg.org>
Subject: Re: [PATCH 1/3] ARM: Remove bcmring NAND driver
References: <505044E3.3040601@broadcom.com>
 <5050C56C.8070603@wwwdotorg.org>
In-Reply-To: <5050C56C.8070603@wwwdotorg.org>
Content-Type: text/plain;
 charset=iso-8859-1;
 format=flowed
Content-Transfer-Encoding: 7bit
Cc: Arnd Bergmann <arnd@arndb.de>, arm@kernel.org,
 linux-mtd@lists.infradead.org, "JD \(Jiandong\) Zheng" <jdzheng@broadcom.com>,
 Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12-09-12 10:25 AM, Stephen Warren wrote:
> On 09/12/2012 02:16 AM, Christian Daudt wrote:
>> This driver is being removed as part of the cleanup of the bcmring
>> SoC from mainline as it is no longer maintained.
>>   arch/arm/configs/bcmring_defconfig |    2 -
> Out of curiosity, if you're removing the whole thing, why edit the
> defconfig at all; just delete it instead in whatever patch removes the
> arch/arm parts?
>
I figured it'd be better to remove the config portion on this patch so 
it is self-contained - just in case the other patch gets held up for 
some reason then this one can still be applied and no junk would be left 
around. But agreed - it doesn't really affect things either way.


  thanks,
    Christian.
