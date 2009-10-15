Received: from vega.surpasshosting.com ([72.29.83.9])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MyPll-0003iD-Tl
	for linux-mtd@lists.infradead.org; Thu, 15 Oct 2009 12:49:30 +0000
Message-ID: <4AD71A40.1090402@embedded-sol.com>
Date: Thu, 15 Oct 2009 14:49:04 +0200
From: Felix Radensky <felix@embedded-sol.com>
MIME-Version: 1.0
To: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
Subject: Re: UBIFS problem on MPC8536DS
References: <4AD5ADC9.30503@embedded-sol.com> <4AD6F172.6030407@aimvalley.nl>
In-Reply-To: <4AD6F172.6030407@aimvalley.nl>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, Norbert

Norbert van Bolhuis wrote:
> Hi Felix,
>
> do you have CONFIG_NO_HZ defined ?
>
> I've seen similar problems with powerpc + CONFIG_NO_HZ. In my case the 
> low-level
> do_write_buffer (cfi_cmdset_0002.c) timed out too early. See
> http://lkml.org/lkml/2009/9/3/84
>
> Maybe in your case it's the do_erase_chip timing out too early.
>
> ---
> NvBolhuis.
>
Thanks for suggestion.

I have CONFIG_NO_HZ defined, but disabling it doesn't help.
I my case timeouts occur in NAND driver, fsl_elbc_nand.c

Felix.
