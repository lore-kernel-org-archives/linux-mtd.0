Received: from web39807.mail.mud.yahoo.com ([209.191.106.68])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Meapy-0005zG-Cz
	for linux-mtd@lists.infradead.org; Fri, 21 Aug 2009 20:35:58 +0000
Message-ID: <605613.1808.qm@web39807.mail.mud.yahoo.com>
References: <1250813957-1786-1-git-send-email-fkan@amcc.com>
	<20090821145506.53275701@lappy.seanm.ca>
Date: Fri, 21 Aug 2009 13:35:48 -0700 (PDT)
From: Victor Gallardo <victorgallardo@yahoo.com>
Subject: Re: [PATCH 1/1] Fix ECC Correction bug for SMC ordering for NDFC
	driver.
To: Sean MacLennan <smaclennan@pikatech.com>, Feng Kan <fkan@amcc.com>
In-Reply-To: <20090821145506.53275701@lappy.seanm.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linuxppc-dev@ozlabs.org, Feng Kan <fkan@amcc.com>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Sean=0A=0A> =0A> It looks like another fix for this bug is to leave the =
current code=0A> alone and turn off CONFIG_MTD_NAND_ECC_SMC.=0A=0AThis=A0wo=
uld fix the problem by hiding the issue. Fengs patch is=A0the correct way t=
o go.=0A=0ABest Regards,=0A=0AVictor Gallardo
