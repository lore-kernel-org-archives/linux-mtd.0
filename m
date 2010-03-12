Received: from smtp1.linux-foundation.org ([140.211.169.13])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NqDmV-0001wb-Mi
	for linux-mtd@lists.infradead.org; Fri, 12 Mar 2010 22:56:40 +0000
Date: Fri, 12 Mar 2010 14:56:31 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Ferenc Wagner <wferi@niif.hu>
Subject: Re: [PATCH] [mtd, nandsim] Fix typo: struct nandsin_geometry
Message-Id: <20100312145631.36585f9b.akpm@linux-foundation.org>
In-Reply-To: <87aaul1d67.fsf@tac.ki.iif.hu>
References: <87aaul1d67.fsf@tac.ki.iif.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 06 Mar 2010 20:08:00 +0100
Ferenc Wagner <wferi@niif.hu> wrote:

> Subject: [PATCH] [mtd, nandsim] Fix typo: struct nandsin_geometry

fyi, the text inside [] is conventionally considered "transient, to be
removed by receiver", so you should have placed the
subsystem-identification text outside the [].

> Actually, this embedded struct (together with nandsim_regs) could as well
> remain nameless...
> 

Sounds like a fine idea.

> ---
>  drivers/mtd/nand/nandsim.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
> index 7281000..803ae12 100644
> --- a/drivers/mtd/nand/nandsim.c
> +++ b/drivers/mtd/nand/nandsim.c
> @@ -312,7 +312,7 @@ struct nandsim {
>  	union ns_mem buf;
>  
>  	/* NAND flash "geometry" */
> -	struct nandsin_geometry {
> +	struct nandsim_geometry {
>  		uint64_t totsz;     /* total flash size, bytes */
>  		uint32_t secsz;     /* flash sector (erase block) size, bytes */
>  		uint pgsz;          /* NAND flash page size, bytes */


this:


From: Ferenc Wagner <wferi@niif.hu>

The name was spelled wrong.  We don't need an identifier on this struct
anyway, so remove it altogether.

Signed-off-by: Ferenc Wagner <wferi@niif.hu>
Cc: David Woodhouse <dwmw2@infradead.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 drivers/mtd/nand/nandsim.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -puN drivers/mtd/nand/nandsim.c~mtd-nandsim-fix-typo-struct-nandsin_geometry drivers/mtd/nand/nandsim.c
--- a/drivers/mtd/nand/nandsim.c~mtd-nandsim-fix-typo-struct-nandsin_geometry
+++ a/drivers/mtd/nand/nandsim.c
@@ -315,7 +315,7 @@ struct nandsim {
 	union ns_mem buf;
 
 	/* NAND flash "geometry" */
-	struct nandsin_geometry {
+	struct {
 		uint64_t totsz;     /* total flash size, bytes */
 		uint32_t secsz;     /* flash sector (erase block) size, bytes */
 		uint pgsz;          /* NAND flash page size, bytes */
_
