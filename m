From: David Woodhouse <dwmw2@infradead.org>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
In-Reply-To: <Pine.LNX.4.58.0502171424040.30538@phoenix.infradead.org>
References: <Pine.LNX.4.58.0502171424040.30538@phoenix.infradead.org>
Content-Type: text/plain
Date: Thu, 17 Feb 2005 14:41:10 +0000
Message-Id: <1108651270.19262.664.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] JFFS2 symlink cache
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-02-17 at 14:25 +0000, Artem B. Bityuckiy wrote:
> 
> +       /* We use f->dents field to store the target path. */
> +       f->dents = kmalloc(targetlen + 1, GFP_KERNEL);

Why aren't you just using the standard page_symlink_ops so that the
cache can be correctly discarded on memory pressure?

-- 
dwmw2
