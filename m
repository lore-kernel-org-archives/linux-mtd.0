Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gIYU6-0002fl-BN
 for linux-mtd@lists.infradead.org; Fri, 02 Nov 2018 12:23:32 +0000
From: Richard Weinberger <richard@nod.at>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Stefan Agner <stefan@agner.ch>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ubifs: auth: add CONFIG_KEYS dependency
Date: Fri, 02 Nov 2018 13:23:07 +0100
Message-ID: <1918197.Mj5OQZhev6@blindfold>
In-Reply-To: <20181102111129.276496-1-arnd@arndb.de>
References: <20181102111129.276496-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Freitag, 2. November 2018, 12:11:22 CET schrieb Arnd Bergmann:
> The new authentication support causes a build failure
> when CONFIG_KEYS is disabled, so add a dependency.
> 
> fs/ubifs/auth.c: In function 'ubifs_init_authentication':
> fs/ubifs/auth.c:249:16: error: implicit declaration of function 'request_key'; did you mean 'request_irq'? [-Werror=implicit-function-declaration]
>   keyring_key = request_key(&key_type_logon, c->auth_key_name, NULL);
> 
> Fixes: d8a22773a12c ("ubifs: Enable authentication support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied!

Thanks,
//richard
