Received: from mail-iy0-f177.google.com ([209.85.210.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QaByy-0001ie-94
	for linux-mtd@lists.infradead.org; Fri, 24 Jun 2011 19:24:01 +0000
Received: by iyn15 with SMTP id 15so3194923iyn.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Jun 2011 12:23:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1308943210.13493.10.camel@koala>
References: <BANLkTi=G+HxWtLgj6wUSQAY1FfjTFC8JjQ@mail.gmail.com>
	<1308917226.7715.6.camel@koala>
	<BANLkTikeC+kfbuowKHbx_yC4ZmcX4nT6Pw@mail.gmail.com>
	<1308943210.13493.10.camel@koala>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Fri, 24 Jun 2011 15:23:38 -0400
Message-ID: <BANLkTimkgCz_yBnDOXyafhSV5S+R1un_YQ@mail.gmail.com>
Subject: Re: mkfs.jffs2 min erase block size: 4 vs 8 KiB
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 24, 2011 at 15:20, Artem Bityutskiy wrote:
> On Fri, 2011-06-24 at 13:10 -0400, Mike Frysinger wrote:
>> On Fri, Jun 24, 2011 at 08:07, Artem Bityutskiy wrote:
>> > For SPI flashes the way out is to emulate larger eraseblock sizes on M=
TD
>> > level. I'd recommend at least 32 KiB.
>>
>> sorry, but emulate how ?
>
> Well, I was thinking about teaching MTD to merge real PEBs and report
> larger EB size up to JFFS2. Probably this could be done via an MTD
> module parameter and/or an ioctl.
>
>> =C2=A0 just tell jffs2 to use an eraseblock size of
>> 32KiB when creating the fs ?
>
> Yes, the other way is to teach JFFS2 to merge PEBs and work with
> multiple of PEBs. In fact in the past it could do this, but that was
> removed because of some issues, do not remember what.
>
> The only complication I see is bad blocks. When you merge PEBs and one
> of them is bad, then the good PEBs which are in this merge should be
> treated as bad as well. But this should not be very difficult to do.
>
> On the one hand, teaching JFFS2 deal with small PEBs seems to make more
> sense, on the other hand, doing this on driver level has an advantage -
> you do not have to modify the file-system and you automatically make UBI
> benefit from this - UBI scan time goes down when eraseblocks become
> larger.

this is way above my familiarity with the code base.  i'll just post
patches to update the docs.
-mike
