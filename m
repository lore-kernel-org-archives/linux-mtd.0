Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17eMOf-00054u-00
	for <linux-mtd@lists.infradead.org>; Mon, 12 Aug 2002 22:06:41 +0100
Date: Mon, 12 Aug 2002 23:06:38 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: adr <mtd@mcmen.demon.co.uk>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Help with Dreamcast flash devices
Message-ID: <20020812210638.GA23744@wohnheim.fh-wedel.de>
References: <200208111908.06874.mtd@mcmen.demon.co.uk> <20020811195238.GA1638@wohnheim.fh-wedel.de> <200208122154.19331.mtd@mcmen.demon.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <200208122154.19331.mtd@mcmen.demon.co.uk>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Mon, 12 August 2002 21:54:19 +0100, adr wrote:
> On Sunday 11 Aug 2002 8:52 pm, Jörn Engel wrote:
> > My best guess would be to create something similar to the slram
> > driver, but with different guts. 
> 
> I've looked at slram.c - but don't really understand what it is for.
> What sort of device is it?

Physical RAM, plain and simple. Usually system memory, after passing a
"mem=a_little_less_than_availlable" command line option. Sometimes
NVRAM that is mapped into the physical memory address range.

Jörn

-- 
"Security vulnerabilities are here to stay."
-- Scott Culp, Manager of the Microsoft Security Response Center, 2001
