Received: from ns.sysgo.de ([213.68.67.98] helo=mailgate.sysgo.de)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BiDmF-0003Re-GP
	for linux-mtd@lists.infradead.org; Wed, 07 Jul 2004 10:52:04 -0400
Date: Wed, 7 Jul 2004 16:51:54 +0200 (CEST)
From: Marius Groeger <mgroeger@sysgo.com>
Sender: mag@sysgo.com
To: Rainer Weikusat <rainer.weikusat@sncag.com>
In-Reply-To: <8765909olf.fsf@farside.sncag.com>
Message-ID: <Pine.LNX.4.56.0407071646170.19011@mag.sysgo.com>
References: <87fz85eidc.fsf@farside.sncag.com>
	<8765909olf.fsf@farside.sncag.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org
Subject: Re: cmdlineparts.c [PATCH]
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 7 Jul 2004, Rainer Weikusat wrote:

> not quite know what to do with it. And I don't really have an idea
> about what to do with the 'author' and 'copyright' parts, either,

You should claim the MODULE_AUTHOR() tag for yourself. OTOH, it is
good practice to just leave the existing copyright notices in the head
and add yours to the list. Is it OK for you to use this hunk?

--- cmdlinepart.c.org   2004-07-07 16:48:53.000000000 +0200
+++ cmdlinepart.c       2004-07-07 16:49:50.000000000 +0200
@@ -3,7 +3,8 @@
  *
  * Read flash partition table from command line
  *
- * Copyright 2002 SYSGO Real-Time Solutions GmbH
+ * Copyright 2002 SYSGO AG
+ * Copyright 2004 SNC AG
  *
  * The format for the command line is as follows:
  *

Regards,
Marius

-- 
Marius Groeger <mgroeger@sysgo.com>           Project Manager
SYSGO AG                      Embedded and Real-Time Software
Voice: +49 6136 9948 0                  FAX: +49 6136 9948 10
www.sysgo.com | www.elinos.com | www.osek.de | www.imerva.com
