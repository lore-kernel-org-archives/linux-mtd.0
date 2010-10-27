Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PAyeZ-0006QJ-7P
	for linux-mtd@lists.infradead.org; Wed, 27 Oct 2010 05:34:28 +0000
Received: by wyf22 with SMTP id 22so289549wyf.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 26 Oct 2010 22:34:24 -0700 (PDT)
MIME-Version: 1.0
Sender: kyungmin78@gmail.com
In-Reply-To: <20101026162900.423EC1365D8@gemini.denx.de>
References: <20101026055332.B14FD152451@gemini.denx.de>
	<1288083795.2227.28.camel@localhost>
	<20101026162900.423EC1365D8@gemini.denx.de>
Date: Wed, 27 Oct 2010 14:34:24 +0900
Message-ID: <AANLkTikc8fpTtTUXs2KaF3h4Bd6TH6kjPr_F3pN=e5u=@mail.gmail.com>
Subject: Re: UBIFS: mount based on UUID?
From: Kyungmin Park <kmpark@infradead.org>
To: Wolfgang Denk <wd@denx.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 27, 2010 at 1:29 AM, Wolfgang Denk <wd@denx.de> wrote:
> Dear Artem,
>
> In message <1288083795.2227.28.camel@localhost> you wrote:
>>
>> No, you are right, we do have UUID, but we added it just in case we need
>> it in the future, e.g., for NFS support, but we do not use it currently
>> because we did not need it. And we did not look at mounting by UUID - it
>> should be possible to do.
>
> I see.
>
>> I'm a bit overloaded at the moment, but if I have time later, I can look
>> at it.

Hi Artem,
I'm also waiting this feature. now it used for script for parsing
mount ubifs. but if support UUID, I will use this one.

Thank you,
Kyungmin Park
>
> Thanks a lot.
>
> Best regards,
>
> Wolfgang Denk
>
> --
> DENX Software Engineering GmbH, =A0 =A0 MD: Wolfgang Denk & Detlev Zundel
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
> Quote from a recent meeting: =A0 "We are going to continue having these
> meetings everyday until I find out why no work is getting done."
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
