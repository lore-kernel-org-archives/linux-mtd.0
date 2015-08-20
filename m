Received: from mail-pd0-x230.google.com ([2607:f8b0:400e:c02::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZSH5C-0004hH-VJ
 for linux-mtd@lists.infradead.org; Thu, 20 Aug 2015 04:04:07 +0000
Received: by pdrh1 with SMTP id h1so9298202pdr.0
 for <linux-mtd@lists.infradead.org>; Wed, 19 Aug 2015 21:03:51 -0700 (PDT)
Date: Wed, 19 Aug 2015 21:03:47 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: robert.jarzmik@free.fr, linux-mtd@lists.infradead.org, jogo@openwrt.org
Subject: Re: [PATCH v2] nand: pxa3xx: Increase READ_ID buffer and make the
 size static
Message-ID: <20150820040347.GC74600@google.com>
References: <1440024009-20177-1-git-send-email-ezequiel@vanguardiasur.com.ar>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1440024009-20177-1-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 19, 2015 at 07:40:09PM -0300, Ezequiel Garcia wrote:
> The read ID count should be made as large as the maximum READ_ID size,
> so there's no need to have dynamic size. This commit sets the hardware
> maximum read ID count, which should be more than enough on all cases.
> Also, we get rid of the read_id_bytes, and use a macro instead.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> ---
> Changes from v1:
> 
>   * Keep "data_size" to 8 bytes, as per hardware
>     requirements to read at least a FIFO entry.
> 
>   * While here, add a proper comment on READ_ID_BYTES'
>     definition.

Pushed to l2-mtd.git
