Received: from florence.buici.com ([206.124.142.26])
	by canuck.infradead.org with smtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CSYej-0000lS-2M
	for linux-mtd@lists.infradead.org; Fri, 12 Nov 2004 05:27:50 -0500
Date: Fri, 12 Nov 2004 02:27:46 -0800
From: Marc Singer <elf@buici.com>
To: linux-mtd@lists.infradead.org
Message-ID: <20041112102746.GA27967@buici.com>
References: <20041111220146.GA1898@buici.com> <1100213473.5074.81.camel@thomas>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1100213473.5074.81.camel@thomas>
Subject: Re: cmdlineparts and chip initialization order
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I now understand why the partitions weren't being parsed.  I didn't
realize that the driver itself was responsible for calling the code
that parses partitions.

Cheers.
