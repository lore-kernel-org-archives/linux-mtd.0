Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oh0cs-00053J-5A
	for linux-mtd@lists.infradead.org; Thu, 05 Aug 2010 13:36:54 +0000
Received: by fxm3 with SMTP id 3so3550611fxm.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 05 Aug 2010 06:36:48 -0700 (PDT)
Subject: Re: error!: "/dev/ubi0" is not a character device ?!?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Arno Steffen <arno.steffen@googlemail.com>
In-Reply-To: <AANLkTikZb=R=8BObvTN6uGaZGAmvvUZd4oYKvkCJih7H@mail.gmail.com>
References: <AANLkTikC6wxXV08=AYsqn56h8Cs-qC_-b8hNyq9DUWps@mail.gmail.com>
	<1280150054.14917.108.camel@localhost>
	<AANLkTik7CdwdyhzVYFXG66V3LKZvqnZhLbg4eVC0nQ=S@mail.gmail.com>
	<1280244340.3021.38.camel@localhost.localdomain>
	<AANLkTi=7-Ur35OzqF7iJtiPzfc-Jp-ANGwa3g_Y=+ae8@mail.gmail.com>
	<1280471755.2838.29.camel@localhost.localdomain>
	<AANLkTikZb=R=8BObvTN6uGaZGAmvvUZd4oYKvkCJih7H@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 05 Aug 2010 16:36:45 +0300
Message-Id: <1281015405.1175.32.camel@localhost.localdomain>
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

On Thu, 2010-08-05 at 13:55 +0200, Arno Steffen wrote:
> cat /proc/devices give me back, that  (252 ubi8) is a character device.

Ok.

> But looking above, in /dev it is listed as block device !?!

udev!?!

> For me creating entries are not transparent, this happend with
> ubiattach. No idea how to force ubiattach to write ubi8 in the
> devicelist as character device.

I thought I explained how udev works briefly. I also suggested you
udevmonitor, you can also google. Neither UBI nor ubiattach nor any
other ubi utility should create any /dev device.

Sorry, I cannot provide more help. Try to dig this yourself - there are:
many ways. You can add printks to the kernel. You can even do echo 1
> /proc/sys/vm/block_dump and find out which process creates /dev
entries. Hey, be creative, do not wait that others will solve your
issues! :-)

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
