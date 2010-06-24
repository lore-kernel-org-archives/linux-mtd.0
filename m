Received: from mail-pw0-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1ORmqg-0005eo-TH
	for linux-mtd@lists.infradead.org; Thu, 24 Jun 2010 13:52:14 +0000
Received: by pwi1 with SMTP id 1so2110018pwi.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 24 Jun 2010 06:52:09 -0700 (PDT)
Subject: Re: [PATCH] mtd-www doc, FAQ, general: spelling fixes
From: Philby John <pjohn@mvista.com>
To: Brian Norris <norris@broadcom.com>
In-Reply-To: <1277332946-14580-1-git-send-email-norris@broadcom.com>
References: <1277332946-14580-1-git-send-email-norris@broadcom.com>
Content-Type: text/plain
Date: Thu, 24 Jun 2010 19:22:02 +0530
Message-Id: <1277387522.24980.6.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: pjohn@mvista.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-06-23 at 15:42 -0700, Brian Norris wrote:
> Several spelling, word choice, etc. edits throughout
> 
> Signed-off-by: Brian Norris <norris@broadcom.com>
> ---
>  doc/general.xml |    2 +-
>  doc/nand.xml    |   60 +++++++++++++++++++++++++++---------------------------
>  doc/onenand.xml |   18 ++++++++--------
>  doc/ubi.xml     |   14 ++++++------
>  doc/ubifs.xml   |   18 ++++++++--------
>  faq/general.xml |    6 ++--
>  faq/jffs2.xml   |   18 ++++++++--------
>  faq/nand.xml    |   14 ++++++------
>  faq/ubi.xml     |   48 ++++++++++++++++++++++----------------------
>  faq/ubifs.xml   |   48 ++++++++++++++++++++++----------------------
>  source.xml      |    2 +-
>  11 files changed, 124 insertions(+), 124 deletions(-)
> 
> diff --git a/doc/general.xml b/doc/general.xml
> index e170ace..4e1bfdd 100644
> --- a/doc/general.xml
> +++ b/doc/general.xml
> @@ -122,7 +122,7 @@ git://git.infradead.org/users/ahunter/nand-tests.git
>  	and nasty DMA issues on an OMAP2 board with OneNAND flash, just by
>  	running this tests for few hours.</li>
>  
> -	<li><b>mtd_nandecctest</b>: a simple test that checks correctess of the
> +	<li><b>mtd_nandecctest</b>: a simple test that checks correctness of the
>  	built-in software ECC for 256 and 512-byte buffers; this test is not
>  	driver-specific but tests general NAND support code.</li>
>  </ul>
> diff --git a/doc/nand.xml b/doc/nand.xml
> index 549827b..776f891 100644
> --- a/doc/nand.xml
> +++ b/doc/nand.xml
> @@ -16,8 +16,8 @@ NAND and NOR Flash is the bus interface. NOR Flash is connected to a address / d
>   bus direct like other memory devices as SRAM etc. NAND Flash uses a multiplexed I/O 
>   Interface with some additional control pins. NAND flash is a sequential access device 
>   appropriate for mass storage applications, while NOR flash is a random access device 
> - appropriate for code storage application.NOR Flash can be used for code storage and 
> - code execution. Code stored on NAND Flash can't be executed frome there. It must be 
> + appropriate for code storage application. NOR Flash can be used for code storage and 
> + code execution. Code stored on NAND Flash can't be executed from there. It must be 
>   loaded into RAM memory and executed from there.</p>

<-snip->

>  Probably because you flash is too small? Try to use JFFS2 then, becasue it
                    ^^^                                            ^^^^^
You missed "you", should be "your", and "becasue".

Regards,
Philby
