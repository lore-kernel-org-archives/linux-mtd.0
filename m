Received: from smtp-vbr6.xs4all.nl ([194.109.24.26])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MarG2-0006f0-Vh
	for linux-mtd@lists.infradead.org; Tue, 11 Aug 2009 13:19:25 +0000
Message-ID: <4A816FD2.4090407@aimvalley.nl>
Date: Tue, 11 Aug 2009 15:19:14 +0200
From: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: error cross compiling ubi-utils
References: <4A6FFFEE.9070108@aimvalley.nl> <4A7E7B6E.2050808@gmail.com>
In-Reply-To: <4A7E7B6E.2050808@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
>> I guess mtd-utils/include/mtd/ubi-media.h should use __u64/__u32/__u16 ?
> 
> I believe new kernels export these types via their headers, and you just
> have an old kernel. You could try to make mtd-utils be independent of
> these types.
> 


You're right.
I didn't realize my "../sys-include/asm/types.h" comes from
linux-libc-headers-2.6.12.0(/include/asm-ppc/types.h).
I guess I should've used more recent kernel headers when building my CDE.
