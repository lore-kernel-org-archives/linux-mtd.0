Received: from pproxy.gmail.com ([64.233.166.178])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FKKMg-0004Bf-MR
	for linux-mtd@lists.infradead.org; Fri, 17 Mar 2006 14:12:00 -0500
Received: by pproxy.gmail.com with SMTP id x31so1152843pye
	for <linux-mtd@lists.infradead.org>;
	Fri, 17 Mar 2006 11:11:57 -0800 (PST)
Message-ID: <f9d2a5e10603171104p4cf9b28es4f574ccdd08ab340@mail.gmail.com>
Date: Fri, 17 Mar 2006 12:04:53 -0700
From: "Russ Dill" <russ.dill@gmail.com>
To: "Selmeci, Tamas" <tamas.selmeci@siemens.com>
In-Reply-To: <38F58D7B92CB20438DF49D28B572CC6F13C4A7@budgw09a.ww300.siemens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <38F58D7B92CB20438DF49D28B572CC6F13C4A4@budgw09a.ww300.siemens.net>
	<6d6a94c50603170012l62ee51dfxe0b33166398ad88d@mail.gmail.com>
	<38F58D7B92CB20438DF49D28B572CC6F13C4A7@budgw09a.ww300.siemens.net>
Cc: linux-mtd@lists.infradead.org, Aubrey <aubreylee@gmail.com>
Subject: Re: why can't kernel read from NAND/SMC device?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> [can't mount root fs (cramfs) from SMC, complaining about ECC read errors=
]

Wait, you are trying to store a kernel and cramfs filesystem on raw
NAND flash? Chances are, they are each sitting on at least one bad
sector. You need an FTL or YAFFS.
