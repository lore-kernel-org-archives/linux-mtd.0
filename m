Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1deHoT-00039r-36
 for linux-mtd@lists.infradead.org; Sun, 06 Aug 2017 09:25:34 +0000
Subject: Re: "UBIFS error (pid 396): dbg_check_space_info: free space changed
 from" + ecryptfs
To: Oleksij Rempel <ore@pengutronix.de>, kernel@pengutronix.de
Cc: linux-mtd@lists.infradead.org
References: <dbc5bc9f-6c38-a0c3-e776-050a70382814@rempel-privat.de>
 <20170802140642.kpsdh3jfow2azevm@pengutronix.de>
From: Richard Weinberger <richard@nod.at>
Message-ID: <2d11efa2-dda2-7810-dd22-965b295bbff9@nod.at>
Date: Sun, 6 Aug 2017 11:25:09 +0200
MIME-Version: 1.0
In-Reply-To: <20170802140642.kpsdh3jfow2azevm@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Oleksij,

Am 02.08.2017 um 16:06 schrieb Oleksij Rempel:
> Hallo all,
> 
> Initial issue was detected on kernel 4.0.9 and is still reproducible
> with same kernel version + most of back ported ubi/ubifs patches till
> the kernel v4.12. UBIfs encryption patches was not backported.
> 
> To reproduce it I needed:
> - system with fresh flashed ubi image.
> - on first start it should run following script:
>> mount -o remount,rw /
>> mount -t ecryptfs ... /dst
>> ... do some work and mv some files to /dst
>> umount /dst
>> mount -o remount,ro / <--  UBIFS error (pid 396): dbg_check_space_info:

Does this also happen on mainline?
Also please try in nandsim to rule out chip specific issues.

Can you please share the ecryptfs configuration?
i.e. are file names encrypted or not?

Thanks,
//richard
