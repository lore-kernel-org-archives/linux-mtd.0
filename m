Received: from mu-out-0910.google.com ([209.85.134.185])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I9Lsj-00012k-Uk
	for linux-mtd@lists.infradead.org; Fri, 13 Jul 2007 10:12:32 -0400
Received: by mu-out-0910.google.com with SMTP id w1so517338mue
	for <linux-mtd@lists.infradead.org>;
	Fri, 13 Jul 2007 07:12:27 -0700 (PDT)
Message-ID: <625fc13d0707130712y1ab1a83dja4df80d103ad1b1f@mail.gmail.com>
Date: Fri, 13 Jul 2007 09:12:26 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: dsaxena@plexity.net
Subject: Re: [PATCH][MTD] Add COMPATIBLE_IOCTL() for MEMGETOOBSEL
In-Reply-To: <20070713063347.GA19047@plexity.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <20070620235245.GA12800@mag.az.mvista.com>
	<625fc13d0706201852g5348a209q82c5cc5b9dc42bf6@mail.gmail.com>
	<20070713063347.GA19047@plexity.net>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-mtd@lists.infradead.org,
	"Mark A. Greer" <mgreer@mvista.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 7/13/07, Deepak Saxena <dsaxena@plexity.net> wrote:

> I'm merging Mark's patch into the MontaVista tree and will send out and
> updated patch vs upstream but also wondering what the proper route is for
> MEMSETOOBSEL? I've been out of the mtd loop for a while but looking at the
> git log for mtd-abi.h and mtdchar.c, it looks like the ioctl() was removed
> over a year ago (commit ff268fb8791cf18df536113355d7184007c269d9).  Do we
> re-introduce it or can we update the tools?

I'd prefer to update the tools.  The problem is, I haven't found time
to really look at it yet and I'm not sure _how_ to update it.

> Thomas, I'm including you b/c you made the original commit to remove
> MEMSETOOBSEL but also made changes to nandwrite.c that use it a month
> later. :) Should we put MEMSETOOBSEL back in?

Yeah... Thomas?

josh
