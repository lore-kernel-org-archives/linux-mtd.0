Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QKQx4-00009Y-9g
	for linux-mtd@lists.infradead.org; Thu, 12 May 2011 08:08:58 +0000
Received: by mail-ey0-f177.google.com with SMTP id 6so418869eyh.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 May 2011 01:08:54 -0700 (PDT)
Subject: Re: [RFC PATCH 2/9] nand/denali: remove nearly-duplicated register
	definitions
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jamie Iles <jamie@jamieiles.com>
In-Reply-To: <1304692143-22432-3-git-send-email-jamie@jamieiles.com>
References: <1304692143-22432-1-git-send-email-jamie@jamieiles.com>
	<1304692143-22432-3-git-send-email-jamie@jamieiles.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 12 May 2011 11:05:34 +0300
Message-ID: <1305187534.2713.57.camel@localhost>
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
> The controller has interrupt enable/status register pairs for each bank
> (along with ECC and status registers) that differ only in address offset.
> Rather than providing definitions for each register, make the address a
> macro so that it scales for devices with different numbers of banks.
> 
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Chuanxiao Dong <chuanxiao.dong@intel.com>
> Signed-off-by: Jamie Iles <jamie@jamieiles.com>

Pushed this one to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
