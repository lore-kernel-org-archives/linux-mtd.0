Subject: Re: [PATCHv3] mtd: cfi_cmdset_0002: Add reboot notifier for AMD
	flashes
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kevin Cernekee <cernekee@gmail.com>
In-Reply-To: <471a5dfa1495f2d33e41435e4d37852ad489b112@localhost.localdomain>
References: <1272519262.7750.66.camel@localhost>
	<471a5dfa1495f2d33e41435e4d37852ad489b112@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 05 May 2010 08:40:27 +0300
Message-ID: <1273038027.3702.52.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-04-29 at 10:26 -0700, Kevin Cernekee wrote:
> Ensure that the flash device is in a quiescent state before rebooting.
> The implementation is closely modeled after the cfi_cmdset_0001 reboot
> notifier, commit 963a6fb0a0d336d0513083b7e4b5c3ff9d6d2061 .
> 
> Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
> ---
>  drivers/mtd/chips/cfi_cmdset_0002.c |   56 +++++++++++++++++++++++++++++++++++
>  1 files changed, 56 insertions(+), 0 deletions(-)

Pushed to l2-mtd-2.6 / master, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
