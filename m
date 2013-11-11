From: "Khoronzhuk, Ivan" <ivan.khoronzhuk@ti.com>
To: "Shilimkar, Santosh" <santosh.shilimkar@ti.com>, Rob Landley
 <rob@landley.net>, Russell King <linux@arm.linux.org.uk>
Subject: [PATCH 04/12] mtd: nand: davinci: move bindings under mtd
Date: Mon, 11 Nov 2013 16:55:09 +0000
Message-ID: <4F5844B3A985794BA902E12C070812375F8D08@DNCE04.ent.ti.com>
References: <1384187188-5776-1-git-send-email-ivan.khoronzhuk@ti.com>,
 <1384187188-5776-5-git-send-email-ivan.khoronzhuk@ti.com>
In-Reply-To: <1384187188-5776-5-git-send-email-ivan.khoronzhuk@ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Strashko,
 Grygorii" <grygorii.strashko@ti.com>, Pawel Moll <pawel.moll@arm.com>,
 Stephen Warren <swarren@wwwdotorg.org>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@kernel.crashing.org>, Rob Herring <rob.herring@calxeda.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Move bindings under mtd. Do this in order to make davinci-nand=0A=
driver usable by keystone architecture.=0A=
=0A=
Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>=0A=
---=0A=
 .../{arm/davinci/nand.txt =3D> mtd/davinci-nand.txt} |    0=0A=
 1 file changed, 0 insertions(+), 0 deletions(-)=0A=
 rename Documentation/devicetree/bindings/{arm/davinci/nand.txt =3D> mtd/da=
vinci-nand.txt} (100%)=0A=
=0A=
diff --git a/Documentation/devicetree/bindings/arm/davinci/nand.txt b/Docum=
entation/devicetree/bindings/mtd/davinci-nand.txt=0A=
similarity index 100%=0A=
rename from Documentation/devicetree/bindings/arm/davinci/nand.txt=0A=
rename to Documentation/devicetree/bindings/mtd/davinci-nand.txt=0A=
--=0A=
1.7.9.5=0A=
=0A=
