Received: from mail-oa0-x22f.google.com ([2607:f8b0:4003:c02::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VTFbE-0005XS-Dq
 for linux-mtd@lists.infradead.org; Mon, 07 Oct 2013 18:32:09 +0000
Received: by mail-oa0-f47.google.com with SMTP id i1so6487673oag.20
 for <linux-mtd@lists.infradead.org>; Mon, 07 Oct 2013 11:31:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1380534024-25052-1-git-send-email-sachin.kamat@linaro.org>
References: <1380534024-25052-1-git-send-email-sachin.kamat@linaro.org>
Date: Mon, 7 Oct 2013 11:31:46 -0700
Message-ID: <CAN8TOE-gWr=GnjovNPx0ewcZjVckVUCMPpnMSPPE4Gyc0_uWoQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] mtd: nand: lpc32xx_mlc: Remove redundant of_match_ptr
From: Brian Norris <computersforpeace@gmail.com>
To: Sachin Kamat <sachin.kamat@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Sep 30, 2013 at 2:40 AM, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> The data structure of_match_ptr() protects is always compiled in.
> Hence of_match_ptr() is not needed.
>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>


Pushed all 3 to l2-mtd.git. Thanks!

Brian
