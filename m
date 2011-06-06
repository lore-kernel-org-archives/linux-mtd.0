Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTavM-0006kZ-Be
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 14:37:04 +0000
Received: by fxm14 with SMTP id 14so3609494fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 07:36:58 -0700 (PDT)
Subject: Re: impact of 2X_PROGRAM on read operations
From: Artem Bityutskiy <dedekind1@gmail.com>
To: David Wagner <david.wagner@free-electrons.com>
In-Reply-To: <4DECC41F.5060808@free-electrons.com>
References: <4DECC41F.5060808@free-electrons.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 06 Jun 2011 17:32:41 +0300
Message-ID: <1307370761.3112.76.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kmpark@infradead.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-06-06 at 14:12 +0200, David Wagner wrote:
> Is there a way to safely read without 2X_PROGRAM enabled once it has
> been flashed with a 2X_PROGRAM-enabled flasher (e.g. patched u-boot).

Not sure about u-boot, but AFAIK 2x is a completely separate mode which
gives you I/O speed-up but makes things incompatible with "normal" mode.
E.g., you can mount JFFS2 only in one of the modes.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
