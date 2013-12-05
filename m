Received: from mx01-fr.bfs.de ([193.174.231.67])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VoXcm-0007Jg-WB
 for linux-mtd@lists.infradead.org; Thu, 05 Dec 2013 12:01:45 +0000
Message-ID: <52A06B00.7070309@bfs.de>
Date: Thu, 05 Dec 2013 13:01:04 +0100
From: walter harms <wharms@bfs.de>
MIME-Version: 1.0
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [patch] mtd: sm_ftl: heap corruption in
 sm_create_sysfs_attributes()
References: <20131205110235.GA14728@elgon.mountain>
In-Reply-To: <20131205110235.GA14728@elgon.mountain>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
 David Woodhouse <dwmw2@infradead.org>
Reply-To: wharms@bfs.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



Am 05.12.2013 12:02, schrieb Dan Carpenter:
> We always put a NUL terminator one space past the end of the "vendor"
> buffer.  Also I think the strnlen() limiter is off by one so I have made
> it smaller.
> 
> Fixes: 7d17c02a01a1 ('mtd: Add new SmartMedia/xD FTL')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Static analysis stuff.  Untested.
> 
> diff --git a/drivers/mtd/sm_ftl.c b/drivers/mtd/sm_ftl.c
> index 4b8e89583f2a..7c452714df8d 100644
> --- a/drivers/mtd/sm_ftl.c
> +++ b/drivers/mtd/sm_ftl.c
> @@ -59,11 +59,12 @@ static struct attribute_group *sm_create_sysfs_attributes(struct sm_ftl *ftl)
>  	struct attribute_group *attr_group;
>  	struct attribute **attributes;
>  	struct sm_sysfs_attribute *vendor_attribute;
> +	int vendor_len;
> +	char *vendor;
>  
> -	int vendor_len = strnlen(ftl->cis_buffer + SM_CIS_VENDOR_OFFSET,
> -					SM_SMALL_PAGE - SM_CIS_VENDOR_OFFSET);
> -
> -	char *vendor = kmalloc(vendor_len, GFP_KERNEL);
> +	vendor_len = strnlen(ftl->cis_buffer + SM_CIS_VENDOR_OFFSET,
> +			     SM_SMALL_PAGE - SM_CIS_VENDOR_OFFSET - 1);
> +	vendor = kmalloc(vendor_len + 1, GFP_KERNEL);
>  	if (!vendor)
>  		goto error1;
>  	memcpy(vendor, ftl->cis_buffer + SM_CIS_VENDOR_OFFSET, vendor_len);

Hi Dan,
is this a case for kstr(n)dup() ? like:

int maxlen=SM_SMALL_PAGE - SM_CIS_VENDOR_OFFSET-1;
char *buf=ftl->cis_buffer + SM_CIS_VENDOR_OFFSET;
vendor=kstrndup(buf,maxlen,GFP_KERNEL);
if (!vendor)
	goto error1;

i added maxlen, buf to to help me understand the code,
when the source is save kstrdup() is also an option

just my to cents,
 wh
