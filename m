Received: from mail-ig0-x22d.google.com ([2607:f8b0:4001:c05::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WmrsI-0005kH-PU
 for linux-mtd@lists.infradead.org; Tue, 20 May 2014 21:47:07 +0000
Received: by mail-ig0-f173.google.com with SMTP id hn18so5437995igb.12
 for <linux-mtd@lists.infradead.org>; Tue, 20 May 2014 14:46:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20140520213426.GA12318@arch.cereza>
References: <1400597820-6589-1-git-send-email-helmut.schaa@googlemail.com>
 <20140520213426.GA12318@arch.cereza>
Date: Tue, 20 May 2014 23:46:45 +0200
Message-ID: <CAGXE3d-daAS0SPuEY5DZzNwRs1GiRx6z0D_sdVy-09X_ZSvR3A@mail.gmail.com>
Subject: Re: [PATCH] mtd-utils: Fix incompatibility with kernel UBI block
 ioctls
From: Helmut Schaa <helmut.schaa@googlemail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Content-Type: text/plain; charset=UTF-8
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 20, 2014 at 11:34 PM, Ezequiel Garcia
<ezequiel.garcia@free-electrons.com> wrote:
> Hi Helmut,
>
> On 20 May 04:57 PM, Helmut Schaa wrote:
>> The kernel UBI block ioctl definition is out of sync with the one
>> in mtd-utils resulting in ubiblock being unusable on current kernels.
>>
>
> Which version are you taking as "current". The ioctl parameter is actually
> an improvement over the first parameter-less implementation, so this patch
> makes no sense.
>
> Take a look at:
>
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=463c5eedb4a13b9aa91f05498a0f2c20bd03f8c4
>
> Maybe you have some old kernel or maybe you've backported this feature and you
> are using some internal version?

Ouch, I was indeed on a different (older) tree :/

Sorry for the noise. Please drop this patch.

Thanks,
Helmut
