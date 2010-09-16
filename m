Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OwBpy-0006uk-LK
	for linux-mtd@lists.infradead.org; Thu, 16 Sep 2010 10:37:07 +0000
Received: by iwn36 with SMTP id 36so1176494iwn.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 16 Sep 2010 03:37:02 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 16 Sep 2010 12:37:02 +0200
Message-ID: <AANLkTimjo2H3AM1tYPSaRdpUt1cWtnvB5f-5fLdD4xAU@mail.gmail.com>
Subject: nandwrite with hw ecc ?
From: Arno Steffen <arno.steffen@googlemail.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have to flash an xloader to my system using uboots "nandwrite hwecc"
Is something like that is also possible with nandwrite, so that I
could upate this partition (the only with hw ecc)
from Linux?
How?
I could see it is possible to flash with oob data. Is this the way?
But what format has this file than?
Thanks
Arno
