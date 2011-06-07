Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QToGF-0001dJ-Tx
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 04:51:28 +0000
Received: by fxm14 with SMTP id 14so4174344fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 21:51:26 -0700 (PDT)
MIME-Version: 1.0
Sender: vapier.adi@gmail.com
In-Reply-To: <1307421938.11104.17.camel@localhost>
References: <1307384537-9607-1-git-send-email-vapier@gentoo.org>
	<1307421064.11104.7.camel@localhost>
	<BANLkTimBGH0UW-YP=CZ7aDf_-nXXDhfz4Q@mail.gmail.com>
	<1307421760.11104.16.camel@localhost>
	<1307421938.11104.17.camel@localhost>
From: Mike Frysinger <vapier@gentoo.org>
Date: Tue, 7 Jun 2011 00:51:06 -0400
Message-ID: <BANLkTim=bc76w9g3_59pLk92J0H5GgsCgQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] flash_info: convert to common.h
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

On Tue, Jun 7, 2011 at 00:45, Artem Bityutskiy wrote:
> On Tue, 2011-06-07 at 07:42 +0300, Artem Bityutskiy wrote:
>> On Tue, 2011-06-07 at 00:41 -0400, Mike Frysinger wrote:
>> > On Tue, Jun 7, 2011 at 00:31, Artem Bityutskiy wrote:
>> > > On Mon, 2011-06-06 at 14:22 -0400, Mike Frysinger wrote:
>> > >> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
>> > >> ---
>> > >> =C2=A0flash_info.c | =C2=A0 27 +++++++++++++++++----------
>> > >> =C2=A01 files changed, 17 insertions(+), 10 deletions(-)
>> > >
>> > > How about killing this utility completely and use mtdinfo from ubi-u=
tils
>> > > instead? Yes, before creating mtdinfo I should have noticed flash_in=
fo,
>> > > but I did not. Did you look at mtdinfo?
>> >
>> > didnt even notice it :P
>> >
>> > if mtdinfo provides all the details that my new flash_info does, then
>> > i dont care about punting it. =C2=A0be nice to merge my fixes before
>> > deleting it though, otherwise i feel like i wasted quite a bit of time
>> > for nothing ;).
>>
>> I think it provides everything except of region information, which
>> flash_info provides :)
>
> And it does not show a map of sectors. May be we can add this to mtdinfo
> instead?

if you merge the patches i posted here, i'll see about extending
mtdinfo to include the new functionality and then i'll post another
patch to punt flash_info ;).
-mike
