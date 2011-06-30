Subject: Re: [PATCH] mtd: OneNAND: samsung: Write DMA support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Date: Thu, 30 Jun 2011 13:45:31 +0300
In-Reply-To: <20110630091951.GQ21898@n2100.arm.linux.org.uk>
References: <20110608101804.GA5527@july> <1309420530.23597.153.camel@sauron>
	<20110630091951.GQ21898@n2100.arm.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1309430735.23597.165.camel@sauron>
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Kyungmin Park <kmpark@infradead.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Thu, 2011-06-30 at 10:19 +0100, Russell King - ARM Linux wrote:
> Which is that this code is trying to work around the restriction in the
> DMA API that dma_map_single() can only take virtual addresses in the
> kernel direct mapped region.

OK.

> The key thing here is that with CPUs which lookup by virtual address,
> like ARMs, you _must_ handle the cache aliases associated with the mapping
> which you are accessing the memory via.
> 
> This means if you are accessing a DMA buffer at address X, and address X
> is cacheable, address X needs cache maintainence performed on it.  Address
> Y, which may correspond with the same memory as X through a different
> mapping is no good.  It has to be X.

Jut to make sure I understand the issue (I am not good at all in this
stuff, this is why I CCed the arm ML):

* if I vmalloc a buffer, I and up with physical memory which has 2
mappings - X which is the direct kernel mapping and Y, which is the
vmalloc mapping.
* The DMA API takes care only about direct mapping in terms of CPU cache
flushing and invalidating. The vmalloc mapping is not taken care of.

And this may cause memory corruptions.

Correct?

> However, there is NO API for mapping DMA buffers from vmalloc space.
> What we do now have are a pair of functions which must be used _correctly_
> (iow, one before and one after) to ensure that virtual cached architectures
> can access the data correctly - and its documented at the bottom of
> cachetlb.txt.

OK, so you do not say it is fundamentally impossible to DMA vmalloc'ed
memory, it is just that no one bothered to invent an API for this.

> As this is something which keeps coming up in connection with MTD, it
> may be a good idea if MTD gave driver authors a helping hand with DMA
> setup/teardown so that the chances of driver authors getting this right
> is greater...

Yes, or the MTD community may push back all hacks and force someone to
invent the API...

Am I right that if we add a helper function which flushes and
invalidates CPU caches for the vmalloc mapping, and then calls the DMA
API function which will take care of the direct mapping, we should be
fine?

Thanks!

P.S.: we really need to document this issue somewhere - either on the
MTD web site or in Documentation/dma-vmalloced-memory.txt.

-- 
Best Regards,
Artem Bityutskiy
