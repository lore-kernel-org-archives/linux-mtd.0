Received: from mail-ob0-x229.google.com ([2607:f8b0:4003:c01::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZONMD-0002DP-RO
 for linux-mtd@lists.infradead.org; Sun, 09 Aug 2015 09:57:34 +0000
Received: by obbop1 with SMTP id op1so106150338obb.2
 for <linux-mtd@lists.infradead.org>; Sun, 09 Aug 2015 02:57:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <27E62D98F903554192E3C13AFCC91C3C2FB64704@hbmail01.hb.imgtec.org>
References: <27E62D98F903554192E3C13AFCC91C3C2FB64704@hbmail01.hb.imgtec.org>
Date: Sun, 9 Aug 2015 11:57:08 +0200
Message-ID: <CAFLxGvyi-Dgu60adwNqp6fwzMQw_WMVGKdSCN4mU1-OCHFT4XQ@mail.gmail.com>
Subject: Re: quick help - Linux MTD NAND subsystem
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Naidu Tellapati <Naidu.Tellapati@imgtec.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Aug 9, 2015 at 11:26 AM, Naidu Tellapati
<Naidu.Tellapati@imgtec.com> wrote:
> 4. Since UBIFS does not make use of OOB area for storing file system specific information, I think I can always use UBIFS with the above 3 ecclayout definitions.
>
> 5. If we can't support JFFS2 file system, is it acceptable to write a NAND Flash Controller Linux driver which works only with UBIFS and does not work with JFFS2.

The usage of the OOB area is one of the drawbacks of JFFS2 (and other
flash filesystems).
As modern controllers need more and more bytes for ECC the usable OOB
area shrinks and
at some point you cannot use JFFS2 anymore.
This is exactly why UBI does not use the OOB area.

If your ECC layout cannot offer enough OOB bytes for JFFS2 there is
not much we can do.
But it should be okay.
In case someone really needs JFFS2 on your NFC she can still use the
gluebi driver which emulates a MTD on top of UBI.

-- 
Thanks,
//richard
