From: David Woodhouse <dwmw2@infradead.org>
To: dedekind@infradead.org
In-Reply-To: <1109445593.13512.1.camel@sauron.oktetlabs.ru>
References: <1109445593.13512.1.camel@sauron.oktetlabs.ru>
Content-Type: text/plain
Date: Sun, 27 Feb 2005 09:40:41 +0000
Message-Id: <1109497241.27107.10.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [BUGFIX] JFFS2 NOR problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2005-02-26 at 22:19 +0300, Artem B. Bityuckiy wrote:
>I think it is safe to clear the JFFS2_SB_FLAG_MOUNTING flag at the end
>of JFFS2 filesystem build routine. Comments?

Didn't we move it from there to where it is now quite recently for other
reasons?

-- 
dwmw2
