Received: from dragon.actrix.co.nz ([203.96.16.164])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17qen7-0006hy-00
	for <linux-mtd@lists.infradead.org>; Sun, 15 Sep 2002 20:10:45 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
Reply-To: manningc2@actrix.gen.nz
To: Erich Schubert <erich@debian.org>, linux-mtd@lists.infradead.org
Subject: Re: recommended Filesystem for DoC?
Date: Mon, 16 Sep 2002 07:07:16 +1200
References: <20020914235138.GA28771@bombadil.xmldesign.de>
In-Reply-To: <20020914235138.GA28771@bombadil.xmldesign.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20020915191039.67A4514BBB@dragon.actrix.co.nz>
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

On Sun, 15 Sep 2002 11:51, Erich Schubert wrote:

> any recommendations for the system?
> grub or lilo? (right now i'm using grub to boot the system off a small
> partition ~8 MB)
> any good howto for installing the bootloader?

If a DOC is "just a bunch of NAND chips" then maybe YAFFS will work with DOC. 
 I'd have to look at the DOC geometry to be able to tell. Right now YAFFS 
wants its flash to be in pages of 512+16 with eraseable blocks being 32 
pages. Nothing that can't be adjusted with a sledge hammer.

There are pros and cons to both YAFFS and JFFS2, that's why both exist.

-- CHarles
