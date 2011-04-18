Received: from mail-yw0-f49.google.com ([209.85.213.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QBptG-0004KA-9l
	for linux-mtd@lists.infradead.org; Mon, 18 Apr 2011 14:57:26 +0000
Received: by ywf9 with SMTP id 9so921749ywf.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 18 Apr 2011 07:57:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1303138210.24954.14.camel@fs-test.research.nokia.com>
References: <1302783893.2796.27.camel@localhost>
	<802c3655ae5130e95b01e5004710f206a3d9ef9c.1303115468.git.ext-andriy.shevchenko@nokia.com>
	<2285954c62e0401291aa3f5055bc79c6789149d7.1303115468.git.ext-andriy.shevchenko@nokia.com>
	<BANLkTik3bKP4=zBgqxpN2vNTWD5V5DzKAA@mail.gmail.com>
	<1303134901.8589.9.camel@localhost>
	<BANLkTi=7yxRMgw+UpCZ+bmwrQw_QfFT44A@mail.gmail.com>
	<1303135646.8589.12.camel@localhost>
	<1303136762.24954.12.camel@fs-test.research.nokia.com>
	<BANLkTi=DNOTANVFDvip8=RqppRCVUe08_w@mail.gmail.com>
	<1303138210.24954.14.camel@fs-test.research.nokia.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Mon, 18 Apr 2011 10:57:04 -0400
Message-ID: <BANLkTi==M8mEkMd8NjyyNe_jWocZQS5_OQ@mail.gmail.com>
Subject: Re: [PATCHv2 2/2] mkfs.jffs2: fix casting of __off64_t
To: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Apr 18, 2011 at 10:50, Andy Shevchenko wrote:
> On Mon, 2011-04-18 at 10:29 -0400, ext Mike Frysinger wrote:
>> On Mon, Apr 18, 2011 at 10:26, Andy Shevchenko wrote:
>> > [1]
>> > http://pubs.opengroup.org/onlinepubs/000095399/basedefs/inttypes.h.html
>> > [2] http://pubs.opengroup.org/onlinepubs/009695399/functions/printf.html
>>
>> on the off chance you missed it, Issue 7 is out:
>> http://pubs.opengroup.org/onlinepubs/9699919799/basedefs/inttypes.h.html
>
> It's true. However it doesn't matter to our talk.

it doesnt ... i was just letting you know in case you werent aware.
Issue 7 has a lot of fun new features.

> The question is which way is better PRIu64 or %jd.

%jd means [u]intmax_t which is not what this is ... on a 32bit system,
int is 32bit.  we're dealing with an explicitly 64bit type (off64_t),
so let's go with an explicitly 64bit printf modifier.
-mike
