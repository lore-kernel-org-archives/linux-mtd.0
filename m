Date: Tue, 7 Jun 2016 15:29:30 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kernel@vger.kernel.org, Stas Sergeev <stsp@list.ru>, Matt Redfearn
 <matt.redfearn@imgtec.com>, Joshua Kinard <kumba@gentoo.org>, Jiri Slaby
 <jslaby@suse.com>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-pci@vger.kernel.org, Borislav Petkov <bp@suse.de>,
 dri-devel@lists.freedesktop.org, Markos Chandras
 <markos.chandras@imgtec.com>, "Dmitry V. Levin" <ldv@altlinux.org>,
 yu-cheng yu <yu-cheng.yu@intel.com>, James Hogan <james.hogan@imgtec.com>,
 Brian Gerst <brgerst@gmail.com>, Johannes Berg <johannes@sipsolutions.net>,
 Peter Zijlstra <peterz@infradead.org>, Al Viro <viro@zeniv.linux.org.uk>,
 Will Drewry <wad@chromium.org>, Nikolay Martynov <mar.kolya@gmail.com>,
 Huacai Chen <chenhc@lemote.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Daniel Borkmann
 <daniel@iogearbox.net>, Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>,
 =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, James Cowgill
 <James.Cowgill@imgtec.com>, linux-serial@vger.kernel.org, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Ralf Baechle
 <ralf@linux-mips.org>, Alex Smith <alex.smith@imgtec.com>,
 linux-media@vger.kernel.org, Adam Buchbinder <adam.buchbinder@gmail.com>,
 QCA ath9k Development <ath9k-devel@qca.qualcomm.com>, Qais Yousef
 <qais.yousef@imgtec.com>, Jiang Liu <jiang.liu@linux.intel.com>, Mikko
 Rapeli <mikko.rapeli@iki.fi>, Paul Gortmaker
 <paul.gortmaker@windriver.com>, Denys Vlasenko <dvlasenk@redhat.com>,
 linaro-mm-sig@lists.linaro.org, Brian Norris <computersforpeace@gmail.com>,
 Hidehiro Kawai <hidehiro.kawai.ez@hitachi.com>, ath10k@lists.infradead.org,
 linux-mips@linux-mips.org, "Luis R. Rodriguez" <mcgrof@do-not-panic.com>,
 Andy Lutomirski <luto@amacapital.net>, Ingo Molnar <mingo@redhat.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, "Kirill A. Shutemov"
 <kirill.shutemov@linux.intel.com>, Roland McGrath <roland@hack.frob.com>,
 Paul Burton <paul.burton@imgtec.com>, Kalle Valo <kvalo@qca.qualcomm.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Tony Wu <tung7970@gmail.com>,
 Huaitong Han <huaitong.han@intel.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, Alexei Starovoitov <ast@kernel.org>, Juergen
 Gross <jgross@suse.com>, Kees Cook <keescook@chromium.org>,
 linux-wireless@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>,
 "David S. Miller" <davem@davemloft.net>, Oleg Nesterov <oleg@redhat.com>,
 Andrea Gelmini <andrea.gelmini@gelma.net>, ath9k-devel@venema.h4ckr.net,
 David Woodhouse <dwmw2@infradead.org>, netdev@vger.kernel.org,
 linux-mtd@lists.infradead.org, Marc Zyngier <marc.zyngier@arm.com>, Rabin
 Vincent <rabin@rab.in>, "Maciej W. Rozycki" <macro@imgtec.com>, David Daney
 <david.daney@cavium.com>
Subject: Re: [PATCH] tree-wide: replace config_enabled() with IS_ENABLED()
Message-Id: <20160607152930.71273719bdaea322814213d0@linux-foundation.org>
In-Reply-To: <1465215656-20569-1-git-send-email-yamada.masahiro@socionext.com>
References: <1465215656-20569-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon,  6 Jun 2016 21:20:56 +0900 Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> The use of config_enabled() against config options is ambiguous.
> In practical terms, config_enabled() is equivalent to IS_BUILTIN(),
> but the author might have used it for the meaning of IS_ENABLED().
> Using IS_ENABLED(), IS_BUILTIN(), IS_MODULE() etc. makes the
> intention clearer.
> 
> This commit replaces config_enabled() with IS_ENABLED() where
> possible.  This commit is only touching bool config options.
> 
> I noticed two cases where config_enabled() is used against a tristate
> option:
> 
>  - config_enabled(CONFIG_HWMON)
>   [ drivers/net/wireless/ath/ath10k/thermal.c ]
> 
>  - config_enabled(CONFIG_BACKLIGHT_CLASS_DEVICE)
>   [ drivers/gpu/drm/gma500/opregion.c ]
> 
> I did not touch them because they should be converted to IS_BUILTIN()
> in order to keep the logic, but I was not sure it was the authors'
> intention.

Well, we do want to be able to remove config_enabled() altogether if
we're going to do this.  So please later send along a patch which makes
a best-effort fix of the unclear usages and let's zap the thing.

If those fixes weren't quite correct then there will be a build error
(drivers/net/wireless/ath/ath10k/thermal.c) or no change in behaviour
(drivers/gpu/drm/gma500/opregion.c).
