Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qbx39-0000dQ-KM
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2011 15:51:36 +0000
Received: by wwf22 with SMTP id 22so1001138wwf.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 29 Jun 2011 08:50:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <BANLkTin6-=8sH8HazumX577-94TRk5Wi2g@mail.gmail.com>
References: <1309199247-19248-1-git-send-email-computersforpeace@gmail.com>
	<1309199247-19248-3-git-send-email-computersforpeace@gmail.com>
	<BANLkTin6-=8sH8HazumX577-94TRk5Wi2g@mail.gmail.com>
Date: Wed, 29 Jun 2011 08:45:10 -0700
Message-ID: <BANLkTimcJZ14Uxs0d0Tf4ObmkH-BfehwhQ@mail.gmail.com>
Subject: Re: [PATCH 02/10] mtd-tests: io_paral: build error,
	"variable length strings"
From: Brian Norris <computersforpeace@gmail.com>
To: Josh Boyer <jwboyer@gmail.com>
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

On Wed, Jun 29, 2011 at 6:22 AM, Josh Boyer <jwboyer@gmail.com> wrote:
> On Mon, Jun 27, 2011 at 2:27 PM, Brian Norris
> <computersforpeace@gmail.com> wrote:
>> Some compilers will complain about use of strlen() within a static array
>> size declaration. For this type of string, "sizeof() - 1" is equivalent
>> and prevents the build error.
>>
>> Error:
>>
>> =A0 io_paral.c:48:13: error: variably modified 'vol_nodes' at file scope
>
> Out of curiosity, which compiler does that? =A0Newer versions of GCC, or
> some other compiler altogether?

I think it's just newer versions of GCC. I found the error on MIPS GCC
on versions 4.5.2 and 4.5.3. It didn't occur on MIPS or x86_64 for
version 4.4.3.

Brian
