Received: from smtp10.atl.mindspring.net ([207.69.200.246])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17prZ3-0000Uy-00
	for <linux-mtd@lists.infradead.org>; Fri, 13 Sep 2002 15:36:57 +0100
Received: from sdn-ap-024tnnashp0337.dialsprint.net ([65.181.17.83] helo=there)
	by smtp10.atl.mindspring.net with smtp (Exim 3.33 #1)
	id 17prZ0-0001xO-00
	for linux-mtd@lists.infradead.org; Fri, 13 Sep 2002 10:36:55 -0400
Content-Type: text/plain;
  charset="iso-8859-1"
From: Kyle Harris <kharris@nexus-tech.net>
To: linux-mtd@lists.infradead.org
Subject: 2.5 jffs2 wierdness
Date: Fri, 13 Sep 2002 10:32:18 -0400
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <E17prZ0-0001xO-00@smtp10.atl.mindspring.net>
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

Here's what I'm seeing at present. 

I built a jffs2 root fs. When the system boots, the kernel hangs (vectors to 
PC 0x4000xxxx). I tracked this down to the binary mawk. If I omit certain 
startup scripts the system boots. If I then run mawk the system hangs. I can 
boot from a nfs root, then mount jffs2, then run mawk from the mounted jffs2 
partition and it works fine! What would be different running a binary from 
root fs vs. a non-root partition? This is an embedded fs, so I think if I 
start adding debug utils (strace, etc.) the problem will most likely change 
)or go away). My original jffs2 fs failed when running mini_httpd, so it 
varies depending on what's on the fs. 

Kyle.
