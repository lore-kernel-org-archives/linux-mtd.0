Return-Path: <SRS0=69qN=CA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39FB1C433DF
	for <linux-mtd@archiver.kernel.org>; Sat, 22 Aug 2020 16:07:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0732820738
	for <linux-mtd@archiver.kernel.org>; Sat, 22 Aug 2020 16:07:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jMKsdi7x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0732820738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QvTGCp1vms9Meh29kRrlAU6GEjJDug5/8XfBWbAALhs=; b=jMKsdi7x5KAdZNFzwdzdFs19a
	5/6UBke1YvA/4C1q6DBcI/I+azPg9XC0pbHqssAjfX+5AlXxHVD5jy1kZI7ZX/xLpn8Uss8OaPA81
	wmZsM1474S8nFdmbSefZ2B2tMWhna6IV1TQJUFXHs1ze4CS+/RdNdvDSTQcMiEmqvt448ZwO9wA7Q
	3GrGe9tIMbyjbcblodc0yCMFP6oiYpI/l+9i+Y7HPHfedDHaR7Gx8irxkfgZnZVoOe+7QgsZNatEQ
	mrsGYsLSHtpidRHMATXQwmt8xS5C3KoF2CtSC6tasQmrLHRPItYoufeser4fqCNoFfmfLMTs8xi94
	bSUgfgPyw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k9W2I-0004CM-2h; Sat, 22 Aug 2020 16:06:30 +0000
Received: from mout.kundenserver.de ([212.227.126.131])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k9W2D-0004C0-Ig
 for linux-mtd@lists.infradead.org; Sat, 22 Aug 2020 16:06:26 +0000
Received: from mail-qt1-f172.google.com ([209.85.160.172]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1Mtf39-1kUloA10Bj-00v7iK for <linux-mtd@lists.infradead.org>; Sat, 22 Aug
 2020 18:06:21 +0200
Received: by mail-qt1-f172.google.com with SMTP id c12so3369444qtn.9
 for <linux-mtd@lists.infradead.org>; Sat, 22 Aug 2020 09:06:20 -0700 (PDT)
X-Gm-Message-State: AOAM5323iqyw7le5PuuXTd2TaiGtvFzWMBcQK9sWyZmUDNd2s0RgAMxE
 7wF2ugi1zYgd9ceHo+hAfv5IclKkfmv8T3lIG7I=
X-Google-Smtp-Source: ABdhPJyT8gBR8BmSvwz3zbJQjyfrlaM4r+sD3eEJ8Qx0Q3v3p8Rs4wmxx+2+wI2GzZkYD/jeoJkbSpCTJl77bkV2YH8=
X-Received: by 2002:ac8:688e:: with SMTP id m14mr7377100qtq.7.1598112379995;
 Sat, 22 Aug 2020 09:06:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a27bTYyn3N+tX=i_6f4KrQkOmkUA1zUQfvCW7qw6smSkQ@mail.gmail.com>
 <CAFmMkTF9eVm0tpOKEy2rzdX=Scr3RwqHDFy_i24R3F5ok-4=eA@mail.gmail.com>
 <CAK8P3a3mf8_Y4DWe3WuBO-Xo0N4Jj=-rrtFzD6w0TriGZPu1_g@mail.gmail.com>
 <CAFmMkTFzmC=aY0gR6urLu-8Oq8aeHBUWi-TodG8XhXKCcC057A@mail.gmail.com>
 <CAK8P3a13N_wNORz_3cYHTN8t29pPrY+dJ+g+1Ga_MmG1TmrUQw@mail.gmail.com>
 <CAFmMkTGm3pMsBzEenYOsRbhOZKFhbHiZ5LxPyVmTdYTTRpKzVQ@mail.gmail.com>
 <CAK8P3a2_RV33kiJ0c34aopZ4iG7LYBR-u=-+BbC+Upyjh1T0Eg@mail.gmail.com>
 <CAFmMkTHqQO1Gj7VeXr4Y_Umb1KzZc2Pf=1pDQvPPpb_XeAFPqQ@mail.gmail.com>
 <20200819065721.GA1375436@lahna.fi.intel.com>
 <CAK8P3a0Bq-ucgC4Xue+B_HV97pTX8YRr4hYh1gfrfGBV_H1EUQ@mail.gmail.com>
 <20200819091123.GE1375436@lahna.fi.intel.com>
In-Reply-To: <20200819091123.GE1375436@lahna.fi.intel.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 22 Aug 2020 18:06:03 +0200
X-Gmail-Original-Message-ID: <CAK8P3a19MLfQARXEWzCD-ySq4t9nsyryB+con33HsQ193+muMw@mail.gmail.com>
Message-ID: <CAK8P3a19MLfQARXEWzCD-ySq4t9nsyryB+con33HsQ193+muMw@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: intel-spi: Do not try to make the SPI flash
 chip writable
To: Mika Westerberg <mika.westerberg@linux.intel.com>
X-Provags-ID: V03:K1:xAFGqewJmgmKsR+bUZPZbdfO5c3rMfLI7Okv7JsRsmuBqceErGK
 i3v9fqivKw+n/xSrIuil6qvMDGSFL+oUZgWUm8yiZP7HrJYScpjvaBbri9gUgeXq9Iwxv2v
 zJYuK1E8bu49qewQZW4ClOnCfT8gdWOxB2cLIaH7HYZKvpMK22LFbIpRZy0NCM0QZYI1Xla
 78RLhL/v5y/aRWXfIvk4w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:T6OCXjCFlV0=:vj8XF9Tr7JllVz6rvvziXb
 /HxLRALFlO9qcOA2St2Wq0e16fc7y5fkZKnWQllsYNiM7zGBZj6qD9Ai1yttux8mNtNTSHrfw
 yOTBL6DrT03TGLnzV4QLxIsfUjQpBr42jtnM45mT0Ve7SqLIhX6ef2ANQRTjAU5EEVl1FiUeY
 uZ9gTDTyDIXIi61vLrht3qpFnerHsalT2ylwv0v6rQZFAQNR9PArkq4AgC63b3AeNEg6T3x8l
 Zjqg1RYVEqBpMphWAjrV8nJ+WzjjdT8ogk7cVR+UDMd74gvzn2sQyd6VbgF4YQ2MJVeCUIgEm
 oVXSXnthyXjg0NNawXqOFvwteJnpES4EghdUkx6XPMlx6LH/5lqByYPBn36Orew+WK9RItZFK
 pEtMcfUnaW2giN1a5wNxTOVP09sLNUhqi8RbiJ6N7Xia4UmPM3j0HUyn8Zf9ivse0yOTDXWJg
 vZSW6wXmTFyudD/DFzRjsyCljrPcu8KV/qjG7wBpCpwJLrMdD6I2d5XTOjDkvaGnIvLidmx7O
 Fky6Z6pSHL+c+uXjqNWDw8JabLb28eXvfu50ooclZKWLOrftbHTQW9NIqWZ3P7M+1ZEXuByE4
 R11IsjJQhlKnBrsMPXUxW+XoQWnxY3E/sFIrEIJf+lLUvg3yJJl9KYvh+9Mvq+DqkZKQfiQs1
 AMQAWTvSKhely14gyJmOtMG5fJDXyxeWcl46EaApk0bry3SP8WeL2xGKPIcHZAif/nBoD8CHf
 k6S5+srgVh3twjHrFPCY0Y6U4m6lmuB2R4XNGNI1QxyphOjaWOdGYWLiBB3egozqm9wbV4qwc
 VSEHr2Yc+x4FbFjz3QNfKFiuKTAOwmJ5sRwm5OqoZgIR5JocWc8Pz38VJVSmzGGAgJxlEFS
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200822_120625_839795_0381A4A7 
X-CRM114-Status: GOOD (  23.38  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Hughes <hughsient@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Daniel Gutson <daniel@eclypsium.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Alex Bazhaniuk <alex@eclypsium.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Aug 19, 2020 at 11:11 AM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Wed, Aug 19, 2020 at 10:38:24AM +0200, Arnd Bergmann wrote:
> > On Wed, Aug 19, 2020 at 8:57 AM Mika Westerberg <mika.westerberg@linux.intel.com> wrote:
>
> > > Actually thinking about this bit more, to make PCI and the platform
> > > parts consistent we can make the "writeable" control this for the PCI
> > > part as well. So what if we add a callback to struct intel_spi_boardinfo
> > > that the PCI driver populates and then the "core" driver uses to enable
> > > writing when "writeable" is set to 1.
> >
> > If you are really worried about the write protection being bypassed by
> > a different driver or code injection, the best way would seem to be to
> > only enable writing in the mtd write callback and disable it immediately
> > after the write is complete. I still don't see why this hardware would
> > be more susceptible to this kind of attack than other drivers though,
> > as it already has the safeguard against writing through the MTD layer
> > without the module parameter.
>
> Hmm, is there already a mechanism at the MTD level to prevent writes? If
> that's the case then sure we can use that instead.

The mtd core just checks both the permissions on the device node (which
default to 0600 without any special udev rules) and the MTD_WRITEABLE
on the underlying device that is controlled by the module parameter
in case of intel-spi{,-platform,-pci}.c.

     Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
