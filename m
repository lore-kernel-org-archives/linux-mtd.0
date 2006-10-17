Received: from amanaus.varma-el.com ([195.144.240.154])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GZos7-0006Rc-Kn
	for linux-mtd@lists.infradead.org; Tue, 17 Oct 2006 09:20:50 -0400
Message-ID: <4534D8A5.7060206@varma-el.com>
Date: Tue, 17 Oct 2006 17:20:37 +0400
From: Andrey Volkov <avolkov@varma-el.com>
MIME-Version: 1.0
To: Andrea Galbusera <andrea.galbusera@teamware.it>
Subject: Re: JFFS2 on Lite5200
References: <1161081183.22948.58.camel@localhost.localdomain>
In-Reply-To: <1161081183.22948.58.camel@localhost.localdomain>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: dedekind@yandex.ru, linux-mtd@lists.infradead.org,
	linuxppc-embedded@ozlabs.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Andrea,

Andrea Galbusera wrote:
> Hello.
> 
> I'm currently using linux-2.6.16 from denx on a Lite5200 V2.0. I need to
> access a JFFS2 filesystem on the onboard flash ( 16MB Am29L652D ).
> 
> I see the flash using physmap driver and cmdline partitions.
> I experience a problem when creating files on JFFS2 with filename longer
> than a few characters. They appear to be created correctly with the
> content I want, but, after unmounting and remounting the filesystem they
> result unreadable and ls complains with "no such file or
> directory" (short-named files are ok).
--snip--

OMG, again same question,

Andrea, check ml archive, I already sent patch half-year ago
(http://ozlabs.org/pipermail/linuxppc-embedded/2006-April/022566.html)
Problem is in alignment/memcpy: JFFS2 code assumed that memory at
unaligned addresses could be touched, but access to an external MMIO
on MPC5200 _must_ be aligned (i.e. you could not read u32 from odd address).

P.S. Artem, I repeat, I sent this patch _HALF_YEAR_AGO_
how about to fix scan.c?

--
Regards
Andrey
