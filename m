Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18eC29-0000hH-00
	for <linux-mtd@lists.infradead.org>; Thu, 30 Jan 2003 10:35:01 +0000
Date: Thu, 30 Jan 2003 12:05:57 +0100 (CET)
From: Marius Groeger <mag@sysgo.de>
To: David Woodhouse <dwmw2@infradead.org>
cc: linux-mtd@lists.infradead.org
Subject: Re: PATCH: support for Arctic/Beech/Ebony 
In-Reply-To: <4504.1043923350@passion.cambridge.redhat.com>
Message-ID: <Pine.LNX.4.52.0301301203510.3890@mag.devdep.sysgo.de>
References: <Pine.LNX.4.52.0301281755410.19671@mag.devdep.sysgo.de>
 <4504.1043923350@passion.cambridge.redhat.com>
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

On Thu, 30 Jan 2003, David Woodhouse wrote:

> Please also update Kconfig, and add $Id$ headers to new files.

Done. I also added an entry for the MBX860 and some "depends on 8xx"
to the Kconfig to match the logic in Config.in.

Regards,
Marius

-----------------------------------------------------------------------------
Marius Groeger           SYSGO Real-Time Solutions AG       mgroeger@sysgo.de
Software Engineering     Embedded and Real-Time Software    www.sysgo.de
Voice: +49-6136-9948-0   Am Pfaffenstein 14                 www.osek.de
FAX:   +49-6136-9948-10  55270 Klein-Winternheim, Germany   www.elinos.com
