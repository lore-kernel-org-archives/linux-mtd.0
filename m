Received: from smtp.nokia.com ([131.228.20.173] helo=mgw-ext14.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I5f0H-00048q-06
	for linux-mtd@lists.infradead.org; Tue, 03 Jul 2007 05:49:02 -0400
Date: Tue, 3 Jul 2007 12:47:02 +0300
From: Jarkko Lavinen <jarkko.lavinen@nokia.com>
To: Richard Purdie <rpurdie@openedhand.com>
Subject: Re: [PATCH/RFC] oops and panic message logging to MTD
Message-ID: <20070703094702.GA11992@angel.research.nokia.com>
References: <1182184301.6074.62.camel@localhost.localdomain>
	<1182239749.4403.48.camel@sauron>
	<1182247254.5760.17.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1182247254.5760.17.camel@localhost.localdomain>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	LKML <linux-kernel@vger.kernel.org>
Reply-To: Jarkko Lavinen <jarkko.lavinen@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jun 19, 2007 at 11:00:54AM +0100, Richard Purdie wrote:
> Its not a case of formatting the whole partition. The whole point of
> this code is the following use case:
> 
> 1. Device crashes
> 2. Device reboots
> 3. mtdoops partition has a log of why it crashed

The oops logger uses oops_in_progress variable to detect the begin and the 
end of an oops.  The end is detected when the first non-oops line comes and
oops_in_progress is false.

This works if the kernel is still running after the oops and gemerates some 
non-oops messages.  But if there is no non-oops line following an oops, no
flushing will occur and there won't be a log on flash.

Jarkko Lavinen
