From: David Woodhouse <dwmw2@infradead.org>
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
In-Reply-To: <4174E7D3.9050706@inf.u-szeged.hu>
References: <417156E1.9000009@yandex.ru> <4173AFAE.6060303@inf.u-szeged.hu>
	<4173B404.6040100@yandex.ru> <4174C8EF.50604@inf.u-szeged.hu>
	<4174D508.8050508@yandex.ru>  <4174E7D3.9050706@inf.u-szeged.hu>
Content-Type: text/plain
Message-Id: <1098180892.13633.1079.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 19 Oct 2004 11:14:52 +0100
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 compression
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-10-19 at 12:09 +0200, Ferenc Havasi wrote:
> Hi Artem,
> 
> > Just wonder, why the compression mode is the global variable 
> > (jffs2_get_compression_mode, defined in compr.c). Theoretically, it 
> > should be the attribute of superblock (in this case it would be possible 
> > to have several JFFS2 filesystems with different compression modes).
> 
> Now the compression mode is a global thing. It can be configured by 
> kernelconfig and is the same for every filesystem. There is no reserved 
> space to store it in the different JFFS2 filesystems (it should need a 
> new type of node or something like that).
> 
> There is plans for the future. One of them: there will be "compression 
> configurations". This is much more general thing than compression mode. 

Increasingly, I think I'd like to see the compression code taken out of
JFFS2 and moved somewhere where other things in the kernel can use it.
While we had only a few local hacks it made a certain amount of sense
for it to be kept private, but now it's getting a lot more useful, I
don't think it should be limited to JFFS2.

We should probably plug it in using the crypto API or something similar.
There's not a _huge_ amount of difference between compression routines
and crypto routines. 

-- 
dwmw2
