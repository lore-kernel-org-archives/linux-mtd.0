Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17bfCx-0003HF-00
	for <linux-mtd@lists.infradead.org>; Mon, 05 Aug 2002 11:35:27 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020803141013.GA14370@wohnheim.fh-wedel.de> 
References: <20020803141013.GA14370@wohnheim.fh-wedel.de>  <AB8D0DF31D9BD511BE94000347959DC901996389@MXSFRCOHOU01> <AB8D0DF31D9BD511BE94000347959DC901996389@MXSFRCOHOU01> <5.1.0.14.0.20020803074026.02927a48@64.170.22.132> 
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
Cc: Vipin Malik <vipin@embeddedlinuxworks.com>,
    linux-mtd@lists.infradead.org
Subject: Re: MTD Partition problems 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 05 Aug 2002 11:35:11 +0100
Message-ID: <461.1028543711@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

joern@wohnheim.fh-wedel.de said:
> > Sorry for the stupid question: If it's by design, why is it going to
> > be ripped out sometime soon?

> It might have made sense, when it was designed. It might just have
> been a relatively new developer making the usual mistakes. Whatever.

> Fact is that it is useless, the superuser can create a read only
> device simply by 'chmod -w /dev/mtd0', if she wishes. That is all
> those extra devices do, except for causing confusion and eating up
> minor numbers. 

I inherited the major number from elsewhere, and it was already set up like 
that. I haven't changed it because people have only just started to read 
the bloody documentation and set it up right -- with the occasional 
exception :)

>  Currently, there is no branch that tackles this problem. There was
> one, but David never took a look, was busy, and rescheduled to 'when
> 2.4.19 is out'. Now I am busy,...

I want to get the remaining changes in the tree into 2.4.20-pre, then 
update the code for 2.5 and start doing new exciting stuff. 

--
dwmw2
