Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oxc7I-0003Gp-Fw
	for linux-mtd@lists.infradead.org; Mon, 20 Sep 2010 08:52:53 +0000
Received: by fxm4 with SMTP id 4so703911fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 20 Sep 2010 01:52:51 -0700 (PDT)
Subject: Re: [PATCH 1/2] mtd: prepare partition add and del functions for
	ioctl requests
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Roman Tereshonkov <roman.tereshonkov@nokia.com>
In-Reply-To: <1284719502-24183-2-git-send-email-roman.tereshonkov@nokia.com>
References: <1284719502-24183-1-git-send-email-roman.tereshonkov@nokia.com>
	<1284719502-24183-2-git-send-email-roman.tereshonkov@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 20 Sep 2010 11:50:58 +0300
Message-ID: <1284972658.2286.52.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-09-17 at 13:31 +0300, Roman Tereshonkov wrote:
> +       list_for_each_entry(p, &mtd_partitions, list)
> +               if (p->master == master) {
> +                           (start < (p->offset + p->mtd.size)))
> +                               goto err_inv; 

Pardon?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
