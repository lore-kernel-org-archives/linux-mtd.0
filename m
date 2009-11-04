Received: from isilmar.linta.de ([213.133.102.198] helo=linta.de)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N5auK-0007om-V1
	for linux-mtd@lists.infradead.org; Wed, 04 Nov 2009 08:08:02 +0000
Date: Wed, 4 Nov 2009 09:07:54 +0100
From: Dominik Brodowski <linux@dominikbrodowski.net>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: pcmcia tree build failure
Message-ID: <20091104080754.GA27784@isilmar.linta.de>
References: <20091104131540.f39af556.sfr@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20091104131540.f39af556.sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Stephen,

On Wed, Nov 04, 2009 at 01:15:40PM +1100, Stephen Rothwell wrote:
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> drivers/telephony/ixj_pcmcia.c: In function 'ixj_probe':
> drivers/telephony/ixj_pcmcia.c:35: error: 'link' undeclared (first use in this function)
> 
> Caused by commit 990c0c8eeb34f62d062052d462feaa99715cb043 ("pcmcia: use
> dynamic debug infrastructure, deprecate CS_CHECK (misc drivers)").
> 
> I have used the version of the pcmcia tree from next-20091102 for today.
> Please build test.  :-(

Thanks -- fixed both issues (build failure and test setup).

Best,
	Domiik
