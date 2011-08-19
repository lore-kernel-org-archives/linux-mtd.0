Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QuSly-0004Jt-2b
	for linux-mtd@lists.infradead.org; Fri, 19 Aug 2011 17:22:22 +0000
Received: by wyh11 with SMTP id 11so2840724wyh.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 19 Aug 2011 10:22:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1313773387.6607.83.camel@sauron>
References: <EBEBA6C3BD40EF4B8C0A5B8AD5A28F993B6C6EB71A@GVW0547EXC.americas.hpqcorp.net>
	<1313773387.6607.83.camel@sauron>
Date: Fri, 19 Aug 2011 10:22:20 -0700
Message-ID: <CAN8TOE-1eO-pihTwU6ZE=HZtXNwXg3-ft7qXipvm0Utj6RWBLQ@mail.gmail.com>
Subject: Re: [BUG] mtd-utils: nandwrite: invalid erase after page write failure
From: Brian Norris <computersforpeace@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: "Fryar, Jeff" <jeff.fryar@hp.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 19, 2011 at 10:02 AM, Artem Bityutskiy <dedekind1@gmail.com> wr=
ote:
> On Thu, 2011-08-11 at 16:30 +0100, Fryar, Jeff wrote:
>> mtd-utils nandwrite.c: After a page write failure, the calculation
>> of the block number to erase is incorrect. =A0The erase block size is
>> being passed as the erase block number in the call to mtd_erase().
>
> Looks like correct fix, thanks! Your patch is not very well formatted,
> but I've amended it and applied to mtd-utils, thanks!

Oops, my bad on the bug. I didn't ever get around to using this
feature when I updated nandwrite a while back. Thanks for catching it.

BTW, are you going to rebase or merge the v1.4.6 tag into the master
development branch? Just curious, since they forked when you did that
last tag (this never happens!), and I sent another series of mtd-utils
fixes...I assume I should still base off of master, right?

Brian
