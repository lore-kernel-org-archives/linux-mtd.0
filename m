Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Gm83b-0003b4-Fg
	for linux-mtd@lists.infradead.org; Mon, 20 Nov 2006 07:15:42 -0500
Message-ID: <45619C60.7070400@ru.mvista.com>
Date: Mon, 20 Nov 2006 15:15:28 +0300
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: dedekind@infradead.org
Subject: Re: [PATCH] [MTD] BLOCK_RO: Readonly Block Device Layer Over MTD
References: <20061117184055.569da7ad@localhost.localdomain>	<1163855713.5597.70.camel@sauron>	<1163856784.20835.2.camel@zod.rchland.ibm.com>
	<1163856955.5597.71.camel@sauron>
In-Reply-To: <1163856955.5597.71.camel@sauron>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, kbaidarov <kbaidarov@dev.rtsoft.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
> On Sat, 2006-11-18 at 07:33 -0600, Josh Boyer wrote:
>   
>> Because we've consistently told people not to do that.
>>     
>
> OK, but why ?
>
>   
B/c it introduces new fields in generic mtd structures which are already 
overcomplicated, and modifies a lot of generic code. I'd expect that 
with this patch applied stuff like mtdcore.c and mtdpart.c becomes 
exposed to possible licensing issues which is definitely not what we aim ;-)

Vitaly
