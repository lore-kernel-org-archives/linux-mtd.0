Received: from maila.telia.com ([194.22.194.231])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16nOaM-00048r-00
	for <linux-mtd@lists.infradead.org>; Tue, 19 Mar 2002 18:43:50 +0000
Message-ID: <004c01c1cf77$9f28e5c0$0200a8c0@telia.com>
From: "Joakim Tjernlund" <Joakim.Tjernlund@lumentis.se>
To: <linux-mtd@lists.infradead.org>
Cc: <dwmw2@infradead.org>
References: <200203061645.g26Gjl806741@skylab.outpostsentinel.com>
Subject: compr_zlib.c
Date: Tue, 19 Mar 2002 19:55:21 +0100
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

OK, a new compression type will be cleaner. What should be done with compression types 
not supported? Can't say that I understand the logic behind the unsupported nodes. 

What do you think about STREAM_END_SPACE? Should it be changed to something bigger?

What is the maximum amount of data JFFS2 will try to compress in one go? I am
thinking of adjusting  windowBits and memLevel, now they default to 128 KB each which
seems a bit too much.

Will you accept a patch against the stable branch?

Also there has been a few performance improvements lately and I would like to see them in the
stable branch as well. We are using them all and no problems so far. Any chance that will
happen?


       Jocke

On Tue, 19 Mar 2002, Joakim Tjernlund wrote:

> No comments so far.
> Anyone?

Looks good. Suspect we should make it a new compression type instead, and 
fix the mount routine to check for compression types we don't support, 
like we check for node types we don't support.

-- 
dwmw2
