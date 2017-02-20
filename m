Date: Mon, 20 Feb 2017 21:59:34 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, linux-mtd@lists.infradead.org, Sascha Hauer
 <s.hauer@pengutronix.de>, Sergio Prado <sergio.prado@e-labworks.com>, Marc
 Gonzalez <marc_gonzalez@sigmadesigns.com>, Wenyou Yang
 <wenyou.yang@atmel.com>, Josh Wu <rainyfeeling@outlook.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@atmel.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH 0/3] mtd: nand: atmel: Add
 ->setup_data_interface() + PM ops
Message-ID: <20170220215934.53961d69@bbrezillon>
In-Reply-To: <1487611322-12688-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1487611322-12688-1-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
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

On Mon, 20 Feb 2017 18:21:59 +0100
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> Hello,
> 
> Sorry for the noise, but I forgot to remove old patches before using
> git send-email on the directory containing the patches generated with
> git format-patch :-/.

And ignore this version as well. These are still not the patches I
wanted to send :-(.

> 
> This patch series is adding to important features to the new Atmel NAND
> controller driver:
> 1/ automatic SMC timings configuration based on information retrieved
>    during NAND detection
> 2/ proper ->suspend()/->resume(). Timings are properly restored when
>    resuming the system
> 
> This series depends on [1] and [2].
> 
> Regards,
> 
> Boris
> 
> [1]https://www.spinics.net/lists/arm-kernel/msg563780.html
> [2]https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1337235.html
> 
> Boris Brezillon (3):
>   memory: atmel-ebi: Change naming scheme
>   memory: atmel-ebi: Add missing ->numcs assignment
>   memory: atmel-ebi: Add PM ops
> 
>  drivers/memory/atmel-ebi.c | 141 ++++++++++++++++++++++++++-------------------
>  1 file changed, 81 insertions(+), 60 deletions(-)
> 
