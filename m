Subject: Re: Mounting big endian jffs2 images on mtdram on a x86
From: David Woodhouse <dwmw2@infradead.org>
To: dedekind@infradead.org
In-Reply-To: <1179138892.3642.5.camel@sauron>
References: <1179133533.21753.13.camel@localhost.localdomain>
	<1179138892.3642.5.camel@sauron>
Content-Type: text/plain
Date: Tue, 15 May 2007 08:42:03 +0800
Message-Id: <1179189724.3482.24.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org,
	Hans-Christian Egtvedt <hcegtvedt@norway.atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2007-05-14 at 13:34 +0300, Artem Bityutskiy wrote:
> 
> > I am trying to mount an JFFS2 image made with mkfs.jffs2 on my x86
> > laptop. The image is made with --big-endian set.
> 
> I think you cannot do this without re-compiling JFFS2. I am not sure,
> just glance to the code (to je32_to_cpu and the like macros).

Edit fs/jffs2/nodelist.h and set JFFS2_BIG_ENDIAN instead of
JFFS2_NATIVE_ENDIAN.

The reason it's not a runtime option is because that would be quite
slow, and it's a very esoteric feature.

I'm sorry. I should have just made it either big- or little-endian right
from the very beginning and never made the mistake of letting it be
host-endian.

-- 
dwmw2
