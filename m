Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1708hG-0005nI-00
	for <linux-mtd@lists.infradead.org>; Tue, 23 Apr 2002 23:23:38 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020423190845.486244B001@iral.com> 
References: <20020423190845.486244B001@iral.com> 
To: "Albert Rybalkin" <albertr@forbes.net>
Cc: linux-mtd@lists.infradead.org
Subject: Re: mtd partitions on Sharp Zaurus 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 23 Apr 2002 23:23:36 +0100
Message-ID: <26196.1019600616@redhat.com>
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

albertr@forbes.net said:
>  But I'm in a complete dark as of how I need to partition flash rom
> chip and map its partions to mtd block devices. Is there any user
> space program exist that can enumerate and display existing partitions
> which are already in the flash? Is there any documentation I can read
> on how to partition flash?

Not really - only the source code. The current flash partitioning code is 
very primitive - we simple register multiple devices, each with methods 
which just add an offset and call into the 'real' device's methods.

I don't know how the partitions on the Zaurus work - they haven't get got 
round to sending me one :)

--
dwmw2
