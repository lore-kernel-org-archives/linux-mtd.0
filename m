Received: from h-67-102-66-132.snfccasy.covad.net ([67.102.66.132]
	helo=hheld.com)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G7zrU-0004i3-Tl
	for linux-mtd@lists.infradead.org; Tue, 01 Aug 2006 15:25:12 -0400
From: "David Byron" <dbyron@hheld.com>
To: "'Josh Boyer'" <jwboyer@gmail.com>
Subject: RE: autoconf for mtd-utils
Date: Tue, 1 Aug 2006 12:25:19 -0700
Message-ID: <000001c6b5a0$3a0a5bb0$c834800a@RudiDell>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: AAAAAJOKoN+ryO5OkOyypB2eX+7EESIA
Cc: linux-mtd@lists.infradead.org
Reply-To: dbyron@hheld.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2006-07-31 at 5:50p, Josh Boyer wrote: 

> Better.  But it only defines BUILDDIR during a cross compile.  Is that
> what you wanted?  Or did you want a general purpose way to separate
> the object and binary files from the source during build time?

I do define BUILDDIR for native builds too, but to the current directory.
The important thing for me is that native objects live in a different place
than cross-compiled objects.  Where they are relative to the source isn't
important to me at the moment.

-DB
