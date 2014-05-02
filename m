Received: from mail-de.keymile.com ([195.8.104.250])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WgEpb-00044c-GZ
 for linux-mtd@lists.infradead.org; Fri, 02 May 2014 14:52:59 +0000
Message-ID: <5363B12C.2040807@keymile.com>
Date: Fri, 02 May 2014 16:52:28 +0200
From: Valentin Longchamp <valentin.longchamp@keymile.com>
MIME-Version: 1.0
To: Mark Marshall <markmarshall14@gmail.com>, linux-spi@vger.kernel.org
Subject: Re: Possible race condition when accessing SPI NOR Flash ?
References: <53623597.8040909@keymile.com>
 <CAD4b4WJCqeg5=Yi6=gd8k5N_OoqGtcZiPOhWn_tK7Jevnxhjfw@mail.gmail.com>
In-Reply-To: <CAD4b4WJCqeg5=Yi6=gd8k5N_OoqGtcZiPOhWn_tK7Jevnxhjfw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: "Brunck, Holger" <Holger.Brunck@keymile.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Bigler,
 Stefan" <Stefan.Bigler@keymile.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Mark,

On 05/02/2014 01:40 PM, Mark Marshall wrote:
> Hi.
> 
> I now fell a bit guilty.  I had this same problem a while ago, and I
> haven't ever really pushed the fix.  In fact, I ended up rewriting
> most of drivers/spi/spi-fsl-espi.c, and that's really the problem - I
> can only test about two boards from over 20, so I know that nobody
> will take my complete re-write seriously, and I sort of lost interest.

Don't feel guilty at all. Even though I have suffered a bit to isolate the
problem, your answer has already helped a lot: with your proposed fix, I have
not been able to reproduce the error anymore.

> 
> But, the bug you are hitting is actually much simpler to fix than
> that.  If you look in drivers/spi/spi-fsl-espi.c, there is a function
> called fsl_espi_cmd_trans.  There are two important things to note
> about this function; 1) It does a 64K kmalloc for every transfer
> (thanks).  2) It overwrites the buffer if the transfer size is large.
> 
> It packs the TX command into the start of the 64K block and sets up a
> TX pointer to the start of that block.  It then points the RX pointer
> to be after the TX command.  This is completely wrong.  The RX pointer
> should also be set to point to the start of the block.
> 
> In the failing case, you are probably doing a 64K read from the Flash.
>  We will have a 5 or 6 byte command followed by 65531 bytes of TX data
> (the value of the TX data does not matter).  The driver will then TX
> the command followed by the data and simultaneously it will RX the
> "command" and the data that we want (the value of stuff RX'd when we
> are TX'ing the command is ignored / irrelevant).  The point is that
> the last few bytes of data the we receive go after the end of the 64K
> block that we have allocated.
> 
> I found that I got similar kernel panics to you.  Basically we are
> overwriting 5 random bytes of kernel memory at the start of a page.
> 
>         espi_trans->tx_buf = local_buf;
> -       espi_trans->rx_buf = local_buf + espi_trans->n_tx;
> +       espi_trans->rx_buf = local_buf;
>         fsl_espi_do_trans(m, espi_trans);
> 
> So, something like this would be a fix.  This is untested.

As I have said above, this fixes the problem for me (as far as I have had time
to test it until now, I will go on in the next days).

> 
> I hope this helps, and I'm sorry that I've not pushed this before.  If
> people want I'll try to produce a proper fix, but I currently using an
> oldish kernel (3.2.10), and don't really want to try to build a newer
> one.  I've only got limited freescale test hardware (P1010RDB &
> P2020RDB).

If you don't feel like sending a patch because of the above reasons, I will
happily submit one (just to avoid a third person to be struck by it ;-) ). If
you want to submit one, just put me on CC and I will happily test it on P2041RDB
and and our P2041 based system on a newer kernel.

Thank you very much & best Regards

Valentin

> 
> Regards,
> 
> Mark.
> 

[snip]

>>
>> Notice that this does not necessarily happen in fw_setenv itself, but rather in
>> the next "task" that tries to allocate/free some virtual memory.
>>
>> I see the same behavior with both the 2013.10 and the 2014.04 releases of
>> u-boot/fw_env. The kernel we are using is 3.10.36.
>>
>> I suspect that the problem is related to SPI NOR/m25p80 driver: on the system we
>> have a NAND Flash device with UBI volumes. If I create 2 ubi volumes on the NAND
>> Flash and configure fw_setenv (/etc/fw_env.config) to use them instead of the
>> the mtd devices targetting the s25fl256s1, I am not able to reproduce the
>> problem, even over more than 10'000 runs.
>>
>> I suspect that it is a race condition because it happens ~1 out of 100 times
>> and if I disable SMP in the kernel I am never able to reproduce the problem.
>>
>> Finally, after having analyzed the fw_env behavior, I have tried to write a very
>> silly program that mimics the fw_env mtd accesses in my use case (attached with
>> this email) and I am able to reproduce the problem with it.
>>
>> One other possible culprit that I see is the fsl_espi.c driver for the
>> underlying hardware connection from the CPU to the NOR Flash, but I wanted to
>> ask here if someone had an idea about what's going wrong.
>>
