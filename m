Received: from wf-out-1314.google.com ([209.85.200.169])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M4Kmi-0006hz-Tt
	for linux-mtd@lists.infradead.org; Wed, 13 May 2009 20:10:43 +0000
Received: by wf-out-1314.google.com with SMTP id 23so515251wfg.24
	for <linux-mtd@lists.infradead.org>;
	Wed, 13 May 2009 13:10:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <72795ccb0905130803y25acae9bwde94ed86d0dbb4f2@mail.gmail.com>
References: <72795ccb0905060026q7dcb45c0u15c35943374fcc78@mail.gmail.com>
	<1241673722.27549.14.camel@localhost.localdomain>
	<1241674092.27549.16.camel@localhost.localdomain>
	<72795ccb0905130803y25acae9bwde94ed86d0dbb4f2@mail.gmail.com>
Date: Wed, 13 May 2009 22:10:30 +0200
Message-ID: <71cd59b00905131310u7d374ddds82da975781f2d00b@mail.gmail.com>
Subject: Re: Load UBI faster
From: Corentin Chary <corentin.chary@gmail.com>
To: simon polette <spolette@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, spolette@adetelgroup.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2009/5/13 simon polette <spolette@gmail.com>:
> My NAND is 256MB but I use only a 130MB partition for UBI/UBIFS.
> So I implemented the on-flash BBT, that made me save 120ms which is a
> sizeable improvement.
> On the other hand, skipping crc calculation for header doesn't seem to
> save much time (perhaps ~10ms so it's difficult to measure the
> difference).

You can try playing with bootchart http://www.bootchart.org/ to be
sure that there is nothing else to change
during the boot process.
You can also try to get separate results to see what's taking time
(mtd, ubi, ubifs). CONFIG_FUNCTION_TRACER and CONFIG_BOOT_TRACER may
help you with  that.
I'll do some test on the same hardware soon, maybe I'll be able to
help you more.

-- 
Corentin Chary
http://xf.iksaif.net - http://uffs.org
