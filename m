Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BBFsl-0008J5-6E
	for linux-mtd@lists.infradead.org; Wed, 07 Apr 2004 17:26:31 +0100
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: Steven Scholz <steven.scholz@imc-berlin.de>
In-Reply-To: <40742192.5030901@imc-berlin.de>
References: <40742192.5030901@imc-berlin.de>
Content-Type: text/plain
Message-Id: <1081354787.4799.191.camel@tubarao>
Mime-Version: 1.0
Date: 07 Apr 2004 10:19:47 -0600
Content-Transfer-Encoding: 7bit
cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: kernel oops in cfi_cmdset_0002.c:do_write_one()...
Reply-To: tharbaugh@lnxi.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-04-07 at 09:43, Steven Scholz wrote:
> Hi there,
> 
> on my embedded PPC system with linux-2.425 I have two flash devices.

> Warning: DQ5 raised while program operation was in progress, however operation completed OK
> Warning: DQ5 raised while program operation was in progress, however operation completed OK
> Warning: DQ5 raised while program operation was in progress, however operation completed OK
> Waiting for write to complete timed out in do_write_oneword.

These error messages are from an ancient version of cfi_cmdset_0002.c.
They come from over-efficient software design that didn't consider the
quirks of how a flash chip works. Have you tried a recent version?

-- 
Thayne Harbaugh
Linux Networx
