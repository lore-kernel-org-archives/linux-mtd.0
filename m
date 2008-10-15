Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Kq5zg-0004sm-Mc
	for linux-mtd@lists.infradead.org; Wed, 15 Oct 2008 13:00:53 +0000
Subject: Re: Understanding UBIFS flash overhead
From: Artem Bityutskiy <dedekind@infradead.org>
To: dsaxena@plexity.net
In-Reply-To: <20081014225615.GA4490@trantor.hsd1.or.comcast.net>
References: <20081010210036.GA12173@trantor.hsd1.or.comcast.net>
	<1223880527.3395.53.camel@sauron>
	<20081014225615.GA4490@trantor.hsd1.or.comcast.net>
Content-Type: text/plain; charset=utf-8
Date: Wed, 15 Oct 2008 15:59:37 +0300
Message-Id: <1224075577.4029.45.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2008-10-14 at 15:56 -0700, Deepak Saxena wrote:
> I pulled these and we go from an 822MiB filesystem to and 878MiB filesyst=
em=20
> out of 949MiB device. This is definetely an improvement, but still means=20
> 71MiB is being used for the journal (8MiB default in my test) and for=20
> indexes (or not being properly accounted for).

1. First of all, I'd like to comment on the "71MiB is being used for the
journal (8MiB default in my test)" phrase, just to clarify things.

The size of the journal does not really affect available space. Just
created this FAQ entry to elaborate on this:
http://www.linux-mtd.infradead.org/faq/ubifs.html#L_smaller_jrn

2. Could I please ask you to actually fill the file-system with a huge
uncompressible file and send use size of the file you was able to
create. Something like:

dd if=3D/dev/urandom of=3D/mnt/ubifs/file bs=3D4096
ls -l /mnt/ubifs/file

You should probably to be able to create a larger than 878MiB file.
Let's see what is the _real_ amount of free space, because df anyway
lies a little.

> Thanks. I've read the docs, faqs, and white paper over and my understandi=
ng
> is that this is refering to free space reporting. I think we can live wit=
h=20
> not-perfectly accurate numbers on this end if our applications fail nicel=
y.
>=20
> The fact that we're loosing ~8% of space from the start is an issue for=20
> us b/c we are already running into issues with kids filling the systems=20
> up quickly, so every page we can save is important. We'll have to some=20
> performance analysis on tweaking the journal size but I'm wondering what=20
> else is configurable (or could be made configurable via changes) to=20
> decrease this?

As I said earlier, we do not expect journal size to affect available
space much.

>  I notice there is an option to mkfs.ubifs to change the=20
> index fanout and I'll read the code to understand this and see how it
> impacts the fs size.

I expect larger index fanout would save some space, but the dependency
should really be small. Also we did not test the FS extensively for
non-default fanouts, although we ran _some_ tests with various
non-default fanouts and UBIFS looked OK. I think the maximum tested
fanout was 128, while default is 8.

> Does the reported filesystem size change dynamically w.r.t w/b and
> compression assumptions or is it completely based on static overhead
> of journal and index?

The reported space does change dynamically w.r.t. w/b. The less dirty
data you have, the more precise is the calculation. To get the most
precise 'df' output, call 'sync'. It not only flushed all dirty data,
but also commits which also makes calculations more precise, because
UBIFS knows _exact_ indexing tree size after commit. I mean, if yo have
data in journal, it is not indexed, and precise index size is unknown.
UBIFS would have to actually _do_ the commit to know precise index size.
This is not fundamental thing, it is just implementation issue. We just
found it much more difficult implement things differently.

Let me tell you some more details which may be useful to know. In UBIFS
we have the index which has size X. And we reserve 2*X more flash space
to guarantee that we can always commit. I mean, the index takes X bytes,
and we reserve 2*X bytes more. Well things are rounded to LEB size, but
this does not matter much. We had a discussion with Adrian today, and we
think that in general we may try to improve things and reserve X bytes,
instead of 2*X bytes, but it is difficult to do. So we would like to
know index size in your case, to understand if it is really worth it.

To provide is the index size you should print the "c->old_idx_sz"
variable. Fill your FS, run sync, and then get its value. I think adding
a printk to the 'ubifs_calc_min_idx_lebs()' function should work. This
func is called on 'df'. So you do sync, run df and look at dmesg.

I was going to add debugfs support to UBIFS and expose important
variables like this via debugfs later.

But there is another possibility to save ~15.5MiB of flash. To do this
we should improve UBI and teach it to store both headers at the first
NAND page. Since you do not have sub-pages, we could use available OOB
bytes from the first page. This would save 2048 bytes per eraseblocks,
which is about ~15.5MiB. Could you please give us information about how
many OOB bytes are available in case of OLPC NAND. You should basically
look at 'struct nand_ecclayout' to find this out. There is an
ECCGETLAYOUT MTD device ioctl. Never used it though, but it should work.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
