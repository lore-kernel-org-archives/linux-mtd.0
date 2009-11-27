Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NDwa5-0006Y1-RP
	for linux-mtd@lists.infradead.org; Fri, 27 Nov 2009 08:53:38 +0000
Date: Fri, 27 Nov 2009 08:53:31 +0000
From: Jamie Lokier <jamie@shareable.org>
To: Adrian Hunter <adrian.hunter@nokia.com>
Subject: Re: UBIFS synchronisation questions about file create/delete
Message-ID: <20091127085331.GA15458@shareable.org>
References: <4B0F8B78.5080405@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4B0F8B78.5080405@nokia.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Ronny Dierckx <ronny.dierckx@telenet.be>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Adrian Hunter wrote:
> 10 minutes is long enough for everything to be written and flushed.  The 
> file should be completely intact.

Unless laptop_mode is used.  It is normally for letting disks spin
down by not flushing writes quickly.

-- Jamie
