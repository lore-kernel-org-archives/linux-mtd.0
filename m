Received: from mail-wi0-x235.google.com ([2a00:1450:400c:c05::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ztifq-0002In-PF
 for linux-mtd@lists.infradead.org; Tue, 03 Nov 2015 20:59:23 +0000
Received: by wicll6 with SMTP id ll6so19793219wic.1
 for <linux-mtd@lists.infradead.org>; Tue, 03 Nov 2015 12:59:01 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20151103212546.0184eaf6@bbrezillon>
References: <5638E074.5070800@ge.com>
 <CAAEAJfAjs0k26QumQdDzHeMGAM2s=xJw4E8N+yhs5GMCFkK=Aw@mail.gmail.com>
 <20151103212546.0184eaf6@bbrezillon>
Date: Tue, 3 Nov 2015 17:59:01 -0300
Message-ID: <CAAEAJfD3_TW4C6p7XU4bWrWxrhg4YRf-YK2QZu_vT3d7uwS4mw@mail.gmail.com>
Subject: Re: nand_flash_detect_onfi error
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Renaud Barbier <renaud.barbier@ge.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 3 November 2015 at 17:25, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
[..]
>
> Hm, sorry but I don't like this idea. ->cmdfunc() is not supposed to
> retrieve any data before ->read_xxx() is called. I know some
> controllers retrieve data ahead of time and then provide the previously
> stored data when ->read_buf() is called, but that's not a good practice
> to assume it will work this way on all controllers (actually I keep
> thinking the sane implementations are those waiting for the
> ->read_buf() call before starting retrieving the data from the NAND
> chip).
>

Right. We've discussed this in the past, and although I don't recall
the details,
I recall you were right.

In any case, I just wanted to mention that if Renaud is getting
a read beyond the buffer, then probably the driver needs fixing.

--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
