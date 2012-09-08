Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TA99T-0002G3-Iv
 for linux-mtd@lists.infradead.org; Sat, 08 Sep 2012 00:44:01 +0000
Received: by lagu2 with SMTP id u2so83514lag.36
 for <linux-mtd@lists.infradead.org>; Fri, 07 Sep 2012 17:43:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <3E54258959B69E4282D79E01AB1F32B7041B73E9@DFLE12.ent.ti.com>
References: <1346350624-27291-1-git-send-email-m-karicheri2@ti.com>
 <20120907212853.20289.86031@nucleus>
 <3E54258959B69E4282D79E01AB1F32B7041B73E9@DFLE12.ent.ti.com>
Date: Fri, 7 Sep 2012 17:43:55 -0700
Message-ID: <CAN8TOE8tpyPK2V4=YQWP7bK7e5AqFDE27EBpKhn0hj-u6r3HAA@mail.gmail.com>
Subject: Re: [PATCH] mtd:nand:clk: preparation for switch to common clock
 framework
From: Brian Norris <computersforpeace@gmail.com>
To: "Karicheri, Muralidharan" <m-karicheri2@ti.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Mike Turquette <mturquette@linaro.org>,
 "dbaryshkov@gmail.com" <dbaryshkov@gmail.com>,
 "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Sep 7, 2012 at 2:56 PM, Karicheri, Muralidharan
<m-karicheri2@ti.com> wrote:
> How do these patch get to upstream? Does this get merged through davinci maintainer or through individual subsystem maintainers?

I think this driver would be taken by David Woodhouse in his linux-mtd
repo. Usually Artem Bityutskiy gleans the mailing list of patches and
puts them in his l2-mtd-2.6 git repo to help David out. Give it some
time, and I'm sure they'll be taking it. We don't really have a
full-time maintainer!

Brian
