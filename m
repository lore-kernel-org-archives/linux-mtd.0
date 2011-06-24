Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QaAL1-0000wR-FC
	for linux-mtd@lists.infradead.org; Fri, 24 Jun 2011 17:38:40 +0000
Received: by wwf22 with SMTP id 22so2181625wwf.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Jun 2011 10:37:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <BANLkTi=cUqQcQzeinQaqh_VBFtfnfkVinw@mail.gmail.com>
References: <BANLkTi=-25MExYfuB-ANK4ceh3gWy+BqCg@mail.gmail.com>
	<1308761363-16512-1-git-send-email-computersforpeace@gmail.com>
	<1308841377.23597.10.camel@sauron>
	<1308841503.23597.12.camel@sauron>
	<BANLkTimTu1ORjEvtJ7XSCCqwzDbid957Aw@mail.gmail.com>
	<BANLkTi=cUqQcQzeinQaqh_VBFtfnfkVinw@mail.gmail.com>
Date: Fri, 24 Jun 2011 10:37:29 -0700
Message-ID: <BANLkTi=b9tnk5tS9FZZ5WP4Nz9PUhMb02A@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] prepare new nanddump options, defaults
From: Brian Norris <computersforpeace@gmail.com>
To: Mike Frysinger <vapier.adi@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On Thu, Jun 23, 2011 at 4:00 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> On Thu, Jun 23, 2011 at 8:52 AM, Mike Frysinger <vapier.adi@gmail.com> wr=
ote:
>> On Thu, Jun 23, 2011 at 11:04, Artem Bityutskiy wrote:
>>> But
>>> even better we could make the version numbers to be the same as release
>>> number, then this process would be more automated and version would mak=
e
>>> some sense...
>>
>> the version isnt encoded anywhere. =A0so if you started using something
>> like the kernel where the VERSION was in the Makefile, we could use
>> that to create a header file which all the utils would include.
>> -mike
>
> I like Mike's idea on the VERSION thing.

I took a little look at doing this "kernel style," but I'm running
into problems. It seems like this would be a little more difficult
because of the less centralized nature of mtd-utils (in comparison
with the kernel). Plus, I'm not very good with the GNU make system and
don't wanna mess too deep into something that could easily break
various people's build systems...

Also, is it just me or is the mtd-utils build setup pretty ugly? Maybe
I'm just used to how simplistic, unified, and informative the kernel
build system is, whereas mtd-utils prints out all sorts of detailed
info at the expense of *clearly* showing what it's doing.

OK, end of complaint (for now) ; I have some tangential noobish
questions, if anyone would be kind enough to answer:

Are the "ubi-utils" and "tests" meant to have the option of compiling
separately from the other mtd-utils?
Are these tools ever distributed separately? If not, do they need to
be independently buildable? It looks to me like ubi-utils is dependent
on first compiling "lib", but otherwise, they can all be built
separately... Anyway, I think this kinda screws with the centralized
VERSION thing above.
Why is mtdinfo under ubi-utils? Perhaps it should be moved when it
replaces flash_info? I think this is a fair interpretation of Item 3
in the feature-removal plan...

Thanks for putting up with me.

Cheers,
Brian
