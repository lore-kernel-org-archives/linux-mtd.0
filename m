Received: from mx1.prosoftsystems.ru ([212.23.72.203])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OGUJC-0008Ih-06
	for linux-mtd@lists.infradead.org; Mon, 24 May 2010 09:50:54 +0000
From: Alexander Pazdnikov <pazdnikov@prosoft.ural.ru>
To: <linux-mtd@lists.infradead.org>
Subject: Re: ubifs became broken on contigous power-fails
Date: Mon, 24 May 2010 15:50:48 +0600
References: <E1OBqfw-0002Rs-00.pazdnikov-list-ru@f27.mail.ru>
	<201005241249.28629.pazdnikov@prosoft.ural.ru>
	<1274689080.22999.43.camel@localhost>
In-Reply-To: <1274689080.22999.43.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <201005241550.48074.pazdnikov@prosoft.ural.ru>
Reply-To: pazdnikov@prosoftsystems.ru
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Could you enable debugging messages when mounging it after power cuts?
> The messages generate a lot of noise, so you need to disable them before
> starting the real test. The idea is to get UBIFS debugging messages when
> errors occur.
Sorry, I've hurried up, and after applying your pathes reflash all of the 
devices with new firmware.
But I'll setup some devices with all firmware to catch this issue again.

> I never had time to really dig this and fix. Would be nice if you could
> do this because I will unlikely have time in the nearest future, but I
> can help you.
Thank you, I'll continue testings and can supply with debug information.

> One think you can do is to make sure you do not fill UBIFS completely,
> then you will avoid hitting these budgeting bugs, also known as ENOSPC
> issues (I think btrfs uses this terminology).
In the issue above there is 11% used space and 89% free space.
I've got this issue only when mounting fs in RO and then remounting it in RW.

-- 
Best regards,
Sasha
