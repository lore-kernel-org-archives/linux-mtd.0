Received: from [2002:c1ed:8229::1] (helo=baythorne.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Aj4eg-00080V-Ks
	for linux-mtd@lists.infradead.org; Tue, 20 Jan 2004 22:47:32 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Dan Post <djp.mtd@onemyth.net>
In-Reply-To: <20040120215050.M62159@onemyth.net>
References: <20040120215050.M62159@onemyth.net>
Content-Type: text/plain
Message-Id: <1074638670.16045.74.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Tue, 20 Jan 2004 22:44:30 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Intel flash and cfi_probe.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-01-20 at 13:50 -0800, Dan Post wrote:
> Hi,
> 
> I was looking at the cfi_probe.c file, and noticed that there are numerous
> '0xF0' commands to flash (theoretically to put the flash back into read array
> mode).  This is incorrect in terms of Intel flash; according to the datasheets
> for L18/30 and K3/18, the "read array" command is 0xFF.

Yeah.... the CFI spec says how to get into query mode, but unfortunately
doesn't specify how to get out of it. And without getting out of it we
can't check for aliases.

We'd previously observed that 0xF0 happened to work for Intel chips...
now evidently it doesn't any more. I suspect we might just have to bite
the bullet and make it depend on the chip type, although it was easier
to avoid that.

> What would happen if we issued an 0xF0;0xFF to an AMD chip?  Or 0xFF;0xF0? 
> Any AMD chip-heads care to answer?  It looks like it will "work" on Intel chips...

Hmmm. That could work.

-- 
dwmw2
