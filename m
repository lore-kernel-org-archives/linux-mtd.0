Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aMB2y-00061P-7Q
 for linux-mtd@lists.infradead.org; Thu, 21 Jan 2016 08:56:53 +0000
Date: Thu, 21 Jan 2016 09:56:30 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: "Bean Huo =?UTF-8?B?6ZyN5paM5paM?= (beanhuo)" <beanhuo@micron.com>
Cc: Adam Somerville <adamsomerville@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "zajec5@gmail.com" <zajec5@gmail.com>, "jteki@openedev.com"
 <jteki@openedev.com>, "mika.westerberg@linux.intel.com"
 <mika.westerberg@linux.intel.com>, "furquan@google.com"
 <furquan@google.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [RFC] spi-nor: fix cross die reads on Micron multi-die devices
Message-ID: <20160121095630.4df558b3@bbrezillon>
In-Reply-To: <A765B125120D1346A63912DDE6D8B6310BF57B7B@NTXXIAMBX02.xacn.micron.com>
References: <A765B125120D1346A63912DDE6D8B6310BF57A20@NTXXIAMBX02.xacn.micron.com>
 <CAJorgdvD9WCsHCoRt05tn-vh_1oqsCZiMehbVKQtynocxX_-wQ@mail.gmail.com>
 <A765B125120D1346A63912DDE6D8B6310BF57B7B@NTXXIAMBX02.xacn.micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Bean,

On Thu, 21 Jan 2016 01:06:48 +0000
Bean Huo =E9=9C=8D=E6=96=8C=E6=96=8C (beanhuo) <beanhuo@micron.com> wrote:

>  Hi, Adam and Boris
>=20
> For Micron MT25Q ,MT25T and MT35Q, they does not exist this action even t=
hey are
> Multi-die devices. So when the last byte of the die selected is read, the=
 next byte output
> is the first byte of next die(not the same die).=20
> You can check this by extended address register chapter in our datasheet,=
 there are detail
> Information.

I never said you were wrong ;), I just asked if it was relevant to
differentiate the two cases. IOW, would the implementation proposed by
Adam work correctly on all chips? And what is the real performance
penalty for MT25Q ,MT25T and MT35Q if we decide to split the read
command in several reads to handle this cross die case?

Best Regards,

Boris

--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
