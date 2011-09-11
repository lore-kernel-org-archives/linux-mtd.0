Received: from mail-gw0-f48.google.com ([74.125.83.48])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R2jAT-0006E9-G6
	for linux-mtd@lists.infradead.org; Sun, 11 Sep 2011 12:29:50 +0000
Received: by gwj22 with SMTP id 22so2849386gwj.21
	for <linux-mtd@lists.infradead.org>;
	Sun, 11 Sep 2011 05:29:48 -0700 (PDT)
Subject: Re: [PATCH 09/12] mtd: document ABI
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Sun, 11 Sep 2011 15:32:14 +0300
In-Reply-To: <1314755147-17756-10-git-send-email-computersforpeace@gmail.com>
References: <1314755147-17756-1-git-send-email-computersforpeace@gmail.com>
	<1314755147-17756-10-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1315744338.18731.40.camel@sauron>
Mime-Version: 1.0
Cc: b35362@freescale.com, Ricard Wanderlof <ricard.wanderlof@axis.com>,
	Kevin Cernekee <cernekee@gmail.com>, linux-mtd@lists.infradead.org,
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

On Tue, 2011-08-30 at 18:45 -0700, Brian Norris wrote:
> We're missing a lot of important documentation in include/mtd/mtd-abi.h:
> 
> * add a simple description of each ioctl (feel free to expand!)
> * give full explanations of recently added and modified operations
> * explain the usage of "RAW" that appear in different modes and types of
>   operations
> * fix some comment style along the way
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Great piece of work, pushed, thanks a lot!

-- 
Best Regards,
Artem Bityutskiy
