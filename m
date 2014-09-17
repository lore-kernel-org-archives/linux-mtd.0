Received: from mail-qg0-f49.google.com ([209.85.192.49])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XUMfn-0003pk-PJ
 for linux-mtd@lists.infradead.org; Wed, 17 Sep 2014 21:22:00 +0000
Received: by mail-qg0-f49.google.com with SMTP id j5so2756323qga.8
 for <linux-mtd@lists.infradead.org>; Wed, 17 Sep 2014 14:21:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1807144344.40128259.1410985683342.JavaMail.zimbra@redhat.com>
References: <371358190.34795877.1410204429882.JavaMail.zimbra@redhat.com>
 <1444809468.34812041.1410206680931.JavaMail.zimbra@redhat.com>
 <20140909170231.GA14429@logfs.org>
 <1807144344.40128259.1410985683342.JavaMail.zimbra@redhat.com>
Date: Wed, 17 Sep 2014 22:21:37 +0100
Message-ID: <CAAEAJfDAG8KrPKqVC5NujGnbSyxmrAtFcLvhScYsNm8RT59Gnw@mail.gmail.com>
Subject: Re: [PATCH V2] mtd: block2mtd: Present block2mtd timely on boot time
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Rodrigo Freire <rfreire@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Felix Fietkau <nbd@openwrt.org>,
 =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@logfs.org>,
 Herton Krzesinski <hkrzesin@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 17 September 2014 21:28, Rodrigo Freire <rfreire@redhat.com> wrote:
>
> mtd: block2mtd: Ensure that block2mtd is presented in a timely fashion
>

Using block2mtd sounds a bit unusual. I see that you are trying to get
a more robust fs.... have you tried using f2fs instead of jffs2?

> Currently, a block MTD device is not presented to the system on time, in
> order to start mounting the filesystems. This patch ensures that block2mt=
d
> is presented at the right time, so filesystems can be mounted on boot tim=
e.

It worries me a bit to add such a long delay to the boot. If for some
reason the SD is not working, then the kernel will wait (by default) 3
seconds now?
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
