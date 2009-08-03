Message-ID: <4A768677.4030100@nokia.com>
Date: Mon, 03 Aug 2009 09:40:55 +0300
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: Kyungmin Park <kmpark@infradead.org>
Subject: Re: UBIFS abnormal unaligned access at OneNAND 4KiB page
References: <9c9fda240908022235l4b50f154jab11f4224412d472@mail.gmail.com>	
	<4A7683C2.9070005@nokia.com>
	<9c9fda240908022334q3e64037co604fb126559cdf82@mail.gmail.com>
In-Reply-To: <9c9fda240908022334q3e64037co604fb126559cdf82@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "Bityutskiy Artem \(Nokia-D/Helsinki\)" <Artem.Bityutskiy@nokia.com>,
	linux-mtd Mailing List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Kyungmin Park wrote:
> On Mon, Aug 3, 2009 at 3:29 PM, Adrian Hunter<adrian.hunter@nokia.com> wrote:
>> Kyungmin Park wrote:
>>> Now I'm working with 4KiB pagesize OneNAND, I got problem with
>>> unaligned byte align again.
>>>
>>> <7>UBIFS DBG (pid 1): read_znode: LEB 78:205824, level 0, 8 branch
>>> <7>UBIFS DBG (pid 1): ubifs_read_node: LEB 78:206016, indexing node,
>>> length 48
>>> onenand_mlc_read_ops_nolock[1108] buf c41bda80 1216 48
>>> <7>UBIFS DBG (pid 1): read_znode: LEB 78:206016, level 0, 1 branch
>>> onenand_mlc_read_ops_nolock[1108] buf c40a68c0 441 13
>>> onenand_read_bufferram[674] area 0x400, buffer c40a68c0, offset 441, count
>>> 13
>>> <1>Unhandled fault: external abort on non-linefetch (0x1008) at 0xc58805ba
>>>
>>> In the previous time, we got the similar case. but the problem gone
>>> with some patch. but it happens again.
>>>
>>> Do you have any idea?
>> It is up to your driver to meet your bus requirements.  If the bus requires
>> word (2 bytes) aligned accesses then you must check the alignment in the
>> driver and read the ends words separately.
> 
> It's onenand_base.c. Only change is page size is 4KiB. others are same.
> 
>> UBIFS does make unaligned reads to the LPT e.g. reading 13 bytes at offset
>> 441
> 
> I think so. but now I got the these unaligned reads.
> That's mystery

Well, onenand_read_bufferram seems to check only the 'count', not the 'offset'

Also perhaps the alignment is 32-bits?
