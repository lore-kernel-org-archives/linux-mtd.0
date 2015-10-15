Date: Thu, 15 Oct 2015 12:22:24 -0600
From: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, Liviu Dudau <Liviu.Dudau@arm.com>,
 Rafa?? Mi??ecki <zajec5@gmail.com>,
 Hauke Mehrtens <hauke@hauke-m.de>, jogo@openwrt.org,
 Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] mtd: document linux-specific partition parser DT binding
Message-ID: <20151015182224.GB17519@obsidianresearch.com>
References: <1444915191-28350-1-git-send-email-linus.walleij@linaro.org>
 <20151015162210.GA4545@localhost>
 <20151015170428.GA9250@obsidianresearch.com>
 <20151015174709.GB108923@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151015174709.GB108923@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 15, 2015 at 10:47:09AM -0700, Brian Norris wrote:
> Hmm, I don't know. I wouldn't expect people should really be using
> cmdlineparts as a production solution, but I'd consider it more of a
> debugging/development option -- if I want to override the DT (which is
> sometimes a bit harder to change) or the on-flash layout (e.g.,
> RedBoot), then I can fiddle with the command line.

We don't have cmdline overrides for very much (if any?) of DT.

The DT is supposed to describe the hardware/boot environment, if
overriding the partition layout is really common, then is the DT
binding really describing the hardware at all?

The partition layout is already very border line to support in DT, it
is really very close to a software configuration which is strongly
discouraged from DT files.

I justify it as the boot loader communicating the partition scheme it
understands to the OS, so the OS can have a hope of setting up the
flash in a way the bootloader understands.

I've never used the cmdline option, so maybe I don't see the use case,
but it seems like a really weird desire to change the partitioning
away from what the bootloader supports.

> Any better nominations for names?

bcrm-part-table-43 ?

Jason
