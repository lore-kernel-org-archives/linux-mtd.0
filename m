Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17AUq1-0007k3-00
	for <linux-mtd@lists.infradead.org>; Wed, 22 May 2002 13:03:29 +0100
Date: Wed, 22 May 2002 14:03:18 +0200 (CEST)
From: Marius Groeger <mag@sysgo.de>
To: =?gb2312?q?cytang?= <cytang_cn@yahoo.com.cn>
cc: linux-mtd@lists.infradead.org
Subject: Re: how to make a bootable linux on doc millennium
In-Reply-To: <20020522113147.93156.qmail@web14405.mail.yahoo.com>
Message-ID: <Pine.LNX.4.40.0205221400530.8118-100000@mag.devdep.sysgo.de>
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

On Wed, 22 May 2002, [gb2312] cytang wrote:

>   my aim is just to build a mini system which can boot
> off my doc . I dont know whether 8M space of Doc  is
> enough . How can I make such a small system ,and can
> boot form doc?

I never got around trying this, but there seem to be two options to do
this:

- There are patches for LILO to make it work with DOC devices

- There are patches for the GRUB bootloader to make it work with DOC
  devices

Regards,
Marius

-----------------------------------------------------------------------------
Marius Groeger           SYSGO Real-Time Solutions GmbH     mgroeger@sysgo.de
Software Engineering     Embedded and Real-Time Software    www.sysgo.de
Voice: +49-6136-9948-0   Am Pfaffenstein 14                 www.osek.de
FAX:   +49-6136-9948-10  55270 Klein-Winternheim, Germany   www.elinos.com
