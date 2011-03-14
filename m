Received: from ebb05.tieto.com ([131.207.168.36])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pz3Rr-0006MF-By
	for linux-mtd@lists.infradead.org; Mon, 14 Mar 2011 08:48:20 +0000
Message-ID: <4D7DD89B.9020204@tieto.com>
Date: Mon, 14 Mar 2011 16:58:03 +0800
From: Yang Rui Rui <ruirui.r.yang@tieto.com>
MIME-Version: 1.0
To: "Artem.Bityutskiy@nokia.com" <Artem.Bityutskiy@nokia.com>
Subject: Re: [PATCH 01/02] mtdswap: kill strip error handling option
References: <20110314015056.GA6819@darkstar>
	<1300091998.2727.3.camel@localhost>
In-Reply-To: <1300091998.2727.3.camel@localhost>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Yang Ruirui R <ruirui.r.yang@tietoenator.com>,
	"ext-phil.2.carmody@nokia.com" <ext-phil.2.carmody@nokia.com>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"ext-jani.1.nikula@nokia.com" <ext-jani.1.nikula@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/14/2011 04:39 PM, Artem Bityutskiy wrote:
> On Mon, 2011-03-14 at 09:50 +0800, Yang Ruirui wrote:
>> From: Yang Ruirui<ruirui.r.yang@tieto.com>
>>
>> As Artem Bityutskiy's suggestion, The strict erase error handling option
>> does not make much sense.
>
> Well, I does make sense, but we just have no prove it is any useful,
> this is why I suggested to kill it.
>
>>
>> Here kill the option, and still keep the retry times as before.
>>
>> Signed-off-by: Yang Ruirui<ruirui.r.yang@tieto.com>
>> ---
>>   drivers/mtd/Kconfig   |    8 --------
>>   drivers/mtd/mtdswap.c |    8 +-------
>>   2 files changed, 1 insertion(+), 15 deletions(-)
>
> Thank, I've amended the commit message and pushed to my l2-mtd-2.6.git
> tree.

Thanks about that.

>
> Artem.
>


-- 
Thanks
Yang Ruirui
