Received: from mail-yk0-x22c.google.com ([2607:f8b0:4002:c07::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yy2If-0002o5-Tx
 for linux-mtd@lists.infradead.org; Thu, 28 May 2015 18:13:03 +0000
Received: by yken206 with SMTP id n206so15205421yke.2
 for <linux-mtd@lists.infradead.org>; Thu, 28 May 2015 11:12:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20150528013805.GN27753@ld-irv-0074>
References: <201505280926.aiYZUlC3%fengguang.wu@intel.com>
 <20150528013805.GN27753@ld-irv-0074>
Date: Thu, 28 May 2015 11:12:39 -0700
Message-ID: <CAN8TOE_R+n6ddLd8RpSNEZaCVSHHF7YE4hbPO5SkO45nx8+jBg@mail.gmail.com>
Subject: Re: [l2-mtd:master 47/48] jedec_probe.c:undefined reference to
 `cfi_build_cmd_addr'
From: Brian Norris <computersforpeace@gmail.com>
To: kbuild test robot <fengguang.wu@intel.com>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Denys Vlasenko <dvlasenk@redhat.com>, kbuild-all@01.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 27, 2015 at 6:38 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> I think this comes down to these two:
>
>> CONFIG_MTD_JEDECPROBE=y
>> CONFIG_MTD_CFI_UTIL=m
>
> I'll apply the following if nobody has objections:
>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Applied to l2-mtd.git, with a bit of context for a commit message.
