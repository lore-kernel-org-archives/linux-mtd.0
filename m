Date: Mon, 21 Jul 2014 19:56:03 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Bo Shen <voice.shen@atmel.com>
Subject: Re: [PATCH v2] mtd: atmel_nand: make ecc parameters same as definition
Message-ID: <20140722025603.GC7537@ld-irv-0074>
References: <1402559925-20910-1-git-send-email-voice.shen@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1402559925-20910-1-git-send-email-voice.shen@atmel.com>
Cc: josh.wu@atmel.com, nicolas.ferre@atmel.com,
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jun 12, 2014 at 03:58:45PM +0800, Bo Shen wrote:
> If the ecc parameter is not the same as definition, when the
> mtd core check these parameters, it will give the error result.
> 
> Take the following as an example:
> 
> Calculate how many bits can be corrected in one page.
> According to the ecc parameters definition,
> 
> one page correct bits = (mtd->writesize * ecc->strength) / ecc->size
> 
> take the following use case as an example:
> mtd->writesize = 2048 bytes
> ecc->strength = 4 bytes (for 512 bytes)
> 
> before this patch, the ecc->size = 2048, so the result is 4 bytes.
> after this patch, the ecc->size = 512, so the result is 16 bytes.
> 
> So, align the ecc parameters the same as definition to correct
> this kind of error.
> 
> Signed-off-by: Bo Shen <voice.shen@atmel.com>
> Acked-by: Josh Wu <josh.wu@atmel.com>
> ---
> Changes in v2:
>   - Enhancement the commit message.

Pushed to l2-mtd.git. Thanks!

Brian
