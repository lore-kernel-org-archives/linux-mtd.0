Received: from cantor.suse.de ([195.135.220.2] helo=mx1.suse.de)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PM1NU-0000O9-Bw
	for linux-mtd@lists.infradead.org; Fri, 26 Nov 2010 16:42:29 +0000
Message-ID: <4CEFE370.9030505@suse.cz>
Date: Fri, 26 Nov 2010 17:42:24 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: Re: Unused config options in drivers/mtd (Re: running my kernel
	scanning scripts on your favourite part of the tree)
References: <alpine.DEB.2.00.1011090711410.5783@localhost6.localdomain6>
	<4CEE8B70.4070500@suse.cz>
	<alpine.DEB.2.00.1011261122140.13435@localhost6.localdomain6>
In-Reply-To: <alpine.DEB.2.00.1011261122140.13435@localhost6.localdomain6>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
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

On 26.11.2010 17:29, Robert P. J. Day wrote:
>   and, BTW, there are still dead config variables in the code that go
> back *several* major versions, even though i've documented them just
> as many times here:
> 
>   http://www.crashcourse.ca/wiki/index.php/Kernel_cleanup

That might be the problem - that you are document the bugs in your wiki,
instead of sending reports to the maintainers directly :).

Michal
