Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RKvEE-0005pd-LC
	for linux-mtd@lists.infradead.org; Mon, 31 Oct 2011 17:00:55 +0000
Received: by wyf28 with SMTP id 28so1041789wyf.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 31 Oct 2011 10:00:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20111030203719.GA20162@pengutronix.de>
References: <1319977792.2126.30.camel@koala>
	<1319992129-13588-1-git-send-email-w.sang@pengutronix.de>
	<1320006895.2126.61.camel@koala>
	<20111030203719.GA20162@pengutronix.de>
Date: Mon, 31 Oct 2011 10:00:49 -0700
Message-ID: <CAN8TOE-pmRTc322hBajwSB1knwYSjBuGeL8tDuG=Te5XE=fcHA@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] mtd: tests: annotate as DANGEROUS in Kconfig
From: Brian Norris <computersforpeace@gmail.com>
To: Wolfram Sang <w.sang@pengutronix.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Oct 30, 2011 at 1:37 PM, Wolfram Sang <w.sang@pengutronix.de> wrote=
:
> On Sun, Oct 30, 2011 at 10:34:53PM +0200, Artem Bityutskiy wrote:
>> On Sun, 2011-10-30 at 17:28 +0100, Wolfram Sang wrote:
>> > + =A0 =A0 WARNING: Some of the tests will ERASE THE CONTENT of mtd dev=
ices!
>> > + =A0 =A0 Do not use these tests unless you are sure you really need t=
o.
>>
>> Thanks, I've pushed this patch but amended the above text a bit:
>> + =A0 =A0 =A0 =A0 WARNING: some of the tests will ERASE entire MTD devic=
e which they
>> + =A0 =A0 =A0 =A0 test. Do not use these tests unless you really know wh=
at you do.

Amendment to the amendment, perhaps? I think "unless you really know
what you do" should be "unless you really know what you are doing".

> OK, thanks! Seems we now finally have it :)

Maybe now we have it?

BTW, I agree that EXPERIMENTAL was not quite the right way to go.

Brian
