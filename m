Message-ID: <52185C8C.3090605@gmail.com>
Date: Sat, 24 Aug 2013 00:11:08 -0700
From: Brian Norris <computersforpeace@gmail.com>
MIME-Version: 1.0
To: Mark Brown <broonie@kernel.org>, Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH V1 4/5] spi: Add Freescale QuadSpi driver
References: <1376885403-12156-1-git-send-email-b32955@freescale.com>
 <1376885403-12156-5-git-send-email-b32955@freescale.com>
 <20130823164442.GA30359@sirena.org.uk>
In-Reply-To: <20130823164442.GA30359@sirena.org.uk>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: b44548@freescale.com, dedekind1@gmail.com, b18965@freescale.com,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, shawn.guo@linaro.org, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/23/2013 09:44 AM, Mark Brown wrote:
> On Mon, Aug 19, 2013 at 12:10:02PM +0800, Huang Shijie wrote:
>> +static int fsl_qspi_wait_till_ready(struct fsl_qspi *q)
>> +{
>> +	unsigned long deadline;
>> +	u32 sr;
>> +
>> +	deadline = jiffies + msecs_to_jiffies(40000);
>> +
>> +	do {
>> +		if ((sr = fsl_qspi_read_sr(q)) < 0)
>> +			break;
>> +		else if (!(sr & SR_WIP))
>> +			return 0;
>> +
>> +		cond_resched();
>> +
>> +	} while (!time_after_eq(jiffies, deadline));
>> +
>> +	return 1;
>> +}
>
> Return an error code if we time out?

You also need to check that you didn't complete between your last 
fsl_qspi_read_sr() and the time_arter_eq() check. Theoretically, there 
could be a lot of time between them (due to cond_resched(), for 
instance). 40000 milliseconds is also a lot of time, but still...

IOW, add a check before the "return -ESOMETHING", something like this:

if (!(fsl_qspi_read_sr(q) & SR_WIP))
	return 0;

Brian
