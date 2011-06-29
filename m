Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qbuiv-0006as-KD
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2011 13:22:35 +0000
Received: by vws8 with SMTP id 8so1083421vws.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 29 Jun 2011 06:22:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1309199247-19248-3-git-send-email-computersforpeace@gmail.com>
References: <1309199247-19248-1-git-send-email-computersforpeace@gmail.com>
	<1309199247-19248-3-git-send-email-computersforpeace@gmail.com>
Date: Wed, 29 Jun 2011 09:22:26 -0400
Message-ID: <BANLkTin6-=8sH8HazumX577-94TRk5Wi2g@mail.gmail.com>
Subject: Re: [PATCH 02/10] mtd-tests: io_paral: build error,
	"variable length strings"
From: Josh Boyer <jwboyer@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Mike Frysinger <vapier.adi@gmail.com>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jun 27, 2011 at 2:27 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> Some compilers will complain about use of strlen() within a static array
> size declaration. For this type of string, "sizeof() - 1" is equivalent
> and prevents the build error.
>
> Error:
>
> =A0 io_paral.c:48:13: error: variably modified 'vol_nodes' at file scope

Out of curiosity, which compiler does that?  Newer versions of GCC, or
some other compiler altogether?

josh
