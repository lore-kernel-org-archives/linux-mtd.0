Received: from mail-pd0-x22b.google.com ([2607:f8b0:400e:c02::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VBcnF-0000Zr-Ij
 for linux-mtd@lists.infradead.org; Tue, 20 Aug 2013 03:39:42 +0000
Received: by mail-pd0-f171.google.com with SMTP id g10so6084087pdj.16
 for <linux-mtd@lists.infradead.org>; Mon, 19 Aug 2013 20:39:19 -0700 (PDT)
Date: Mon, 19 Aug 2013 20:39:12 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [mtd-www: ] nand-data: add four Toshiba nand chips
Message-ID: <20130820033912.GA28421@norris.computersforpeace.net>
References: <1376384964-740-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1376384964-740-1-git-send-email-b32955@freescale.com>
Cc: artem.bityutskiy@linux.intel.com, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 13, 2013 at 05:09:24PM +0800, Huang Shijie wrote:
> Add the items for four Toshiba nand chips.
> All the four nand chips are supported by the kernel now.
G> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> ---
>  nand-data/nanddata.csv |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
> 
> diff --git a/nand-data/nanddata.csv b/nand-data/nanddata.csv
> index 20a6f86..408f0df 100644
> --- a/nand-data/nanddata.csv
> +++ b/nand-data/nanddata.csv
> @@ -192,6 +192,10 @@
>  "Toshiba","TC58NVG0S3E","0x98","0xD1","0x98D1...",128,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,TRUE,FALSE,FALSE,TRUE,FALSE,"1-bit/512-byte","1?",5,"Extended ID decode",TRUE,FALSE,TRUE,TRUE,TRUE,,TRUE,TRUE,TRUE,1,1,1,"Single",,"Datasheet doesn't list full ID, only shows ID decoder table"
>  "Toshiba","TC58NVG1S3E","0x98","0xDA","0x98DA...",256,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,TRUE,FALSE,FALSE,TRUE,FALSE,"1-bit/512-byte","1?",5,"Extended ID decode",TRUE,FALSE,TRUE,TRUE,TRUE,,TRUE,TRUE,TRUE,1,1,1,"Single",,"Datasheet doesn't list full ID, only shows ID decoder table"
>  "Toshiba","TC58NVG2S3E","0x98","0xDC","0x98DC...",512,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,TRUE,FALSE,FALSE,TRUE,FALSE,"1-bit/512-byte","1?",5,"Extended ID decode",TRUE,FALSE,TRUE,TRUE,TRUE,,TRUE,TRUE,TRUE,1,1,1,"Single",,"Datasheet doesn't list full ID, only shows ID decoder table"
> +"Toshiba","TC58NVG2S0F","0x98","0xDC","0x98dc902676150108",512,4096,224,"256 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,TRUE,FALSE,FALSE,TRUE,FALSE,"4-bit/512-byte","1",8,"Full ID decode",TRUE,FALSE,TRUE,TRUE,TRUE,,TRUE,TRUE,TRUE,1,1,1,"Single",,"Datasheet doesn't list full ID, only shows ID decoder table, get the full ID by testing"
> +"Toshiba","TC58NVG3S0F","0x98","0xD3","0x98d3902676150208",1024,4096,232,"256 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,TRUE,FALSE,FALSE,TRUE,FALSE,"4-bit/512-byte","1",8,"Full ID decode",TRUE,FALSE,TRUE,TRUE,TRUE,,TRUE,TRUE,TRUE,1,1,1,"Single",,"Datasheet doesn't list full ID, only shows ID decoder table, get the full ID by testing"
> +"Toshiba","TC58NVG5D2","0x98","0xD7","0x98d7943276560900",4096,8192,640,"1 MB","x8","N/A","1st or last page (1st byte in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,TRUE,FALSE,"40-bit/1024-byte","2",8,"Full ID decode",TRUE,FALSE,TRUE,TRUE,TRUE,,TRUE,TRUE,TRUE,1,1,1,"Single",,"Datasheet doesn't list full ID, only shows ID decoder table, get the full ID by testing"
> +"Toshiba","TC58NVG6D2","0x98","0xDE","0x98de948276560420",8192,8192,640,"2 MB","x8","N/A","1st or last page (1st byte in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,TRUE,FALSE,"40-bit/1024-byte","2",8,"Full ID decode",TRUE,FALSE,TRUE,TRUE,TRUE,,TRUE,TRUE,TRUE,1,1,1,"Single",,"Datasheet doesn't list full ID, only shows ID decoder table, get the full ID by testing"

I would prefer the "Full ID" entries follow the capitalization style of
the other chips (all-caps). Also the "Correct OOB" entry is missing
(should be TRUE). But otherwise:

Acked-by: Brian Norris <computersforpeace@gmail.com>

I made the edits and pushed to mtd-www.git. Thanks!

(I'm not sure how to update the linux-mtd website.)

Brian
