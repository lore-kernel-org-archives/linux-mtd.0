Received: from mail-wg0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TK7Lo-0002om-Qx
 for linux-mtd@lists.infradead.org; Fri, 05 Oct 2012 12:50:01 +0000
Received: by mail-wg0-f49.google.com with SMTP id gg4so954545wgb.18
 for <linux-mtd@lists.infradead.org>; Fri, 05 Oct 2012 05:49:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1349356456-13371-1-git-send-email-plagnioj@jcrosoft.com>
References: <1349356456-13371-1-git-send-email-plagnioj@jcrosoft.com>
Date: Fri, 5 Oct 2012 14:49:44 +0200
Message-ID: <CACRpkdb10dfKR-sAvbUar+ZsC16uLofhBXuMxfL7QtXLhNg1+Q@mail.gmail.com>
Subject: Re: [PATCH 1/1] mtd: st fsmc_nand: pass the ale and cmd resource via
 resource
From: Linus Walleij <linus.walleij@linaro.org>
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Vipin Kumar <vipin.kumar@st.com>, devicetree-discuss@lists.ozlabs.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 4, 2012 at 3:14 PM, Jean-Christophe PLAGNIOL-VILLARD
<plagnioj@jcrosoft.com> wrote:

> Do not use the platform_data to pass resource and be smart in the drivers.
> Just pass it via resource
>
> Switch to devm_request_and_ioremap at the sametime
>
> Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Vipin Kumar <vipin.kumar@st.com>
> Cc: linux-mtd@lists.infradead.org

This is much better. Actually I was confused by these offsets recently...
Acked-by: Linus Walleij <linus.walleij@linaro.org>

My patch to convert the Nomadik to the FSMC driver will collide with this,
but I can sure fix it up as we run into it, no big deal.

Yours,
Linus Walleij
