From: David Woodhouse <dwmw2@infradead.org>
To: Sergei Sharonov <sergei.sharonov@halliburton.com>
In-Reply-To: <loom.20050404T173154-376@post.gmane.org>
References: <20050404135849.4689.qmail@web52705.mail.yahoo.com>
	<loom.20050404T173154-376@post.gmane.org>
Content-Type: text/plain
Date: Mon, 04 Apr 2005 19:55:33 +0100
Message-Id: <1112640934.24487.375.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 and frequent/small write operations
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2005-04-04 at 17:15 +0000, Sergei Sharonov wrote:
> I was told that O_SYNC flag for open does not work with JFFS2 (!?).

You misunderstood. On NOR flash, O_SYNC does nothing because JFFS2 is
entirely synchronous anyway. On NAND flash, I believe that O_SYNC does
what it is supposed to -- any write will have reached the medium before
the write() system call returns.

This has nothing to do with atomicity of writes with respect to power
failure.

-- 
dwmw2
