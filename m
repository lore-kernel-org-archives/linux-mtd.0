Received: from mail-fx0-f211.google.com ([209.85.220.211])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NCY6Y-0004Wj-4I
	for linux-mtd@lists.infradead.org; Mon, 23 Nov 2009 12:33:23 +0000
Received: by fxm3 with SMTP id 3so5854968fxm.4
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 Nov 2009 04:33:15 -0800 (PST)
MIME-Version: 1.0
Sender: penberg@gmail.com
In-Reply-To: <E1NBZJ5-0003hL-Qc@longford.logfs.org>
References: <20091120181113.GA2159@logfs.org>
	<E1NBZJ5-0003hL-Qc@longford.logfs.org>
Date: Mon, 23 Nov 2009 14:33:15 +0200
Message-ID: <84144f020911230433q5fd90321m9b463cb425fafe7d@mail.gmail.com>
Subject: Re: [PATCH 12/17] [LogFS] readwrite.c
From: Pekka Enberg <penberg@cs.helsinki.fi>
To: Joern Engel <joern@logfs.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	Hugh Dickins <hugh.dickins@tiscali.co.uk>,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Joern,

(Dunno who to CC, really, so lets see if I can trick Andrew or Hugh
into looking at the issue.)

On Fri, Nov 20, 2009 at 9:38 PM, Joern Engel <joern@logfs.org> wrote:
> +static void logfs_lock_write_page(struct page *page)
> +{
> + =A0 =A0 =A0 int loop =3D 0;
> +
> + =A0 =A0 =A0 while (unlikely(!trylock_page(page))) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (loop++ > 0x1000) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Has been observed once s=
o far... */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "stack at %=
p\n", &loop);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 BUG();
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (PagePreLocked(page)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Holder of page lock is w=
aiting for us, it
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* is safe to use this pa=
ge. */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Some other process has this page locked =
and has
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* nothing to do with us. =A0Wait for it =
to finish.
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 schedule();
> + =A0 =A0 =A0 }
> + =A0 =A0 =A0 BUG_ON(!PageLocked(page));
> +}

What's the purpose of PagePreLocked()? The above function looks pretty
fragile for a filesystem to me.

                        Pekka
