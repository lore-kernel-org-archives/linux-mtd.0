Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gSNQS-0000uN-H5
 for linux-mtd@lists.infradead.org; Thu, 29 Nov 2018 14:36:21 +0000
Received: by mail-io1-xd33.google.com with SMTP id n9so1728716ioh.7
 for <linux-mtd@lists.infradead.org>; Thu, 29 Nov 2018 06:36:09 -0800 (PST)
MIME-Version: 1.0
References: <20181113140133.17385-1-brgl@bgdev.pl>
 <20181113140133.17385-2-brgl@bgdev.pl>
 <CAMRc=MeRJ60gcYz00C828PBqnEdC-9onOKOadfackdzHiC1WOA@mail.gmail.com>
 <b8f08722-d3d5-6ddf-5845-15eb5079094c@linaro.org>
In-Reply-To: <b8f08722-d3d5-6ddf-5845-15eb5079094c@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 29 Nov 2018 15:35:58 +0100
Message-ID: <CAMRc=Md4PbYDhmBNx5Rk5F9OZw2Om3D6F21iV6za-+dq0NshYw@mail.gmail.com>
Subject: Re: [PATCH v2 01/25] nvmem: add new config option
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-i2c <linux-i2c@vger.kernel.org>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Kevin Hilman <khilman@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Sekhar Nori <nsekhar@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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

czw., 29 lis 2018 o 15:32 Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> napisa=C5=82(a):
>
>
> >
> > Hi Srinivas,
> >
> > if there are no objections - can you Ack this patch for Greg to pick
> > up into char-misc?
>
> Patch is fine for me. I normally send all the nvmem patches just before r=
c5.
>
> --srini
> >
> > Bart
> >

Boris, are you fine with Srinivas sending the MTD patch as well so
that they stay together?

Bart
