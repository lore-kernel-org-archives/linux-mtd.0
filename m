From: David Woodhouse <dwmw2@infradead.org>
To: Vahid Fereydunkolahi <fereydunk@yahoo.com>
In-Reply-To: <20050119184300.56344.qmail@web51008.mail.yahoo.com>
References: <20050119184300.56344.qmail@web51008.mail.yahoo.com>
Content-Type: text/plain
Date: Wed, 19 Jan 2005 18:53:40 +0000
Message-Id: <1106160821.26551.548.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: some questions regarding the write operation on JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-01-19 at 10:43 -0800, Vahid Fereydunkolahi wrote:
> If the application calls a write system call, which is more than the
> VFS page size, then the VFS will break this write operation based on
> the size of the page. this means that JFFS2 does not have any
> knowledge about the whole write operation. If power failure happens
> during the write operation, the data can be written partially.

Please don't top-post. Read http://david.woodhou.se/email.html

What you say is true -- the data can be written partially. This is true
for all file systems, and doesn't even need a power failure -- if you
ask them to write a certain amount, they may write less than that and
then return.

-- 
dwmw2
