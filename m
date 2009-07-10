Message-ID: <4A5737AA.7050208@gmail.com>
Date: Fri, 10 Jul 2009 15:44:26 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 2:2][MTD][NAND]omap : Adding DMA mode support in nand
	prefetch/post-write
References: <63362.192.168.10.89.1247226916.squirrel@dbdmail.itg.ti.com>	
	<1247227344.20721.363.camel@localhost.localdomain>
	<1247229621.29541.4.camel@macbook.infradead.org>
In-Reply-To: <1247229621.29541.4.camel@macbook.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
	david-b@pacbell.net, Tony Lindgren <tony@atomide.com>,
	linux-mtd@lists.infradead.org, vimal singh <vimalsingh@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse wrote:
> On Fri, 2009-07-10 at 15:02 +0300, Artem Bityutskiy wrote:
>> On Fri, 2009-07-10 at 17:25 +0530, vimal singh wrote:
>>> +	/* The fifo depth is 64 bytes. We have a sync at each frame and frame
>>> +	 * length is 64 bytes.
>>> +	 */
>>> +	int buf_len = len/64;
>> To optimize performance it is better not to rely on gcc and use <<
> 
> If you ever see gcc screwing up division of an 'int' by a constant 64,
> file a GCC bug.

I did see gcc generated division instruction instead of shift
instruction on x86 when the kernel is compiles with size optimization.
I think this is because it division instruction is shorter.

The exact place I we saw was the UBIFS binary search function, and
division by 2 was not compiled into a shift instruction.

So what I suggested is to use shift explicitly if this is wanted.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
