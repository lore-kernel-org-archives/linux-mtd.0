Received: from desire.actrix.co.nz ([203.96.16.164])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CxuYs-0000oR-Ad
	for linux-mtd@lists.infradead.org; Sun, 06 Feb 2005 17:07:23 -0500
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
To: Martin Egholm Nielsen <martin@egholm-nielsen.dk>,
	linux-mtd@lists.infradead.org
Date: Mon, 7 Feb 2005 11:14:06 +1300
References: <ctsr0r$94m$1@sea.gmane.org>
In-Reply-To: <ctsr0r$94m$1@sea.gmane.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20050206220713.D99FE15504@desire.actrix.co.nz>
Cc: 
Subject: Re: Writing frequently to NAND - wearing, caching?
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 03 February 2005 22:31, Martin Egholm Nielsen wrote:
> Hi there,
>
> I have an application which may need to write states frequently to my
> nand-fs in order to have these states in case of powerdown.
> But I'm a bit concerned about wearing the nand if I write to frequently.
>
> So, if I only need to write, say, 100 bytes every second, how often will
> this actually be flushed to the nand?
> Is there a maximum commit/flush frequency built in the driver? Or can
> this be configured?
> I know this is a very diffuse question, but hopefully you get my drift.
>
> BR,
>   Martin Egholm

It depends on what fs you're using.

With YAFFS, and I believe JFFS2 too, there is no reason to worry about flash 
"wearing out".  I have done accelerated lifetime tests on NAND using YAFFS 
and in one test wrote 130GB to NAND without any data loss, bad blocks 
happening etc.

The NAND writes whenever the file system tells it to, so again your question 
is FS dependent, but all file systems that are NAND-friendly should handle 
the load you mention with no problems.

-- Charles
