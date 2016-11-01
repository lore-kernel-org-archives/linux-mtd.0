Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c1enO-0006Ia-3R
 for linux-mtd@lists.infradead.org; Tue, 01 Nov 2016 19:32:31 +0000
Date: Tue, 1 Nov 2016 20:32:04 +0100 (CET)
From: Julia Lawall <julia.lawall@lip6.fr>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
cc: kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] UBIFS: Remove some dead code
In-Reply-To: <1dc01a45-1eb4-20bd-c5c8-c8f37ba60e06@wanadoo.fr>
Message-ID: <alpine.DEB.2.10.1611012028530.6300@hadrien>
References: <20161101064525.11813-1-christophe.jaillet@wanadoo.fr>
 <a074d673-cf23-d7a1-7b1e-0e1f8f7b0ffe@nod.at>
 <1dc01a45-1eb4-20bd-c5c8-c8f37ba60e06@wanadoo.fr>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-1849458589-1478028727=:6300"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1849458589-1478028727=:6300
Content-Type: TEXT/PLAIN; charset=windows-1252
Content-Transfer-Encoding: 8BIT



On Tue, 1 Nov 2016, Christophe JAILLET wrote:

> Le 01/11/2016 à 12:42, Richard Weinberger a écrit :
> > On 01.11.2016 07:45, Christophe JAILLET wrote:
> > > 'ubifs_fast_find_freeable()' can not return an error pointer, so this test
> > > can be removed.
> > >
> > > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > > ---
> > >   fs/ubifs/gc.c | 4 ----
> > >   1 file changed, 4 deletions(-)
> > >
> > > diff --git a/fs/ubifs/gc.c b/fs/ubifs/gc.c
> > > index e845c64b6ce1..7b35e3d6cde7 100644
> > > --- a/fs/ubifs/gc.c
> > > +++ b/fs/ubifs/gc.c
> > > @@ -846,10 +846,6 @@ int ubifs_gc_start_commit(struct ubifs_info *c)
> > >   	 */
> > >   	while (1) {
> > >   		lp = ubifs_fast_find_freeable(c);
> > > -		if (IS_ERR(lp)) {
> > > -			err = PTR_ERR(lp);
> > > -			goto out;
> > > -		}
> > Good catch, how did you find this?
> > If you have a tool/script I'd like to use it too.
> >
> > Thanks,
> > //richard
> > --
>
> Hi,
> well, it is a bit tricky.
>
> AFAIK, coccinelle is only able to match things in a given file. Finding issues
> between 2 files can be tricky.
>
> So first, I have built a list a functions which are likely to return NULL,
> either because they explicitly return NULL or if its return value is tested
> against NULL or not. See coccinelle script n°1 below.
> Then I have built a list of functions followed by a test with IS_ERR. See
> coccinelle script n°2 below.
>
> These 2 scripts generate 2 lists of functions.
> If a function is present in the 2 files, it is likely that something is
> spurious.
>
> Either the IS_ERR is not needed (this is the case in the patch above), either
> the return value is incorrectly checked. Could also be that NULL is returned
> but an error pointer would be a better option.
>
>
> I also did more or less the same for functions that return PTR_ERR and
> functions that are not followed by a test with IS_ERR.
> I can post these other scripts if wanted.
>
>
>
> Any ideas to improve or speed-up the coccinelle scripts are welcome.
> Julia ?
>
>
> Best regards,
> CJ
>
>
>
> Coccinelle script n°1:
> =====================
> @find@
> identifier f;
> @@
>
>    f(...)
>    {
>       ...
>       return NULL;

Do you want functions that always return NULL or that may return NULL?
Currently you are getting those that always return NULL, except perhaps
under ifs.  But if you want functions that may return NULL, it would be
better to put exists in the rule header after find.  This will also likely
be more efficient.

>    }
>
> @script:python@
> f << find.f;
> @@
>
> print "%s" %(f)
>
>
>
> @find2@
> identifier f;
> expression x;
> statement S;
> @@
>
>    x = f(...);
> (
>    if (x) S
> |
>    if (!x) S
> )

You might want to put ... after x = f(...);, or rather .... when != x = e
for some expression metavariable e.

>
> @script:python@
> f << find2.f;
> @@
>
> print "%s" %(f)
>
>
>
>
>
> Coccinelle script n°2:
> =====================
> @find@
> statement S;
> type t;
> t *x;
> identifier f;
> @@
>
>     x = f(...);

Same here about the ...

julia

> (
>     if (IS_ERR(x)) S
> |
>     if (!IS_ERR(x)) S
> )
>
>
>
> @script:python@
> f << find.f;
> @@
>
> print "%s" %(f)
>
>
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
--8323329-1849458589-1478028727=:6300--
