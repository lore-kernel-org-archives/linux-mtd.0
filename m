Date: Wed, 17 Oct 2007 18:00:57 +0100 (BST)
From: Alexey Korolev <akorolev@infradead.org>
To: Nicolas Pitre <nico@cam.org>
Subject: Re: Recursion in CFI driver. Is it really necessary to have.
In-Reply-To: <alpine.LFD.0.9999.0710151534180.19446@xanadu.home>
Message-ID: <Pine.LNX.4.64.0710171749520.17490@pentafluge.infradead.org>
References: <Pine.LNX.4.64.0710121547550.21455@pentafluge.infradead.org>
	<alpine.LFD.0.9999.0710121112450.19446@xanadu.home>
	<Pine.LNX.4.64.0710151552170.1863@pentafluge.infradead.org>
	<alpine.LFD.0.9999.0710151534180.19446@xanadu.home>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi
>
> One issue: you now force the resettime behavior for every cases.  Should
> we care?

Yes you are right. This message is for debugging purposes. I would not care becuase it is hard to make code beauty and keep this debuging print.

> Also some style issues:
>
>> @@ -709,6 +709,23 @@
>>  		spin_unlock(&shared->lock);
>>  	}
>>
>> +	ret = chip_ready(map, chip, adr, mode);
>> +	if (ret == -EAGAIN)
>> +		goto retry;
>> +
>> +
>> +	return ret;
>> +}
>
> One blank line too many above.
>
>> +
>> +static int chip_ready (struct map_info *map, struct flchip *chip, unsigned
>> long adr, int mode)
>> +{
>
> You'll have to add a prototype for that function which is called before
> its definition.
>

Oh thank you! I will correct it and create a new thread for the patch.

Thanks,
Alexey
