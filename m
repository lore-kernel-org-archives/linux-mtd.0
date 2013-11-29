Received: from mail-pd0-x229.google.com ([2607:f8b0:400e:c02::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VmJBD-00012S-1K
 for linux-mtd@lists.infradead.org; Fri, 29 Nov 2013 08:12:03 +0000
Received: by mail-pd0-f169.google.com with SMTP id v10so13421403pde.14
 for <linux-mtd@lists.infradead.org>; Fri, 29 Nov 2013 00:11:27 -0800 (PST)
Date: Fri, 29 Nov 2013 00:11:13 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: "Rosenberger, Philipp" <Philipp.Rosenberger@xse.de>
Subject: Re: [PATCH] of_mtd: Fix header file include guard
Message-ID: <20131129081113.GA20013@norris.computersforpeace.net>
References: <52972EEE.8070704@xse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <52972EEE.8070704@xse.de>
Cc: Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Rob Herring <rob.herring@calxeda.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ device tree guys

Hi Grant/Rob,

It looks like this header is technically owned by you guys. Once we have
a proper submission, should I merge this sort of change through MTD, or
do one of you want to take care of it?

Hi Philpp,

Thanks for the patch! There are a few things to fix up though.

On Thu, Nov 28, 2013 at 11:53:39AM +0000, Rosenberger, Philipp wrote:
> It seems the include guard was copied from of_net.h.

Good catch.

Note that all patches require a "Signed-off-by" line in the patch
description, to signify (among other things) that this is your work and
that you are submitting it under the GPLv2 license. See
Documentation/SubmittingPatches (esp. point 12).

> ---
>  include/linux/of_mtd.h |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/of_mtd.h b/include/linux/of_mtd.h
> index 6f10e93..cb32d9c 100644
> --- a/include/linux/of_mtd.h
> +++ b/include/linux/of_mtd.h
> @@ -7,7 +7,7 @@
>   */
> 
>  #ifndef __LINUX_OF_MTD_H
> -#define __LINUX_OF_NET_H
> +#define __LINUX_OF_MTD_H
> 
>  #ifdef CONFIG_OF_MTD
> 
> -- 1.7.9.5
> 
> XS Embedded GmbH
> Peterzeller Strasse 8
> D-78048 Villingen - Schwenningen
> 
> Telefon +49 (7721) 4060 - 428
> Fax     +49 (7721) 4060 - 499
> 
> www.xse.de
> Philipp.Rosenberger@xse.de
> 
> :::::::::: based.on.visions ::::::::::
> 
> 
> XS Embedded GmbH
> Geschäftsführung: Michael Maier, Rainer Oder
> 
> Handelsregister: Amtsgericht Freiburg i.Br., HRB 705237
> Sitz der Gesellschaft: Peterzeller Strasse 8, 78048 Villingen-Schwenningen
> USt-Id Nummer: DE268786819
> 
> Confidentiality Notice: This e-mail message, including any attachments, is for the sole use of the intended recipient(s) and may contain confidential and privileged information. Any unauthorized review, use, disclosure or distribution is prohibited. If you are not the intended recipient, please contact the sender by return e-mail and destroy all copies of the original message.

This confidentiality notice is incongruous with sending patches to a
public mailing list, for inclusion in an open source project. This
message (combined with a lack of a Signed-off-by) means we cannot take
your patch. Please remove this footer and resubmit, with a CC to
linux-mtd@infradead.org and devicetree@vger.kernel.org.

Thanks,
Brian
