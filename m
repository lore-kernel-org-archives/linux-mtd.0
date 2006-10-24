Received: from agminet01.oracle.com ([141.146.126.228])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GcOCm-0002rF-AT
	for linux-mtd@lists.infradead.org; Tue, 24 Oct 2006 11:28:54 -0400
Message-ID: <453E315B.8090801@oracle.com>
Date: Tue, 24 Oct 2006 08:29:31 -0700
From: "Randy.Dunlap" <randy.dunlap@oracle.com>
MIME-Version: 1.0
To: Ben Dooks <ben@fluff.org>
Subject: Re: [PATCH] MTD: fix printk format warning
References: <20061023214826.d54fc7c6.randy.dunlap@oracle.com>
	<1161681850.3260.167.camel@sauron>
	<20061024100245.GA21695@home.fluff.org>
In-Reply-To: <20061024100245.GA21695@home.fluff.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: akpm <akpm@osdl.org>, dwmw2@infradead.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ben Dooks wrote:
> On Tue, Oct 24, 2006 at 12:24:10PM +0300, Artem Bityutskiy wrote:
>> On Mon, 2006-10-23 at 21:48 -0700, Randy Dunlap wrote:
>>> (may be a gcc phenomenon)
>>> Fix printk format warning:
>>> drivers/mtd/maps/physmap.c:93: warning: long long unsigned int format, long unsigned int arg (arg 2)
>>>
>>> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
>> ... snip ...
>>
>>>       	printk(KERN_NOTICE "physmap platform flash device: %.8llx at %.8llx\n",
>>> -	    (unsigned long long)dev->resource->end - dev->resource->start + 1,
>>> +	    (unsigned long long)(dev->resource->end - dev->resource->start + 1),
>>>  	    (unsigned long long)dev->resource->start);
>> Hmm, AFAIK
>>
>> "(unsigned long) dev->resource->end - dev->resource->start + 1" should 
> 
> I thought that 'z' was the modifier to %x for resources?

Maybe you are thinking of 'z' for use with size_t ?  From the C99 spec:

z  Specifies that a following d, i, o, u, x, or X conversion specifier applies to a
size_t or the corresponding signed integer type argument; or that a
following n conversion specifier applies to a pointer to a signed integer type
corresponding to size_t argument.  But a resource_size_t is not a size_t.
Depending on CONFIG, it's either:

#ifdef CONFIG_RESOURCES_64BIT
typedef u64 resource_size_t;
#else
typedef u32 resource_size_t;
#endif

which I suppose is what Artem missed.  I.e., it's not always unsigned long.
However, I won't deny that gcc seems odd here.

-- 
~Randy
