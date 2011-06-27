Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QbIDQ-0004oc-4D
	for linux-mtd@lists.infradead.org; Mon, 27 Jun 2011 20:15:29 +0000
Received: by wwf22 with SMTP id 22so3697245wwf.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 27 Jun 2011 13:15:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <BANLkTimEsXdEcH2JJ0x4-iidSkAoK6jy_w@mail.gmail.com>
References: <1309199247-19248-1-git-send-email-computersforpeace@gmail.com>
	<1309199247-19248-7-git-send-email-computersforpeace@gmail.com>
	<BANLkTimEsXdEcH2JJ0x4-iidSkAoK6jy_w@mail.gmail.com>
Date: Mon, 27 Jun 2011 13:15:23 -0700
Message-ID: <BANLkTi=HJwuX1hy-YxGMXmk6LjAq_gMgfQ@mail.gmail.com>
Subject: Re: [PATCH 06/10] mtd-utils: add common version printing function
From: Brian Norris <computersforpeace@gmail.com>
To: Mike Frysinger <vapier.adi@gmail.com>
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

On Mon, Jun 27, 2011 at 12:51 PM, Mike Frysinger <vapier.adi@gmail.com> wro=
te:
> On Mon, Jun 27, 2011 at 14:27, Brian Norris wrote:
>> +/* Simple version-printing for utils */
>> +#define common_print_version() \
>> +do { \
>> + =A0 =A0 =A0 fprintf(stderr, PROGRAM_NAME " " VERSION "\n"); \
>> +} while (0)
>
> this shouldnt go to stderr

Yeah, I wasn't too sure on that one. There were several utils that
already used stderr, but that doesn't actually make much sense, I
guess.

> if the string is const, then it could just be puts(). =A0but i wonder if
> it shouldnt instead use printf("%s %s\n", PROGRAM_NAME, VERSION) so
> that the string that represents PROGRAM_NAME isn't duplicated in the
> .rodata section.

I'm not sure I know what the exact technical difference would be
between the string concatenation version and the '%s' argument
version...

Brian
