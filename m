Received: from mail-wg0-x235.google.com ([2a00:1450:400c:c00::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vjdgw-0001IU-6I
 for linux-mtd@lists.infradead.org; Thu, 21 Nov 2013 23:29:47 +0000
Received: by mail-wg0-f53.google.com with SMTP id b13so460155wgh.20
 for <linux-mtd@lists.infradead.org>; Thu, 21 Nov 2013 15:29:23 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAGZNvdpag-DDUwYKGYaLs17St6P_LRk7EKDtPzuLcsGT324YTw@mail.gmail.com>
References: <CAGZNvdpag-DDUwYKGYaLs17St6P_LRk7EKDtPzuLcsGT324YTw@mail.gmail.com>
Date: Fri, 22 Nov 2013 00:29:23 +0100
Message-ID: <CAFLxGvyz6bz+eKm1gsBE70ud9m31kBbghJWYV6T2n3racZChpA@mail.gmail.com>
Subject: Re: UBI attach, UBIFS mount and blocks writing
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Fernando Silveira <fsilveira@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 21, 2013 at 6:33 PM, Fernando Silveira <fsilveira@gmail.com> wrote:
> Hi,
>
> Does a simple UBI attach procedure (e.g. "ubi.mtd=root" at the Linux
> cmdline or "ubiattach -m 1") writes something to the flash? What about
> a simple read-write mount of a UBIFS partition?
>
> I'm worried about it because my flash has a VERY low limit for
> erasing/writing blocks and I'd like to avoid passing read-only
> arguments to the "mtdparts" parameter (e.g.
> "mtdparts=mynand:8m(boot),-(root)ro") and base only whether I write to
> a UBI device or write files to UBIFS partitions in read-write mode.

UBI does wear-leveling, it tests block and replaces them.
UBIFS has for example a journal, which has to be processed at mount time.
The short answer is yes, both can issue writes.

-- 
Thanks,
//richard
