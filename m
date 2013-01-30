Received: from mail-ee0-f45.google.com ([74.125.83.45])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U0VYa-0005so-6o
 for linux-mtd@lists.infradead.org; Wed, 30 Jan 2013 11:10:20 +0000
Received: by mail-ee0-f45.google.com with SMTP id b57so731884eek.4
 for <linux-mtd@lists.infradead.org>; Wed, 30 Jan 2013 03:10:17 -0800 (PST)
Sender: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <5108FEE9.4040805@openwrt.org>
Date: Wed, 30 Jan 2013 12:07:21 +0100
From: Florian Fainelli <florian@openwrt.org>
MIME-Version: 1.0
To: Pawel Moll <pawel.moll@arm.com>
Subject: Re: [PATCH] mtd: physmap_of: Fix map name when "linux, mtd-name"
 is absent
References: <1359542256-19135-1-git-send-email-pawel.moll@arm.com>
In-Reply-To: <1359542256-19135-1-git-send-email-pawel.moll@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello

On 01/30/2013 11:37 AM, Pawel Moll wrote:
> Commit d68cbdd4fb04d2b756ad53c22f36943167b16340 "mtd: physmap_of:
> allow to specify the mtd name for retro compatiblity" introduced
> a "linux,mtd-name" property to override map names, but when
> this property is absent (so of_property_read_string() returns
> value != 0) an uninitialized value is used (as mtd_name is not
> set). This may lead to kernel oopses when the name is
> derefernced, eg:
>
> Unable to handle kernel NULL pointer dereference at virtual address 00000001
> pgd = 80004000
> [00000001] *pgd=00000000
> Internal error: Oops: 5 [#1] SMP ARM
> Modules linked in:
> CPU: 3    Not tainted  (3.8.0-rc5+ #644)
> PC is at strcmp+0x4/0x30
> LR is at parse_cmdline_partitions+0x54/0x2f8
>
> Fixed by initializing the variable to NULL.

This is the 3rd time such a patch is submitted.

1358446932-7238-1-git-send-email-stef.van.os@prodrive.nl
df9da712b775781366ae23aac28ed20849b4e4d3.1356260943.git.baruch@tkos.co.il

Fortunately it is now in linux-mtd:
http://git.infradead.org/linux-mtd.git/commit/7dfe4be351e81656ca1068e5d4ead235c7ba94b1

>
> Signed-off-by: Pawel Moll <pawel.moll@arm.com>
> ---
>   drivers/mtd/maps/physmap_of.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
> index 67cc73c..7901d72 100644
> --- a/drivers/mtd/maps/physmap_of.c
> +++ b/drivers/mtd/maps/physmap_of.c
> @@ -170,7 +170,7 @@ static int of_flash_probe(struct platform_device *dev)
>   	resource_size_t res_size;
>   	struct mtd_part_parser_data ppdata;
>   	bool map_indirect;
> -	const char *mtd_name;
> +	const char *mtd_name = NULL;
>
>   	match = of_match_device(of_flash_match, &dev->dev);
>   	if (!match)
>
