Subject: Re: [PATCH v4 04/11] mtd: Add MPC5121 NAND Flash Controller driver
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Anatolij Gustschin <agust@denx.de>
In-Reply-To: <1266255305-29224-1-git-send-email-agust@denx.de>
References: <1265377377-29327-5-git-send-email-agust@denx.de>
	<1266255305-29224-1-git-send-email-agust@denx.de>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 16 Feb 2010 10:11:08 +0200
Message-ID: <1266307868.11659.177.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: John Rigby <jcrigby@gmail.com>, Piotr Ziecik <kosmo@semihalf.com>,
	Detlev Zundel <dzu@denx.de>, Grant Likely <grant.likely@secretlab.ca>,
	linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-02-15 at 18:35 +0100, Anatolij Gustschin wrote:
> Adds NAND Flash Controller driver for MPC5121 Revision 2.
> All device features, except hardware ECC and power management,
> are supported.
> 
> Signed-off-by: Piotr Ziecik <kosmo@semihalf.com>
> Signed-off-by: Wolfgang Denk <wd@denx.de>
> Signed-off-by: Anatolij Gustschin <agust@denx.de>
> Acked-by: Grant Likely <grant.likely@secretlab.ca>
> Cc: <linux-mtd@lists.infradead.org>
> Cc: Grant Likely <grant.likely@secretlab.ca>
> Cc: John Rigby <jcrigby@gmail.com>
> ---
> Changes since v3:
>  - include 'asm/mpc5121.h' header instead of 'asm/mpc5xxx.h'.
>    This change is needed because arch patch adding reset
>    module definition was reworked and doesn't add mpc5121
>    specific definitions to common header for mpc52xx/mpc5121.
> 
> Changes since v2:
>  - move the arch bits into separate patch
>    (it is the next patch in this series now)
>  - use __devinit/__devexit/__devexit_p and __devinitdata
> 
> Changes since v1:
>  - add logfile with changes since previous version 
> 
> Changes since the patch version submitted in May 2009:
> 
>  - move mpc5121_nfc.h to the driver .c as there is only one user
>  - remove DRV_VERSION macro
>  - replace printk() by dev_*()
>  - drop unnecessary .suspend and .resume initializations
>  - remove duplicate .name/.owner settings
>  - fix mpc5121_nfc_init() to "return of_register_platform_driver(&mpc5121_nfc_driver);"
>  - move module_init() to just below the init function
>  - remove MODULE_VERSION
>  - use "mtd: Add MPC5121 NAND Flash Controller driver" as the subject,
>    previously it was "mpc5121: Added NAND Flash Controller driver.
> 
>  drivers/mtd/nand/Kconfig       |    7 +
>  drivers/mtd/nand/Makefile      |    1 +
>  drivers/mtd/nand/mpc5121_nfc.c |  916 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 924 insertions(+), 0 deletions(-)
>  create mode 100644 drivers/mtd/nand/mpc5121_nfc.c

Pushed to my l2-mtd-2.6.git / dunno.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
