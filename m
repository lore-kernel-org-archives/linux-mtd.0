Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oeizw-0003Rb-Te
	for linux-mtd@lists.infradead.org; Fri, 30 Jul 2010 06:23:13 +0000
Received: by eyd10 with SMTP id 10so573274eyd.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 29 Jul 2010 23:23:11 -0700 (PDT)
Subject: Re: error!: "/dev/ubi0" is not a character device ?!?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Arno Steffen <arno.steffen@googlemail.com>
In-Reply-To: <AANLkTik7CdwdyhzVYFXG66V3LKZvqnZhLbg4eVC0nQ=S@mail.gmail.com>
References: <AANLkTikC6wxXV08=AYsqn56h8Cs-qC_-b8hNyq9DUWps@mail.gmail.com>
	<1280150054.14917.108.camel@localhost>
	<AANLkTik7CdwdyhzVYFXG66V3LKZvqnZhLbg4eVC0nQ=S@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 30 Jul 2010 09:23:09 +0300
Message-Id: <1280470989.2838.16.camel@localhost.localdomain>
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
> > Your udev rules, perhaps? Creating device nodes is responsibility of
> > your system, not UBI/ubi-utils.
> 
> My mtd8 is a character device as it should be.
> crw-rw----    1 root     root      90,  16 Jan  1 00:00 /dev/mtd8
> 
> I don't know who is creating the device node, but it is avauilable
> after ubiattach.
> If it is done by udev - how to control it and change it's behaviour?
> I can delete the device node and create one manually as described by
> free_electrons.

When UBI registers character devices, the generic linux chdev code sends
an uevent to user-space. This uevent event contains the information
about what was created, major/minor of that, etc.

In user-space there is udevd, which is listening on a netlink socket,
and handles the uevents. There are udev rules which describe how to
handle events, the rules are usually at /etc/udev/rules.d/

So, I suspect that one of your rules is screwed.

You should use udevmonitor and take a look at the events and how they
are handled. And google a bit, perhaps. udev has nothing to do with UBI.
And I do not know much about udev.

> cat /sys/class/ubi/ubi0/dev (e.g. 253:0)
> mknod /dev/ubi0 c 253 0

This looks correct

> Calling ubimkvol then creates a lot of other errors. (see below)

This is strange.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
