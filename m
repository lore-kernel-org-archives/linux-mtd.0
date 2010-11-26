Received: from astoria.ccjclearline.com ([64.235.106.9])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PM1BD-0006mS-Vg
	for linux-mtd@lists.infradead.org; Fri, 26 Nov 2010 16:29:51 +0000
Date: Fri, 26 Nov 2010 11:29:29 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Michal Marek <mmarek@suse.cz>
Subject: Re: Unused config options in drivers/mtd (Re: running my kernel
	scanning scripts on your favourite part of the tree)
In-Reply-To: <4CEE8B70.4070500@suse.cz>
Message-ID: <alpine.DEB.2.00.1011261122140.13435@localhost6.localdomain6>
References: <alpine.DEB.2.00.1011090711410.5783@localhost6.localdomain6>
	<4CEE8B70.4070500@suse.cz>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 25 Nov 2010, Michal Marek wrote:

> CC the mtd maintainer and mailinglist and adjusted subject. Robert, you
> should report such bugs to the maintainer / author of the code in
> question, otherwise your mail might end up unnoticed on LKML.
>
> Michal

 {sigh}.  the point of my earlier post was not specifically to point
out unused kernel config vars in the MTD code; rather, it was to
suggest that anyone who's interested can run my scanning scripts to
locate such things for themselves in their favourite subsystem(s) -- i
simply used the MTD code as a working example.

  and, BTW, there are still dead config variables in the code that go
back *several* major versions, even though i've documented them just
as many times here:

  http://www.crashcourse.ca/wiki/index.php/Kernel_cleanup

so if you're curious, the scripts are here:

  http://www.crashcourse.ca/wiki/index.php/Kernel_cleanup_scripts

rday

--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
