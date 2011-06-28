Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QbZmN-0002TZ-Hf
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2011 15:00:44 +0000
Message-ID: <4E09EC77.10501@parrot.com>
Date: Tue, 28 Jun 2011 17:00:07 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: Re: [PATCH 3/6] refactor mtd wait code
References: <1309105616-3609-1-git-send-email-matthieu.castet@parrot.com>	
	<1309105616-3609-3-git-send-email-matthieu.castet@parrot.com>	
	<1309248031.23597.45.camel@sauron>
	<1309248214.23597.47.camel@sauron>
In-Reply-To: <1309248214.23597.47.camel@sauron>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy a écrit :
> On Tue, 2011-06-28 at 11:00 +0300, Artem Bityutskiy wrote:
>> On Sun, 2011-06-26 at 18:26 +0200, Matthieu CASTET wrote:
>>> +/**
>>> +  * This is call after sending a read command, or for autoincrement
>>> +  * chip that need it (!NAND_NO_READRDY).
>>> +  *
>>> +  * We can't call NAND_CMD_STATUS here, because the read command
>>> +  * is not finished
>>> +  */
>>> +static void nand_wait_read(struct mtd_info *mtd, struct nand_chip *chip)
>>> +{
>>> +	/*
>>> +	 * If we don't have access to the busy pin, we apply the given
>>> +	 * command delay
>>> +	 */
>>> +	if (!chip->dev_ready) {
>>> +		udelay(chip->chip_delay);
>>> +	}
>>> +	else {
>>> +		/* Apply this short delay always to ensure that we do wait tWB in
>>> +		 * any case on any machine. */
>>> +		ndelay(100);
>> Please, all these hard-coded numbers should be hidden in the specific
>> driver.
> 
> Or could you please explain a bit better why this delay has to be part
> of nand core? And why it is 100 and not 200?
> 
This delay is already in the nand core. I only put it in a common function :

> -	/* Apply this short delay always to ensure that we do wait tWB in
> -	 * any case on any machine. */
> -	ndelay(100);
> -
> -	nand_wait_ready(mtd);
> +	/* This applies to read commands */
> +	nand_wait_read(mtd, chip);
>  }

> -
> -	/* Apply this short delay always to ensure that we do wait tWB in
> -	 * any case on any machine. */
> -	ndelay(100);
> -
> -	nand_wait_ready(mtd);
> +	/* This applies to read commands */
> +	nand_wait_read(mtd, chip);
>  }


And I think it is 100 ns, because it is the worst case for tWB.


Matthieu
