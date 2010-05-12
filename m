Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OC8mt-0007N2-ST
	for linux-mtd@lists.infradead.org; Wed, 12 May 2010 10:03:36 +0000
Received: by fxm17 with SMTP id 17so4571585fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 12 May 2010 03:03:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <B125D8217ABC4B43826503DE00A2D44910FDF52118@SJEXCHCCR01.corp.ad.broadcom.com>
References: <i2z804f0d21005060530qb2a65906j62e68c9f6f5e90bc@mail.gmail.com>
	<B125D8217ABC4B43826503DE00A2D44910FDF51E19@SJEXCHCCR01.corp.ad.broadcom.com>
	<r2m804f0d21005070245p46f7ab7aoa182a1c5316f7b3f@mail.gmail.com>
	<B125D8217ABC4B43826503DE00A2D44910FDF52118@SJEXCHCCR01.corp.ad.broadcom.com>
Date: Wed, 12 May 2010 12:03:32 +0200
Message-ID: <AANLkTilpNYg2zPoAmB5b6oky22VDyjBS94kedv2sojXG@mail.gmail.com>
Subject: Re: <4>mtd->read(x bytes from y) returned ECC error / Node header CRC
	failed / READ error
From: Arno Steffen <arno.steffen@googlemail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I could solve this issue by changing to kernel 2.6.33 (before 2.6.28).
No problems anymore, even on a writeable mounted root-fs.

2010/5/7 Darwin Rambo <drambo@broadcom.com>:
>> For the first I have mounted the jffs2 (rootfs) as read only
>> (confirmed by a "VFS: Mounted root (jffs2 filesystem) readonly
>> message").
>> The behaviour is still the same. So does it makes a difference to set
>> WriteProtection?
>> The other question - if this is some selfhealing issue (as messages
>> dissapear in next boot), why it will not try to heal itself right on
>> time? Is it possible to force this?
>> I cound't found a fitting option in kernel config (at least not one I
>> would understood).
>
> Sorry, I missed that. My comment was for writable file systems.
>
