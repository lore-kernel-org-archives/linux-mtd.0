Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gIVlR-0005LB-GE
 for linux-mtd@lists.infradead.org; Fri, 02 Nov 2018 09:29:15 +0000
Received: by mail-wr1-x443.google.com with SMTP id j26-v6so1282626wre.1
 for <linux-mtd@lists.infradead.org>; Fri, 02 Nov 2018 02:29:03 -0700 (PDT)
MIME-Version: 1.0
References: <20181101225603.17806-1-nkela@cisco.com>
 <c6b51706910048b8dd0732f8963a69867542e9a4.camel@infinera.com>
In-Reply-To: <c6b51706910048b8dd0732f8963a69867542e9a4.camel@infinera.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Fri, 2 Nov 2018 10:28:49 +0100
Message-ID: <CAFLxGvwy=ksb=GVg-D6cD40JQ1b7+RGjXH9vq8w4jB0N9rmK3Q@mail.gmail.com>
Subject: Re: [PATCH] Make JFFS2 endianness configurable
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: nkela@cisco.com, David Woodhouse <dwmw2@infradead.org>,
 xe-linux-external@cisco.com,
 "linux-mtd @ lists . infradead . org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, rod@whitby.id.au
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Nov 2, 2018 at 9:46 AM Joakim Tjernlund
<Joakim.Tjernlund@infinera.com> wrote:
>
> On Thu, 2018-11-01 at 15:56 -0700, Nikunj Kela wrote:
> > CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender and know the content is safe.
> >
> >
> > This patch allows the endianness of the JFSS2 filesystem to be
> > specified by config options.
> >
> > It defaults to native-endian (the previously hard-coded option).
> >
> > Some architectures benefit from having a single known endianness
> > of JFFS2 filesystem (for data, not executables) independent of the
> > endianness of the processor (ARM processors can be switched to either
> > endianness at run-time).
>
> I like this too. I have on several occasions needed to mount a JFFS2 BE on
> my PC. This saves me from having to hack the src.

The feature makes sense, but I don't like it being a Kconfig option.
As Al pointed out, it should be done like UFS does.

IOW, implement a wrapper function which selects the endianness automatically.
That way you can force it as mount option or detect during mount what
kind of JFFS2
you have.

-- 
Thanks,
//richard
