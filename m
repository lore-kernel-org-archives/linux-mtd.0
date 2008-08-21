Received: from moutng.kundenserver.de ([212.227.126.188])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KWAyL-0002Li-P5
	for linux-mtd@lists.infradead.org; Thu, 21 Aug 2008 14:17:10 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: "Jared Hulbert" <jaredeh@gmail.com>
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
Date: Thu, 21 Aug 2008 16:14:52 +0200
References: <48AD00C4.6060302@gmail.com> <200808211453.26233.arnd@arndb.de>
	<6934efce0808210712u36144c78mb7f1998414a549cf@mail.gmail.com>
In-Reply-To: <6934efce0808210712u36144c78mb7f1998414a549cf@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200808211614.53261.arnd@arndb.de>
Cc: Nick Piggin <nickpiggin@yahoo.com.au>, linux-embedded@vger.kernel.org,
	carsteno@de.ibm.com, =?utf-8?q?J=C3=B6rn?= Engel <joern@logfs.org>,
	Linux-kernel@vger.kernel.org,
	linux-mtd <linux-mtd@lists.infradead.org>, tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 21 August 2008, Jared Hulbert wrote:
> > One thing that would be really nice is if you could add fake-write
> > support in the way that I proposed for cramfs a few months ago.
> > This would make axfs much more interesting for another set of
> > users, and keep cramfs a really simple example file system.
> 
> Did that get merged?

No, there were a few remaining issues that I never found the time
to work on.

	Arnd <><
