Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OKBMv-0007sq-6l
	for linux-mtd@lists.infradead.org; Thu, 03 Jun 2010 14:26:02 +0000
Received: by fxm15 with SMTP id 15so145828fxm.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 03 Jun 2010 07:26:00 -0700 (PDT)
Subject: Re: [PATCH] ubi : generate random image_seq when attaching empty
	MTD device
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
In-Reply-To: <4C07B8C3.7080304@parrot.com>
References: <4C07B8C3.7080304@parrot.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 03 Jun 2010 17:25:56 +0300
Message-Id: <1275575156.9729.3.camel@localhost.localdomain>
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

On Thu, 2010-06-03 at 16:14 +0200, Matthieu CASTET wrote:
> generate random image_seq when attaching empty MTD device (kernel do the 
> ubi formating).
> 
> Signed-off-by: Matthieu CASTET <matthieu.castet@parrot.com>

Looks OK, I'll push it to the UBI tree as soon as I have time - very
busy right now, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
