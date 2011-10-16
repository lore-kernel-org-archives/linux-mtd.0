Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RFPRL-0000fs-5T
	for linux-mtd@lists.infradead.org; Sun, 16 Oct 2011 12:03:40 +0000
Received: by wyg8 with SMTP id 8so682225wyg.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 16 Oct 2011 05:03:36 -0700 (PDT)
Subject: Re: [PATCH v2] mtd: provide an alias for the redboot module name
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Andres Salomon <dilinger@queued.net>
Date: Sun, 16 Oct 2011 15:03:13 +0300
In-Reply-To: <20111014073320.140fb4b2@debxo>
References: <20111014073320.140fb4b2@debxo>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1318766597.2935.20.camel@sauron>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
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

On Fri, 2011-10-14 at 07:33 -0700, Andres Salomon wrote:
> parse_mtd_partitions takes a list of partition types; if the driver
> isn't loaded, it attempts to load it, and then it grabs the partition
> parser.  For redboot, the module name is "redboot.ko", while the parser
> name is "RedBoot".  Since modprobe is case-sensitive, attempting to
> modprobe "RedBoot" will never work.  I suspect the embedded systems that
> make use of redboot just always manually loaded redboot prior to loading
> their specific nand chip drivers (or statically compiled it in).
> 
> Signed-off-by: Andres Salomon <dilinger@queued.net>
> Cc: stable@kernel.org
> ---
>  drivers/mtd/redboot.c |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
> 
> v2: instead of renaming the module, use a module_alias.  Duh.  Thanks,
> Artem Bityutskiy!

Pushed to l2-mtd-2.6.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
