Received: from mail-iy0-f177.google.com ([209.85.210.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QbHqr-0004OW-Kw
	for linux-mtd@lists.infradead.org; Mon, 27 Jun 2011 19:52:12 +0000
Received: by iyn15 with SMTP id 15so5361984iyn.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 27 Jun 2011 12:52:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1309199247-19248-7-git-send-email-computersforpeace@gmail.com>
References: <1309199247-19248-1-git-send-email-computersforpeace@gmail.com>
	<1309199247-19248-7-git-send-email-computersforpeace@gmail.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Mon, 27 Jun 2011 15:51:44 -0400
Message-ID: <BANLkTimEsXdEcH2JJ0x4-iidSkAoK6jy_w@mail.gmail.com>
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

On Mon, Jun 27, 2011 at 14:27, Brian Norris wrote:
> +/* Simple version-printing for utils */
> +#define common_print_version() \
> +do { \
> + =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, PROGRAM_NAME " " VERSION "\n"); \
> +} while (0)

this shouldnt go to stderr

if the string is const, then it could just be puts().  but i wonder if
it shouldnt instead use printf("%s %s\n", PROGRAM_NAME, VERSION) so
that the string that represents PROGRAM_NAME isn't duplicated in the
.rodata section.
-mike
