Received: from mail-bw0-f215.google.com ([209.85.218.215])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NrXjC-0001Eg-2f
	for linux-mtd@lists.infradead.org; Tue, 16 Mar 2010 14:26:42 +0000
Received: by bwz7 with SMTP id 7so4114848bwz.4
	for <linux-mtd@lists.infradead.org>;
	Tue, 16 Mar 2010 07:26:36 -0700 (PDT)
Sender: Peter Korsgaard <jacmet@gmail.com>
From: Peter Korsgaard <jacmet@sunsite.dk>
To: Ferenc Wagner <wferi@niif.hu>
Subject: Re: RFC: direct MTD support for SquashFS
References: <87vdcwv139.fsf@tac.ki.iif.hu>
Date: Tue, 16 Mar 2010 15:26:33 +0100
In-Reply-To: <87vdcwv139.fsf@tac.ki.iif.hu> (Ferenc Wagner's message of "Tue,
	16 Mar 2010 14:38:02 +0100")
Message-ID: <87ljdsibqe.fsf@macbook.be.48ers.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Phillip Lougher <phillip@lougher.demon.co.uk>,
	linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>>>> "Ferenc" == Ferenc Wagner <wferi@niif.hu> writes:

 Ferenc> Hi,

 Ferenc> In embedded systems, SquashFS over MTD would be a considerable
 Ferenc> win, as that would permit configuring without CONFIG_BLOCK.
 Ferenc> Please find attached a naive patch against 2.6.33 for this.  It
 Ferenc> does not handle bad MTD blocks, that could be handled by gluebi
 Ferenc> (once you're willing to take the UBI overhead), or by a custom
 Ferenc> solution later.

 Ferenc> For now, 2.6.34 gained pluggable decompressors, so this patch
 Ferenc> does not apply anymore, though the main idea holds.  My
 Ferenc> questions: is the community interested in integrating something
 Ferenc> like this, should this patch transformed into something
 Ferenc> acceptable, or am I a total lunatic?  I don't know a thing
 Ferenc> about filesystem development, but willing to learn and
 Ferenc> refactor.  Comments welcome.

Nice, I have been thinking about that as well. What kind of size savings
are you getting with this?

CC'ing linux-embedded as this might be of interest there as well.

-- 
Bye, Peter Korsgaard
