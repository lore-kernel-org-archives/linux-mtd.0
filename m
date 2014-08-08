Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFn8F-0005hD-7d
 for linux-mtd@lists.infradead.org; Fri, 08 Aug 2014 16:35:07 +0000
Message-ID: <1407515643.25561.28.camel@sauron.fi.intel.com>
Subject: Re: Question about ubiformat
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Brian Norris <computersforpeace@gmail.com>
Date: Fri, 08 Aug 2014 19:34:03 +0300
In-Reply-To: <20140808162704.GR3711@ld-irv-0074>
References: <1a5301cfb29c$9a4ec6d0$ceec5470$@com>
 <20140808061936.GA3246@norris-Latitude-E6410>
 <1b4901cfb31a$ee57b240$cb0716c0$@com> <20140808162704.GR3711@ld-irv-0074>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Daniel Bowen <dbowen@logitech.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2014-08-08 at 09:27 -0700, Brian Norris wrote:
> It erases every block, writes the image to the first 300, and programs
> EC headers to the last 200.

Yes, confirmed.

-- 
Best Regards,
Artem Bityutskiy
