Received: from web36703.mail.mud.yahoo.com ([209.191.85.37])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JySN5-0008N2-MM
	for linux-mtd@lists.infradead.org; Tue, 20 May 2008 13:59:20 +0000
Date: Tue, 20 May 2008 06:59:18 -0700 (PDT)
From: Alex Dubov <oakad@yahoo.com>
Subject: Support of removable MTD devices and other advanced features
	(follow-up from lkml)
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <411628.55054.qm@web36703.mail.mud.yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Greetings.

I was working on SmartMedia and MemoryStick support and found that some
desirable features are missing from MTD core. As the thread on lkml died out I
would like to continue it here.

First, I want to say that I'm not aiming for immediate inclusion of my code. I,
however, want to work toward target that will be acceptable by all MTD
developers.

Second, I don't want to start a flame war. I just want to hear some
suggestions, if possible.

And third, architectural switch I'm proposing should not require modification
to low level chip drivers or higher level functionality of UBI kind. They can
be glued together with relative ease (callback architecture is quite flexible).
My target is device management and FTL drivers.

Therefore, I propose (and intend to implement) a new architecture for MTD core,
modeled after the block device API. The "alpha" version of it is here:

http://gentoo-wiki.com/User:Oakad/mtd_proposal



      
