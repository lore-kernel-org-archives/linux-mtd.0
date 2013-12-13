Message-ID: <52AB1B14.6030905@st.com>
Date: Fri, 13 Dec 2013 14:35:00 +0000
From: Angus Clark <angus.clark@st.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 04/36] mtd: st_spi_fsm: Supply framework for device
 requests
References: <1385727565-25794-1-git-send-email-lee.jones@linaro.org>
 <1385727565-25794-5-git-send-email-lee.jones@linaro.org>
 <20131210201943.GC27149@ld-irv-0074.broadcom.com>
In-Reply-To: <20131210201943.GC27149@ld-irv-0074.broadcom.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: Angus CLARK <angus.clark@st.com>, Lee Jones <lee.jones@linaro.org>,
 linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/10/2013 08:19 PM, Brian Norris wrote:
> On Fri, Nov 29, 2013 at 12:18:53PM +0000, Lee Jones wrote:
>> --- a/drivers/mtd/devices/st_spi_fsm.c
>> +static void stfsm_wait_seq(struct stfsm *fsm)
>> +{
>> +	unsigned long timeo = jiffies + HZ;
>> +
>> +	while (time_before(jiffies, timeo)) {
>> +		if (stfsm_is_idle(fsm))
>> +			return;
>> +
>> +		cond_resched();
>> +	}
>> +
>> +	dev_err(fsm->dev, "timeout on sequence completion\n");
> 
> I believe the timeout logic is incorrect. What if we wait a "long time"
> to call stfsm_wait_seq() (due to scheduling, or otherwise)? Then the
> while loop might not even run once (time_before(x, y) is false). Or what
> if cond_resched() waits for a long time...
> 
> So you need an extra check of stfsm_is_idle() after the while loop,
> before you declare a timeout.

Yes, good catch, this needs to updated.

Cheers,

Angus
