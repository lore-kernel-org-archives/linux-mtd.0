Received: from mail-oi0-x22b.google.com ([2607:f8b0:4003:c06::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b6C3q-00042U-DF
 for linux-mtd@lists.infradead.org; Fri, 27 May 2016 07:19:58 +0000
Received: by mail-oi0-x22b.google.com with SMTP id w184so154443618oiw.2
 for <linux-mtd@lists.infradead.org>; Fri, 27 May 2016 00:19:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <046201d1b7b0$5f15b400$1d411c00$@rogers.com>
References: <046201d1b7b0$5f15b400$1d411c00$@rogers.com>
Date: Fri, 27 May 2016 09:19:37 +0200
Message-ID: <CAFLxGvwpDYOk_hyo4vo3YH=OP8TKes_PO94FG9UaJkpTx0o_CQ@mail.gmail.com>
Subject: Re: Looking for an alternative to ubimirror
From: Richard Weinberger <richard.weinberger@gmail.com>
To: PJ <paul.j2@rogers.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, May 27, 2016 at 2:40 AM, PJ <paul.j2@rogers.com> wrote:
> Hi,
>
> Can anyone please recommend a procedure to copy one UBI volume to another?
>
> I'd like to execute from the bash command line, if possible.
>
> One upon a time I was able to use ubimirror, however that command appears to
> have been removed from mtd-utils.
>
> - The source volume will be mounted R/O as it is the rootfs.
> - The destination volume will be unrestricted (unmounted).
> - Both the source and destination volumes are in the same device.

Did you try dd if=/dev/ubiX_Y ... | ubiupdatevol ...?

-- 
Thanks,
//richard
