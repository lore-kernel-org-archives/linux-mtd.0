Received: from mba.ocn.ne.jp ([210.190.142.172] helo=smtp.mba.ocn.ne.jp)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fds6F-0003a6-WD
	for linux-mtd@lists.infradead.org; Wed, 10 May 2006 13:03:58 -0400
Date: Thu, 11 May 2006 02:04:20 +0900 (JST)
Message-Id: <20060511.020420.12190675.anemo@mba.ocn.ne.jp>
To: jwboyer@gmail.com
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
In-Reply-To: <625fc13d0605100400t458ab59enbd36f70c90e10b2e@mail.gmail.com>
References: <4461B7CD.9010100@ru.mvista.com>
	<625fc13d0605100400t458ab59enbd36f70c90e10b2e@mail.gmail.com>
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

On Wed, 10 May 2006 06:00:57 -0500, "Josh Boyer" <jwboyer@gmail.com> wrote:
> Not quite the case.  You need bad block skipping, yes.  But NAND can
> get bit flips in good blocks still.  How do you deal with that?  You
> can't leave the block in that state forever because it will continue
> to get bit flips and then your data will be unusable.

If I mounted a JFFS2 filesystem on NAND and _never_ write anything (or
mounted read-only), does current MTD/NAND/JFFS2 layer handle those bit
flips?  I've thought JFFS2 only reassign blocks on writing, so JFFS2
also suffer those "bit flips on read" problem, is it right?

---
Atsushi Nemoto
