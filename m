Received: from moutng.kundenserver.de ([212.227.126.183])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JjxXR-0001dh-76
	for linux-mtd@lists.infradead.org; Thu, 10 Apr 2008 14:14:05 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: joern@logfs.org
Subject: Re: [patch 4/15] fs/logfs/compr.c
Date: Thu, 10 Apr 2008 16:13:47 +0200
References: <20080401181308.512473173@logfs.org>
	<20080401181332.853833004@logfs.org>
In-Reply-To: <20080401181332.853833004@logfs.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200804101613.48465.arnd@arndb.de>
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 01 April 2008, joern@logfs.org wrote:
> +
> +static DEFINE_MUTEX(compr_mutex);
> +static struct z_stream_s stream;
> +

How much time is spent in the compression code? Would it be helpful
to have a percpu stream and do preempt_disable around it instead
of the mutex?

That would improve parallelism and cache-locality of the compression,
at the cost of adding a source of latency to preemptible kernels.

	Arnd <><
