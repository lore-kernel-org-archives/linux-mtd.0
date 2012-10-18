MIME-Version: 1.0
In-Reply-To: <67e0aae3b23f37feb30789f5c6cb342b5684911a.1349778821.git.vipin.kumar@st.com>
References: <cover.1349778820.git.vipin.kumar@st.com>
 <67e0aae3b23f37feb30789f5c6cb342b5684911a.1349778821.git.vipin.kumar@st.com>
Date: Wed, 17 Oct 2012 23:36:46 -0700
Message-ID: <CAN8TOE_FcjZs3=Q+36S68D9xKmk_m2j+UxqoJSu+p_fgo4cG6Q@mail.gmail.com>
Subject: Re: [PATCH 11/11] nand: Increase the ecc placement locations to 640
From: Brian Norris <computersforpeace@gmail.com>
To: Vipin Kumar <vipin.kumar@st.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: dedekind1@gmail.com, linus.walleij@linaro.org, spear-devel@list.st.com,
 linux-mtd@lists.infradead.org, plagnioj@jcrosoft.com,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 9, 2012 at 3:44 AM, Vipin Kumar <vipin.kumar@st.com> wrote:
> Few devices like H27UBG8T2CTR have a writesize/oobsize of 8KB/640B.
> This means that the maximum oobsize has gone up to 640 bytes and conseque=
ntly
> the maximum ecc placement locations have also gone up to 640.

We really need to change the nand_ecclayout struct sometime. Each one
takes something like 4+4=D7640+4+32=D78 =3D 2824 bytes now, and we have 4 o=
f
them statically declared in nand_base.c. And most drivers just declare
their own anyway. (fsl_{elbc,ifc}_nand.c have 4 and 5 of them each)

I've thought about dynamically allocating and/or changing its layout
so that we can do eccpos ranges, similar to the oobfree entries. But
this gets harder, with the old ioctl(ECCGETLAYOUT) still hanging
around, a few platform uses of nand_ecclayout, and probably some other
complications.

Anyway, this comes off as basically a complaint, while in fact, I
wanted to see if anyone else agreed and/or had any suggestions. Or,
maybe somebody could convince me not to care...

Brian
