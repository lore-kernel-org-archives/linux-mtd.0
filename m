Received: from [2002:c1ed:8229::1] (helo=baythorne.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bx04F-0001Rr-OV
	for linux-mtd@lists.infradead.org; Tue, 17 Aug 2004 05:15:44 -0400
From: David Woodhouse <dwmw2@infradead.org>
To: Ian Campbell <icampbell@arcom.com>
In-Reply-To: <1092731553.9001.18.camel@icampbell-debian>
References: <1092731553.9001.18.camel@icampbell-debian>
Content-Type: text/plain
Message-Id: <1092734138.3777.50.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Tue, 17 Aug 2004 10:15:38 +0100
Content-Transfer-Encoding: 7bit
Cc: Linux MTD Mailing List <linux-mtd@lists.infradead.org>
Subject: Re: MTD patches
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-08-17 at 09:32 +0100, Ian Campbell wrote:
> I've had a couple of patches to MTD sitting in my 2.6 tree for a while
> now and wonder if you would consider including them.

Thanks for these.

> mtd-redboot-partition-fixes.patch
> 
>         This patch has two parts. 
>         
>         The first is to factor out the offset to look at for the RedBoot
>         partition table into a variable. This has no impact on the code
>         as is, but makes it easier and clearer for platforms that have
>         the partition table at some other offset to wrap a #ifdef
>         CONFIG_ARCH_ around the variable rather than introducing errors
>         by cloning the whole master->read call.

Hmmm. Isn't this why we introduced an extra argument to the partition
parsers in the first place? The map code should be able to pass a
suitable argument, rather than having ifdefs in the parser code? Gary?

>         The second part looks for any partition name starting with
>         "RedBoot" rather than looking for "RedBoot\0". On my platform
>         RedBoot lives in a separate boot ROM, but the RedBoot config and
>         partition table are in the main flash so we can find them.

Seems reasonable.
        
> mtd-add_full.patch
>         
>         This patch adds a new api call add_mtd_device_full() that allows
>         a device to be added to a specific minor number (if it is
>         available).

Hmm. I don't like this much -- if you want stable device naming that's
what udev is for. I don't want to accept this before the equivalent for
fixed numbering of SCSI or IDE drives is accepted upstream. :)

> mtd-jedec-probe-parts
>         
>         This patch adds a few new part numbers to jedec_probe.c. They
>         are AMD AM29F002T, Hyundai HY29F002T and Macronix MX29FOO2T.

OK, please apply this -- you have CVS access don't you?

-- 
dwmw2
