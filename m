Date: Fri, 9 May 2014 15:45:05 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/2] mtd: orion-nand: fix build error with ARMv4
Message-ID: <20140509184505.GA30330@arch.cereza>
References: <1399560433-1402630-1-git-send-email-arnd@arndb.de>
 <1399560990-1402858-1-git-send-email-arnd@arndb.de>
 <1399560990-1402858-4-git-send-email-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1399560990-1402858-4-git-send-email-arnd@arndb.de>
Cc: Jingoo Han <jg1.han@samsung.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08 May 04:56 PM, Arnd Bergmann wrote:
> orion_nand_read_buf uses an inline assembly with the "ldrd"
> instruction, which is only available from ARMv5 upwards. This
> used to be fine, since all users have an ARMv5 or ARMv7 CPU,
> but now we can also build a multiplatform kernel with ARMv4
> support enabled in addition to the "kirkwood" (mvebu) platform.
> 
> This provides an alternative to call the readsl() function that
> is supposed to have the same effect and is also optimized for
> performance.
> 
> This patch is untested, and it would be worthwhile to check
> if there is any performance impact, especially in case the readsl
> version is actually faster.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: Jingoo Han <jg1.han@samsung.com>
> Cc: linux-mtd@lists.infradead.org
> ---
>  drivers/mtd/nand/orion_nand.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/mtd/nand/orion_nand.c b/drivers/mtd/nand/orion_nand.c
> index dd7fe81..c7b5e8a 100644
> --- a/drivers/mtd/nand/orion_nand.c
> +++ b/drivers/mtd/nand/orion_nand.c
> @@ -56,6 +56,7 @@ static void orion_nand_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
>  		*buf++ = readb(io_base);
>  		len--;
>  	}
> +#if __LINUX_ARM_ARCH__ >= 5
>  	buf64 = (uint64_t *)buf;
>  	while (i < len/8) {
>  		/*
> @@ -68,6 +69,10 @@ static void orion_nand_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
>  		asm volatile ("ldrd\t%0, [%1]" : "=&r" (x) : "r" (io_base));
>  		buf64[i++] = x;
>  	}
> +#else
> +	readsl(io_base, buf, len/8);

I gave this a try in order to answer Arnd's performance question. First of all,
the patch seems wrong. I guess it's because readsl reads 4-bytes pieces, instead of
8-bytes.

This patch below is tested (but not completely, see below) and works:

diff --git a/drivers/mtd/nand/orion_nand.c b/drivers/mtd/nand/orion_nand.c
index dd7fe81..7a78cc5 100644
--- a/drivers/mtd/nand/orion_nand.c
+++ b/drivers/mtd/nand/orion_nand.c
@@ -52,6 +52,7 @@ static void orion_nand_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
 	uint64_t *buf64;
 	int i = 0;
 
+#if __LINUX_ARM_ARCH__ >= 5
 	while (len && (unsigned long)buf & 7) {
 		*buf++ = readb(io_base);
 		len--;
@@ -69,6 +70,14 @@ static void orion_nand_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
 		buf64[i++] = x;
 	}
 	i *= 8;
+#else
+	while (len && (unsigned long)buf & 3) {
+		*buf++ = readb(io_base);
+		len--;
+	}
+	readsl(io_base, buf, len/4);
+	i = (len / 4 * 4) * 4;
+#endif
 	while (i < len)
 		buf[i++] = readb(io_base);
 }

However, all the reads are nicely aligned (in both the buffer and the
length) which means the only 'read' performed in the readsl() one.

In other words, the patch is still half-untested. Therefore, and given
this is meant only to coherce a build, maybe we'd rather just loop over
readb and stay on the safe side?

And now, answering Arnd's question:

# Using ldrd
# time nanddump /dev/mtd5 -f /dev/null -q
real	0m 5.90s
user	0m 0.22s
sys	0m 5.67s

# Using readsl
# time nanddump /dev/mtd5 -f /dev/null -q
real	0m 6.39s
user	0m 0.17s
sys	0m 6.20s

So I'd say, let's stick to the ldrd magic.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
