Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T4wIS-0004R3-LF
 for linux-mtd@lists.infradead.org; Fri, 24 Aug 2012 15:59:45 +0000
Received: by wibhn17 with SMTP id hn17so779649wib.0
 for <linux-mtd@lists.infradead.org>; Fri, 24 Aug 2012 08:59:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1345208270.27859.75.camel@sauron.fi.intel.com>
References: <CAP+RiCC1afVbKAZESMcZGd1G3+7aKuLTQGggOEFGZxQM6o+QQA@mail.gmail.com>
 <loom.20120813T153641-586@post.gmane.org>
 <1345208270.27859.75.camel@sauron.fi.intel.com>
Date: Fri, 24 Aug 2012 10:59:42 -0500
Message-ID: <CAP+RiCASzaH-TFHSYK0ioyXackRcMrZD4eoev2qVUVLhGft7Bg@mail.gmail.com>
Subject: Re: UBIFS Recovery Issue: 'grab_empty_leb: could not find an empty
 LEB'
From: Brent Taylor <motobud@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 17, 2012 at 7:57 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
>
> On Mon, 2012-08-13 at 13:41 +0000, Brent Taylor wrote:
> > I've been running with the patched kernel for about a month now and I've seen
> > this issue once since then.  Does anyone have any other ideas on how I can
> > better track this down.  I've taken precautions to test if the external data
> > partitions mounted properly, if not, then they are reformatted and initialized.
> >  I will have a problem if the issue occurs in the root filesystem.
>
> What kind of test do you run?
>
> --
> Best Regards,
> Artem Bityutskiy


Artem,
Thanks for taking the time to look at this.

I'm not sure if I can share the image just yet.  What all would you
need?  vmlinuz, uImage, the config file?.

I've changed my test setup slightly since my initial post.  My test
setup now includes a Linux PC that is connected to an ethernet
controlled power switch
(http://www.controlanything.com/Relay/Relay/ethernet_relay_controllers)
that is powering my hardware.  I have a script that runs that sends a
command to the power switch to cut power, sleep for 2 seconds, then
re-apply power.  It then waits anywhere between 0 and 45 seconds
before cutting power again.

I've upgraded to linux-3.5.1 and I haven't started to run the test
again, but will pretty soon.

-- Bud
