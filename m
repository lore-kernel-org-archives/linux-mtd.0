Received: from ca-ol-bordeaux-26-216.abo.wanadoo.fr ([80.8.74.216] helo=localhost.localdomain)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1725v3-0006g2-00
	for <linux-mtd@lists.infradead.org>; Mon, 29 Apr 2002 08:49:57 +0100
Received: from openwide.fr (IDENT:pierre@localhost.localdomain [127.0.0.1])
	by localhost.localdomain (8.9.3/8.9.3) with ESMTP id JAA05579
	for <linux-mtd@lists.infradead.org>; Mon, 29 Apr 2002 09:49:27 +0200
Message-ID: <3CCCFB07.6F3494BE@openwide.fr>
Date: Mon, 29 Apr 2002 09:49:27 +0200
From: Pierre Ficheux <pierre.ficheux@openwide.fr>
MIME-Version: 1.0
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: compile error - kernel 2.4.17 +
References: <1019247180.1363.17.camel@zeus>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

Frederick Lefebvre wrote:
> 
> The patchin.sh utility replaces compatmac.h which is included from mtd.h
> and then from fs/jffs2/background.c . The problem is that compatmac.h
> redefines recalc_sigpending(struct task_struct *t) with
> ecalc_sigpending(void) which is used by fs/jffs2/background.c .  The
> consequence is that the jffs2 driver does not compile anymore.  Am I
> missing something or is that a bug?

	I got the same error as I got the last CVS yesterday. Of course I have
changed the 2 calls in background.c and it works fine. Is it an
'official' bug? Are we missing anything?

	regards

> Frederick Lefebvre
> flefebvre@irg.ca

-- 
Pierre FICHEUX -/- CTO OpenWide, France -\- pierre.ficheux@openwide.fr
				         http://www.ficheux.com
					 http://www.emulateur-xtel.org
More fun, more freedom, less Micro$oft
