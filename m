Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PvP0h-0006fv-0e
	for linux-mtd@lists.infradead.org; Fri, 04 Mar 2011 07:01:12 +0000
Received: by eyh6 with SMTP id 6so606373eyh.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 03 Mar 2011 23:01:08 -0800 (PST)
Subject: Re: Bug in mtd_speedtest?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: David Lambert <dave@lambsys.com>
In-Reply-To: <4D70280E.8030501@lambsys.com>
References: <4D70280E.8030501@lambsys.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 04 Mar 2011 08:59:42 +0200
Message-ID: <1299221982.2735.7.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-03-03 at 17:45 -0600, David Lambert wrote:
> I think I may have found an overflow condition in the speed calculation 
> of mtd_speedtest on some platforms with larger flash partitions:
> 
> Consider for example if goodebcnt = 15000, and mtd->erasesize = 
> 256*1024, then there is an intermediate product of  3932160000 which 
> results in the sign bit being set on a 32 bit integer. Maybe k should be 
> an unsigned long long?

Please, just send a patch :-)

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
