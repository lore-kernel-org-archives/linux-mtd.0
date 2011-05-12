Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QKQxD-00009Y-HT
	for linux-mtd@lists.infradead.org; Thu, 12 May 2011 08:09:06 +0000
Received: by mail-ey0-f177.google.com with SMTP id 6so418869eyh.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 May 2011 01:09:03 -0700 (PDT)
Subject: Re: [RFC PATCH 3/9] nand/denali: detect the number of banks
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jamie Iles <jamie@jamieiles.com>
In-Reply-To: <1304692143-22432-4-git-send-email-jamie@jamieiles.com>
References: <1304692143-22432-1-git-send-email-jamie@jamieiles.com>
	<1304692143-22432-4-git-send-email-jamie@jamieiles.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 12 May 2011 11:05:43 +0300
Message-ID: <1305187543.2713.58.camel@localhost>
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
> Not all configurations of the Denali controller support 4 banks.  The
> controller can support between 1 and 16 banks.  Detect this from the
> design features register.
> 
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Chuanxiao Dong <chuanxiao.dong@intel.com>
> Signed-off-by: Jamie Iles <jamie@jamieiles.com>

Pushed this one to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
