Received: from [212.58.137.10] (helo=trajan.ag-netcom.net)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AiZp6-0001t0-3p
	for linux-mtd@lists.infradead.org; Mon, 19 Jan 2004 13:52:12 +0000
Received: from 192.168.0.4 (dsl-217-155-44-202.zen.co.uk [217.155.44.202])
	by trajan.ag-netcom.net (8.12.8p1/8.12.8) with ESMTP id i0JDruRs036640
	for <linux-mtd@lists.infradead.org>; Mon, 19 Jan 2004 13:53:56 GMT
	(envelope-from david@avoncliff.com)
From: david stevenson <david@avoncliff.com>
To: linux-mtd@lists.infradead.org
Date: Mon, 19 Jan 2004 13:49:57 +0000
References: <Pine.GSO.4.44.0401190820001.12833-100000@rose.man.poznan.pl>
In-Reply-To: <Pine.GSO.4.44.0401190820001.12833-100000@rose.man.poznan.pl>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200401191349.57616.david@avoncliff.com>
Subject: Re: Run out of memory
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 19 January 2004 7:22 am, Michal Schulz wrote:
> On Fri, 16 Jan 2004, david stevenson wrote:
> > In round figures the kernel is using 2meg code,data,reserved, and free
> > shows 1700k used 300k free, before I try to run anything.
> >
> > Some hints of whether this looks normal or odd would be much appreciated.
> > David
>
> Try to put kernel image into some kind of ROM memory (may be flash as
> well). Then you can first of all reduce the amount of memory consumed by
> kernel itself. On one of machines I was working few years ago (386EX)
> there was 1700K free RAM after system bootup, whereas total amount of RAM
> was 2.5MB. (0K used for kernel code)

Thanks, that would be the largest item in ram out of the way. I will have to 
look at the odd parallel memory maps on my sc400 to work out how to map that.
Is there a howto for kernel xip?

I am interested to know if either mtd or jffs2, use large amounts of ram, in 
this case large being in the 100's of kb. And do they use any user space ram 
or is it all in kernel data?

David
