Received: from mika.eatserver.nl ([195.20.9.75])
	by casper.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q2f4j-00041G-4T
	for linux-mtd@lists.infradead.org; Thu, 24 Mar 2011 07:35:21 +0000
Message-ID: <4D8AF428.5010000@aimvalley.nl>
Date: Thu, 24 Mar 2011 08:35:04 +0100
From: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
MIME-Version: 1.0
To: Detlev Zundel <dzu@denx.de>, yanok@emcraft.com
Subject: Re: [RFC] Handling of errors for AMD NOR (cfi_cmdset_0002) chips
References: <4D797E23.6070409@emcraft.com> <4D79DC90.6070600@aimvalley.nl>
	<m27hbpyh36.fsf@ohwell.denx.de>
In-Reply-To: <m27hbpyh36.fsf@ohwell.denx.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
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

On 03/23/11 16:47, Detlev Zundel wrote:
> Hi Norbert,
>
>> What issue you have with NOR flash and UBIFS ?
>
> We're still working on the issue initially reported by Anatolij here:
>
> http://thread.gmane.org/gmane.linux.drivers.mtd/33832
>
> Cheers
>    Detlev
>


ok, thanks.

But the unstable bit problem is different from software timeout
related issues regarding UBI and NOR flash the OP mentioned.
It is anyway good to hear work is in progress here.

I asked about the software timeout issue because I've seen false
timeouts with powerpc + CONFIG_NO_HZ a while ago.
In my case the low-level do_write_buffer (cfi_cmdset_0002.c) timed
out too early. See
http://lkml.org/lkml/2009/9/3/84

---
N. van Bolhuis.
