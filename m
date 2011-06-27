Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QbIIM-0004ub-1E
	for linux-mtd@lists.infradead.org; Mon, 27 Jun 2011 20:20:34 +0000
Received: by iwn35 with SMTP id 35so5405447iwn.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 27 Jun 2011 13:20:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <BANLkTi=HJwuX1hy-YxGMXmk6LjAq_gMgfQ@mail.gmail.com>
References: <1309199247-19248-1-git-send-email-computersforpeace@gmail.com>
	<1309199247-19248-7-git-send-email-computersforpeace@gmail.com>
	<BANLkTimEsXdEcH2JJ0x4-iidSkAoK6jy_w@mail.gmail.com>
	<BANLkTi=HJwuX1hy-YxGMXmk6LjAq_gMgfQ@mail.gmail.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Mon, 27 Jun 2011 16:20:09 -0400
Message-ID: <BANLkTi=V42maw_NtTTO86tggp5SjhH=zHQ@mail.gmail.com>
Subject: Re: [PATCH 06/10] mtd-utils: add common version printing function
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
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

On Mon, Jun 27, 2011 at 16:15, Brian Norris wrote:
> On Mon, Jun 27, 2011 at 12:51 PM, Mike Frysinger wrote:
>> if the string is const, then it could just be puts(). =C2=A0but i wonder=
 if
>> it shouldnt instead use printf("%s %s\n", PROGRAM_NAME, VERSION) so
>> that the string that represents PROGRAM_NAME isn't duplicated in the
>> .rodata section.
>
> I'm not sure I know what the exact technical difference would be
> between the string concatenation version and the '%s' argument
> version...

"%s %s\n" is one string in .rodata, and PROGRAM_NAME is another.  so
anytime the app uses PROGRAM_NAME (like in all the helpers in
common.h), they'll reuse that same PROGRAM_NAME string rather than
constantly duplicating it.

if however you use PROGRAM_NAME " " VERSION, you have a unique string
that is only used by the version code.

minor details, but all these duplicate const strings slowly add up ...
-mike
