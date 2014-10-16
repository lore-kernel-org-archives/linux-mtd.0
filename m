Received: from mailsec115.isp.belgacom.be ([195.238.20.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xefy5-0005KN-T4
 for linux-mtd@lists.infradead.org; Thu, 16 Oct 2014 07:59:31 +0000
Date: Thu, 16 Oct 2014 09:59:04 +0200 (CEST)
From: Fabian Frederick <fabf@skynet.be>
Reply-To: Fabian Frederick <fabf@skynet.be>
To: Joe Perches <joe@perches.com>
Message-ID: <1884722160.6037.1413446344204.open-xchange@webmail.nmp.skynet.be>
In-Reply-To: <1413305557.3269.21.camel@joe-AO725>
References: <1413305085-7318-1-git-send-email-fabf@skynet.be>
 <1413305557.3269.21.camel@joe-AO725>
Subject: Re: [PATCH 1/1 linux-next] fs/jffs2/nodelist.h: remove unnecessary
 __constant_ prefix
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <dwmw2@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



> On 14 October 2014 at 18:52 Joe Perches <joe@perches.com> wrote:
>
>
> On Tue, 2014-10-14 at 18:44 +0200, Fabian Frederick wrote:
> > See commit fbdb8138cf0c
> > ("checkpatch: warn on uses of __constant_ functions")
>
> Perhaps it'd be better to use the same
> __builtin_constant_p test as swab.h and use
> just one pattern instead
>
> > diff --git a/fs/jffs2/nodelist.h b/fs/jffs2/nodelist.h
> > index fa35ff7..9f0d547 100644
> > --- a/fs/jffs2/nodelist.h
> > +++ b/fs/jffs2/nodelist.h
> > @@ -48,8 +48,8 @@
> >=C2=A0 #define cpu_to_je32(x) ((jint32_t){cpu_to_be32(x)})
> >=C2=A0 #define cpu_to_jemode(x) ((jmode_t){cpu_to_be32(os_to_jffs2_mode(=
x))})
> >=C2=A0
> > -#define constant_cpu_to_je16(x) ((jint16_t){__constant_cpu_to_be16(x)}=
)
> > -#define constant_cpu_to_je32(x) ((jint32_t){__constant_cpu_to_be32(x)}=
)
> > +#define constant_cpu_to_je16(x) ((jint16_t){cpu_to_be16(x)})
> > +#define constant_cpu_to_je32(x) ((jint32_t){cpu_to_be32(x)})
>
> So none of these constant_ things would be here
> at all.

I guess you're talking about include/uapi/linux/swab.h eg=C2=A0 =C2=A0 =C2=
=A0 =C2=A0
#define __swab16(x)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
(__builtin_constant_p((__u16)(x)) ?=C2=A0 =C2=A0 =C2=A0\
___constant_swab16(x) :=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0\
__fswab16(x))

As your commit fbdb8138cf0c states

("Emit a warning when using any of these __constant_ forms:")

There's no need for __constant outside include/uapi.
So maybe we could just remove all #define constant_cpu_to_xxx
and always call cpu_to_xxx from jffs2 instead ?

Fabian
>
>
