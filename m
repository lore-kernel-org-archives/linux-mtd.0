Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SPd6q-0002Ol-IS
 for linux-mtd@lists.infradead.org; Wed, 02 May 2012 17:13:01 +0000
Received: by bkwj4 with SMTP id j4so862056bkw.36
 for <linux-mtd@lists.infradead.org>; Wed, 02 May 2012 10:12:57 -0700 (PDT)
MIME-Version: 1.0
Sender: vapier.adi@gmail.com
In-Reply-To: <1335903148-29539-1-git-send-email-shawn7400@gmail.com>
References: <1335903148-29539-1-git-send-email-shawn7400@gmail.com>
From: Mike Frysinger <vapier@gentoo.org>
Date: Wed, 2 May 2012 13:12:37 -0400
Message-ID: <CAMjpGUf-UiH=nDD9YaMeqk_a5xB9KthExU45KVhgWE8TjO1==g@mail.gmail.com>
Subject: Re: [PATCH] Change linking order of SPI and MTD.
To: "Shawn J. Goff" <shawn7400@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 1, 2012 at 4:12 PM, Shawn J. Goff wrote:
> Currently, UBI initializes before SPI. This is a problem
> if you intend to boot to a UBI volume on an SPI device. =C2=A0UBI will
> fail to initialize with the following message:

this is why many SPI bus masters use subsys_initcall() now

> The initialization order is determined by the order the modules are
> linked into the kernel, so the fix was to change this order. UBI is
> under the MTD tree, so SPI is now linked in before MTD.

NAK: linking order is arbitrary and always has been
-mike
