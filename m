Received: from isengard.yottayotta.com ([209.115.177.37])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 170CuF-00062B-00
	for <linux-mtd@lists.infradead.org>; Wed, 24 Apr 2002 03:53:19 +0100
Received: from fw-edm-dmz.yottayotta.com ([192.168.1.2] helo=edm-app01.yottayotta.com)
	by isengard.yottayotta.com with esmtp (Exim 3.33 #1)
	id 170Cky-0003OW-00
	for linux-mtd@lists.infradead.org; Tue, 23 Apr 2002 20:43:44 -0600
Message-ID: <3CC61DDF.3050102@yottayotta.com>
Date: Tue, 23 Apr 2002 20:52:15 -0600
From: Murtada Shah <mshah@yottayotta.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: mtd jffs2 on 2.4.18-rmk3: undefined references
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


I'm trying to install the mtd from the cvs rep. for 2.4.18 kernel with rmk3 patch.


I copied (normally it ln -sf, but I cp -f'd) the files over, but I'm getting
undefined references to zlib_deflateInit_, zlib_inflateInit_ and some other
zlib_<> calls.. which seem to reside in the lib/zlib_deflate &
lib/zlib_inflate directories of mtd. How do I copy these to the linux kernel
so I can cross-compile 2.4.18-rmk3 with latest mtd without undefined reference
errors?


Murtada Shah
