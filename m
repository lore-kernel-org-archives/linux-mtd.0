Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bYrHr-0007PP-22
 for linux-mtd@lists.infradead.org; Sun, 14 Aug 2016 09:00:55 +0000
Received: by mail-oi0-x243.google.com with SMTP id e80so2289463oig.2
 for <linux-mtd@lists.infradead.org>; Sun, 14 Aug 2016 02:00:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1471008390-19227-1-git-send-email-vincent.stehle@intel.com>
References: <1471008390-19227-1-git-send-email-vincent.stehle@intel.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sun, 14 Aug 2016 11:00:33 +0200
Message-ID: <CAFLxGvwqvLpUUzqc_5=iTB03NdU_mYvrmPqRjTZ6O-x+mzTTeA@mail.gmail.com>
Subject: Re: [PATCH] UBIFS: fix assertion in layout_in_gaps()
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@intel.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Vincent,

On Fri, Aug 12, 2016 at 3:26 PM, Vincent Stehl=C3=A9
<vincent.stehle@intel.com> wrote:
> An assertion in layout_in_gaps() verifies that the gap_lebs pointer is
> below the maximum bound. When computing this maximum bound the idx_lebs
> count is multiplied by sizeof(int), while C pointers arithmetic does take
> into account the size of the pointed elements implicitly already. Remove
> the multiplication to fix the assertion.
>
> Fixes: 1e51764a3c2ac05a ("UBIFS: add new flash file system")
> Signed-off-by: Vincent Stehl=C3=A9 <vincent.stehle@intel.com>
> Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> ---
>  fs/ubifs/tnc_commit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/ubifs/tnc_commit.c b/fs/ubifs/tnc_commit.c
> index b45345d..51157da 100644
> --- a/fs/ubifs/tnc_commit.c
> +++ b/fs/ubifs/tnc_commit.c
> @@ -370,7 +370,7 @@ static int layout_in_gaps(struct ubifs_info *c, int c=
nt)
>
>         p =3D c->gap_lebs;
>         do {
> -               ubifs_assert(p < c->gap_lebs + sizeof(int) * c->lst.idx_l=
ebs);
> +               ubifs_assert(p < c->gap_lebs + c->lst.idx_lebs);

Good catch! Did you hit this assertion or was it found by review?
I bet the latter since it is here since ever and given the wrongness
it is unlikely to trigger.

--=20
Thanks,
//richard
