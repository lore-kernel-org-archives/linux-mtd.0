Received: from mail-wm0-x22f.google.com ([2a00:1450:400c:c09::22f])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eUUeC-0002Wo-E5
 for linux-mtd@lists.infradead.org; Thu, 28 Dec 2017 09:38:46 +0000
Received: by mail-wm0-x22f.google.com with SMTP id i11so42842380wmf.4
 for <linux-mtd@lists.infradead.org>; Thu, 28 Dec 2017 01:38:33 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1514441615.4759.12.camel@infinera.com>
References: <1514441615.4759.12.camel@infinera.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 28 Dec 2017 10:38:31 +0100
Message-ID: <CAFLxGvyDWQCwUpGcn+9ZbSXKxfXpMBT5WpCjA5NZ1GR+ueSUVQ@mail.gmail.com>
Subject: Re: xxhash ?
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Joakim,

On Thu, Dec 28, 2017 at 7:13 AM, Joakim Tjernlund
<Joakim.Tjernlund@infinera.com> wrote:
> Now that xxhash is in the tree one could look at replacing
> crc32 in JFFS2/UBI. This would make checksumming much faster.

Since this will require a change of the on-disk format we have to be
very careful.
Do you have a use-case where crc32 is the bottle neck?

-- 
Thanks,
//richard
