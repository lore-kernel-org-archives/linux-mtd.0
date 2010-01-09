Received: from mail-fx0-f222.google.com ([209.85.220.222])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NTkZL-0006wo-Kx
	for linux-mtd@lists.infradead.org; Sat, 09 Jan 2010 23:18:12 +0000
Received: by fxm22 with SMTP id 22so22922226fxm.2
	for <linux-mtd@lists.infradead.org>;
	Sat, 09 Jan 2010 15:18:06 -0800 (PST)
Subject: RE: UBI - exclude bootloader blocks from wear levelling
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Darwin Rambo <drambo@broadcom.com>
In-Reply-To: <B125D8217ABC4B43826503DE00A2D44910DFC175CF@SJEXCHCCR01.corp.ad.broadcom.com>
References: <4B2FA658.6010407@wyplay.com>
	<B125D8217ABC4B43826503DE00A2D44910DFC17584@SJEXCHCCR01.corp.ad.broadcom.com>
	<dbdb2ea60912211451vda39800t803891a2acf9528a@mail.gmail.com>
	<B125D8217ABC4B43826503DE00A2D44910DFC175CF@SJEXCHCCR01.corp.ad.broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 10 Jan 2010 01:18:04 +0200
Message-Id: <1263079084.7315.113.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	twebb <taliaferro62@gmail.com>, Lauren Del Giudice <lauren@wyplay.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-12-21 at 15:12 -0800, Darwin Rambo wrote:
> My understanding is that wear levelling occurs across each ubi device,
> and if there were 4 volumes on it, then the wear levelling would be
> spread efficiently over the single large device. Then you probably get
> better wear levelling than if you had 4 smaller devices and 4 volumes.

Right.

WL works on UBI device, which corresponds to the attached MTD device. So
there is 1-1 mapping between MTD and UBI devices. And each UBI device
may contain many volumes.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
