Received: from mail.grid-net.com ([97.65.115.2])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1POaFV-0007b9-85
	for linux-mtd@lists.infradead.org; Fri, 03 Dec 2010 18:20:50 +0000
Message-ID: <4CF93500.8050108@grid-net.com>
Date: Fri, 03 Dec 2010 10:20:48 -0800
From: Steve Iribarne <siribarne@grid-net.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: bud_replay size question
References: <4CF691F0.9010607@grid-net.com>	
	<1291392477.2365.64.camel@localhost>
	<1291392874.2365.67.camel@localhost>
In-Reply-To: <1291392874.2365.67.camel@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
> On Fri, 2010-12-03 at 18:07 +0200, Artem Bityutskiy wrote:
>> Alternatively, you can try to look at all UBIFS allocations. I will not
>> be surprized if it allocates some buffers which are not really neaded in
>> R/O mode, although we did do some work to allocate less resources when
>> we are in R/O mode. You can experiment in Linux, because it is easier,
>> and if you find unneeded buffers, fix this, and then port your changes
>> to u-boot.
> 
> And you can try to look at UBI - in R/O mode we probably need less than
> we allocate, but again dunno for sure, should be checke.
> 
Once I get this release out the door I will play around with this and 
report back.

-stv

-- 
Steve Iribarne
Sr. Software Engineer
Embedded Devices
