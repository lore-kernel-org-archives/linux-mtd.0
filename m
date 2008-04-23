Received: from wf-out-1314.google.com ([209.85.200.168])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JocZN-0000T5-D9
	for linux-mtd@lists.infradead.org; Wed, 23 Apr 2008 10:51:21 +0000
Received: by wf-out-1314.google.com with SMTP id 29so2009071wff.24
	for <linux-mtd@lists.infradead.org>;
	Wed, 23 Apr 2008 03:51:20 -0700 (PDT)
Message-ID: <bae050c10804230351s699a851bmb950a18b22ae8e54@mail.gmail.com>
Date: Wed, 23 Apr 2008 18:51:20 +0800
From: Nancy <nancydreaming@gmail.com>
To: dedekind@infradead.org
Subject: Re: [RFC] slight UBI scan time improvement
In-Reply-To: <1208942023.11721.48.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1208882552.11721.13.camel@sauron>
	<bae050c10804230015r50b7747apef8b1d8cab302c9a@mail.gmail.com>
	<1208935971.11721.20.camel@sauron>
	<bae050c10804230101m64bc2558icf9a5ad7efb8c824@mail.gmail.com>
	<1208938571.11721.38.camel@sauron>
	<bae050c10804230207s79902591l8a977881d89e48c3@mail.gmail.com>
	<1208942023.11721.48.camel@sauron>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 4/23/08, Artem Bityutskiy <dedekind@infradead.org> wrote:
> On Wed, 2008-04-23 at 17:07 +0800, Nancy wrote:
> > Torure is enough : )
> > Will you please explain why pattern 0x00 is not enough, it still need
> > 0xA5 and 0x5A. What these information come from? Thanks in advance.
>
> Dunno, i just decided it might be good. And I just picked these values.
> If we fail  on the first pattern, we do not continue.
Okay.
Another question:
      Will you please explain why need leb_read_lock()?
      If I ummap a leb(only operate the eba table, do not do
ubi_wl_put_peb() ), then, what will that PEB belong to? wl->free,
wl->used, wl->prot.pnum, wl->prot.aec, wl->scrub? What will happen to
that PEB?


--
Best wishes,
Nancy
