Received: from chfdns02.ch.intel.com ([143.182.246.25] helo=melete.ch.intel.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15shiC-0003Hn-00
	for <linux-mtd@lists.infradead.org>; Sun, 14 Oct 2001 10:37:37 +0100
Received: from hasmsxvs01.iil.intel.com (hasmsxvs01.iil.intel.com [143.185.63.58])
	by melete.ch.intel.com (8.9.1a+p1/8.9.1/d: relay.m4,v 1.44 2001/10/01 19:10:43 root Exp $) with SMTP id JAA09040
	for <linux-mtd@lists.infradead.org>; Sun, 14 Oct 2001 09:46:45 GMT
Received: from hasmsx17.iil.intel.com ([143.185.63.203])
 by hasmsxvs01.iil.intel.com (NAVGW 2.5.1.6) with SMTP id M2001101411464516972
 for <linux-mtd@lists.infradead.org>; Sun, 14 Oct 2001 11:46:45 +0200
Message-ID: <7C0E66E1B97BD5119B120002A50A63D22E4191@hasmsx101.iil.intel.com>
From: "Kremer, Alex" <alex.kremer@intel.com>
To: linux-mtd@lists.infradead.org
Subject: linux/completion.h
Date: Sun, 14 Oct 2001 11:46:43 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ISO-8859-1"
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

Hi all,

>From about a month ago, the jffs2 code uses the "completion" interface that
appeared
only around 2.4.8. This means that jffs2 cannot be compiled unmodified with
kernels
prior to this. I'm using 2.4.1 and cannot currently upgrade (hw
compatibility issues,
that would demand too many changes).

Does anyone know what would be a sufficient set of changes either to
jffs2 or the kernel that wouldn't break anything and allow me use the latest
jffs2
code?
It seems that completion() and wait_for_completion() just manage
the wait queue. I'll try to just add them. Has anyone tried this, yet?

Thanks,
Kreso
