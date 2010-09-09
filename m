Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Otdoh-0000yE-Kt
	for linux-mtd@lists.infradead.org; Thu, 09 Sep 2010 09:53:16 +0000
Received: by fxm12 with SMTP id 12so911529fxm.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 09 Sep 2010 02:53:14 -0700 (PDT)
Subject: Re: ubifs : corruption after power cut test
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
In-Reply-To: <4C88A769.4010103@parrot.com>
References: <4C346D5B.2000609@parrot.com> <4C3C1572.8080501@parrot.com>
	<4C3C2740.2040105@parrot.com> <4C3C30D1.9030005@parrot.com>
	<1279031064.31639.90.camel@localhost> <4C3C81E3.3030407@parrot.com>
	<4C4FDEF5.2040405@parrot.com>  <1282463086.16502.38.camel@brekeke>
	<1283763308.11066.0.camel@localhost>  <4C88A769.4010103@parrot.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 09 Sep 2010 12:51:45 +0300
Message-ID: <1284025905.27765.2.camel@localhost>
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

> PS : any idea/comment on the handling of interrupted write page by 
> UBI/UBIFS ?

Err, I think these are perfectly handled, I read your e-mails, they were
a little messy, but I did not find anything UBIFS does not handle. I
sent you a fix for your oops.

Would you please re-formulate your questions nicely in a separate
e-mail, if you still have them?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
