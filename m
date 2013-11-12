Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vg6W6-00031i-QK
 for linux-mtd@lists.infradead.org; Tue, 12 Nov 2013 05:27:59 +0000
Message-ID: <5281BC43.4050101@ti.com>
Date: Tue, 12 Nov 2013 10:57:31 +0530
From: Sourav Poddar <sourav.poddar@ti.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v4] drivers: mtd: m25p80: add quad read support
References: <1383935845-31116-1-git-send-email-computersforpeace@gmail.com>
 <52806AE5.60600@ti.com> <20131111191919.GF20061@ld-irv-0074.broadcom.com>
In-Reply-To: <20131111191919.GF20061@ld-irv-0074.broadcom.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Marek Vasut <marex@denx.de>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 12 November 2013 12:49 AM, Brian Norris wrote:
> On Mon, Nov 11, 2013 at 10:58:05AM +0530, Sourav Poddar wrote:
>> Hi Brian,
>> On Saturday 09 November 2013 12:07 AM, Brian Norris wrote:
>>> From: Sourav Poddar<sourav.poddar@ti.com>
>>>
>>> Some flash also support quad read mode. Adding support for quad read
>>> mode in m25p80 for Spansion and Macronix flash.
>>>
>>> [Tweaked by Brian]
>>>
>>> With this patch, quad-read support will override fast-read and
>>> normal-read, if the SPI controller and flash chip both support it.
>>>
>>> Signed-off-by: Sourav Poddar<sourav.poddar@ti.com>
>>> Signed-off-by: Brian Norris<computersforpeace@gmail.com>
>> I tested this patch version with Spansion(S25FL256S) and
>> Macronix(MX66L51235F) flash. It worked fine.
>>
>> Tested-by: Sourav Poddar<sourav.poddar@ti.com>
>>
>> Thanks for correcting it.
> Thanks for the patches and testing.
>
> Pushed to a temporary 'next' branch on l2-mtd.git, since it's too late
> for the 3.13 merge window, IMO. I'll bring it in once we're past the
> merge window.
>
Ok. Thanks!
> Brian
