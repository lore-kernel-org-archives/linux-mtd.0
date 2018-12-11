Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWlYJ-0002Eh-O0
 for linux-mtd@lists.infradead.org; Tue, 11 Dec 2018 17:10:37 +0000
Received: by mail-wr1-x430.google.com with SMTP id 96so14916036wrb.2
 for <linux-mtd@lists.infradead.org>; Tue, 11 Dec 2018 09:10:24 -0800 (PST)
MIME-Version: 1.0
References: <TY2PR01MB27000DE339F2C8C63CBEF4C49DA60@TY2PR01MB2700.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB27000DE339F2C8C63CBEF4C49DA60@TY2PR01MB2700.jpnprd01.prod.outlook.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 11 Dec 2018 18:10:11 +0100
Message-ID: <CAFLxGvzp_FmaoADzLG0HnBSJsz45NDU3kH+YPr6eUAzOo4uJrw@mail.gmail.com>
Subject: Re: Questions about ubifs,ubi and mtd?
To: takei744@oki.com
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Dec 11, 2018 at 3:09 PM =E6=AD=A6=E4=BA=95 =E5=85=8B=E6=98=8E <take=
i744@oki.com> wrote:
>
> Hi all,
>
> We are developing the product using file system using ubi, ubifs on hardw=
are with NAND flash memory.
>
> Although the development of the product was completed, we are seeking you=
r help as the customer who is using it is having trouble with it.
>
> The product we have developed has 6 MTD partitions for NAND flash memory.
> These consist of 6 MTDs named 'kernel-a' 'kernel-b', 'rootfs-a', 'rootfs-=
b', 'data-1', 'data-2', and online program only accesses 'data-1' and 'data=
-2' for write access.
> Nevertheless, when loading our program from 'rootfs-a', trying to read th=
e inode with the ubifs_read_node() function will result in "bad node type" =
(ex: 193 but expected 9) and the LEB can not be read with the expected valu=
e. (Even though you do not have write access to rootfs)
> In addition, the file size may be 0 byte in some cases.
>
> Is there anyone who encountered such a problem? Is there patch?

Well, are you using a recent kernel?
