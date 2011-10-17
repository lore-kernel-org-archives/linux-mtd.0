Received: from mail-gy0-f177.google.com ([209.85.160.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RFnM9-0000c3-Qx
	for linux-mtd@lists.infradead.org; Mon, 17 Oct 2011 13:35:54 +0000
Received: by gyd10 with SMTP id 10so3419916gyd.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 17 Oct 2011 06:35:52 -0700 (PDT)
MIME-Version: 1.0
Sender: dsdrake@gmail.com
In-Reply-To: <1318590949.12351.116.camel@sauron>
References: <CAMLZHHSW9daPS9RsMyBnhTfzUQLC0+e9_-=xqiWE4T6upbcaiQ@mail.gmail.com>
	<1318590949.12351.116.camel@sauron>
Date: Mon, 17 Oct 2011 14:35:51 +0100
Message-ID: <CAMLZHHSSWkjy7LiFG-g5vZ==2H+yPFB_M-yUem1K5UJMKo2tmw@mail.gmail.com>
Subject: Re: ubi vol_size and lots of bad blocks
From: Daniel Drake <dsd@laptop.org>
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

Hi Artem,

Thanks for the detailed response - I'll be sure to send another
documentation patch once we've got to the bottom of everything.

On Fri, Oct 14, 2011 at 12:15 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
>> I found a note in the UBI FAQ where it says vol_size can be excluded
>> and it will be computed to be the size of the input image, and then
>> the autoresize flag can be used to expand the partition later.
>> Excluding vol_size in this way indeed solves the problem and the
>> problematic laptop now boots.
>
> Well, you probably need some free space as well. Just come up with
> some minimum number, say 300MiB and use this number for volume size in
> ubinize, and use autoresize flag.

Regarding free space, is it really necessary? My understanding is that
the autoresize functionality will resize the volume *before* it gets
mounted for the first time, so it should be fine to not leave any free
space at image creation time. When it gets mounted for the first time,
it will be freshly resized and have free space available.

As for "some minimum number", I guess it goes without saying that
whatever number is chosen, it must be bigger than the amount of data
that is going to be written into the image. Our image building tool
will be used by different customers who will apply simple
customisations (e.g. with GNOME, with wikipedia) so the range of image
sizes varies. We need to do it based on some kind of calculation that
considers the size of the initial data to be written to the flash. If
we can do it with no free space initially, we can let ubinize do that
for us, with autoresize enabled (this was my trail of thought).

> Autorisize will not occupy the PEBs reserved for bad block handling.

OK, thanks for clarifying.
One final question... What happens when the PEBs reserved for bad
block handling run out?

Thanks,
Daniel
