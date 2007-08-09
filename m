Date: Thu, 9 Aug 2007 01:19:13 +0100
From: Christoph Hellwig <hch@infradead.org>
To: J??rn Engel <joern@logfs.org>
Subject: Re: [Patch 18/18] include/linux/Kbuild
Message-ID: <20070809001913.GA10044@infradead.org>
References: <20070808161234.GB15319@lazybastard.org>
	<20070808162447.GT15319@lazybastard.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20070808162447.GT15319@lazybastard.org>
Cc: akpm@osdl.org, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 08, 2007 at 06:24:47PM +0200, J??rn Engel wrote:
> --- linux-2.6.21logfs/include/linux/Kbuild~logfs	2007-08-08 02:57:37.000000000 +0200
> +++ linux-2.6.21logfs/include/linux/Kbuild	2007-08-08 02:57:37.000000000 +0200
> @@ -101,6 +101,7 @@ header-y += jffs2.h
>  header-y += keyctl.h
>  header-y += limits.h
>  header-y += lock_dlm_plock.h
> +header-y += logfs.h

That file doesn't define any kind of user<->kernel interface and thus should
not be exported.
