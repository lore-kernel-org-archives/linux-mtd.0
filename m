Received: from [2002:d556:63ea::1] (helo=phoenix.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 19rdW2-00083h-Pk
	for <linux-mtd@lists.infradead.org>; Tue, 26 Aug 2003 14:05:42 +0100
Received: from [213.86.99.237] (helo=executor.cambridge.redhat.com)
	by phoenix.infradead.org with esmtp (Exim 4.22)
	id 19rdVf-0006hz-Tp
	for linux-mtd@lists.infradead.org; Tue, 26 Aug 2003 14:05:19 +0100
From: David Woodhouse <dwmw2@redhat.com>
To: Gleb Natapov <gleb@nbase.co.il>
In-Reply-To: <20030826130146.GC26520@nbase.co.il>
References: <20030826130146.GC26520@nbase.co.il>
Message-Id: <1061903112.8465.24.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 26 Aug 2003 14:05:13 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Support for multiple physical mappings for MTD
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2003-08-26 at 16:01 +0300, Gleb Natapov wrote:
> Hello,
> 
> I work with Motorola MPC8245 processor. It has one memory window for
> extended ROM and another for boot ROM.
> 
> Currently physmap driver supports only one memory window for MTD device. 
> Attached quick patch makes it more easy task to add more then one memory window.

It's already an easy task just to add your own map driver -- even easier
in 2.6 (and I'll probably send that same code in for 2.4.23). I'd rather
you did that than complicate the physmap driver, I think.

-- 
dwmw2
