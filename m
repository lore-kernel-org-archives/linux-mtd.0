Received: from [2002:c1ed:8229::1] (helo=baythorne.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B9HgP-0003Ta-5h
	for linux-mtd@lists.infradead.org; Fri, 02 Apr 2004 06:57:37 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: David Updegraff <dave@cray.com>
In-Reply-To: <406CAD57.40004@cray.com>
References: <Pine.LNX.4.44.0404011658150.6508-100000@kiire.colleduc.ee>
	 <1080830176.24117.1858.camel@hades.cambridge.redhat.com>
	 <406CAD57.40004@cray.com>
Content-Type: text/plain
Message-Id: <1080885452.17863.39.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Fri, 02 Apr 2004 06:57:32 +0100
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: patch for AMD am29dl800b
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Please don't reply to unrelated threads. This isn't about bad blocks and
doesn't live with the message to which you replied.

On Thu, 2004-04-01 at 18:01 -0600, David Updegraff wrote:
> Hi.
> 
> I have a gadget with this amd chip on it.  Whose id and layout dfn. is 
> not in the jedec_probe tables.  Unfortuanately, they have _SIX_ (6) 
> erase regions.  Anyone know of a reason expanding the regions[] array to 
> 6 is a bad idea?  Or why dealing with this chip in general is a bad idea?

Hmmm. And this chip really doesn't do CFI?

I wonder how much space we take up with this table, and if we should put
the regions outside the table rather than inline ("ulong *regions").
> 
> ______________________________________________________________________
-- 
dwmw2
