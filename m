Received: from [202.177.17.107] (helo=donut.udomain.com.hk)
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A5LDY-00074C-Ff
	for <linux-mtd@lists.infradead.org>; Fri, 03 Oct 2003 09:23:16 +0100
Message-ID: <3F7D31B7.7020400@hectrix.com>
Date: Fri, 03 Oct 2003 16:22:15 +0800
From: Selwyn Tang <selwyn@hectrix.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <Law15-F74mSknvh7wFI000062b3@hotmail.com>
	<3F7CD9CA.5090805@hectrix.com> <1065160480.16088.0.camel@imladris.demon.co.uk>
In-Reply-To: <1065160480.16088.0.camel@imladris.demon.co.uk>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: high cpu usage using nftl for DOC2000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Dave,

On 10/03/2003 01:54 PM, David Woodhouse wrote:
> Boot with 'profile=1' and use readprofile to see where it's spending all
> the CPU time. Note your driver must be built-in to the kernel for this.

The followings, among others, are reported by readprofile:

  147 handle_IRQ_event			1.5978
   17 ide_outb				1.4167
 3288 _DoC_Delay			32.8800
 6634 __rdtsc_delay			236.9286

I don't know how to interpret them :-)

Selwyn
