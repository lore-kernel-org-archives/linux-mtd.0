Received: from gate.crashing.org ([63.228.1.57])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P8C60-0000VQ-Lw
	for linux-mtd@lists.infradead.org; Tue, 19 Oct 2010 13:19:17 +0000
Subject: Re: [PATCH 1/2] P4080/eLBC: Make Freescale elbc interrupt common to
	elbc devices
Mime-Version: 1.0 (Apple Message framework v1081)
Content-Type: text/plain; charset=us-ascii
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <1287386552-10647-1-git-send-email-tie-fei.zang@freescale.com>
Date: Tue, 19 Oct 2010 08:18:30 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <2D2A6B88-DA17-467D-BB43-919C1CAAB894@kernel.crashing.org>
References: <1287386552-10647-1-git-send-email-tie-fei.zang@freescale.com>
To: Roy Zang <tie-fei.zang@freescale.com>
Cc: B07421@freescale.com, dedekind1@gmail.com, B25806@freescale.com,
	linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	akpm@linux-foundation.org, dwmw2@infradead.org, B11780@freescale.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Oct 18, 2010, at 2:22 AM, Roy Zang wrote:

> Move Freescale elbc interrupt from nand dirver to elbc driver.
> Then all elbc devices can use the interrupt instead of ONLY nand.
>=20
> For former nand driver, it had the two functions:
>=20
> 1. detecting nand flash partitions;
> 2. registering elbc interrupt.
>=20
> Now, second function is removed to fsl_lbc.c.
>=20
> Signed-off-by: Lan Chunhe-B25806 <b25806@freescale.com>
> Signed-off-by: Roy Zang <tie-fei.zang@freescale.com>
> Reviewed-by: Anton Vorontsov <cbouatmailru@gmail.com>
> Cc: Wood Scott-B07421 <B07421@freescale.com>
> ---

Roy, this is a nit, but are these really p4080 specific?  just wondering =
why the subject is P4080/eLBC:...

- k=
