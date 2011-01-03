Message-ID: <4D21471D.60705@st.com>
Date: Mon, 3 Jan 2011 09:18:45 +0530
From: viresh kumar <viresh.kumar@st.com>
MIME-Version: 1.0
To: Linus Walleij <linus.ml.walleij@gmail.com>
Subject: Re: [PATCH V3 36/63] ST SPEAr : FSMC (Flexible Static Memory
	Controller) NOR interface driver
References: <cover.1292833228.git.viresh.kumar@st.com>	<187ed7b3996c7f37ce782d847d3ecc761c3e52b8.1292833228.git.viresh.kumar@st.com>
	<AANLkTik_NXigwhRH3KMjV3qmu-GB7m+6hzzdGY8RjBof@mail.gmail.com>
In-Reply-To: <AANLkTik_NXigwhRH3KMjV3qmu-GB7m+6hzzdGY8RjBof@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: Rajeev KUMAR <rajeev-dlh.kumar@st.com>,
	Armando VISCONTI <armando.visconti@st.com>,
	Vipin KUMAR <vipin.kumar@st.com>, Shiraz HASHIM <shiraz.hashim@st.com>,
	Amit VIRDI <Amit.VIRDI@st.com>,
	Vipul Kumar SAMAR <vipulkumar.samar@st.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Deepak SIKRI <deepak.sikri@st.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Linus,

On 12/26/2010 09:08 PM, Linus Walleij wrote:
> 2010/12/20 Viresh Kumar <viresh.kumar@st.com>:
> 

(...)

>> diff --git a/arch/arm/mach-spear13xx/fsmc-nor.c b/arch/arm/mach-spear13xx/fsmc-nor.c
>> new file mode 100644
>> index 0000000..03234b6
>> --- /dev/null
>> +++ b/arch/arm/mach-spear13xx/fsmc-nor.c
> 
> What is this file doing in mach-spear13xx? Several other platforms
> like U300 and Nomadik use the same NOR controller.
> 
> This should be in drivers/mtd/* somewhere I believe?
> 
>> @@ -0,0 +1,85 @@
>> +/*
>> + * arch/arm/mach-spear13xx/fsmc-nor.c
>> + *
>> + * FSMC (Flexible Static Memory Controller) interface for NOR
>> + *
>> + * Copyright (C) 2010 ST Microelectronics
>> + * Vipin Kumar<vipin.kumar@st.com>
>> + *
>> + * This file is licensed under the terms of the GNU General Public
>> + * License version 2. This program is licensed "as is" without any
>> + * warranty of any kind, whether express or implied.
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/err.h>
>> +#include <linux/init.h>
>> +#include <linux/err.h>
>> +#include <linux/io.h>
>> +#include <plat/fsmc.h>
> 
> Use <linux/mtd/fsmc.h> as include file, get rid of plat/fsmc.h.
> Extend that .h file with the stuff you need.
> 
> We need to keep definitions for MTD NOR, NAND and OneNAND using FSMC
> in this file so as to keep things simple. One header file is enough, and it's
> very generic too, FSMC is not for plat-spear/* but also U300, Nomadik and
> Ux500.
> 

Yes i agree. I will remove patches related to fsmc from this patch series and will
send them separately.

-- 
viresh
