Received: from mx1.quantum.com ([146.174.252.111])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KbcSZ-0006MI-Mv
	for linux-mtd@lists.infradead.org; Fri, 05 Sep 2008 14:38:52 +0000
Subject: RE: Partitioning NAND flash
From: Brian Szmyd <brian.szmyd@quantum.com>
To: Eirik Aanonsen <eaa@wprmedical.com>
In-Reply-To: <6B5648EA2E2C2D42AF2FF7691522AD92417D79@wpr01.wprmedical.local>
References: <1220554162.4879.64.camel@lethargic>
	<6B5648EA2E2C2D42AF2FF7691522AD92417D79@wpr01.wprmedical.local>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Sep 2008 08:38:48 -0600
Message-Id: <1220625528.4879.73.camel@lethargic>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Eirik Aanonsen wrote:
> It should problably be positioned in your board spesific code then.
> Search for use of:
> static struct mtd_partition
> This is used for both the nand and the nor flash and contains the partiti=
ons ( in my cases anyway )
> ( typical place could be arch/"cpu_type"/ )
>=20
> Regards=20
> Eirik Aanonsen

Perfect! I would have never thought to look there for MTD partitioning
structs but I guess it makes sense. For those who care, the relevant
files is: arch/powerpc/platforms/40x/kilauea-nand.c

Much appreciated Eirik!

=EF=BB=BFBrian Szmyd | brian.szmyd@quantum.com

-----------------------------------------------------------
The information contained in this transmission may be=20
confidential. Any disclosure, copying, or further=20
distribution of confidential information is not permitted=20
unless such privilege is explicitly granted in writing by=20
Quantum Corporation. Furthermore, Quantum Corporation is not=20
responsible for the proper and complete transmission of the=20
substance of this communication or for any delay in its=20
receipt.
------------------------------------------------------------
