Received: from perches-mx.perches.com ([206.117.179.246] helo=labridge.com)
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S64sg-0000u9-OW
 for linux-mtd@lists.infradead.org; Fri, 09 Mar 2012 18:49:36 +0000
Message-ID: <1331318968.13055.8.camel@joe2Laptop>
Subject: Re: [PATCH 1/4] jffs2: Convert most D1/D2 macros to jffs2_dbg
From: Joe Perches <joe@perches.com>
To: dedekind1@gmail.com
Date: Fri, 09 Mar 2012 10:49:28 -0800
In-Reply-To: <1331294012.29445.10.camel@sauron.fi.intel.com>
References: <cover.1329349881.git.joe@perches.com>
 <2d68e76db16d42f451370714f03ef952e0839692.1329349881.git.joe@perches.com>
 <1330965033.7220.16.camel@golum> <1330966615.3140.6.camel@joe2Laptop>
 <1331294012.29445.10.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2012-03-09 at 13:53 +0200, Artem Bityutskiy wrote:
> OK, pushed these ones, although I think that mechanical D1->jffs2_dbg()
> conversion is not very useful and to make your patch-set worth the
> trouble you should do few more clean-up steps, like I suggested.

Do you want me to remove the D2/jffs2_dbg(2, ...) instances
or just eliminate the first arg to jffs2_dbg and keep the
current jffs2_dbg(2,...) instances?
