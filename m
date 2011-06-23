Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QZtIy-0007yc-TL
	for linux-mtd@lists.infradead.org; Thu, 23 Jun 2011 23:27:25 +0000
Received: by wwf22 with SMTP id 22so1674571wwf.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Jun 2011 16:27:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <BANLkTimJN8yOXCqsNscax6bmkTWTzvHphA@mail.gmail.com>
References: <BANLkTi=-25MExYfuB-ANK4ceh3gWy+BqCg@mail.gmail.com>
	<1308761363-16512-1-git-send-email-computersforpeace@gmail.com>
	<1308841377.23597.10.camel@sauron>
	<1308841503.23597.12.camel@sauron>
	<BANLkTimTu1ORjEvtJ7XSCCqwzDbid957Aw@mail.gmail.com>
	<BANLkTi=cUqQcQzeinQaqh_VBFtfnfkVinw@mail.gmail.com>
	<BANLkTimJN8yOXCqsNscax6bmkTWTzvHphA@mail.gmail.com>
Date: Thu, 23 Jun 2011 16:27:17 -0700
Message-ID: <BANLkTinXV-5GWzxn5EoGAfSe2fTWEGjQZw@mail.gmail.com>
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

On Thu, Jun 23, 2011 at 4:14 PM, Mike Frysinger <vapier.adi@gmail.com> wrot=
e:
> i've been pondering unifying common options so all tools have the same
> behavior. =A0for example, all utils should work the same with the basic
> flags:
> -h --help
> -V --version
> -v --verbose
>
> it's bad enough when these deviate across projects, but even within a
> project is even more obnoxious.

Sounds fine. You wanna take care of that? ;)

>> and of the ones that do, we have a
>> random "2.1.0" from flash_erase. We wouldn't want to have a decreased
>> version number...so do we jump to mtd-utils v2.1 and make everything
>> the same version? Or even v3.0, just for fun?
>
> i dont think anyone has scripts parsing these things. =A0i say let's
> just lock them all to the mtd release and forget about it.

OK. So my list's step 7 would just have us jump to 1.4.7 and stick all
utils to that version.

I got the ball rolling with a patch incrementing nanddump and mtdinfo
versions. Then a maintainer can take step 2 on my list (i.e., tag the
release), and Mike and I can hack away at feature-removal...

Brian
