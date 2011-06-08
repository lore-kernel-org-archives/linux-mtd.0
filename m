Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUEzR-0007Dg-M3
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 09:23:54 +0000
Received: by fxm14 with SMTP id 14so242215fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 02:23:51 -0700 (PDT)
Subject: Re: [PATCH 26/44] mtd: cs553x_nand.c: use mtd_device_parse_register
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
In-Reply-To: <1307453803-31950-27-git-send-email-dbaryshkov@gmail.com>
References: <1307453803-31950-1-git-send-email-dbaryshkov@gmail.com>
	<1307453803-31950-27-git-send-email-dbaryshkov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 08 Jun 2011 12:19:34 +0300
Message-ID: <1307524774.31223.34.camel@localhost>
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

On Tue, 2011-06-07 at 17:36 +0400, Dmitry Eremin-Solenikov wrote:
> +                       mtd_device_parse_register(cs553x_mtd[i], NULL,
> 0,
> +                                       NULL, 0); 

You do not need 2 lines here.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
