Received: from hqemgate03.nvidia.com ([216.228.121.140])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RsGzb-0005Qs-U2
 for linux-mtd@lists.infradead.org; Tue, 31 Jan 2012 16:55:40 +0000
From: Stephen Warren <swarren@nvidia.com>
To: Barry Song <Barry.Song@csr.com>, Greg Kroah-Hartman <gregkh@suse.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Date: Tue, 31 Jan 2012 08:55:28 -0800
Subject: RE: [PATCH 2/3] GPIO: TEGRA: move to use
 platform_devm_request_and_ioremap() helper
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF178E12440C@HQMAIL01.nvidia.com>
References: <1328004002-24646-1-git-send-email-Barry.Song@csr.com>
 <1328004002-24646-3-git-send-email-Barry.Song@csr.com>
In-Reply-To: <1328004002-24646-3-git-send-email-Barry.Song@csr.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Linus Walleij <linus.walleij@linaro.org>,
 "workgroup.linux@csr.com" <workgroup.linux@csr.com>,
 Grant Likely <grant.likely@secretlab.ca>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Barry Song <Baohua.Song@csr.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Erik Gilling <konkers@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Barry Song wrote at Tuesday, January 31, 2012 3:00 AM:
> [no description]
> Signed-off-by: Barry Song <Baohua.Song@csr.com>

Acked-by: Stephen Warren <swarren@nvidia.com>

--=20
nvpublic
