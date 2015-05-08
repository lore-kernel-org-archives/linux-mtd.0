Date: Fri, 8 May 2015 11:47:54 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] ARM: tegra: add "nor-jedec" flash compatible binding
Message-ID: <20150508184754.GA32500@ld-irv-0074>
References: <1431066098-19821-1-git-send-email-zajec5@gmail.com>
 <554CDD8C.7050000@wwwdotorg.org>
 <20150508184317.GZ32500@ld-irv-0074>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150508184317.GZ32500@ld-irv-0074>
Cc: Marek Vasut <marex@denx.de>, Alexandre Courbot <gnurou@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org,
 linux-sh@vger.kernel.org, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 linux-spi@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, May 08, 2015 at 11:43:17AM -0700, Brian Norris wrote:
> I'm open to change, as this binding is new in 4.1-rc1.

Though we'd need to make sure any change to "nor-jedec" gets applied to
the shmobile platforms that have started using this string in
linux-next.

Brian
