Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Gm8zh-0004sH-3X
	for linux-mtd@lists.infradead.org; Mon, 20 Nov 2006 08:15:33 -0500
Message-ID: <4561AB83.3070001@dev.rtsoft.ru>
Date: Mon, 20 Nov 2006 16:20:03 +0300
From: Konstantin Baydarov <kbaidarov@dev.rtsoft.ru>
MIME-Version: 1.0
To: dedekind@infradead.org
Subject: Re: [PATCH] [MTD] BLOCK_RO: Readonly Block Device Layer Over MTD
References: <20061117184055.569da7ad@localhost.localdomain>	
	<1163855713.5597.70.camel@sauron>	
	<1163856784.20835.2.camel@zod.rchland.ibm.com>	
	<1163856955.5597.71.camel@sauron> <45619C60.7070400@ru.mvista.com>
	<1164026819.5597.88.camel@sauron>
In-Reply-To: <1164026819.5597.88.camel@sauron>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Vitaly Wool <vwool@ru.mvista.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
> On Mon, 2006-11-20 at 15:15 +0300, Vitaly Wool wrote:
> 
>>B/c it introduces new fields in generic mtd structures which are already 
>>overcomplicated, and modifies a lot of generic code. I'd expect that 
>>with this patch applied stuff like mtdcore.c and mtdpart.c becomes 
>>exposed to possible licensing issues which is definitely not what we aim ;-)
> 
> 
> I am talking about something like this:
> 
> http://lists.infradead.org/pipermail/linux-mtd/2004-May/009683.html
> 
> I do not see it introducing any new field.
> 

I realized it exactly the same way on top of readoly block device. 
Patch, you talking about, definitely needs #ifdef-s and it waste kernel 
RAM statically allocating block_map, block_top, block_scantop 
MAX_MTD_DEVICES times :-).
