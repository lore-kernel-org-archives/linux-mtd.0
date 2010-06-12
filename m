Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1ONReB-0004rA-KJ
	for linux-mtd@lists.infradead.org; Sat, 12 Jun 2010 14:25:20 +0000
Subject: Re: ubifs became broken on contigous power-fails
From: Artem Bityutskiy <dedekind1@gmail.com>
To: pazdnikov@prosoftsystems.ru
In-Reply-To: <1274694991.22999.52.camel@localhost>
References: <E1OBqfw-0002Rs-00.pazdnikov-list-ru@f27.mail.ru>
	<201005241249.28629.pazdnikov@prosoft.ural.ru>
	<1274689080.22999.43.camel@localhost>
	<201005241550.48074.pazdnikov@prosoft.ural.ru>
	<1274694991.22999.52.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 12 Jun 2010 17:22:55 +0300
Message-ID: <1276352575.19028.121.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Mon, 2010-05-24 at 12:56 +0300, Artem Bityutskiy wrote:
> On Mon, 2010-05-24 at 15:50 +0600, Alexander Pazdnikov wrote:
> > > Could you enable debugging messages when mounging it after power cuts?
> > > The messages generate a lot of noise, so you need to disable them before
> > > starting the real test. The idea is to get UBIFS debugging messages when
> > > errors occur.
> > Sorry, I've hurried up, and after applying your pathes reflash all of the 
> > devices with new firmware.
> > But I'll setup some devices with all firmware to catch this issue again.
> > 
> > > I never had time to really dig this and fix. Would be nice if you could
> > > do this because I will unlikely have time in the nearest future, but I
> > > can help you.
> > Thank you, I'll continue testings and can supply with debug information.
> > 
> > > One think you can do is to make sure you do not fill UBIFS completely,
> > > then you will avoid hitting these budgeting bugs, also known as ENOSPC
> > > issues (I think btrfs uses this terminology).
> > In the issue above there is 11% used space and 89% free space.
> > I've got this issue only when mounting fs in RO and then remounting it in RW.
> 
> OK. Try my patch. Also, it is worth running your tests with UBIFS extra
> self checks enabled.

Did it help?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
