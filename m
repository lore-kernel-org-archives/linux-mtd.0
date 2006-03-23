Received: from mga01.intel.com ([192.55.52.88] helo=fmsmga101-1.fm.intel.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FMMIe-00046G-EI
	for linux-mtd@lists.infradead.org; Thu, 23 Mar 2006 04:40:20 -0500
Message-ID: <44226CEB.70200@intel.com>
Date: Thu, 23 Mar 2006 12:39:55 +0300
From: Alexander Belyakov <alexander.belyakov@intel.com>
MIME-Version: 1.0
To: dedekind@infradead.org
References: <F048F58F304F0040BC3E937DE4E231E701D05FBF@NNSMSX401>
	<1143047296.29683.44.camel@sauron.oktetlabs.ru>
In-Reply-To: <1143047296.29683.44.camel@sauron.oktetlabs.ru>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "Korolev, Alexey" <alexey.korolev@intel.com>, linux-mtd@lists.infradead.org,
	"Kutergin, Timofey" <timofey.kutergin@intel.com>
Subject: Re: [PATCH/RFC] Linux MTD striping middle layer
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem B. Bityutskiy wrote:
>  15 files changed, 4144 insertions(+), 33 deletions(-), 2
> modifications(!)
>
> You definitely have to split your patch on several parts. Your patch has
> to only affect drivers/mtd/mtdstripe.c and include/linux/mtd/stripe.h.
> If you have to modify other subsystem, send the modification separately,
> motivate them and let the corresponding janitor to review them.

Yes I realize that patch is quite large and might be difficult to 
understand. You are right here.

Striping core (including initialization calls) is contained by the 
following files:

drivers/mtd/mtdstripe.c
include/linux/mtd/stripe.h
drivers/mtd/maps/mphysmap.c
drivers/mtd/Kconfig
drivers/mtd/Makefile


Applying only these files one will get interleaving functional. But will not get performance increase. I shall make some explanations on that in this message.

So in order to simplify process I suggest to forget about all changes except those 5 files mentioned above. Shall I post new reduced diff file, containing mtdstripe core only?

Now on performance issue. I shall provide an example.

Say we have 2 physically independent flash devices (striping layer has 2 worker threads) with interleaving size of 128 bytes. Write operation with 1024 bytes of data is issued. Interleaving algorithm splits data in 8 chunks and pushes them into worker thread queues. Fist chip queue get chunk 1, chunk 3, chunk 5 and chunk 7. Second chip queue get chunk 2, chunk 4, chunk 6 and chunk 8. At this point both worker threads have the same priority equal (in simple case) to priority of the caller thread. Write to flashes begins here.

Worker thread 1 puts chunk 1 to flash 1 buffer and get free time flushing data to flash. At that free time worker thread 2 should get control and write chunk 2 to flash 2. But it won't despite worker thread 1 invokes rescheduling. Since switching between two thread with equal priority has some uncertainty. And data chunks will be written in the following order:

chunk 1
chunk 3
chunk 5
chunk 7
chunk 2
chunk 4
chunk 6
chunk 8

instead of expected:

chunk 1   chunk 2
chunk 3   chunk 4
chunk 5   chunk 6
chunk 7   chunk 8

It is obvious that one will not get any performance increase in the first case.

That is not only striping problem, but also a problem of several instances of file system mounted on different flashes. These filesystems also will not work simultaneously.

So mtdstripe itself is not enough to get performance increase. Additional solution needed. And two of possible solutions presented in the original diff file.

Now as my worries explained I'd suggest to push these thread switching issues into the background and continue with mtdstripe core only.

My question is: shall I post new reduced (mtdstripe core only) patch here leaving all the rest for future discussion?

Thanks,
Alexander Belyakov
