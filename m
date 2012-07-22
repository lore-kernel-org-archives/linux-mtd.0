Received: from smtp158.ord.emailsrvr.com ([173.203.6.158])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1St62U-00042F-7B
 for linux-mtd@lists.infradead.org; Sun, 22 Jul 2012 23:58:23 +0000
Message-ID: <500C9393.9060804@calxeda.com>
Date: Sun, 22 Jul 2012 18:58:11 -0500
From: Rob Herring <rob.herring@calxeda.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH 1/3] mtd: m25p80: add support for Spansion s25sl064p chip
References: <1341555027-17462-1-git-send-email-marex@denx.de>
 <1342627074.9105.0.camel@brekeke> <201207181808.15833.marex@denx.de>
 <1342628031.9105.6.camel@brekeke>
In-Reply-To: <1342628031.9105.6.camel@brekeke>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Marek Vasut <marex@denx.de>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org, David Woodhouse <david.woodhouse@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 07/18/2012 11:13 AM, Artem Bityutskiy wrote:
> On Wed, 2012-07-18 at 18:08 +0200, Marek Vasut wrote:
>> Dear Artem Bityutskiy,
>>
>>> On Fri, 2012-07-06 at 08:10 +0200, Marek Vasut wrote:
>>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>>> Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
>>>> Cc: David Woodhouse <david.woodhouse@intel.com>
>>>
>>> Pushed 1/3 and 2/3 to l2-mtd.git, thanks!
>>
>> Thanks, Artem. Could you please suggest where to document the property added in 
>> 3/3 please?
> 
> Rob Herring responded to me last time, let's try to ask him. Rob, the
> question is here:
> 
> http://lists.infradead.org/pipermail/linux-mtd/2012-July/042752.html
> 
> "NOTE: I'm not sure where to document this property, as m25p80 is
>       a simple DT device. Any hints please?"

Looks like "spansion,m25p80" needs to be documented under
Documentation/devicetree/bindings/mtd, and then this new property
documented with it. The only in tree user right now is here:

arch/powerpc/boot/dts/p2020rdb-pc.dtsi

Rob
