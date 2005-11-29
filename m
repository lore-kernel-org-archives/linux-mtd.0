Received: from mail-out.m-online.net ([212.18.0.9])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Eh2Qg-0003jY-MR
	for linux-mtd@lists.infradead.org; Tue, 29 Nov 2005 05:09:47 -0500
To: Michael Richardson <mcr@sandelman.ottawa.on.ca>
From: Wolfgang Denk <wd@denx.de>
Mime-version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 8bit
In-reply-to: Your message of "Mon, 28 Nov 2005 21:26:22 EST."
	<v0mzjofaup.fsf@marajade.sandelman.ca>
Date: Tue, 29 Nov 2005 11:09:37 +0100
Sender: wd@denx.de
Message-Id: <20051129100937.AF133353F54@atlas.denx.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/2] --cvs-exclude for mkfs.jffs2 
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In message <v0mzjofaup.fsf@marajade.sandelman.ca> you wrote:
> 
> This adds an option to ignore CVS directories.

This doesn't make sense to me. You can and should use "cvs export" to
create the directory trees you want to package.

You use  CVS,  others  use  GIT,  or  Subversion,  or  ClearCase,  or
Monotone,  or darcs, or ... - it would not be really practical to add
special rules for everybody's favorite tool.

Best regards,

Wolfgang Denk

-- 
Software Engineering:  Embedded and Realtime Systems,  Embedded Linux
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
You can observe a lot just by watchin'.                  - Yogi Berra
