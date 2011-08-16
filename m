Received: from mail-yw0-f49.google.com ([209.85.213.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QtKQO-00055M-A9
	for linux-mtd@lists.infradead.org; Tue, 16 Aug 2011 14:15:25 +0000
Received: by ywp17 with SMTP id 17so4021529ywp.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 16 Aug 2011 07:15:21 -0700 (PDT)
Subject: Re: [BUG] mtdinfo -a: Tries to open NULL pointer for NOR with
	Eraseblock Regions
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Tue, 16 Aug 2011 17:17:00 +0300
In-Reply-To: <CAN8TOE9NyKqOkfYC6h_44Wf+xs7ZtTjGS+YkLAhLV60FnKB2hQ@mail.gmail.com>
References: <201107251148.51262.brian.foster@maxim-ic.com>
	<CAN8TOE8Uk09DPJ_OYXh4RjnKkXugEFLpZQ+hrA4Gw4oK2cQYOw@mail.gmail.com>
	<201107260921.44512.brian.foster@maxim-ic.com>
	<CAN8TOE847yECw3zeh42tf=6mC73O33Lr7Lzwpi0FrT-rB9ZYmg@mail.gmail.com>
	<CAMjpGUc1a4NR5PWt3A5Y+jv6ihsWjUgH3iVUpNc0dsvkEzx6pw@mail.gmail.com>
	<CAN8TOE--96V6ZruB8+VvAz2kqxqMq4nc4d5=6SGsUt0eu7og0g@mail.gmail.com>
	<CAMjpGUcTPR=EVOtfju5_S4Zu_h-rmqnCii4R0j7yFX8JTD81uA@mail.gmail.com>
	<CAN8TOE9p1v=mDUawRrnVAwDO4zz9LmXkqdNynLPCSCnBRMr9pw@mail.gmail.com>
	<CAMjpGUcjhuc6MaH0y2vGdM5ru00BJEmVeBwMUebkbfoxDNY28g@mail.gmail.com>
	<1313381489.2200.19.camel@koala>
	<CAN8TOE9NyKqOkfYC6h_44Wf+xs7ZtTjGS+YkLAhLV60FnKB2hQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1313504225.21711.3.camel@sauron>
Mime-Version: 1.0
Cc: Brian Foster <brian.foster@maxim-ic.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Mike Frysinger <vapier@gentoo.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-08-15 at 16:13 -0700, Brian Norris wrote:
> This way, we do not rely on guessing any paths; we simply use the
> sysfs information that is exposed, among other purposes, for cases
> cases like this, right? And then (as I stated on another message in
> this thread) we could even support the "region info" on newer kernels,
> if somebody ever does the work to export them. I think this solution
> involves no extra work right now, does not remove valuable features,
> does not make dirty assumptions about node names, and can take
> advantage of new sysfs features in the future. The main downside I see
> is the potential (documented) difference in information printed by
> `mtdinfo --all' vs. `mtdinfo /dev/mtdX'.

Yes, fair enough, just pushed your fix and cleanups, thanks!

-- 
Best Regards,
Artem Bityutskiy
