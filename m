Received: from anchor-post-35.mail.demon.net ([194.217.242.85])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18HkLV-000206-00
	for <linux-mtd@lists.infradead.org>; Fri, 29 Nov 2002 12:34:13 +0000
Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: RE: JFFS/MTD and Raw access
Date: Fri, 29 Nov 2002 13:04:30 -0000
Message-ID: <541025071C7AC24C84E9F82296BB9B950807D2@OPTEX1.optex.local>
From: "John Hall" <john.hall@optionexist.co.uk>
To: <tglx@linutronix.de>
Cc: <simon@baydel.com>,
	"Damien GERANTON" <dgeranton@alpha3i.com>,
	"MTD mailing list" <linux-mtd@lists.infradead.org>
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

On 29 November 2002 12:35 Thomas Gleixner <tglx@linutronix.de> wrote:

> For NAND see http://www.linux-mtd/tech/nand.html

You mean http://www.linux-mtd.infradead.org/tech/nand.html

I found a small bug on the page that caused all the text from "HOWTO
implement NAND support" onwards to be in h2. Patch is here:

diff -u nand.html.orig nand.html
--- nand.html.orig      Fri Nov 29 13:02:46 2002
+++ nand.html   Fri Nov 29 13:03:49 2002
@@ -191,7 +191,7 @@
 </p>

 <hr>
-<h2>JFFS2 specific information <h2>
+<h2>JFFS2 specific information</h2>
 <h3>JFFS2 Out of Band usage</h3>

 <h4>Nand chips with 256 byte pagesize and 8 byte OOB size</h4>

Regards,
John Hall
