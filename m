Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QWsGr-00031U-9s
	for linux-mtd@lists.infradead.org; Wed, 15 Jun 2011 15:44:46 +0000
Received: by wyb28 with SMTP id 28so486641wyb.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 15 Jun 2011 08:44:41 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4DF78D22.6030101@eml.cc>
References: <4DF78D22.6030101@eml.cc>
Date: Wed, 15 Jun 2011 08:44:41 -0700
Message-ID: <BANLkTimSoZqt-NR=AG69PQnMC2wpMB63Eg@mail.gmail.com>
Subject: Re: Runtime repartitioning
From: Brian Norris <computersforpeace@gmail.com>
To: Tim Cussins <timcussins@eml.cc>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Roman Tereshonkov <roman.tereshonkov@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Tim,

On Tue, Jun 14, 2011 at 9:32 AM, Tim Cussins <timcussins@eml.cc> wrote:
> Hi all,
>
> In July 2010 a couple of competing patchsets were submitted that aimed to
> provide runtime repartitioning of mtd devices.
>
> http://thread.gmane.org/gmane.linux.drivers.mtd/30458
> http://thread.gmane.org/gmane.linux.drivers.mtd/30950
> http://thread.gmane.org/gmane.linux.drivers.mtd/30949
>
> Neither submission was accepted, comments were given on and off list, and
> that was the end of it :)
>
> The ability to create new mtd partitions after boot would be awesome - how
> can I get involved in getting such functionality into the tree?

It's probably a good idea to at least CC those who worked on this
before...I added Roman Tereshonkov, the one who started the
discussion.

Anyway, it looks like Roman ended up submitting a revised version of
the patch from the first discussion. His work made it into the kernel
as the following two commits. You can feel free to test it yourself!

5daa7b21496aebf057c12be03038e7220e33353b
mtd: prepare partition add and del functions for ioctl requests

d0f7959e2b708d775c3b6b53cc6a8abb8ff0a00b
mtd: add BLKPG API based repartition support

Brian
