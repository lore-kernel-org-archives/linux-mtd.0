Received: from [2002:c1ed:8229::1] (helo=baythorne.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1ApmKc-0006EK-VP
	for linux-mtd@lists.infradead.org; Sun, 08 Feb 2004 10:38:31 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Florian Schirmer <jolt@tuxbox.org>
In-Reply-To: <007301c3ebea$29f96270$9602010a@jingle>
References: <007301c3ebea$29f96270$9602010a@jingle>
Content-Type: text/plain
Message-Id: <1076236627.12587.212.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Sun, 08 Feb 2004 10:37:07 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 corruption
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-02-05 at 14:15 +0100, Florian Schirmer wrote:
> Hi,
> 
> i'm having a strange problem with a JFFS2 filesystem: I always get messages
> about incorrect CRC values while mounting the filesystem. What i did:

Please set CONFIG_JFFS2_FS_DEBUG=1, then reproduce this with full
logging -- you'll need to do it over a serial console to make sure you
catch everything.

-- 
dwmw2
