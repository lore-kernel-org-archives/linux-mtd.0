Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17SdVt-0001HP-00
	for <linux-mtd@lists.infradead.org>; Thu, 11 Jul 2002 13:57:41 +0100
Date: Thu, 11 Jul 2002 14:57:40 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: linux-mtd@lists.infradead.org
Cc: jffs-dev@axis.com
Subject: Support for NOR flash with ECC
Message-ID: <20020711125740.GA6789@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

Hi!

Recently, I have hacked up support for the STMicro M58LW064A flash
chips, see http://www.st.com/stonline/books/pdf/docs/7239.pdf.

The patch series here works for me, but might require some tweaks for
other people and will require some cleanup work before David should
accept it.

This is basically a preview, until my exams are over and I have some
time to work on the patches again. Sorry, time is running out.

Jörn

-- 
A surrounded army must be given a way out.
-- Sun Tzu
