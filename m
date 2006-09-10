Received: from nf-out-0910.google.com ([64.233.182.186])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GMOVb-0000fV-1T
	for linux-mtd@lists.infradead.org; Sun, 10 Sep 2006 13:34:00 +0100
Received: by nf-out-0910.google.com with SMTP id l37so1126293nfc
	for <linux-mtd@lists.infradead.org>;
	Sun, 10 Sep 2006 05:32:57 -0700 (PDT)
Message-ID: <625fc13d0609100532n58933486l3f66715c38172cd5@mail.gmail.com>
Date: Sun, 10 Sep 2006 07:32:57 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: dedekind@yandex.ru
Subject: Re: State of UBI
In-Reply-To: <4503D10E.000001.07116@webmail12.yandex.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <625fc13d0609091922m42a1caeagfa4e87bc18f2a8d6@mail.gmail.com>
	<4503D10E.000001.07116@webmail12.yandex.ru>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 9/10/06, dedekind <dedekind@yandex.ru> wrote:
> Hello Josh,
>
> >Where are we with UBI?  It seems Artem has been steadily committing
> >fixes to the ubi git tree.
> Yes, I'm using it in another project so I stedily add more tiny
> features, changes and fixes. Also, one may notice that I maintain
> UBI FAQ which has considerably grown.

I've noticed that as well.  I think it's great and I appreciate the
effort you've put in so far.

>
> >I think a good start would be to list what's missing.  I know that it
> >needs a patch to allow double page writes on NAND.  There's also the
> >missing JFFS2 integration, or rather two competing versions of it.  Is
> >there anything else?  Something documented in a TODO list would be
> >good.
>
> Well, what you've listed is not what UBI itself needs:
> 1. "double page writes on NAND" - it needs MTD changes and zero UBI changes.

I'll politely disagree here.  UBI _does_ need this on NAND to be
really usable.  Otherwise you eat 2 pages per block for UBI metadata,
and that is quite a bit of overhead for a handful of bytes in the
structures.

> 2. Better UBI utilities as I find the current ones not ideal.

What do you find lacking or not ideal?  I'm just curious.

>
> >Then there's a matter of when should it be merged.  As it stands right
> >now, UBI is in limbo and I'd hate to see something with good potential
> >just sit around rotting.  Having a merge goal would perhaps provide
> >some motivation.  It could be a date or a kernel version, but it
> >should be realistic.
>
> Would be nice to just add it to mtd-2.6.git, IMO. This would be a good
> and simple step further.

Yes, maybe.  But I don't want to put the mtd-2.6.git tree in a state
where one has to cherry pick non-UBI fixes from it to send upstream.

josh
