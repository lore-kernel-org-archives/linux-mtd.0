Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18EOhD-0004ec-00
	for <linux-mtd@lists.infradead.org>; Wed, 20 Nov 2002 06:50:47 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <BDEDIOGGNJEEPBHLJLFGIENECDAA.tium@palmpalm.com> 
References: <BDEDIOGGNJEEPBHLJLFGIENECDAA.tium@palmpalm.com> 
To: "Taeil Um" <tium@mail.palmpalm.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: (no subject) 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 20 Nov 2002 07:20:53 +0000
Message-ID: <3734.1037776853@passion.cambridge.redhat.com>
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

tium@mail.palmpalm.com said:
> raw unchecked node of size 0x64034000 freed from erase block 13 at
> 0x000340c0, but un0 

Your output is corrupted.

Please reproduce with CONFIG_JFFS2_FS_DEBUG=1 and show the messages from 
the beginning of the mount.

What's on the flash at offset 0x340c0? Not a node of length 0x64034000 and 
with a valid CRC32 in the header, I'll bet. What compiler are you using?

--
dwmw2
