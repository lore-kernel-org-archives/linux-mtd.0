Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TLzyx-0001vt-Hy
 for linux-mtd@lists.infradead.org; Wed, 10 Oct 2012 17:22:08 +0000
Received: by mail-we0-f177.google.com with SMTP id u50so480428wey.36
 for <linux-mtd@lists.infradead.org>; Wed, 10 Oct 2012 10:22:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <ec169eb041e87e66c06108e85ea4a67e5797cecc.1349778821.git.vipin.kumar@st.com>
References: <cover.1349778820.git.vipin.kumar@st.com>
 <ec169eb041e87e66c06108e85ea4a67e5797cecc.1349778821.git.vipin.kumar@st.com>
Date: Wed, 10 Oct 2012 19:22:04 +0200
Message-ID: <CACRpkdaot3DKCoJOBpUcJFVrJ89xRx2T58fDe4YKY_r4NFqEag@mail.gmail.com>
Subject: Re: [PATCH 09/11] fsmc/nand:FIX: replace change_bit routine
From: Linus Walleij <linus.walleij@linaro.org>
To: Vipin Kumar <vipin.kumar@st.com>,
 Russell King - ARM Linux <linux@arm.linux.org.uk>,
 Nicolas Pitre <nico@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1
Cc: plagnioj@jcrosoft.com, spear-devel@list.st.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 9, 2012 at 12:44 PM, Vipin Kumar <vipin.kumar@st.com> wrote:

> change_bit routine accepts only ulong pointers as buffer, so an unaligned char
> pointer passed to change_bit may lead to a crash.
>
> Fix this bug by accessing the buffer as char pointer.

Why not see if we can fix change_bit() instead?
Since I suspect this is on ARM I bet Russell and Nico
want to hear about this if there is a problem.

Can the ARM change_bit() not be fixed, so that
long arguments are the only option?

>                 if (err_idx[i] < chip->ecc.size * 8) {
> -                       change_bit(err_idx[i], (unsigned long *)dat);
> +                       uint8_t *p = dat + err_idx[i] / 8;
> +                       *p = *p ^ (1 << (err_idx[i] % 8));

I'm one of these people who would write >>3 and
&7 rather than /8 or %8 but I guess we are all
different. Atleast consider it if you stick with this...

Yours,
Linus Walleij
