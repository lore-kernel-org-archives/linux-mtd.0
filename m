Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QQiKQ-0001ao-Uk
	for linux-mtd@lists.infradead.org; Sun, 29 May 2011 15:54:59 +0000
Received: by fxm14 with SMTP id 14so2803062fxm.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 29 May 2011 08:54:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5d84u6d24de3ikt776vdrqpnhhecs3aoio@4ax.com>
References: <5d84u6d24de3ikt776vdrqpnhhecs3aoio@4ax.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Sun, 29 May 2011 11:54:36 -0400
Message-ID: <BANLkTimab0pKp68f_coPfsjm_6GdKAxSew@mail.gmail.com>
Subject: Re: [Ubi] Wrong major:minor
To: Gilles <gilles.ganault@free.fr>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, May 29, 2011 at 06:39, Gilles wrote:
> I'm no Linux expert, and was wondering how to find out what the
> correct major:minor is for the Ubi device nodes?

they're most likely dynamic and there's no safe way you could create
the nodes ahead of time with a device table.  simply run mdev to take
care of /dev for you.

you can check /proc/devices to be sure ... anything over 250 is dynamic
-mike
