Received: from mail-vn0-x22e.google.com ([2607:f8b0:400c:c0f::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z6JvZ-0005PR-TS
 for linux-mtd@lists.infradead.org; Sat, 20 Jun 2015 14:39:26 +0000
Received: by vnbf129 with SMTP id f129so1793933vnb.13
 for <linux-mtd@lists.infradead.org>; Sat, 20 Jun 2015 07:39:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAC7eWMVmta_docSDskDJHE_jT29OgoD6z2XUT4CrRJEoc9oYbg@mail.gmail.com>
References: <CAC7eWMVmta_docSDskDJHE_jT29OgoD6z2XUT4CrRJEoc9oYbg@mail.gmail.com>
Date: Sat, 20 Jun 2015 16:39:02 +0200
Message-ID: <CAFLxGvwSZoO4_G5KKvjpihbp5NYO2RFj1NYZ2tjfSaMJ7kkjtw@mail.gmail.com>
Subject: Re: integck
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Smitha Rathnam <rathnam.smitha@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Jun 20, 2015 at 4:05 PM, Smitha Rathnam
<rathnam.smitha@gmail.com> wrote:
> Hi,
>
> I built and ran integck on the target.
> I did the following:
> ./integck -p -m 5 /mnt/nand
> integck: error!: cannot find file-system info
> integck: error!: condition '0' failed in get_tested_fs_info() at integck.c:2942
> integck: error 0 (Success)
> ./integck[0x9b00]
> ./integck[0x10f8c]
> /lib/libc.so.6(__libc_start_main+0x114)[0x2aaf84d4]
>
> The ubi logfs is present on mtd5.
>
> What am I doing wrong here?

/mnt/nand is not a mount point of an UBIFS instance.

-- 
Thanks,
//richard
