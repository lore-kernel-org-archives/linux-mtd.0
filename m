Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1as57I-0005um-LQ
 for linux-mtd@lists.infradead.org; Mon, 18 Apr 2016 09:05:13 +0000
Message-ID: <1460970266.7369.3.camel@gmail.com>
Subject: Re: Reconsidering exportable UBIFS
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>, linux-fsdevel
 <linux-fsdevel@vger.kernel.org>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Christoph Hellwig <hch@infradead.org>
Date: Mon, 18 Apr 2016 12:04:26 +0300
In-Reply-To: <5702E7F5.1050807@nod.at>
References: <5702E7F5.1050807@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2016-04-05 at 00:17 +0200, Richard Weinberger wrote:
> The biggest problem I see is that UBIFS does not really support
> telldir()
> and seekdir().
> Directory offsets in UBIFS are plain hash values, so
> telldir()/seekdir() won't
> correctly work if UBIFS faces hash collisions.
> Currently UBIFS implements a hack which stores the UBIFS dent object
> into
> file->private_data such that consecutive readdir()s are guaranteed to
> work.
> A comment on UBIFS's readdir states:
>  * This means that UBIFS cannot support NFS which requires full
>  * 'seekdir()'/'telldir()' support.

Richard, I do not remember much about NFS support. I can only say that
I never really put efforts into this, unfortunately.
Here is an old discussion which could give you some more hints:

http://marc.info/?l=linux-nfsv4&m=126480082613293&w=2

Artem.
