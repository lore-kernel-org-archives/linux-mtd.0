Received: from wproxy.gmail.com ([64.233.184.206])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FLgUk-0000UA-5I
	for linux-mtd@lists.infradead.org; Tue, 21 Mar 2006 08:03:09 -0500
Received: by wproxy.gmail.com with SMTP id 69so1228618wra
	for <linux-mtd@lists.infradead.org>;
	Tue, 21 Mar 2006 05:01:11 -0800 (PST)
Message-ID: <625fc13d0603210501i5a353e56s6a686e629b692645@mail.gmail.com>
Date: Tue, 21 Mar 2006 07:01:11 -0600
From: "Josh Boyer" <jwboyer@gmail.com>
To: Tomas <Tomas2003@home.se>
In-Reply-To: <ops6rhi7cvoeqxpi@privat.utfors.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <1142865089.c65a3380tomas2003@home.se>
	<Pine.LNX.4.64.0603201102430.3631@localhost.localdomain>
	<ops6rhi7cvoeqxpi@privat.utfors.se>
Cc: linux-mtd@lists.infradead.org
Subject: Re: cfi 0001
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 3/21/06, Tomas <Tomas2003@home.se> wrote:
> Hi,
>
> There are 2 things that I didn't expect:
>
> First that the flash allways seems to be in non-readable
> state after a write. It will not change state until a read
> is performed. This might be by design for performance?
> The cfi-driver uses the buffered write and then
> returns. Next time the cfi-driver is called it checks
> if the operation done before was completed
> and issue the current task?

This has been like that forever.  We added the hack David described
earlier to force the chip back into read array mode after a write or
erase.  But it's not 100% safe.

> The second thing is that it whole flash is put
> into a non-readable state in a write operation.
> I have partition the flash in several partition
> by using physmap. I don't know how the cfi flash
> works but shoudn't it be possible to work on sector basis?

No, it's not.  That isn't how NOR flash works.  And partitions created
with physmap are purely a software mechanism.

josh
