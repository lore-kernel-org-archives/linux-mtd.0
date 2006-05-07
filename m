From: David Woodhouse <dwmw2@infradead.org>
To: KaiGai Kohei <kaigai@kaigai.gr.jp>
In-Reply-To: <445D3DCE.2000208@kaigai.gr.jp>
References: <445C476A.2090506@ak.jp.nec.com>
	<1146917241.2766.61.camel@pmac.infradead.org>
	<1146919108.2766.73.camel@pmac.infradead.org>
	<445CD332.40309@ak.jp.nec.com>
	<1146937993.2503.93.camel@shinybook.infradead.org>
	<445D3DCE.2000208@kaigai.gr.jp>
Content-Type: text/plain
Date: Sun, 07 May 2006 01:29:58 +0100
Message-Id: <1146961798.2503.144.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: joern@wohnheim.fh-wedel.de, linux-mtd@lists.infradead.org,
	KaiGai Kohei <kaigai@ak.jp.nec.com>
Subject: Re: [PATCH] XATTR support on JFFS2 (version. 5)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2006-05-07 at 09:22 +0900, KaiGai Kohei wrote:
> OK, I'll fix according to your suggestion.
> Only one point, I think xattr_sem should be modified in xattr.c for
> readability.

Yes, you are probably right.

-- 
dwmw2
