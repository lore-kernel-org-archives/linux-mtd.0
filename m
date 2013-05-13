Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ublzz-0004un-CT
 for linux-mtd@lists.infradead.org; Mon, 13 May 2013 06:12:41 +0000
Message-ID: <1368425690.3208.14.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: chips: Add support for PMC SPI Flash chips in
 m25p80.c
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Michel Stempin <michel.stempin@wanadoo.fr>, Brian Norris
 <computersforpeace@gmail.com>
Date: Mon, 13 May 2013 09:14:50 +0300
In-Reply-To: <518D6138.2090009@wanadoo.fr>
References: <1368195520.26780.169.camel@sauron.fi.intel.com>
 <518D6138.2090009@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2013-05-10 at 23:06 +0200, Michel Stempin wrote:
>     Add support for PMC (now Chingis, part of ISSI) Pm25LV512 (512 kBbit), Pm25LV010 (1 Mbit) (see datasheet http://www.geocities.jp/scottle556/pdf/Pm25LV512-010.pdf) and Pm25LQ032 (32 Mbit) (datasheet:http://www.
> 
>     This patch is resent in order to take into account this upstream patch:
> 
>     commit e534ee4f9ca29fdb38eea4b0c53f2154fbd8c1ee
>     Author: Krzysztof Mazur <krzysiek@podlesie.net>
>     Date:   Fri Feb 22 15:51:05 2013 +0100

I think it would make sense if Brien gook a glimpse on this patch.

-- 
Best Regards,
Artem Bityutskiy
