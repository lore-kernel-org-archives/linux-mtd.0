Received: from rose.man.poznan.pl ([150.254.173.3])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AiTm0-0008QJ-UK
	for linux-mtd@lists.infradead.org; Mon, 19 Jan 2004 07:24:37 +0000
Date: Mon, 19 Jan 2004 08:22:07 +0100 (CET)
From: Michal Schulz <mschulz@rose.man.poznan.pl>
To: david stevenson <david@avoncliff.com>
In-Reply-To: <200401162339.10448.david@avoncliff.com>
Message-ID: <Pine.GSO.4.44.0401190820001.12833-100000@rose.man.poznan.pl>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
cc: linux-mtd@lists.infradead.org
Subject: Re: Run out of memory
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 16 Jan 2004, david stevenson wrote:

> In round figures the kernel is using 2meg code,data,reserved, and free shows
> 1700k used 300k free, before I try to run anything.
>
> Some hints of whether this looks normal or odd would be much appreciated.
> David

Try to put kernel image into some kind of ROM memory (may be flash as
well). Then you can first of all reduce the amount of memory consumed by
kernel itself. On one of machines I was working few years ago (386EX)
there was 1700K free RAM after system bootup, whereas total amount of RAM
was 2.5MB. (0K used for kernel code)


-- 
Michal Schulz
