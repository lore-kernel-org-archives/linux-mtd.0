Received: from p01c11o144.mxlogic.net ([208.65.144.67])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PB8iS-0007rz-Rl
	for linux-mtd@lists.infradead.org; Wed, 27 Oct 2010 16:19:09 +0000
From: H Hartley Sweeten <hartleys@visionengravers.com>
To: Guennadi Liakhovetski <g.liakhovetski@gmx.de>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Wed, 27 Oct 2010 11:18:50 -0500
Subject: RE: commit 432dc821 breaks machines
Message-ID: <0D753D10438DA54287A00B027084269764819C5D74@AUSP01VMBX24.collaborationhost.net>
References: <Pine.LNX.4.64.1010270842580.7190@axis700.grange>
In-Reply-To: <Pine.LNX.4.64.1010270842580.7190@axis700.grange>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: linux-embedded <linux-embedded@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday, October 26, 2010 11:52 PM, Guennadi Liakhovetski wrote:
>
> Hi
>
> commit 432dc821c90114f9b0e00f6752a700e937516ade
> Author: H Hartley Sweeten <hartleys@visionengravers.com>
> Date:   Thu Aug 19 18:18:21 2010 -0700
>
>     mtd: cleanup Kconfig dependencies
>
> breaks machines by undefining macros like CONFIG_MTD_MAP_BANK_WIDTH_*.=20
> Previously the Kconfig entries like
>
> config MTD_MAP_BANK_WIDTH_1
> 	bool "Support  8-bit buswidth" if MTD_CFI_GEOMETRY
> 	default y
>
> meant, that if MTD_CFI_GEOMETRY is not selected, this config entry is not=
=20
> _displayed_, and default selections are used. Now, with that "if" removed=
=20
> and all these Kconfig entries put under a common

Yah, I overlooked that part.

>
> if MTD_CFI_GEOMETRY
>
> none of these options get selected by default. Please, revert or otherwis=
e=20
> fix this part.

I believe David Woodhouse has already reverted the commit.

Sorry for the trouble,
Hartley=
