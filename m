Received: from nz-out-0506.google.com ([64.233.162.237])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HoIkI-0007Qw-Hg
	for linux-mtd@lists.infradead.org; Wed, 16 May 2007 08:36:59 -0400
Received: by nz-out-0506.google.com with SMTP id i11so1262782nzi
	for <linux-mtd@lists.infradead.org>;
	Wed, 16 May 2007 05:36:45 -0700 (PDT)
Message-ID: <84144f020705160536i189f6206sffc964a145177da7@mail.gmail.com>
Date: Wed, 16 May 2007 15:36:44 +0300
From: "Pekka Enberg" <penberg@cs.helsinki.fi>
Sender: penberg@gmail.com
To: "=?ISO-8859-1?Q?J=F6rn_Engel?=" <joern@lazybastard.org>
Subject: Re: [PATCH] LogFS take three
In-Reply-To: <20070516122603.GE5472@lazybastard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <20070515151919.GA32510@lazybastard.org>
	<Pine.LNX.4.64.0705161319060.5152@sbz-30.cs.Helsinki.FI>
	<20070516122603.GE5472@lazybastard.org>
Cc: akpm@osdl.org, Evgeniy Polyakov <johnpol@2ka.mipt.ru>,
	Albert Cahalan <acahalan@gmail.com>, Greg KH <greg@kroah.com>,
	linux-kernel@vger.kernel.org, Ingo Oeser <ioe-lkml@rameria.de>,
	linux-mtd@lists.infradead.org, Jan Engelhardt <jengelh@linux01.gwdg.de>,
	linux-fsdevel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 5/16/07, J=F6rn Engel <joern@lazybastard.org> wrote:
> > > +/* FIXME: all this mess should get replaced by using the page cache =
*/
> > > +static void fixup_from_wbuf(struct super_block *sb, struct logfs_are=
a
> > *area,
> > > +             void *read, u64 ofs, size_t readlen)
> > > +{
> >
> > Indeed. And I think you're getting some more trouble because of this...
>
> More trouble?

Forgot to add (see below). Seems logfs_segment_read would be simpler
too if you fixed this.

> [ Objects are the units that get compressed.  Segments can contain both
> compressed and uncompressed objects. ]
>
> It is a trade-off.  Each object has a 24 Byte header plus X Bytes of
> data.  Whether the data is compressed or not is indicated in the header.

Was my point really. Why do segments contain both compressed and
uncompressed objects?
