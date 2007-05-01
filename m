Received: from agminet01.oracle.com ([141.146.126.228])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HiyUo-0001xR-Ng
	for linux-mtd@lists.infradead.org; Tue, 01 May 2007 15:58:48 -0400
Date: Tue, 1 May 2007 13:00:05 -0700
From: Randy Dunlap <randy.dunlap@oracle.com>
To: Richard Purdie <rpurdie@openedhand.com>
Subject: Re: [PATCH 2/5] jffs2: Add LZO compression support to jffs2
Message-Id: <20070501130005.57ae0b49.randy.dunlap@oracle.com>
In-Reply-To: <1178030823.5883.54.camel@localhost.localdomain>
References: <1178030823.5883.54.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-crypto@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	LKML <linux-kernel@vger.kernel.org>, herbert@gondor.apana.org.au
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 01 May 2007 15:47:03 +0100 Richard Purdie wrote:

> Add LZO1X compression/decompression support to jffs2.
> 
> LZO's interface doesn't entirely match that required by jffs2 so a
> buffer and memcpy is unavoidable.
> 
> Signed-off-by: Richard Purdie <rpurdie@openedhand.com>
> ---
> 
> diff --git a/fs/Kconfig b/fs/Kconfig
> index a42f767..1645dfa 100644
> --- a/fs/Kconfig
> +++ b/fs/Kconfig
> @@ -1310,6 +1310,16 @@ config JFFS2_ZLIB
>  
>            Say 'Y' if unsure.
>  
> +config JFFS2_LZO
> +	bool "JFFS2 LZO compression support" if JFFS2_COMPRESSION_OPTIONS
> +	select LZO
> +	depends on JFFS2_FS
> +	default y
> +        help
> +          minilzo-based compression. Generally works better than Zlib.
> +
> +          Say 'Y' if unsure.

Use <tab> on the "help" line (instead of spaces) and
use <tab><space><space> on the help text lines.

>  config JFFS2_RTIME
>  	bool "JFFS2 RTIME compression support" if JFFS2_COMPRESSION_OPTIONS
>  	depends on JFFS2_FS

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
