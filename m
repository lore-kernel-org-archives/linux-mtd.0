Received: from 228-216.205.122.dellhost.com ([216.205.122.228] helo=lakeshoremicro.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16kx0i-0007k9-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Mar 2002 00:52:56 +0000
Message-ID: <002201c1ca2b$00ca7fc0$0101a8c0@dellc800>
From: "Mark Meade" <mark@lakeshoremicro.com>
To: "David Woodhouse" <dwmw2@infradead.org>,
	"Vadim Khmelnitsky" <VadimK@m-sys.com>
Cc: <linux-mtd@lists.infradead.org>
References: <AEA9DCA73595D411A6D4009027DE9C5E019BFA74@MSI-EX6>  <4513.1015976946@redhat.com>
Subject: Re: UnitSizeFactor of != 1 yet? 
Date: Tue, 12 Mar 2002 20:03:48 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

David Woodhouse wrote:

> Er, as in "Sorry, we don't support UnitSizeFactor 0x00" ?

Yes, that was the message I got with the latest cvs code, after relocating the
ReplUnitTable assignment.

Just to make sure I didn't have something else screwed up, I went back to the source in
2.4.18, and added a printk of the UnitSizeFactor.  In that case, it also said 0.

The procedure that led up to this was a "DFORMAT /WIN:D000 /S:DOC504.EXB" in DOS, power
down, boot up Linux 2.4.18, and insmod.  The dformat command ends up putting a formatted
fat partition on the DoC.

Mark
