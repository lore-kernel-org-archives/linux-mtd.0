Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTo6f-0001Rp-GC
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 04:41:34 +0000
Received: by fxm14 with SMTP id 14so4170654fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 21:41:30 -0700 (PDT)
MIME-Version: 1.0
Sender: vapier.adi@gmail.com
In-Reply-To: <1307421064.11104.7.camel@localhost>
References: <1307384537-9607-1-git-send-email-vapier@gentoo.org>
	<1307421064.11104.7.camel@localhost>
From: Mike Frysinger <vapier@gentoo.org>
Date: Tue, 7 Jun 2011 00:41:10 -0400
Message-ID: <BANLkTimBGH0UW-YP=CZ7aDf_-nXXDhfz4Q@mail.gmail.com>
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

On Tue, Jun 7, 2011 at 00:31, Artem Bityutskiy wrote:
> On Mon, 2011-06-06 at 14:22 -0400, Mike Frysinger wrote:
>> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
>> ---
>> =C2=A0flash_info.c | =C2=A0 27 +++++++++++++++++----------
>> =C2=A01 files changed, 17 insertions(+), 10 deletions(-)
>
> How about killing this utility completely and use mtdinfo from ubi-utils
> instead? Yes, before creating mtdinfo I should have noticed flash_info,
> but I did not. Did you look at mtdinfo?

didnt even notice it :P

if mtdinfo provides all the details that my new flash_info does, then
i dont care about punting it.  be nice to merge my fixes before
deleting it though, otherwise i feel like i wasted quite a bit of time
for nothing ;).
-mike
