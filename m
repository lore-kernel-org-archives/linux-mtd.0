Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OdGIs-0008Ov-Iv
	for linux-mtd@lists.infradead.org; Mon, 26 Jul 2010 05:32:43 +0000
Subject: Re: [PATCH]  [MTD] onenand/onenand_base.c:Fix for page addr
	calculation based on device type
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Rohit Hassan Sathyanarayan <rohit.hs@samsung.com>
In-Reply-To: <000401cb2a34$974af890$c5e0e9b0$%hs@samsung.com>
References: <000401cb2a34$974af890$c5e0e9b0$%hs@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 26 Jul 2010 08:31:52 +0300
Message-ID: <1280122312.14917.41.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: 'Enric =?ISO-8859-1?Q?Balletb=F2?= i
	Serra' <eballetbo@gmail.com>, v.dalal@samsung.com,
	linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-07-23 at 12:29 +0530, Rohit Hassan Sathyanarayan wrote:
> Hi all
> 
> Sending the patch for page address calculation based on device type. This resolves the 
> OneNAND DDP device read problem as pointed by Enric.
> http://lists.infradead.org/pipermail/linux-mtd/2010-July/030920.html
> 
> 
> Signed-off-by: Rohit HS <rohit.hs@samsung.com>

Pushed to l2-mtd-2.6.git / master, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
