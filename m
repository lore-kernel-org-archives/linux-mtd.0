Received: from mail-fx0-f222.google.com ([209.85.220.222])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Ncty7-0000Q3-92
	for linux-mtd@lists.infradead.org; Thu, 04 Feb 2010 05:09:35 +0000
Received: by fxm22 with SMTP id 22so4832602fxm.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 03 Feb 2010 21:09:29 -0800 (PST)
Subject: Re: To remove UBI Control Device . . .
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Lee Amirev <lee.amirev@gmail.com>
In-Reply-To: <e14c53d91001251215k5e7074d4lb579d43df530b94a@mail.gmail.com>
References: <e14c53d91001251215k5e7074d4lb579d43df530b94a@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 04 Feb 2010 07:09:25 +0200
Message-Id: <1265260166.2517.39.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-01-25 at 15:15 -0500, Lee Amirev wrote:
> My system does not need to dynamically attach or detach MTD devices to
> UBI.  We can just attach all that we need through boot or module
> parameters.  Therefore, we don't need the UBI control device
> (/dev/ubi_ctrl).   In order to prevent the device from existing, I
> could simply comment out the misc_register and misc_deregister calls
> in ubi_init or ubi_exit in /drivers/mtd/ubi/build.c.  Is this
> sufficient?  Are there any unintended consequences in removing the
> control device?

It should be fine. But I do not think it is nice solution. I think the
proper solution is to amend your udev rules.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
