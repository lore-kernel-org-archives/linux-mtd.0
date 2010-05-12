Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OC2eU-0006sv-24
	for linux-mtd@lists.infradead.org; Wed, 12 May 2010 03:30:30 +0000
Received: by fxm17 with SMTP id 17so4276694fxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 11 May 2010 20:30:28 -0700 (PDT)
Subject: Re: Can not mount UBIFS
From: Artem Bityutskiy <dedekind1@gmail.com>
To: =?UTF-8?Q?=E6=9E=97=E4=BA=8E=E5=B3=BB?= <okpalin@gmail.com>
In-Reply-To: <AANLkTilpKdU3IrnoLCLnCqiW_E9a2VbyyREVoTpVRk-F@mail.gmail.com>
References: <a145ef951003110433k5fd6c3c0h23bbe73fdb39686f@mail.gmail.com>
	<531B6536C9F737458807DF75064873C8BE5EB0382D@mta-digimail.MTA.INT>
	<a145ef951003160113x7baea205i8deb13c14ba8e0de@mail.gmail.com>
	<1270544458.6754.15.camel@localhost>
	<r2va145ef951005030454ud5400ebao9ce886d0e86c7549@mail.gmail.com>
	<1272888512.27729.46.camel@localhost>
	<i2sa145ef951005032020i17584946r95957f8a038efe23@mail.gmail.com>
	<AANLkTil-IPNGJdudKOjtHjc9Y2od0xM2-D7beVEV_HHI@mail.gmail.com>
	<1273556690.2209.146.camel@localhost>
	<AANLkTilpKdU3IrnoLCLnCqiW_E9a2VbyyREVoTpVRk-F@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 12 May 2010 06:30:24 +0300
Message-Id: <1273635024.8881.1.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Bosi Daniele <Daniele.Bosi@mta.it>,
	GUIDA Nicola <Nicola.GUIDA@numonyx.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-05-12 at 09:18 +0800, 林于峻 wrote:
> Dear Sir,
> 
> I am very confused.
> If the driver has some problems, why images written by ubiformat can work well?
> Images written by bootloader or ubiformat should have the same
> problem, if the driver is wrong.

I do not know. May be this is not a driver problem. May be you write
twice to the same page? Just dig your driver, insert printks and find
out where exactly it decides to return error.
-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
