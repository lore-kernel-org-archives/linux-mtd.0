Received: from [209.71.224.24] (helo=mail.webnet.qc.ca)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16yehf-0007V1-00
	for <linux-mtd@lists.infradead.org>; Fri, 19 Apr 2002 21:09:55 +0100
Subject: compile error - kernel 2.4.17 +
From: Frederick Lefebvre <flefebvre@irg.ca>
To: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 19 Apr 2002 16:13:00 -0400
Message-Id: <1019247180.1363.17.camel@zeus>
Mime-Version: 1.0
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

The patchin.sh utility replaces compatmac.h which is included from mtd.h
and then from fs/jffs2/background.c . The problem is that compatmac.h
redefines recalc_sigpending(struct task_struct *t) with
ecalc_sigpending(void) which is used by fs/jffs2/background.c .  The
consequence is that the jffs2 driver does not compile anymore.  Am I
missing something or is that a bug?

Fred

-- 
Frederick Lefebvre
flefebvre@irg.ca
Software Developer,
(418)523-4474 #242
Infomedia Research Group (IRG)
Quebec, Canada
