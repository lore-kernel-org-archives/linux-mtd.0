Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QRgsB-0003Li-Ko
	for linux-mtd@lists.infradead.org; Wed, 01 Jun 2011 08:33:52 +0000
Received: by wyb28 with SMTP id 28so5132807wyb.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 01 Jun 2011 01:33:48 -0700 (PDT)
Subject: Re: [Ubi] Wrong major:minor
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Gilles <gilles.ganault@free.fr>
In-Reply-To: <BANLkTimab0pKp68f_coPfsjm_6GdKAxSew@mail.gmail.com>
References: <5d84u6d24de3ikt776vdrqpnhhecs3aoio@4ax.com>
	<BANLkTimab0pKp68f_coPfsjm_6GdKAxSew@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 01 Jun 2011 11:29:23 +0300
Message-ID: <1306916963.4405.72.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Mike Frysinger <vapier.adi@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2011-05-29 at 11:54 -0400, Mike Frysinger wrote:
> On Sun, May 29, 2011 at 06:39, Gilles wrote:
> > I'm no Linux expert, and was wondering how to find out what the
> > correct major:minor is for the Ubi device nodes?
> 
> they're most likely dynamic and there's no safe way you could create
> the nodes ahead of time with a device table.  simply run mdev to take
> care of /dev for you.
> 
> you can check /proc/devices to be sure ... anything over 250 is dynamic
> -mike

Right, UBI allocates device numbers dynamically, so pre-creating device
nodes is not a good idea.

Major/minor for every UBI device / UBI volume can be found at:

/sys/class/ubi/ubiX/dev
/sys/class/ubi/ubiX_Y/dev

Or the major number can be indeed found at /proc/devices, and then the
minor numbers follow the following fomula:

UBI Volume major number = UBI device major number.
UBI Volume minor number = UBI volume ID + 1.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
