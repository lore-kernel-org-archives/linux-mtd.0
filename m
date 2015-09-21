Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ze9LV-0005WN-Ms
 for linux-mtd@lists.infradead.org; Mon, 21 Sep 2015 22:14:05 +0000
Received: by padhy16 with SMTP id hy16so127961958pad.1
 for <linux-mtd@lists.infradead.org>; Mon, 21 Sep 2015 15:13:40 -0700 (PDT)
Date: Mon, 21 Sep 2015 15:13:38 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Alex Smith <alex.smith@imgtec.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Alex Smith <alex@alex-smith.me.uk>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v5 3/4] mtd: nand: jz4780: driver for NAND devices on
 JZ4780 SoCs
Message-ID: <20150921221338.GD31505@google.com>
References: <1441703453-2838-1-git-send-email-alex.smith@imgtec.com>
 <1441703453-2838-4-git-send-email-alex.smith@imgtec.com>
 <20150909142439.GA2371@laptop>
 <CAAEAJfDDGe23X==ODV+pwpobcLZreQtaJuMdkzaZsRS9TNFKPQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAEAJfDDGe23X==ODV+pwpobcLZreQtaJuMdkzaZsRS9TNFKPQ@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Sep 14, 2015 at 03:38:48PM -0300, Ezequiel Garcia wrote:
> On 9 September 2015 at 11:24, Ezequiel Garcia
> <ezequiel@vanguardiasur.com.ar> wrote:
> Whatever the outcome of the discussion on patch 1/4
> "mtd: nand: increase ready wait timeout and report timeouts"
> is, the jz4780-specific patches should remain unaffected to it.
> 
> In fact, I believe patch 1/4 shouldn't even be on the same series.
> So, maybe you can consider taking the rest (or not) independently
> of that patch?

Sure, I'll consider the fate of patch 1 separately from 2-4.
