Received: from eu1sys200aog119.obsmtp.com ([207.126.144.147])
	by canuck.infradead.org with smtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PuGsG-0000VT-36
	for linux-mtd@lists.infradead.org; Tue, 01 Mar 2011 04:07:48 +0000
Message-ID: <4D6C7105.6040406@st.com>
Date: Tue, 1 Mar 2011 09:37:33 +0530
From: viresh kumar <viresh.kumar@st.com>
MIME-Version: 1.0
To: "Artem.Bityutskiy@nokia.com" <Artem.Bityutskiy@nokia.com>
Subject: Re: [PATCH V2 resend] fsmc-nand: Add fsmc_nand_set_plat_data in
	drivers/mtd/nand/fsmc_nand.c
References: <8b8879499520ac641f7e38ac0e40182eb7f32f85.1298866118.git.viresh.kumar@st.com>
	<1298897478.2809.12.camel@localhost> <4D6C6D79.80502@st.com>
In-Reply-To: <4D6C6D79.80502@st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: Vipin KUMAR <vipin.kumar@st.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	viresh kumar <viresh.kumar@st.com>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
	Linus WALLEIJ <linus.walleij@stericsson.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/01/2011 09:22 AM, viresh kumar wrote:
> On 02/28/2011 06:21 PM, Artem Bityutskiy wrote:
>> On Mon, 2011-02-28 at 09:39 +0530, Viresh Kumar wrote:
>>> In most of the cases partitions info, width, etc comes from board files. And
>>> device structure may be defined in machine files, common to all board files.
>>> Thus, we need to set platform data from board file, for which
>>> fsmc_nand_set_plat_data routine is required.
>>
>> Hi, sorry, but after looking a bit closer I do not see why you need this
>> function.
>>
>> Why could not you set up the width, options, and partitions in the
>> straight in board file, e.g., like arch/arm/mach-omap2/board-igep0030.c
>> sets partitions for onenand driver? Also, for partitions you can use
>> command line arguments, like this is done in
>> drivers/mtd/onenand/generic.c
>>  
> 
> This is what i explained in the commit message also. We don't declare device
> structures in board files, as this information is machine dependent, so this is present
> in common machine file to all boards.
> Now we have to set platform data. This can be be done in board_init() routine in
> the board specific file. But then this routine will contain below mentioned code,
> and so will not look clean enough. so we thought of creating this function which can
> simply be reused by all board files.
> 
>>> +/* This function is used to set platform data field of pdev->dev */
>>> +void fsmc_nand_set_plat_data(struct platform_device *pdev,
>>> +		struct mtd_partition *partitions, unsigned int nr_partitions,
>>> +		unsigned int options, unsigned int width)
>>> +{
>>> +	struct fsmc_nand_platform_data *plat_data;
>>> +	plat_data = dev_get_platdata(&pdev->dev);
>>> +
>>> +	if (partitions) {
>>> +		plat_data->partitions = partitions;
>>> +		plat_data->nr_partitions = nr_partitions;
>>> +	}
>>> +
>>> +	plat_data->options = options;
>>> +	plat_data->width = width;
>>> +}
>>> +EXPORT_SYMBOL_GPL(fsmc_nand_set_plat_data);
>>
>> Just looks a bit too much to add a function which simply assigns
>> parameters and then export it. If you'll need to initialize more
>> parameters later, will you add more arguments there?
>>
> 
> Almost all plat_data fields are filled here. But yes your question
> still stands valid. Obviously we must not have a large number of parameters
> here.
> 

Ok. I think one thing can be done. We can define a routine in device.h
static inline void *dev_set_platdata(const struct device *dev, void *pdata);

Now, we can define plat_data in boards file and then call this routine.

-- 
viresh
