Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QKR1y-0000EI-2R
	for linux-mtd@lists.infradead.org; Thu, 12 May 2011 08:14:02 +0000
Received: by ewy3 with SMTP id 3so419199ewy.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 May 2011 01:13:56 -0700 (PDT)
Subject: Re: [RFC PATCH 5/9] nand/denali: convert to dev_() printk helpers
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jamie Iles <jamie@jamieiles.com>
In-Reply-To: <1304692143-22432-6-git-send-email-jamie@jamieiles.com>
References: <1304692143-22432-1-git-send-email-jamie@jamieiles.com>
	<1304692143-22432-6-git-send-email-jamie@jamieiles.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 12 May 2011 11:10:37 +0300
Message-ID: <1305187837.2713.62.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
	chuanxiao.dong@intel.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-05-06 at 15:28 +0100, Jamie Iles wrote:
> Use the dev_() printk helpers rather than printk so the name of the
> device is include.  Also remove a duplicate definition of BANK().
> 
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Chuanxiao Dong <chuanxiao.dong@intel.com>
> Signed-off-by: Jamie Iles <jamie@jamieiles.com>

This patch looks ok to me, but it depends on the previous one so I could
not apply it. I do not look at other patches as I presume they are all
dependent.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
