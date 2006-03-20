Received: from pproxy.gmail.com ([64.233.166.178])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FLFiG-0000z6-LY
	for linux-mtd@lists.infradead.org; Mon, 20 Mar 2006 03:26:09 -0500
Received: by pproxy.gmail.com with SMTP id t32so1714498pyc
	for <linux-mtd@lists.infradead.org>;
	Mon, 20 Mar 2006 00:26:01 -0800 (PST)
Message-ID: <f9d2a5e10603200026m3554fb35q2847dda09fa1defd@mail.gmail.com>
Date: Mon, 20 Mar 2006 01:26:00 -0700
From: "Russ Dill" <russ.dill@gmail.com>
To: "Selmeci, Tamas" <tamas.selmeci@siemens.com>
In-Reply-To: <38F58D7B92CB20438DF49D28B572CC6F13C4AC@budgw09a.ww300.siemens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <38F58D7B92CB20438DF49D28B572CC6F13C4A4@budgw09a.ww300.siemens.net>
	<6d6a94c50603170012l62ee51dfxe0b33166398ad88d@mail.gmail.com>
	<38F58D7B92CB20438DF49D28B572CC6F13C4A7@budgw09a.ww300.siemens.net>
	<f9d2a5e10603171104p4cf9b28es4f574ccdd08ab340@mail.gmail.com>
	<38F58D7B92CB20438DF49D28B572CC6F13C4AC@budgw09a.ww300.siemens.net>
Cc: linux-mtd@lists.infradead.org, Aubrey <aubreylee@gmail.com>
Subject: Re: The solution for NAND/SMC on S3C2410 problems
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> For some reason, with correct root=3D kernel parameter, the kernel compla=
ined about read errors (ECC), when it tried to mount the root partition. Wi=
th hardware ECC, there were less, with SW ECC, there were more ECC-error me=
ssages... It seems, that there are still bugs or misconfigurations in the E=
CC-calculation algorithms in S3C2410, because after manually disabling ECC-=
check, everything worked well, the root partition was mounted!!! (I saw som=
e selections for ECC-calculations, maybe I'm gonna try them)
>

sigh...because you are pretty much garunteed that you'll have bad
blocks on NAND, its part of the technology. The only place you'll get
blocks that always work is in the bootloader area (on some chips, that
are designed in this way).

Read the data sheet for any NAND part. You can't store data on NAND
flash like you can on NOR flash.
