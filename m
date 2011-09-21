Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R6GFA-0002uc-LP
	for linux-mtd@lists.infradead.org; Wed, 21 Sep 2011 06:25:17 +0000
Received: by eyd9 with SMTP id 9so797921eyd.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 20 Sep 2011 23:25:15 -0700 (PDT)
Subject: Re: measuring the flash usage
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Wed, 21 Sep 2011 09:27:57 +0300
In-Reply-To: <CAN8TOE8s-DbYNWuDht0KhU3wbW-4owNHxgvv-m_mftRReUzhRg@mail.gmail.com>
References: <CAFDOyVAzYULUuJMCTAcaFjkxxnzJRudGc9219zNLH7urpCiJAw@mail.gmail.com>
	<CAN8TOE8s-DbYNWuDht0KhU3wbW-4owNHxgvv-m_mftRReUzhRg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1316586484.4849.79.camel@sauron>
Mime-Version: 1.0
Cc: Folkert van Heusden <folkert.van.heusden@gmail.com>,
	linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-09-20 at 14:02 -0700, Brian Norris wrote:
> Hi,
> 
> On Tue, Sep 20, 2011 at 4:22 AM, Folkert van Heusden
> <folkert.van.heusden@gmail.com> wrote:
> > For an embedded system I'm working on I'd like to monitor the health
> > of the flash memory.
> > On regular Linux systems one can look at /proc/diskstats to see how
> > often the system writes to a disk. It seems though that (at least
> > kernel 2.6.19) for flash these counters are not updated.
> 
> I don't have much experience with the /proc/diskstats but for me, it
> at least lists the mtdblockX devices I have on my system (which I
> don't use).

That will only account I/O via mtdblock, but not via mtd devices.

I think we do not have proper I/O accounting for MTD. In N900 we hacked
/proc/diskstats to also show MTD I/O, but for some reasons (do not
remember) we decided that would not be upstreamable. You can try that,
or introduce mtd-specific sysfs entries for accounting.


-- 
Best Regards,
Artem Bityutskiy
