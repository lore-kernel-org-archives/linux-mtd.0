Date: Mon, 30 Mar 2015 11:16:11 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v4 02/10] mtd: st_spi_fsm: Fetch boot device locations
 from DT match tables
Message-ID: <20150330181611.GC32500@ld-irv-0074>
References: <1421853868-8262-1-git-send-email-lee.jones@linaro.org>
 <1421853868-8262-3-git-send-email-lee.jones@linaro.org>
 <20150206042744.GK18140@ld-irv-0074> <20150210074634.GD8020@x1>
 <20150224050452.GG18140@ld-irv-0074> <20150224094110.GA20969@x1>
 <20150313160601.GI12966@brian-ubuntu> <20150316081306.GD3383@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150316081306.GD3383@x1>
Cc: devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@stlinux.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Mar 16, 2015 at 08:13:06AM +0000, Lee Jones wrote:
> So when you said "we have consistently agreed that we aren't going to
> work around that in Linux", who has agreed this.  Would you be kind
> enough to point me in the direction of that conversation please?

A few pointers from recent history:

http://lists.infradead.org/pipermail/linux-mtd/2014-September/055156.html

http://lists.infradead.org/pipermail/linux-mtd/2014-September/055559.html

If the question came up in other threads, though, I'm sure the answers
were the same.

BTW, there are sound solutions to this problem in Linux, and they are
supported where possible. Some flash support a separate set of opcodes
that always expect a 4-byte address. If we use these opcodes, we never
have to do any persistent mode-switching. We only found that Spansion
consistently supports these opcodes on all their flash, though.

See:

commit 87c9511fba2bd069a35e1312587a29e112fc0cd6
Author: Brian Norris <computersforpeace@gmail.com>
Date:   Thu Apr 11 01:34:57 2013 -0700

    mtd: m25p80: utilize dedicated 4-byte addressing commands

Brian
