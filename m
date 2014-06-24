Received: from mail-qg0-x229.google.com ([2607:f8b0:400d:c04::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WzK3B-0003GX-Em
 for linux-mtd@lists.infradead.org; Tue, 24 Jun 2014 06:17:49 +0000
Received: by mail-qg0-f41.google.com with SMTP id i50so6864680qgf.28
 for <linux-mtd@lists.infradead.org>; Mon, 23 Jun 2014 23:17:28 -0700 (PDT)
MIME-Version: 1.0
Sender: christian.riesch@gmail.com
In-Reply-To: <A765B125120D1346A63912DDE6D8B6315D6F28@NTXXIAMBX02.xacn.micron.com>
References: <A765B125120D1346A63912DDE6D8B6315D6F28@NTXXIAMBX02.xacn.micron.com>
Date: Tue, 24 Jun 2014 08:17:27 +0200
Message-ID: <CABkLObrDD3msnGq9jjUF0HewbPzv761ZvzdHX2-O=TanCH89GA@mail.gmail.com>
Subject: Re: [PATCH v3] mtd:nor:timeout:fix do_write_buffer() timeout error
From: Christian Riesch <christian.riesch@omicron.at>
To: =?UTF-8?B?QmVhbiBIdW8g6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Kees Cook <keescook@chromium.org>, Alexander Shiyan <shc_work@mail.ru>,
 Jingoo Han <jg1.han@samsung.com>,
 Paul Gortmaker <paul.gortmaker@windriver.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Tue, Jun 24, 2014 at 4:02 AM, Bean Huo =E9=9C=8D=E6=96=8C=E6=96=8C (bean=
huo)
<beanhuo@micron.com> wrote:
> The size of the buffer program has been increased from 256 to 512 ,
> 2ms maximum timeout for do_write_buffer can not adapt to all the differen=
t
> vendor's norflash.There maximum timeout information in the CFI area,so
> the best way is to choose the result calculated according to timeout fiel=
d
> of struct cfi_ident that probed from norflash's CFI aera.This is also a
> standard defined by CFI.
>
> Without this change, if the size of buffer program is 512 or bigger than =
256,
> due to timeout is the shorter than that the chip required,do_write_buffer
> sometimes fails.
>
> Tested with Micron JS28F512M29EWx and Micron MT28EW512ABA flash devices.
>

v3 applies without any problems! Thanks!
Christian
