MIME-Version: 1.0
In-Reply-To: <20120406134600.GQ7264@S2101-09.ap.freescale.net>
References: <1314169643-23425-5-git-send-email-b32955@freescale.com>
 <CAOMZO5D_ACi73J0QfXoJmvyw6fBMrQfyoKLkK2P+-kMm5EzaDQ@mail.gmail.com>
 <20120405010829.GG7264@S2101-09.ap.freescale.net>
 <CAOMZO5ACk06aFWmmH0ZXCf6XoLaShwUaoAW0jHKmDTsJ0v027A@mail.gmail.com>
 <20120405012343.GH7264@S2101-09.ap.freescale.net>
 <CAOMZO5D2v4-ZoUXEhn7-Z7oSJ190egpkWGLkbaVzkjU5=HCNVA@mail.gmail.com>
 <20120406023121.GK7264@S2101-09.ap.freescale.net>
 <CAOMZO5Dr+qVMOpG6T03L-+i6qYkJRPUPT87hcJAs6DxHs+EcmA@mail.gmail.com>
 <20120406065302.GN7264@S2101-09.ap.freescale.net>
 <CAOMZO5Ab=cdOevjBhEyQtxVo3mEuoq7xy0auGinUoyh-TddTDw@mail.gmail.com>
 <20120406134600.GQ7264@S2101-09.ap.freescale.net>
Date: Fri, 6 Apr 2012 10:56:29 -0300
Message-ID: <CAOMZO5AZzaVWe+vU=JCOv3QQAfUTWRdNVDsaUx+9Q+O8N0J_EQ@mail.gmail.com>
Subject: Re: [PATCH v8 4/4] ARM: mxs/mx28evk: add GPMI-NAND device
From: Fabio Estevam <festevam@gmail.com>
To: Shawn Guo <shawn.guo@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: dedekind1@gmail.com, s.hauer@pengutronix.de, w.sang@pengutronix.de,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 Sam Gandhi <samgandhi9@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Apr 6, 2012 at 10:46 AM, Shawn Guo <shawn.guo@linaro.org> wrote:

> I'm pretty sure that imx28 dt patch from Dong Aisheng will hit mainline
> with v3.5-rc1, which could be the earliest time for spi-mxs to hit
> mainline. =C2=A0In that case, I do not have any reason to take your board
> file patch from there, so what's point of the while argument?

Ok, will submit the mxs spi driver (non-dt aware) next week when I
come back to the office.

You can drop all of the arch mxs spi patches I sent you
