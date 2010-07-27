Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Odm2L-0008V0-OT
	for linux-mtd@lists.infradead.org; Tue, 27 Jul 2010 15:25:46 +0000
Received: by fxm3 with SMTP id 3so781422fxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 27 Jul 2010 08:25:44 -0700 (PDT)
Subject: Re: error!: "/dev/ubi0" is not a character device ?!?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Arno Steffen <arno.steffen@googlemail.com>
In-Reply-To: <AANLkTik7CdwdyhzVYFXG66V3LKZvqnZhLbg4eVC0nQ=S@mail.gmail.com>
References: <AANLkTikC6wxXV08=AYsqn56h8Cs-qC_-b8hNyq9DUWps@mail.gmail.com>
	<1280150054.14917.108.camel@localhost>
	<AANLkTik7CdwdyhzVYFXG66V3LKZvqnZhLbg4eVC0nQ=S@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 27 Jul 2010 18:25:40 +0300
Message-Id: <1280244340.3021.38.camel@localhost.localdomain>
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

On Mon, 2010-07-26 at 15:49 +0200, Arno Steffen wrote:
> [root@or:/]# mount -t ubifs /dev/ubi0_0 /tmp
> mount: mounting /dev/ubi0_0 on /tmp failed: No such device

Try mount -t ubifs ubi0_0 /tmp

Mounting by character device was added only recently, probably your
kernel is older?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
