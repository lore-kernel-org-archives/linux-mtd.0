Received: from mail-qg0-x22b.google.com ([2607:f8b0:400d:c04::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WhWI5-00021J-NM
 for linux-mtd@lists.infradead.org; Tue, 06 May 2014 03:43:38 +0000
Received: by mail-qg0-f43.google.com with SMTP id 63so3024034qgz.30
 for <linux-mtd@lists.infradead.org>; Mon, 05 May 2014 20:43:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAE94FHEYeaAPG8WPEwA10KGopY3UJUjcOPZucpgaB8Vp51RbWw@mail.gmail.com>
References: <CAE94FHEYeaAPG8WPEwA10KGopY3UJUjcOPZucpgaB8Vp51RbWw@mail.gmail.com>
Date: Tue, 6 May 2014 11:43:16 +0800
Message-ID: <CAE94FHEJWzSUzjfpui63uvHFego=tANvm72=9HFHHEKoTppXXA@mail.gmail.com>
Subject: Re: [UBI] is ubi_self_check_all_ff() with mtd_read() return value not
 match?
From: Ted Juan <ted.juan@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

Sorry to bother all. I got it.
mtd_read() has check the "return ret_code >= mtd->bitflip_threshold ?
-EUCLEAN : 0;"

Thanks.


2014-05-06 9:59 GMT+08:00 Ted Juan <ted.juan@gmail.com>:
> Hi All,
>
> int ubi_self_check_all_ff(struct ubi_device *ubi, int pnum, int offset, int len)
> {
>
>          ............................  // skip
>
>         err = mtd_read(ubi->mtd, addr, len, &read, buf);
>         if (err && !mtd_is_bitflip(err)) {
>                 ubi_err("error %d while reading %d bytes from PEB
> %d:%d, read %zd bytes",
>                         err, len, pnum, offset, read);
>                 goto error;
>         }
>
>         err = ubi_check_pattern(buf, 0xFF, len);
>         ........................... // skip
> }
>
> In the low level nand flash driver (nand_base.c), the nand_read_page()
> always return "max_bitflips".
> That will cause the above code something wrong, err = mtd_read(), err
> is max_bitflips.
> It will "goto error" but not got to check pattern 0xff.
>
> Is it something wrong, or I am misunderstanding?
>
> Thanks much.
>
> regards,
>
> Ted
