Received: from eu1sys200aog103.obsmtp.com ([207.126.144.115])
 by casper.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S6178-0004Yc-Hm
 for linux-mtd@lists.infradead.org; Fri, 09 Mar 2012 14:48:17 +0000
Message-ID: <4F5A181D.1080106@st.com>
Date: Fri, 9 Mar 2012 15:47:57 +0100
From: Armando Visconti <armando.visconti@st.com>
MIME-Version: 1.0
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: Re: [PATCH 08/18] fsmc/nand: Add support for default partitions for
 several NAND devices
References: <cover.1331119143.git.vipin.kumar@st.com>	
 <1e02585381b1fb93a8fd5b826ac33d355eaedaa5.1331119143.git.vipin.kumar@st.com>
 <1331298422.29445.23.camel@sauron.fi.intel.com>
In-Reply-To: <1331298422.29445.23.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Vipin KUMAR <vipin.kumar@st.com>,
 "Artem.Bityutskiy@nokia.com" <Artem.Bityutskiy@nokia.com>,
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

On 03/09/2012 02:07 PM, Artem Bityutskiy wrote:
> On Wed, 2012-03-07 at 17:00 +0530, Vipin Kumar wrote:
>> +static struct mtd_partition partition_info_64KB_blk[] = {
>> +	{
>> +		.name = "X-loader",
>> +		.offset = 0,
>> +		.size = 4*0x10000,
>> +	},
>> +	{
>> +		.name = "U-Boot",
>> +		.offset = 4*0x10000,
>> +		.size = 8*0x40000,
>> +	},
>> +	{
>> +		.name = "Kernel",
>> +		.offset = (4+8)*0x10000,
>> +		.size = 64*0x40000,
>> +	},
>> +	{
>> +		.name = "Root File System",
>> +		.offset = (4+8+64)*0x10000,
>> +		.size = MTDPART_SIZ_FULL,
>> +	},
>> +};
>
> Shouldn't this kind of data come from DT/platform data or cmdline
> instead? Does it make sense to have it hard-coded in the driver?
>

These are just the default partitions.
We are passing them also from platform, and it is possible also
from cmdline.

But in case we don't, this is the default.

Shouldn't we treat such a case?

Ciao,
Arm
