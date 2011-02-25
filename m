Received: from eu1sys200aog106.obsmtp.com ([207.126.144.121])
	by canuck.infradead.org with smtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PsvlQ-0003Ac-FF
	for linux-mtd@lists.infradead.org; Fri, 25 Feb 2011 11:23:13 +0000
Message-ID: <4D6790FD.9060807@st.com>
Date: Fri, 25 Feb 2011 16:52:37 +0530
From: viresh kumar <viresh.kumar@st.com>
MIME-Version: 1.0
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: Re: [PATCH] fsmc-nand: Add fsmc_nand_set_plat_data in linux/mtd/fsmc.h
References: <e63303f4cd51aa61f08e2b026b6a80dc0d9cd54a.1298442421.git.viresh.kumar@st.com>
	<1298632262.2798.66.camel@localhost>
In-Reply-To: <1298632262.2798.66.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: Vipin KUMAR <vipin.kumar@st.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
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

On 02/25/2011 04:41 PM, Artem Bityutskiy wrote:
>> > diff --git a/include/linux/mtd/fsmc.h b/include/linux/mtd/fsmc.h
>> > index 6987995..0cba324 100644
>> > --- a/include/linux/mtd/fsmc.h
>> > +++ b/include/linux/mtd/fsmc.h
>> > @@ -160,4 +160,21 @@ extern void __init fsmc_init_board_info(struct platform_device *pdev,
>> >  		struct mtd_partition *partitions, unsigned int nr_partitions,
>> >  		unsigned int width);
>> >  
>> > +/* This function is used to set platform data field of pdev->dev */
>> > +static inline void fsmc_nand_set_plat_data(struct platform_device *pdev,
>> > +		struct mtd_partition *partitions, unsigned int nr_partitions,
>> > +		unsigned int options, unsigned int width)
>> > +{
>> > +	struct fsmc_nand_platform_data *plat_data;
>> > +	plat_data = dev_get_platdata(&pdev->dev);
>> > +
>> > +	if (partitions) {
>> > +		plat_data->partitions = partitions;
>> > +		plat_data->nr_partitions = nr_partitions;
>> > +	}
>> > +
>> > +	plat_data->options = options;
>> > +	plat_data->width = width;
>> > +}
> Isn't this function too big to be an inline func in a header file?
> 

Sorry, i have already resent this patch with change in commit message.

Actually this routine will not be called many times. Only for setting
plat_data of few devices (depending on board). So i thought keeping
it inline would be better. But will change if you want. Should i move
it in fsmc-nand.c??

-- 
viresh
