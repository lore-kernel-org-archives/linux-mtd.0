Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUF5z-0007Pz-Cc
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 09:30:40 +0000
Received: by fxm14 with SMTP id 14so246519fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 02:30:35 -0700 (PDT)
Subject: Re: [PATCH 00/44] Cleanup of parse/register scenario
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
In-Reply-To: <1307453803-31950-1-git-send-email-dbaryshkov@gmail.com>
References: <1307453803-31950-1-git-send-email-dbaryshkov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 08 Jun 2011 12:26:18 +0300
Message-ID: <1307525178.31223.38.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-06-07 at 17:35 +0400, Dmitry Eremin-Solenikov wrote:
> Lots of mtd drivers have more or less the same common logic:
> parse partitions, then register them. Currently this ends up
> with lots of code duplication, each copy having it's own features
> and bugs. In this patch serie I create a special function
> (mtd_device_parse_register) which handles all issues with acquiring
> partition information, registering mtd device(s) and returning correct
> error code.
> 
> The following changes since commit 85bd7e882840f4cb4d213768d252c754f22440ac:
> 
>   mtd: pxa3xx_nand: Fix blank page ECC mismatch (2011-06-07 15:40:29 +0300)
> 
> are available in the git repository at:
>   git://git.infradead.org/users/dbaryshkov/mtd-cleanup.git mtd-parse-1st

Dmitry, the patch-set is a great clean-up! Could you please address few
nit-picks I sent and also go through your patches and join the
unnecessary 2 lines in your 'mtd_device_parse_register()' invocations? I
think I can see several of them.

I mean,

mtd_device_parse_register(x, y, z,
			a, b)

should become

mtd_device_parse_register(x, y, z, a, b)

if this fits 80 characters.

Thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
