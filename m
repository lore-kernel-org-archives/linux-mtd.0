Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OaPcv-0003cl-3p
	for linux-mtd@lists.infradead.org; Sun, 18 Jul 2010 08:53:37 +0000
Received: by fxm3 with SMTP id 3so1950798fxm.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 18 Jul 2010 01:53:35 -0700 (PDT)
Subject: Re: UBIFS memleak ?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
In-Reply-To: <4C3C3024.8050104@parrot.com>
References: <4C3C3024.8050104@parrot.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 18 Jul 2010 11:53:31 +0300
Message-Id: <1279443211.16247.43.camel@localhost.localdomain>
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

On Tue, 2010-07-13 at 11:21 +0200, Matthieu CASTET wrote:
> Hi,
> 
> in mount_ubifs shouldn't we do something like that in case of 
> ubifs_leb_unmap error ?

Yes, are you going to send a proper patch with signed-off-by?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
