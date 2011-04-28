Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QFUDz-0000sK-Te
	for linux-mtd@lists.infradead.org; Thu, 28 Apr 2011 16:37:56 +0000
Received: by eyh6 with SMTP id 6so1030427eyh.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 28 Apr 2011 09:37:53 -0700 (PDT)
Subject: Re: ubiformat: libmt error (side effect from last Large Buffer
	Allocations patch)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Stefano Babic <sbabic@denx.de>
In-Reply-To: <4DB6A266.5050509@denx.de>
References: <4DB66CA3.2040906@denx.de> <1303807043.2778.45.camel@localhost>
	<4DB6A266.5050509@denx.de>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 28 Apr 2011 19:33:37 +0300
Message-ID: <1304008417.2778.105.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: marathon96@gmail.com, linux-mtd@lists.infradead.org,
	Bastian Ruppert <bastian.ruppert@sewerin.de>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-04-26 at 12:45 +0200, Stefano Babic wrote:
> Tested-by: Stefano Babic <sbabic@denx.de>

Thanks, I've tweaked Grant's patches and folded my patch into them, and
added your Tested-by tag, and pushed to l2-mtd-2.6.git.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
