Received: from mail-qy0-f177.google.com ([209.85.216.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P0V5G-0006y7-6m
	for linux-mtd@lists.infradead.org; Tue, 28 Sep 2010 07:58:43 +0000
Received: by qyk34 with SMTP id 34so9904925qyk.15
	for <linux-mtd@lists.infradead.org>;
	Tue, 28 Sep 2010 00:58:40 -0700 (PDT)
MIME-Version: 1.0
Sender: vapier.adi@gmail.com
In-Reply-To: <1285660196.2437.34.camel@localhost>
References: <1284263293-31064-1-git-send-email-vapier@gentoo.org>
	<1284278763.1783.15.camel@brekeke> <1285660196.2437.34.camel@localhost>
From: Mike Frysinger <vapier@gentoo.org>
Date: Tue, 28 Sep 2010 03:58:19 -0400
Message-ID: <AANLkTimC4Qh6i=NB+xRmJW1+G7UBo1mpY2MJ5OMpoR7e@mail.gmail.com>
Subject: Re: [PATCH] old ubi-utils: drop -Werror
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Frank Haverkamp <haver@vnet.ibm.com>, Andreas Arnez <arnez@de.ibm.com>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Sep 28, 2010 at 03:49, Artem Bityutskiy wrote:
> On Sun, 2010-09-12 at 11:06 +0300, Artem Bityutskiy wrote:
>> On Sat, 2010-09-11 at 23:48 -0400, Mike Frysinger wrote:
>> > Considering this is marked as "old" which is synonymous with "dead",
>> > having the dir cause build failures because of warnings makes no
>> > sense. =C2=A0So drop the -Werror usage.
>> >
>> > Signed-off-by: Mike Frysinger <vapier@gentoo.org>
>>
>> I wonder if people still use them and may be we can just remove them?
>> Added Frank and Andreas who are the potential users of the old
>> ubi-utils.
>
> OK, let's remove the old utilities.

i'm assuming you'll take care of this and dont need me to send a patch
-mike
