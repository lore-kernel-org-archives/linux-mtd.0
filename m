From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050125105140.GC29797@wohnheim.fh-wedel.de>
References: <20050120161306.GG20639@wohnheim.fh-wedel.de>
	<1106238673.7940.0.camel@sauron.oktetlabs.ru>
	<20050120164153.GM20639@wohnheim.fh-wedel.de>
	<1106240903.7940.12.camel@sauron.oktetlabs.ru>
	<20050120173341.GA24657@wohnheim.fh-wedel.de>
	<1106243853.7940.15.camel@sauron.oktetlabs.ru>
	<20050121124403.GA9931@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501211312570.20298@phoenix.infradead.org>
	<20050121134221.GB9931@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501211354110.20298@phoenix.infradead.org>
	<20050125105140.GC29797@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 Jan 2005 10:56:39 +0000
Message-Id: <1106650599.6480.109.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-01-25 at 11:51 +0100, Jörn Engel wrote:
> > RULE: Can not have any f->sem locked if gonna lock f->alloc_sem.
> 
> Or c->erase_completion_lock if you want to lock either of the above.

That's obvious -- you can't lock semaphores while you hold spinlocks.

> Or c->inocache_lock if you want to lock either of the above.

That (inocache_lock vs. erase_completion_lock) is documented in
README.Locking.

-- 
dwmw2
