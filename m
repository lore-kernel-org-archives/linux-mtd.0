From: David Woodhouse <dwmw2@infradead.org>
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
In-Reply-To: <41762CF9.9030501@inf.u-szeged.hu>
References: <417156E1.9000009@yandex.ru> <4173AFAE.6060303@inf.u-szeged.hu>
	<4173B404.6040100@yandex.ru> <4174C8EF.50604@inf.u-szeged.hu>
	<4174D508.8050508@yandex.ru> <4174E7D3.9050706@inf.u-szeged.hu>
	<1098180892.13633.1079.camel@hades.cambridge.redhat.com>
	<41762CF9.9030501@inf.u-szeged.hu>
Content-Type: text/plain
Message-Id: <1098263785.3872.31.camel@baythorne.infradead.org>
Mime-Version: 1.0
Date: Wed, 20 Oct 2004 10:16:25 +0100
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

On Wed, 2004-10-20 at 11:16 +0200, Ferenc Havasi wrote:
> David Woodhouse wrote:
> 
> > We should probably plug it in using the crypto API or something similar.
> > There's not a _huge_ amount of difference between compression routines
> > and crypto routines. 
> 
> Yes, I agree with you. I will look after how cryto API works and think 
> over the differences between crypt and compression. It whould be also 
> nice to collect some really well working public compressor modul.

Thanks. Separating the compression stuff out from JFFS2 will also make
me less unhappy about the fact that some of it is only GPL'd and not
compatible with the eCos licence.

-- 
dwmw2
