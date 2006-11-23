Received: from smtpd2.aruba.it ([62.149.128.207] helo=smtp3.aruba.it)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GnHD7-0005qF-Bx
	for linux-mtd@lists.infradead.org; Thu, 23 Nov 2006 11:14:08 -0500
Message-ID: <4565C738.30800@gfplab.com>
Date: Thu, 23 Nov 2006 17:07:20 +0100
From: Paolo Scaffardi <scaffardi@gfplab.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Problems with sumtool with linux-mtd 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi there!
I'm developing for a arm cirrus ep9302-based board target. The build
system was based on an older mtd version. I upgraded to version 1.0.
Now, it seems i have a problem using sumtool (that was never used before
by build system after creating jffs2).

I correctly made my jffs2 filesystem for my on-board flash (intel, NOR
type, 128Kb x 128 blocks) with this cmd:

mkfs.jffs2 --pad=$((8*1024*1024)) --eraseblock=$((128*1024)) -d
/opt/mydir -o image.jffs2

Then i called sumtool with:

sumtool --pad --eraseblock=$((128*1024)) --input=image.jffs2
--output=image2.jffs2

The problem is that the second images was really smaller than the first
one (384Kb).

Why that?
Sumtool dont give me any error!

Bye,
Paolo Scaffardi
GFP Lab s.r.l.
http://www.gfplab.com
fax 178 2258454
