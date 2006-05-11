Received: from mba.ocn.ne.jp ([210.190.142.172] helo=smtp.mba.ocn.ne.jp)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FeC3e-00042n-L3
	for linux-mtd@lists.infradead.org; Thu, 11 May 2006 10:22:33 -0400
Date: Thu, 11 May 2006 23:23:04 +0900 (JST)
Message-Id: <20060511.232304.05600722.anemo@mba.ocn.ne.jp>
To: jwboyer@gmail.com
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
In-Reply-To: <625fc13d0605101020i5a21bcf5t1eea0401c350a5f3@mail.gmail.com>
References: <625fc13d0605100400t458ab59enbd36f70c90e10b2e@mail.gmail.com>
	<20060511.020420.12190675.anemo@mba.ocn.ne.jp>
	<625fc13d0605101020i5a21bcf5t1eea0401c350a5f3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, vwool@ru.mvista.com
Subject: Re: [RFC] read-only filesystem support for NAND flash devices
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 10 May 2006 12:20:58 -0500, "Josh Boyer" <jwboyer@gmail.com> wrote:
> > If I mounted a JFFS2 filesystem on NAND and _never_ write anything (or
> > mounted read-only), does current MTD/NAND/JFFS2 layer handle those bit
> > flips?  I've thought JFFS2 only reassign blocks on writing, so JFFS2
> > also suffer those "bit flips on read" problem, is it right?
> 
> If you truly never write anything, then yes it probably suffers from
> the same problem.  In a typical JFFS2 setup where writes do occur, the
> theory is that garbage collection will eventually reclaim that block. 
> Whether that actually happens or not is largely determined on a per
> use case basis.

Thank you.  Then something like periodical garbage collection will
save the bit flips, but of course unnecessary writes should shorten
the life of the device ...  so ambivalent.

---
Atsushi Nemoto
