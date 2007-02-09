Subject: Re: [PATCH] [MTD] JFFS2: memory leak in jffs2_do_mount_fs()
From: David Woodhouse <dwmw2@infradead.org>
To: Dmitry Adamushko <dmitry.adamushko@gmail.com>
In-Reply-To: <b647ffbd0701181620k540156ccq38a8a3c94fcb4359@mail.gmail.com>
References: <b647ffbd0701181614l4d0d724cu9749943d1a57efdf@mail.gmail.com>
	<b647ffbd0701181620k540156ccq38a8a3c94fcb4359@mail.gmail.com>
Content-Type: text/plain
Date: Fri, 09 Feb 2007 15:00:37 +0000
Message-Id: <1171033237.29713.43.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2007-01-19 at 01:20 +0100, Dmitry Adamushko wrote:
> [PATCH] [MTD] JFFS2: memory leak in jffs2_do_mount_fs()
> 
> If  jffs2_sum_init()  fails,  c->blocks is not freed neither in
> jffs2_do_mount_fs() nor in jffs2_do_fill_super().
> 
> Signed-off-by: Dmitry Adamushko <dmitry.adamushko at gmail dot com> 

applied; thanks.

-- 
dwmw2
