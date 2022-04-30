Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E23C433F5
	for <linux-mtd@archiver.kernel.org>; Sat, 30 Apr 2022 14:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DmObbftaCYcFuEoTcYDTHkGb4sNiDhorGtoqy32Mzdo=; b=Mvg9I5eZOBJjZb
	DtoRlQZDijJtw1/EwB6VtcS81+BmrRy75yy+d9iPLYrmo0ObKFV9kLGDbNlDQ/AJPW5snMEmEcXxq
	uzWi6YgJWVRHeyFJlsD4ShEGAtqAAgQfN7NmnfhjFKbnlRo7cPg+KNw/vD2eoino4wdqFa2VGOxJw
	A1kScUxUPXgAfNg4n6C1hGLPbMzlVLVIog7+XDly9UWNqUgfiauEyrQqVw1q8mMbNiFN8B77xNJs9
	BG2Cup7U4b9wv2r1NXyOV5xlJG7hAtiEACyXv0sXXm16t8Y9bW8GIulmG8OdJLN78zOLLmgjUvAuZ
	FJ9M4MkeEuIz2LoOWtxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nko8D-00EV7X-3T; Sat, 30 Apr 2022 14:31:33 +0000
Received: from mout.kundenserver.de ([212.227.126.131])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nko86-00EV6O-HJ
 for linux-mtd@lists.infradead.org; Sat, 30 Apr 2022 14:31:31 +0000
Received: from mail-yb1-f172.google.com ([209.85.219.172]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MeToK-1oJ3162OTk-00aW7T for <linux-mtd@lists.infradead.org>; Sat, 30 Apr
 2022 16:31:24 +0200
Received: by mail-yb1-f172.google.com with SMTP id e12so19103225ybc.11
 for <linux-mtd@lists.infradead.org>; Sat, 30 Apr 2022 07:31:24 -0700 (PDT)
X-Gm-Message-State: AOAM531k/8kgc6Keu6f2V1BZiJzaQRPPKgzc/xllQ0FbGMv+JZJfhFQX
 uop90z6+3TuSqK/JlKeAQejp0be9hOMLjeVJTI4=
X-Google-Smtp-Source: ABdhPJyu1oLM1IRKTqR+eQdQ1rsYTJoLMnuBV/FFpB8y5vKEh5sII8e/hMlA25PDcp1w4A+thLzVKyWiU6hDO089+bw=
X-Received: by 2002:a0d:d804:0:b0:2f4:e47d:1c2c with SMTP id
 a4-20020a0dd804000000b002f4e47d1c2cmr4143200ywe.320.1651328616903; Sat, 30
 Apr 2022 07:23:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220419163810.2118169-1-arnd@kernel.org>
 <20220422170530.GA2338209@roeck-us.net>
 <CAK8P3a3V=qxUqYT3Yt=dpXVv58-Y+HVi952wO6D4LPN5NNphGA@mail.gmail.com>
 <8b36d3a4-ec85-2f9f-e4b7-734d8ddd3d8f@roeck-us.net>
 <CAK8P3a0R9cpEb1d2=e9KnGSbi_uRv48RWfCu_J4DDak_cGZSuw@mail.gmail.com>
 <20220422234150.GA3442771@roeck-us.net>
 <CAK8P3a3qZdEqnJ2nTOKwDMossngOgCpEvZq4cQMPQjSsUoU=6g@mail.gmail.com>
 <3b4046ed-fd75-13ea-fac3-06469172806c@roeck-us.net>
 <CAK8P3a1LzEG1vo+5nMrnL3TOMcbSKJ3u=StcfY8dajV2raUBjA@mail.gmail.com>
 <3df135a2-17f5-d6c6-b4a8-e1a60e254297@roeck-us.net>
 <CAK8P3a2EHMQPN4ny9sXXuReFG0jN0hyRV7h9v_AR_0pqpOU41w@mail.gmail.com>
 <CAK8P3a09+nFS3g1rgvTW9da3tMiAhHjkjZVs1QOJOj8TJ-9MDg@mail.gmail.com>
 <6f1b27fa-96d1-4be7-ac6a-762610314f2a@roeck-us.net>
 <8d6d453a-e6fc-439b-2f34-e60c22fc9e98@roeck-us.net>
 <CAK8P3a2Ekvis1YcrJZtuga+XQdbeTC98PkOszCpS2DiZri7VMQ@mail.gmail.com>
 <149509dd-f43d-1b27-4395-81eab4ff3455@roeck-us.net>
 <CAK8P3a05vFdBnXXAMPVS82xX29+uinvWPcWxAgvj0TfoOk+1kg@mail.gmail.com>
 <b13783aa-9225-d52a-3800-c97ad772688b@roeck-us.net>
 <CAK8P3a3S5OjkKq_u5FpnwzYv+0+typya6Z4MzTez5ZH+do00xQ@mail.gmail.com>
In-Reply-To: <CAK8P3a3S5OjkKq_u5FpnwzYv+0+typya6Z4MzTez5ZH+do00xQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 30 Apr 2022 16:23:20 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3jiqf_zpBsZyvAb5ZtkwDa7KkqExqDAdpY_pYqkr_NgQ@mail.gmail.com>
Message-ID: <CAK8P3a3jiqf_zpBsZyvAb5ZtkwDa7KkqExqDAdpY_pYqkr_NgQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/48] ARM: PXA multiplatform support
To: Arnd Bergmann <arnd@arndb.de>
Cc: Guenter Roeck <linux@roeck-us.net>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Daniel Mack <daniel@zonque.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 Philipp Zabel <philipp.zabel@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>, 
 Paul Parsons <lost.distance@yahoo.com>, Sergey Lapin <slapin@ossfans.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>, 
 Helge Deller <deller@gmx.de>, Mark Brown <broonie@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 IDE-ML <linux-ide@vger.kernel.org>, 
 linux-clk <linux-clk@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 patches@opensource.cirrus.com, 
 linux-leds@vger.kernel.org, linux-mmc <linux-mmc@vger.kernel.org>, 
 linux-mtd <linux-mtd@lists.infradead.org>, linux-rtc@vger.kernel.org, 
 USB list <linux-usb@vger.kernel.org>, 
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 ALSA Development Mailing List <alsa-devel@alsa-project.org>
X-Provags-ID: V03:K1:V6cnRDNLnJRGElCV9K7IiVClM8h9EDkgYFPwY1Q++0YibheyKFs
 bQrT2eLvDjxEa8Wc2IYSELIUFPo2Uh7K1EaZm7e9M3dipARxNOD06d8NnBUtfyCXnVfkRFU
 LQtocXiXsOKODXhWrTzOUUdJSwdTHOUyLyGsHlCHm5vcxNRAnEe1kvGFCPLfQ1qdA3BDWv2
 9WP3JplVvU0y9Zda0TLrA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Vuq1zfu7z6U=:BQprOxFSyckpOUmCUGKNFY
 PN/cWNO5sI7etGMqreO2EdVWHZV0HE7Uu91OIE15IUVaJSNs6OaFyJmwngIGQsaYaw2SfwWwO
 Et7VtAcVpzk3JHfcBOLRjafHyz859g9tgDfwRVtFgjnYrFHqatHA+sjpu/xnCOyUnhYv2UJr1
 9CcEn5Jr8lOd92R3ga6gfUZbZSlJRH1/Zq/vxzWl6kDRNI2NO/MkW61mltecLW8LTDXPEsZMa
 mh6YlM4vIurXxBf9iv9G3mYMcacmvsiD6XKCJ8saIKEcSG8folttKGO1O8U1iN9yuvBxpy8Ux
 xr+n6PF7cGHezHbuXLVnrAk5OkMQf2IcNSaRder3G6/tvgm2I2X7ffr8lSD9B+CfZ+7pDLlZ4
 BvJfQz3b+d32LXQN1jyQq9Wbvwbs8NBLfgHSRsZOdV0cIaIEjUhFUcqawQ9Em41sBqGg0bx4g
 3tEm3BwUzB5jCBVvGzdt8IlV+pzF1HzQsQvUwPdhBqSblPlkinep4QlNwXk+Kj4i8Hicq8okw
 9Cv93oKzCRjau1TOT9yymOEOP+yNHOlsbdauwfKxDkWqQwLsh1/f9Uj+mDf9VsrATSGY/ViGF
 KRqjUE/55FhasC6TxhgUZyxAxAiH1Fs0XyacVtk3ZTLDkD5JQpv7KbCw4FIvVgjL4WolND0ND
 8S8tW3jt+GkUY01+dp2rtbYYGc/iLx+lsZR11hucPahr0tWvZYUYKSS6bL/1pI6hu4/i6bnPp
 RZzxAynOUqyvsZKQzBrHTpMBDw/UVwrIz+2Hb6lWpqXZ0vVTVLYwoUfMD1R47VQuknNtxY3iN
 QDqXtwqYQeY3rxoYGuS2fB7DjMX5H/53BMPTVTBppKz4PCflm0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220430_073126_895719_FAB148D7 
X-CRM114-Status: GOOD (  25.29  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, Apr 30, 2022 at 3:32 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Sat, Apr 30, 2022 at 2:41 PM Guenter Roeck <linux@roeck-us.net> wrote:
> > On 4/30/22 01:04, Arnd Bergmann wrote:
> > > and concluded that it must have done this for a long time. In my own qemu
> > > instance, I see a crash from iWMMXt, but that works fine on your machine.
> > > OTOH, your failed instances all look like they either time out or
> > > failed to find a
> > > rootfs. I tried passing an MMC device as root, and that works here.
> > >
> >
> > Booting from mmc works for me as well. Booting from pcmcia worked before,
> > so I assume that there must be some regression.
>
> Ok, got it, and managed to reproduce the hang now. My "ARM: pxa/sa1100: move
> I/O space to PCI_IOBASE" patch managed to get it to the point of detecting
> the pcmcia device instead of crashing, so I assumed it was enough when it
> clearly was not. Before that patch, it still works, afterwards it hangs with
> "pata_pcmcia: probe of 0.0 failed with error -12" as mentioned above. I'll
> have another look.

Got it: as the PCMCIA bus on this machine is the only thing with an I/O space,
I assigned it port number range 0-0x1000, with an io_offset of 0, but this
was apparently unexpected and triggered this sanity check:

static int static_find_io(struct pcmcia_socket *s, unsigned int attr,
                        unsigned int *base, unsigned int num,
                        unsigned int align, struct resource **parent)
{
      if (!s->io_offset)
              return -EINVAL;
      ...
      return 0;
}

I moved the devices around now, giving zeus/viper I/O space an offset of
zero, and moving PCMCIA to offset 0x10000 and 0x11000 for the two slots,
which now works because the io_offset is nonzero. I've regenerated the
branches again, and confirmed the for-next branch still boots from pcmcia.

        Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
