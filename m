Received: from isengard.yottayotta.com ([209.115.177.37])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 170vv4-0000Qp-00
	for <linux-mtd@lists.infradead.org>; Fri, 26 Apr 2002 03:57:10 +0100
Message-ID: <3CC8C1C9.80709@yottayotta.com>
Date: Thu, 25 Apr 2002 20:56:09 -0600
From: Murtada Shah <mshah@yottayotta.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.arm.linux.org.uk
Subject: Kernel removing directories
Content-Type: text/plain; charset=us-ascii; format=flowed
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

Hi,

I'm booting from flash... but during bootup jffs2 erases some things it 
seems??

"inode #7 was a directory with children ... removing those too"

Why does it do this? then I can't boot since one of my directories is 
erased... and I have to boot from nfs & re-install the items.

Murtada
