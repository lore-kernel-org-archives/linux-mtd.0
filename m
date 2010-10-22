Received: from [85.183.114.52] (helo=Dublin.logfs.org)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P9Dh2-0005k0-Ki
	for linux-mtd@lists.infradead.org; Fri, 22 Oct 2010 09:13:45 +0000
Date: Fri, 22 Oct 2010 10:39:52 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] drivers/mtd/devices/phram.c: Use KBUILD_MODNAME
Message-ID: <20101022083952.GJ16783@logfs.org>
References: <1287596362.1813.205.camel@Joe-Laptop>
	<1287657452.2932.15.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1287657452.2932.15.camel@localhost>
Cc: Joe Perches <joe@perches.com>, David Woodhouse <dwmw2@infradead.org>,
	Joern Engel <joern@lazybastard.org>, LKML <linux-kernel@vger.kernel.org>,
	linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 21 October 2010 13:37:32 +0300, Artem Bityutskiy wrote:
> On Wed, 2010-10-20 at 10:39 -0700, Joe Perches wrote:
> > Use the more standard #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> > No change in output strings.
> > 
> > Signed-off-by: Joe Perches <joe@perches.com>
> 
> Pushed to l2-mtd-2.6.git, thanks.

Fine with me. (aka Acked-By:)

Jörn

-- 
"Error protection by error detection and correction."
-- from a university class
