Received: from eu1sys200aog107.obsmtp.com ([207.126.144.123])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S7OQf-0004My-3o
 for linux-mtd@lists.infradead.org; Tue, 13 Mar 2012 09:54:05 +0000
Message-ID: <4F5F1931.7060602@st.com>
Date: Tue, 13 Mar 2012 10:53:53 +0100
From: Armando Visconti <armando.visconti@st.com>
MIME-Version: 1.0
To: "dedekind1@gmail.com" <dedekind1@gmail.com>,
 Vipin KUMAR <vipin.kumar@st.com>
Subject: Re: [PATCH 08/18] fsmc/nand: Add support for default partitions for
 several NAND devices
References: <cover.1331119143.git.vipin.kumar@st.com>		
 <1e02585381b1fb93a8fd5b826ac33d355eaedaa5.1331119143.git.vipin.kumar@st.com>	
 <1331298422.29445.23.camel@sauron.fi.intel.com> <4F5A181D.1080106@st.com>
 <1331305901.29445.39.camel@sauron.fi.intel.com>
In-Reply-To: <1331305901.29445.39.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "Artem.Bityutskiy@nokia.com" <Artem.Bityutskiy@nokia.com>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Vincenzo FRASCINO <Vincenzo.FRASCINO@st.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/09/2012 04:11 PM, Artem Bityutskiy wrote:
> On Fri, 2012-03-09 at 15:47 +0100, Armando Visconti wrote:
>> On 03/09/2012 02:07 PM, Artem Bityutskiy wrote:
>>> On Wed, 2012-03-07 at 17:00 +0530, Vipin Kumar wrote:
>>>> +static struct mtd_partition partition_info_64KB_blk[] = {
>>>> +	{
>>>> +		.name = "X-loader",
>>>> +		.offset = 0,
>>>> +		.size = 4*0x10000,
>>>> +	},
>>>> +	{
>>>> +		.name = "U-Boot",
>>>> +		.offset = 4*0x10000,
>>>> +		.size = 8*0x40000,
>>>> +	},
>>>> +	{
>>>> +		.name = "Kernel",
>>>> +		.offset = (4+8)*0x10000,
>>>> +		.size = 64*0x40000,
>>>> +	},
>>>> +	{
>>>> +		.name = "Root File System",
>>>> +		.offset = (4+8+64)*0x10000,
>>>> +		.size = MTDPART_SIZ_FULL,
>>>> +	},
>>>> +};
>>>
>>> Shouldn't this kind of data come from DT/platform data or cmdline
>>> instead? Does it make sense to have it hard-coded in the driver?
>>>
>>
>> These are just the default partitions.
>
> I thing the default should be "no partitions" instead of a hard-coded
> list of partitions tailored to a specific system.
>
>> We are passing them also from platform, and it is possible also
>> from cmdline.
>
> Fine, then deleting the defaults should not hurt :-)
>

Yes, Artem, I think you are right.
Actually I checked better and I can say that:

   1. We do have the provision to pass the partitions thru pdata and
      cmdline
   2. Nevertheless, we are not passing partitions thru pdata in none
      of our platforms.

I think we need to change this and pass partitions thru pdata.
Vipin, what's your opinion?

Thx,
Arm

-- 
-- "Every step appears to be the unavoidable consequence of the
-- preceding one." (A. Einstein)
-- 
Armando Visconti                  Mobile: (+39) 346 8879146
Senior SW Engineer                Fax:    (+39) 02 93519290
CPG                               Work:   (+39) 02 93519683
Computer System Division          e-mail: armando.visconti@st.com
ST Microelectronics               TINA:   051  4683
