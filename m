Received: from mail-iy0-f177.google.com ([209.85.210.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QZtSL-00081E-3V
	for linux-mtd@lists.infradead.org; Thu, 23 Jun 2011 23:37:05 +0000
Received: by iyn15 with SMTP id 15so2392973iyn.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Jun 2011 16:37:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <BANLkTinXV-5GWzxn5EoGAfSe2fTWEGjQZw@mail.gmail.com>
References: <BANLkTi=-25MExYfuB-ANK4ceh3gWy+BqCg@mail.gmail.com>
	<1308761363-16512-1-git-send-email-computersforpeace@gmail.com>
	<1308841377.23597.10.camel@sauron> <1308841503.23597.12.camel@sauron>
	<BANLkTimTu1ORjEvtJ7XSCCqwzDbid957Aw@mail.gmail.com>
	<BANLkTi=cUqQcQzeinQaqh_VBFtfnfkVinw@mail.gmail.com>
	<BANLkTimJN8yOXCqsNscax6bmkTWTzvHphA@mail.gmail.com>
	<BANLkTinXV-5GWzxn5EoGAfSe2fTWEGjQZw@mail.gmail.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Thu, 23 Jun 2011 19:36:41 -0400
Message-ID: <BANLkTi=ZW99673rk-03VDHWb7aoUf1LFtQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] prepare new nanddump options, defaults
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
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

On Thu, Jun 23, 2011 at 19:27, Brian Norris wrote:
> On Thu, Jun 23, 2011 at 4:14 PM, Mike Frysinger wrote:
>> i've been pondering unifying common options so all tools have the same
>> behavior. =C2=A0for example, all utils should work the same with the bas=
ic
>> flags:
>> -h --help
>> -V --version
>> -v --verbose
>>
>> it's bad enough when these deviate across projects, but even within a
>> project is even more obnoxious.
>
> Sounds fine. You wanna take care of that? ;)

i'll take a peek as i've done this before with other projects

> OK. So my list's step 7 would just have us jump to 1.4.7 and stick all
> utils to that version.

did someone forget to tag/push v1.4.[56] ?  i dont see it in the git repo.
-mike
