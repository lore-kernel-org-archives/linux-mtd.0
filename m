Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TLznn-00008y-GC
 for linux-mtd@lists.infradead.org; Wed, 10 Oct 2012 17:10:36 +0000
Received: by mail-we0-f177.google.com with SMTP id u50so472852wey.36
 for <linux-mtd@lists.infradead.org>; Wed, 10 Oct 2012 10:10:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <3dcb002d0ad03dde9a91e8128dbaa320b8a264a9.1349778821.git.vipin.kumar@st.com>
References: <cover.1349778820.git.vipin.kumar@st.com>
 <3dcb002d0ad03dde9a91e8128dbaa320b8a264a9.1349778821.git.vipin.kumar@st.com>
Date: Wed, 10 Oct 2012 19:10:33 +0200
Message-ID: <CACRpkdYj2o77fLWM8vwpCSSuQkJAwOx5gNhCQd+yZ8SJ4M328Q@mail.gmail.com>
Subject: Re: [PATCH 06/11] fsmc/nand: Modify the wait to uninterruptible
From: Linus Walleij <linus.walleij@linaro.org>
To: Vipin Kumar <vipin.kumar@st.com>
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

> Interruptible wait caused trouble in fsmc hardware state machine if the
> application was killed abruptly. To make fsmc operation safe turn wait in to
> un-interruptible.
>
> Signed-off-by: Vipin Kumar <vipin.kumar@st.com>

Yes this is wise.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
