From: David Woodhouse <dwmw2@infradead.org>
To: Vahid Fereydunkolahi <fereydunk@yahoo.com>
In-Reply-To: <20050119190435.12763.qmail@web51001.mail.yahoo.com>
References: <20050119190435.12763.qmail@web51001.mail.yahoo.com>
Content-Type: text/plain
Date: Wed, 19 Jan 2005 19:07:17 +0000
Message-Id: <1106161637.26551.549.camel@hades.cambridge.redhat.com>
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

On Wed, 2005-01-19 at 11:04 -0800, Vahid Fereydunkolahi wrote:
> Does this mean that even a small write which may
> bypass one page, can be written partially?

Yes. On _any_ file system that is a theoretical possibility. Any
userspace software which assumes otherwise is broken.

-- 
dwmw2
