Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FQnXf-0002Sz-Cv
	for linux-mtd@lists.infradead.org; Tue, 04 Apr 2006 11:34:07 -0400
Date: Tue, 4 Apr 2006 17:33:54 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Richard Purdie <richard@openedhand.com>
Message-ID: <20060404153354.GD25130@wohnheim.fh-wedel.de>
References: <1144163888.6441.48.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1144163888.6441.48.camel@localhost.localdomain>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC/testing] Upgrade the zlib_inflate library code to a
	recent version
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 4 April 2006 16:18:08 +0100, Richard Purdie wrote:
> 
> Upgrade the zlib_inflate implementation in the kernel from a patched
> version 1.1.3 to a patched 1.2.3. 

s/1.1.3/1.1.4/

I once pulled all the bugfixes between the versions into the kernel.

> The code in the kernel is about seven years old and I noticed that the
> external zlib library's inflate performance was significantly faster
> (~50%) than the code in the kernel on ARM (and faster again on x86_32).
> 
> For comparison the newer deflate code is 20% slower on ARM and 50%
> slower on x86_32 but gives an approx 1% compression ratio improvement. I
> don't consider this to be an improvement for kernel use so have no plans
> to change the zlib_deflate code.
> 
> Various changes have been made to the zlib code in the kernel, the most
> significant being the extra functions/flush option used by ppp_deflate.
> This update reimplements the features PPP needs to ensure it continues
> to work.
> 
> This code has been tested on ARM under both JFFS2 (with zlib compression
> enabled) and ppp_deflate and on x86_32. JFFS2 sees an approx. 10% real
> world file read speed improvement.
> 
> This patch also removes ZLIB_VERSION as it no longer has a correct
> value. We don't need version checks anyway as the kernel's module
> handling will take care of that for us. This removal is also more in
> keeping with the zlib author's wishes
> (http://www.zlib.net/zlib_faq.html#faq24) and I've added something to
> the zlib.h header to note its a modified version.

Sounds good.

> +#if 0
> +int zlib_inflatePrime(z_streamp strm, int bits, int value)

Was this code dead in 1.2.3 as well?

> +#ifndef PKZIP_BUG_WORKAROUND

For the kernel, we can remove compat code against DOS compilers, etc.
In this particular case, I believe we can just consider data
compressed with PKZIP to be illegal and throw an error.

Overall the patch doesn't contain any obvious problems and seems to do
what you described.  If testing agrees as well, I'm all for merging
it.

Jörn

-- 
It is better to die of hunger having lived without grief and fear,
than to live with a troubled spirit amid abundance.
-- Epictetus
