Received: from moutng.kundenserver.de ([212.227.17.9])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1R8tWQ-0001qU-8G
	for linux-mtd@lists.infradead.org; Wed, 28 Sep 2011 12:45:59 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH V4] mtd: Add DiskOnChip G3 support
Date: Wed, 28 Sep 2011 14:45:47 +0200
References: <1316633266-21312-1-git-send-email-robert.jarzmik@free.fr>
	<201109271539.21533.arnd@arndb.de> <878vp96fhl.fsf@free.fr>
In-Reply-To: <878vp96fhl.fsf@free.fr>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Message-Id: <201109281445.47715.arnd@arndb.de>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 27 September 2011, Robert Jarzmik wrote:
> >
> > Really, passing the entire register name into an inline function is much
> > preferred over string concatenation, because it lets you grep for where
> > certain definitions are used.
> Right. But how do handle the "#seq" then ?
> 
> The whole point here is to write humanly readable debug messages. A message of
> the like "doc_flashsequence: 48 SET_PLANE1" is much better than
> "doc_flashsequence: 48", don't you think ?
> 
> If we consider to loose that debugging messages, it's way easier to drop the "do
> .. while(0)" sequences, and just keep the register write.
> 
> Now if you're convinced removing the "SET_PLANE1" debugging message is less
> important that ability to grep the full register name, why not, but from a
> maintenance point of view I would prefer letting the "macroness" in.

I generally recommend removing debug messages like this entirely from
production code. If you need them on production systems, that is an indication
that the code quality is not good enough. Enabling the debug output like
this also creates a lot of almost identical strings, which you don't need
if you turn it into an extern function that does

	static const char docseq[] = {
		[DOC_SEQ_RESET]		 = "reset",
		[DOC_SEQ_PAGE_SIZE_532]	 = "page_size_532",
	};
	dev_dbg(dev, "doc_flashSequence: %02x %s\n", docseq[seq]);

with exactly the same output.

Or you could turn the entire tracing into trace events and do the parsing
in user space, which seems appropriate if you frequently need to trace
these.

	Arnd
