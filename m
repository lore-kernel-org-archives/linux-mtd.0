Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S5IVZ-0004uY-MX
 for linux-mtd@lists.infradead.org; Wed, 07 Mar 2012 15:10:36 +0000
Received: by iaky10 with SMTP id y10so10445663iak.36
 for <linux-mtd@lists.infradead.org>; Wed, 07 Mar 2012 07:10:26 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <279c36d7ca1b849e2622fac18467ed70fb1970e9.1331119143.git.vipin.kumar@st.com>
References: <cover.1331119143.git.vipin.kumar@st.com>
 <279c36d7ca1b849e2622fac18467ed70fb1970e9.1331119143.git.vipin.kumar@st.com>
Date: Wed, 7 Mar 2012 16:10:26 +0100
Message-ID: <CACRpkdYbTDi7Vzo_cErExKuu0dkssFr=EDbcjdEW+H_8s=Lgfg@mail.gmail.com>
Subject: Re: [PATCH 01/18] nand/fsmc: Newly erased page read algorithm
 implemented
From: Linus Walleij <linus.walleij@linaro.org>
To: Vipin Kumar <vipin.kumar@st.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Artem.Bityutskiy@nokia.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 7, 2012 at 12:30 PM, Vipin Kumar <vipin.kumar@st.com> wrote:

> A newly erased page contains ff in data as well as spare area. While reading an
> erased page, the read out ecc from spare area does not match the ecc generated
> by fsmc ecc hardware accelerator. This is because ecc of data ff ff is not ff
> ff. This leads to errors when file system erases and reads back the pages to
> ensure consistency.
>
> This patch adds a software workaround to ensure that the ecc check is not
> performed for erased pages. This problem is solved by checking the number of
> bits (in 512 byte data + 13 byte ecc) which are 0. If these number of bits are
> less than 8, the page is considered erased and correction algorithm is not tried
> on that page
>
> Signed-off-by: Vipin Kumar <vipin.kumar@st.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Thanks,
Linus Walleij
