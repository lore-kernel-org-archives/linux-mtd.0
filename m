Received: from mail-qa0-f42.google.com ([209.85.216.42])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SPaMR-0000Uk-Ge
 for linux-mtd@lists.infradead.org; Wed, 02 May 2012 14:16:56 +0000
Received: by qafi31 with SMTP id i31so2158026qaf.15
 for <linux-mtd@lists.infradead.org>; Wed, 02 May 2012 07:16:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAOMZO5AJn3QjwRga71+HXPr3on7xG-AQtCM58xqx-1J3fA=zuA@mail.gmail.com>
References: <1335903148-29539-1-git-send-email-shawn7400@gmail.com>
 <CAOMZO5AJn3QjwRga71+HXPr3on7xG-AQtCM58xqx-1J3fA=zuA@mail.gmail.com>
Date: Wed, 2 May 2012 10:16:53 -0400
Message-ID: <CAGiDA6LFxcr=UmT4r9uka5sz7k=S8zhCupp2HjS0t+ijQBe_1w@mail.gmail.com>
Subject: Re: [PATCH] Change linking order of SPI and MTD.
From: "Shawn J. Goff" <shawn7400@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Fabio Estevam <festevam@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 1, 2012 at 11:09 PM, Fabio Estevam <festevam@gmail.com> wrote:
> On Tue, May 1, 2012 at 5:12 PM, Shawn J. Goff <shawn7400@gmail.com> wrote=
:
>> From: "Shawn J. Goff" <shawn7400@gmail.com>
>>
>> Currently, UBI initializes before SPI. This is a problem
>> if you intend to boot to a UBI volume on an SPI device. =A0UBI will
>> fail to initialize with the following message:
>>
>> UBI error: ubi_init: UBI error: cannot initialize UBI, error -19
>>
>> The initialization order is determined by the order the modules are
>> linked into the kernel, so the fix was to change this order. UBI is
>> under the MTD tree, so SPI is now linked in before MTD.
>
> Could EPROBE_DEFER help in this case?

I hadn't known about EPROBE_DEFER until now. If it does help,
that's probably a better solution. I'll look into it, but it'll be
at least a few days before I'm able to spend time on it.
