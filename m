Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18e9rs-0000Md-00
	for <linux-mtd@lists.infradead.org>; Thu, 30 Jan 2003 08:16:17 +0000
Date: Thu, 30 Jan 2003 09:47:11 +0100 (CET)
From: Marius Groeger <mag@sysgo.de>
To: Joakim Tjernlund <Joakim.Tjernlund@lumentis.se>
cc: linux-mtd@lists.infradead.org
Subject: Re: PATCH: support for Arctic/Beech/Ebony
In-Reply-To: <000b01c2c7df$d7c45d40$020120b0@jockeXP>
Message-ID: <Pine.LNX.4.52.0301300945080.1306@mag.devdep.sysgo.de>
References: <Pine.LNX.4.52.0301281755410.19671@mag.devdep.sysgo.de>
 <000b01c2c7df$d7c45d40$020120b0@jockeXP>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Wed, 29 Jan 2003, Joakim Tjernlund wrote:

> 2 comments:
>   - You don't need mb() since ioremap will add the
>      GUARDED attribute to the mapping.
>
>  - Add support for point()/unpoint().

All right, I did both and have just committed it to CVS.

Thanks,
Marius

-----------------------------------------------------------------------------
Marius Groeger           SYSGO Real-Time Solutions AG       mgroeger@sysgo.de
Software Engineering     Embedded and Real-Time Software    www.sysgo.de
Voice: +49-6136-9948-0   Am Pfaffenstein 14                 www.osek.de
FAX:   +49-6136-9948-10  55270 Klein-Winternheim, Germany   www.elinos.com
