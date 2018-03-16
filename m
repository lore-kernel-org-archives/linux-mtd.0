Received: from mout.gmx.net ([212.227.17.20])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ewkjR-0007nY-Cg
 for linux-mtd@lists.infradead.org; Fri, 16 Mar 2018 08:28:59 +0000
MIME-Version: 1.0
Message-ID: <trinity-f32d437e-64fa-481b-a9d3-1ed9f8affc8a-1521188924456@3c-app-gmx-bs35>
From: "Frank Smith" <smith-f@gmx.de>
To: "Frieder Schrempf" <frieder.schrempf@exceet.de>
Cc: linux-mtd@lists.infradead.org
Subject: Aw: Re:  Re: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not
 found. is25lp256d
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Mar 2018 09:28:44 +0100
In-Reply-To: <c88b8eb2-b613-9108-c5df-095ec3e0a1e2@exceet.de>
References: <trinity-f2c4ec20-92aa-4549-961a-54ada3bed090-1521123187434@3c-app-gmx-bs35>
 <4fa247df-ecd3-1034-aaa1-45bfdc1bcda8@exceet.de>
 <trinity-16b93208-69da-44fd-8882-e4852cb4837b-1521125017314@3c-app-gmx-bs35>
 <c88b8eb2-b613-9108-c5df-095ec3e0a1e2@exceet.de>
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I figured out, when writing zero's with "flashcp" onto 0xA00000 or higher t=
he first sectors at 0x000000 are equal=2E
So, partial both areas, are identical=2E=2E somehow=2E

Do you know where to start at debugging?

Best, Frank

=C2=A0
