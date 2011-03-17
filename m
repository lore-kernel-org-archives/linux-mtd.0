Received: from ebb05.tieto.com ([131.207.168.36])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q08ki-0004Rx-RQ
	for linux-mtd@lists.infradead.org; Thu, 17 Mar 2011 08:40:17 +0000
Message-ID: <4D81CB3E.9030001@tieto.com>
Date: Thu, 17 Mar 2011 16:50:06 +0800
From: Yang Rui Rui <ruirui.r.yang@tieto.com>
MIME-Version: 1.0
To: "Artem.Bityutskiy@nokia.com" <Artem.Bityutskiy@nokia.com>
Subject: Re: [PATCH 02/02] force module loaded with partitions set
References: <20110314015148.GA6827@darkstar>	
	<1300092195.2727.4.camel@localhost> <4D7DD878.5090903@tieto.com>	
	<1300092812.2727.9.camel@localhost> <4D7DDC19.6080404@tieto.com>
	<1300095199.2727.10.camel@localhost>
In-Reply-To: <1300095199.2727.10.camel@localhost>
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

On 03/14/2011 05:33 PM, Artem Bityutskiy wrote:
> On Mon, 2011-03-14 at 17:12 +0800, Yang Rui Rui wrote:
>>> I think you should rather re-work the framework a bit and make the
>>> "->add_mtd()" call-back return an integer error code. Then we could just
>>> return errors on error and prevent the module from being loaded.
>>>
>>
>> I'm thinking is it possible to pass partitions param later? ie. use sysfs attribute?
>
> It may be possible, but would probably require some work.
>

mainline mtd & mtd_blkdev changes a lot since 2.6.32, but there's no
way for me to test with linux-mtd tree due to lack real hardware.

work on this with 2.6.32 seems not so necessary,
So I think I will give up, sorry about that.

-- 
Thanks
Yang Ruirui
