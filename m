Received: from [212.105.56.244] (helo=dmz.lumentis.net)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AiW3M-0000TX-R3
	for linux-mtd@lists.infradead.org; Mon, 19 Jan 2004 09:50:40 +0000
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "'David Woodhouse'" <dwmw2@infradead.org>,
   "'Li Yang-r58472'" <LeoLi@motorola.com>
Date: Mon, 19 Jan 2004 10:48:02 +0100
Message-ID: <000801c3de71$54b6c240$0a01a8c0@LUMENTIS02>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <1074503876.14499.40.camel@imladris.demon.co.uk>
cc: linux-mtd@lists.infradead.org
Subject: RE: jffs2+mtd+big endian problem
Reply-To: joakim.tjernlund@lumentis.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Second, you could use the current CVS JFFS2 code (you should probably
> use that anyway since it has a lot of optimisations missing from older
> kernels), and make it use little-endian images by defining
> JFFS2_LITTLE_ENDIAN instead of JFFS2_NATIVE_ENDIAN at about line 90 of
> include/linux/jffs2.h

Why little endian? Have you standardized on little endian for JFFS2? The 
last I remember there was a discussion about JFFS2 endianness but no decision.
I think little endian is the way of the past, big endian is the future.

 Jocke 
